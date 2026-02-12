-- Create External Salespeople table
create table if not exists public.external_salespeople (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  active boolean default true,
  created_at timestamp with time zone default now()
);

-- Enable RLS
alter table public.external_salespeople enable row level security;

-- Policies
create policy "Everyone can read external salespeople"
on public.external_salespeople for select
to authenticated
using (true);

create policy "Admins can manage external salespeople"
on public.external_salespeople for all
to authenticated
using (
  exists (
    select 1 from public.profiles
    where profiles.id = auth.uid()
    and (profiles.role = 'admin' or profiles.role = 'ADMIN' or profiles.role = 'supervisor' or profiles.role = 'SUPERVISOR')
  )
);

-- Add delete policy for Visits (Admins only)
create policy "Admins can delete visits"
on public.visits for delete
to authenticated
using (
  exists (
    select 1 from public.profiles
    where profiles.id = auth.uid()
    and (profiles.role = 'admin' or profiles.role = 'ADMIN')
  )
);
