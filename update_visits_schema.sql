-- Add new columns to visits table if they don't exist
alter table public.visits add column if not exists order_index integer default 0;
alter table public.visits add column if not exists external_salesperson text;
alter table public.visits add column if not exists is_indication boolean default false;
alter table public.visits add column if not exists realized boolean default false;
alter table public.visits add column if not exists origin_type text; -- 'CALL', 'TASK', 'MANUAL'
alter table public.visits add column if not exists origin_id text;
alter table public.visits add column if not exists contact_person text;

-- Add index for ordering
create index if not exists visits_order_index_idx on public.visits (order_index);
