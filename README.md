# Sistema de Agendamento Clínico

Este projeto consiste em um sistema de banco de dados relacional para gerenciamento de agendamentos de consultas médicas. A estrutura foi desenvolvida com base no mapeamento de entidades como Pessoas, Pacientes, Médicos, Especialidades e Agendamentos, garantindo a integridade dos dados e o histórico de consultas.

---

## Como Executar e Testar os Scripts

Para testar as 18 consultas (`SELECT`), você deve primeiro preparar a estrutura e a carga de dados seguindo a ordem dos arquivos na pasta `exercicios/`:
1. `criar_tabelas.sql` (Apaga e recria a estrutura limpa)
2. `inserir_dados.sql` (Popula o banco com 20 registros de teste)
3. `comandos_select.sql` (Contém as consultas que respondem ao exercício)

---

### Opção 1: Executando pelo DBeaver

1. **Criar as tabelas e dados:**
   * Abra os arquivos `criar_tabelas.sql` e `inserir_dados.sql` no DBeaver.
   * Certifique-se de que a conexão `postgres` e o esquema `public` estão selecionados no topo.
   * Use o atalho **`Alt + X`** em cada um para rodar o script completo.
2. **Testar as Consultas:**
   * Abra o arquivo `comandos_select.sql`.
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
   * Abra o arquivo `criar_tabelas.sql` e depois o `inserir_dados.sql`. Clique em **`Run on active connection`** no topo de cada arquivo.
   * Abra o `comandos_select.sql`, selecione com o mouse o comando `SELECT` que deseja testar e pressione **`Ctrl + E, Ctrl + E`** para ver o resultado na aba lateral.