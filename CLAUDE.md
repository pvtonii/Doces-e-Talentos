# Doces & Talentos — Guia para Claude Code

## Visão geral

PWA (Progressive Web App) de gestão para uma doceria/confeitaria.
Toda a aplicação está num único ficheiro: **`index.html`** (~5 800 linhas).
O HTML, CSS e JavaScript estão todos dentro desse ficheiro.

## Arquitetura

| Camada | Detalhe |
|---|---|
| Frontend | HTML + CSS inline + JS vanilla (sem frameworks) |
| Backend | Supabase (REST API via fetch manual) |
| Offline | `localStorage` com prefixo `doceria_` |
| Deploy | Ficheiro estático — abre direto no browser ou via GitHub Pages |

## Módulos principais (dentro de `index.html`)

| Secção | Descrição |
|---|---|
| Variáveis CSS (`:root`) | Design tokens — cores, sombras, raios, fontes |
| HTML estrutural | Header, nav bottom, drawer lateral, modais, páginas |
| Supabase helpers | `sbFetch`, `sbSelect`, `sbInsert`, `sbUpdate`, `sbDelete` |
| `initSupabase()` | Lê URL/key do localStorage e valida a ligação |
| `carregarTudo()` | Carrega todos os dados ao iniciar |
| `navigate(page)` | Troca de secção visível |

## Páginas / Secções

- **Dashboard** — resumo geral (Olá!)
- **Pedidos** — gestão de encomendas
- **Receitas** — fichas técnicas com ingredientes
- **Ingredientes** — base de ingredientes com custo por unidade
- **Insumos** — materiais não-alimentares (caixas, fitas, etc.)
- **Estoque** — quantidades em stock
- **Mercado** — lista de compras automática
- **Clientes** — base de clientes
- **Configurações** — ligação ao Supabase

## Convenções importantes

- **Não separar os ficheiros** sem pedido explícito — o projeto é intencionalmente monolítico para facilitar o deploy.
- Variáveis CSS estão em `:root`; não adicionar cores ou espaçamentos hardcoded.
- Toda a comunicação com Supabase passa pelos helpers `sb*` (linhas ~1783–1801).
- Os dados locais usam sempre `localLoad(key)` / `localSave(key, data)`.
- O `manifest.json` está referenciado mas é opcional para PWA offline.

## Como testar

Abrir `index.html` diretamente no browser.
Para testar com Supabase: ir a **Configurações** no app e inserir URL + anon key do projeto Supabase.

## Repositório

`https://github.com/pvtonii/Doces-e-Talentos`
