-- Create Visits table
create table public.visits (
  id uuid default gen_random_uuid() primary key,
  client_id text, -- Can be null for manual visits
  client_name text not null,
  address text,
  phone text,
  salesperson_id text not null, -- User ID
  salesperson_name text not null,
  scheduled_date timestamp with time zone not null,
  status text not null default 'PENDING', -- PENDING, COMPLETED, CANCELED
  outcome text, -- Notes/Result
  created_at timestamp with time zone default now()
);

-- Add indexes
create index visits_salesperson_id_idx on public.visits (salesperson_id);
create index visits_scheduled_date_idx on public.visits (scheduled_date);

-- Update Tasks table to support scheduling
alter table public.tasks add column if not exists scheduled_for timestamp with time zone;
alter table public.tasks add column if not exists schedule_reason text;
