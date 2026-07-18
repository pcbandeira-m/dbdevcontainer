# Exercícios 03 e 04

### Exercício 03 - Construção do Script com os Comandos SELECT do Contexto de "Agendamento de Consultas"
### Exercício 04 - Construção do Script com os operadores de JUNÇÃO do Contexto de "Agendamento de Consultas"

### Componentes:
- Alisson Bruno Dantas Felix
- Patricia Cristina Bandeira de Melo

---

## Como Executar e Testar os Scripts

Para testar as 18 consultas (`SELECT`), você deve primeiro preparar a estrutura e a carga de dados seguindo a ordem dos arquivos na pasta `exercicios/`:
1. `consultas_ddl.sql` (Apaga e recria a estrutura limpa)
2. `consultas_dml.sql` (Popula o banco com 20 registros de teste)
3. `comandos_select.sql` (Contém as consultas que respondem ao exercício 3)
4. `comandos_juncoes.sql` (Contém as consultas que respondem ao exercício 4)

---

### Opção 1: Executando pelo DBeaver

1. **Criar as tabelas e dados:**
   * Abra os arquivos `consultas_ddl.sql` e `consultas_dml.sql` no DBeaver.
   * Certifique-se de que a conexão `postgres` e o esquema `public` estão selecionados no topo.
   * Use o atalho **`Alt + X`** em cada um para rodar o script completo.
2. **Testar as Consultas:**
   * Abra o arquivo desejado (`comandos_select.sql` ou `comandos_juncoes`).
   * Clique em cima do `SELECT` desejado e pressione **`Ctrl + Enter`** para exibir os resultados na tabela inferior.

---

### Opção 2: Executando Localmente pelo VS Code

*Nota: Certifique-se de abrir a pasta do projeto no modo Windows local (não utilize o ambiente `WSL: Ubuntu` para evitar bloqueios de rede com o banco nativo).*

1. **Instalar as extensões necessárias:**
   * Instale a extensão **SQLTools** e o driver **SQLTools PostgreSQL/Cockroach Driver**.
2. **Configurar a Conexão:**
   * No painel do SQLTools (ícone de banco de dados na barra lateral), clique em *Add New Connection*.
   * Escolha *PostgreSQL* e configure com: Server=`localhost` (ou `127.0.0.1`), Port=`5432`, Database=`postgres`, Username=`postgres` e sua senha. Salve e clique no plugue para conectar.
3. **Rodar os Scripts:**
   * Abra o arquivo `consultas_ddl.sql` e depois o `consultas_dml.sql`. Clique em **`Run on active connection`** no topo de cada arquivo.
   * Abra o arquivo desejado (`comandos_select.sql` ou `comandos_juncoes`), selecione com o mouse o comando `SELECT` que deseja testar e pressione **`Ctrl + E, Ctrl + E`** para ver o resultado na aba lateral.
