-- ============================================================
-- Keepalive: linha única que o workflow .github/workflows/keepalive.yml
-- atualiza a cada 6h só pra gerar escrita real no banco e o projeto não
-- pausar por inatividade no plano free do Supabase. RLS fica ligada sem
-- nenhuma policy — só a service_role (guardada nos secrets do GitHub,
-- nunca exposta ao app) consegue ler/escrever aqui.
-- Rodar uma vez no SQL Editor do Supabase.
-- ============================================================
create table if not exists public.keepalive (
  id        integer primary key default 1,
  pinged_at timestamptz not null default now()
);

alter table public.keepalive enable row level security;
