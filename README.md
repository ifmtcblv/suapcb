# SUAP-CB

Aplicação desktop standalone para conferência de livros e acervos de biblioteca, utilizando leitura de código de barras e dados CSV exportados pelo SUAP ou Gnuteca.

## Destaques

- Carrega arquivos CSV de inventário do SUAP ou relatórios de acervo do Gnuteca diretamente em um banco SQLite local.
- Detecta o formato de exportação de forma totalmente automática.
- Escaneia códigos de barras em tempo real com uma pistola sem fio para marcar livros como encontrados ou não cadastrados.
- Filtra estantes e livros por nome; alterna a visualização por status (todos, encontrados, não encontrados).
- Gera relatórios CSV detalhados por estante (ou geral da Biblioteca) e geral, incluindo livros encontrados, não encontrados, divergentes e não cadastrados.
- Executa em Windows e Linux de forma 100% offline, sem necessidade de servidores ou conexão de rede.

## Pré-requisitos

- **Python 3.7+** — [download](https://www.python.org/downloads/)
- **PyQt5** — instalado automaticamente via `make setup`

## Instalação

```bash
git clone https://github.com/carlosrabelo/suap-cb.git
cd suap-cb
make setup
```

## Uso

### Executar a aplicação

```bash
make run
```

### Carregar um CSV exportado do SUAP ou Gnuteca

```bash
.venv/bin/python app.py -load caminho/para/Relatorio.csv
```

Isso importa os dados para o banco local e encerra. Inicie sem `-load` para uso interativo. O programa identificará de forma automática se o arquivo pertence ao SUAP ou Gnuteca e processará o inventário de acordo.

### Escanear e Gerar Relatórios

1. Selecione uma estante (ou **"BIBLIOTECA"** para arquivos do Gnuteca) na janela principal.
2. Clique em **Escanear Livros** e use a pistola para escanear os códigos de barra dos livros físico.
3. A janela de escaneamento mantém o foco de leitura e exibe feedback visual em tempo real (Verde: Encontrado, Laranja: Já marcado, Vermelho: Não cadastrado).
4. Ao fechar a janela, um resumo contendo a contagem da sessão de auditoria e os pendentes na estante é exibido.
5. Clique em **Gerar Relatório** para exportar os resultados consolidados.

### Relatórios de Saída

Os relatórios são salvos localmente no diretório de dados da aplicação (`report/`) e organizados por estantes individuais e em uma pasta consolidada `_GERAL_`:
- `encontrados.csv`: Todos os livros auditados e marcados com sucesso.
- `nao_encontrados.csv`: Itens que constavam na importação inicial, mas que não foram escaneados.
- `divergente.csv`: Livros cujo registro original indicava uma estante, mas que foram escaneados em outra.
- `nao_cadastrados.csv`: Livros físicos escaneados que não constavam no banco de dados importado do CSV.

## Estrutura do Projeto

```
app.py              # Ponto de entrada — inicializa a interface e trata argumentos CLI
main_window.py      # Janela principal com tabelas de estantes e livros
scan_window.py      # Janela de escaneamento de código de barras
database.py         # Gerenciador SQLite e lógica de importação CSV (SUAP e Gnuteca)
report_generator.py # Geração de relatórios CSV
requirements.txt    # Dependências Python
```

## Desenvolvimento

```bash
make setup      # Cria .venv e instala dependências (somente na primeira vez)
make run        # Executa a aplicação
make quality    # Formata, faz lint e verifica tipos
make test       # Executa a suíte de testes unitários e de integração
```

## Contribuição

1. Faça um fork do repositório
2. Crie uma branch para sua feature: `git checkout -b feat/descricao`
3. Faça commit com Conventional Commits: `git commit -m "feat: adiciona X"`
4. Faça push e abra um pull request

Desenvolvido no Instituto Federal de Educação, Ciência e Tecnologia de Mato Grosso (IFMT), Campus Cuiabá – Bela Vista, como parte de um projeto de estágio supervisionado.

## Licença

Este projeto é licenciado sob a MIT License — veja [LICENSE](LICENSE) para mais detalhes.
