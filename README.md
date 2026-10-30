# Minhas Despesas

Controle pessoal de gastos mensais e de cartões de crédito.

**Abrir o app:** https://eneas-ena.github.io/despesas/

## Como funciona

- App feito em página web; pode ser instalado na tela inicial do iPad, iPhone ou Mac.
- Os dados ficam salvos no Supabase, por isso aparecem iguais em todos os aparelhos.

## Observações

- O acesso é feito com o e-mail e a senha do Bispo (Supabase → Authentication → Users). O banco só libera as finanças para esse usuário.
- `seguranca.sql` contém as regras de segurança da tabela `financas`. Ele depende da função `eh_dono()`, criada por um script base que não fica no GitHub.

## Como publicar uma nova versão

1. Nesta página do repositório, clique em **Add file → Upload files**.
2. Arraste os arquivos novos, com os mesmos nomes dos antigos.
3. Clique em **Commit changes**.

Em um ou dois minutos a nova versão está no ar no mesmo endereço.

---
Desenvolvido por Bispo Enéas Araújo.
