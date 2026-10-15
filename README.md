# 🍰 Doces & Talentos

Aplicação web de gestão para confeitaria/doceria. Funciona no browser, sem instalação, com suporte offline.

## Funcionalidades

- **Pedidos** — regista e acompanha encomendas de clientes
- **Receitas** — fichas técnicas com lista de ingredientes e custo calculado
- **Ingredientes** — catálogo com preço por unidade
- **Insumos** — materiais de embalagem e consumíveis
- **Estoque** — controlo de quantidades disponíveis
- **Mercado** — lista de compras gerada automaticamente pelo stock mínimo
- **Clientes** — base de dados de clientes

## Tecnologia

| Item | Detalhe |
|---|---|
| Interface | HTML + CSS + JavaScript (sem frameworks) |
| Backend | [Supabase](https://supabase.com) (opcional) |
| Offline | `localStorage` do browser |
| Tipo | PWA — instalável no iPhone/Android |

## Como usar

### Sem servidor (modo offline)
Abra o ficheiro `index.html` diretamente no browser.
Todos os dados ficam guardados no `localStorage` do dispositivo.

### Com Supabase (sincronização entre dispositivos)
1. Crie um projeto gratuito em [supabase.com](https://supabase.com)
2. Abra o app e vá a **Configurações**
3. Cole a **URL** e a **anon key** do seu projeto Supabase
4. Os dados passam a sincronizar em tempo real

## Estrutura do projeto

```
Doces&Talentos/
├── index.html      # Aplicação completa (HTML + CSS + JS)
├── CLAUDE.md       # Guia para desenvolvimento com Claude Code
├── README.md       # Este ficheiro
└── .gitignore
```

## Keepalive (Supabase não pausa)

O Supabase free pausa o projeto depois de ~1 semana sem atividade.
`.github/workflows/keepalive.yml` grava a hora atual numa linha fixa da tabela
`keepalive` a cada 6h e lê de volta (escrita + leitura reais), chamando a REST
API do Supabase direto, já que o app é estático.

Setup (uma vez):
1. Rodar `supabase/keepalive.sql` no SQL Editor do Supabase.
2. No GitHub → Settings → Secrets and variables → Actions, criar
   `SUPABASE_URL` e `SUPABASE_SERVICE_ROLE_KEY`.

## Repositório

[github.com/pvtonii/Doces-e-Talentos](https://github.com/pvtonii/Doces-e-Talentos)
