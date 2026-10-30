-- ============================================================
-- Minhas Despesas / UNI — Segurança da tabela "financas"
--
-- Depende da função public.eh_dono(), criada pelo script
-- "dono-base.sql" (que o Bispo roda uma única vez e que NÃO
-- fica no GitHub, porque contém o e-mail dele).
--
-- Cole no SQL Editor do Supabase e clique em RUN.
-- Pode rodar de novo sem problema.
-- ============================================================

alter table public.financas enable row level security;

-- Apaga TODAS as regras antigas da tabela (as abertas a qualquer pessoa)
do $$
declare p record;
begin
  for p in select policyname from pg_policies
           where schemaname = 'public' and tablename = 'financas'
  loop
    execute format('drop policy %I on public.financas', p.policyname);
  end loop;
end $$;

-- Ninguém sem login mexe na tabela
revoke all on public.financas from anon, authenticated;
grant select, insert, update, delete on public.financas to authenticated;

-- Só o dono (o usuário do Bispo) lê e grava
create policy "fin_dono_ler"    on public.financas for select to authenticated using (public.eh_dono());
create policy "fin_dono_criar"  on public.financas for insert to authenticated with check (public.eh_dono());
create policy "fin_dono_editar" on public.financas for update to authenticated using (public.eh_dono()) with check (public.eh_dono());
create policy "fin_dono_apagar" on public.financas for delete to authenticated using (public.eh_dono());

-- O PIN antigo não é mais usado; apaga o "código" dele do banco
update public.financas set pin_hash = null where pin_hash is not null;
