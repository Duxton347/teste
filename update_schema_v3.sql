-- Sales Table Updates
alter table public.sales 
add column if not exists client_id uuid references public.clients(id);

-- Tasks Table Updates for Call Scheduling (Repiques)
alter table public.tasks 
add column if not exists approval_status text default 'APPROVED'; -- 'PENDING', 'APPROVED', 'RESOLVED'

alter table public.tasks 
add column if not exists origin_call_id uuid references public.call_logs(id);

alter table public.tasks 
add column if not exists target_call_type text; -- What type of call this scheduled task is for

-- Ensure searching capabilities for clients (if not already indexed)
create index if not exists idx_clients_name on public.clients using gin (name gin_trgm_ops);
