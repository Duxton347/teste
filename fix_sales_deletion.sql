-- Enable RLS on Sales if not already enabled
alter table public.sales enable row level security;

-- Policy: Administrators can DELETE sales
drop policy if exists "Admins can delete sales" on public.sales;
create policy "Admins can delete sales"
on public.sales
for delete
to authenticated
using (
  exists (
    select 1 from public.profiles
    where profiles.id = auth.uid()
    and (profiles.role = 'admin' or profiles.role = 'ADMIN')
  )
);

-- Policy: Everyone can READ sales
drop policy if exists "Everyone can read sales" on public.sales;
create policy "Everyone can read sales"
on public.sales
for select
to authenticated
using (true);

-- Policy: Everyone can INSERT sales
drop policy if exists "Everyone can insert sales" on public.sales;
create policy "Everyone can insert sales"
on public.sales
for insert
to authenticated
with check (true);

-- Policy: Everyone can UPDATE sales
drop policy if exists "Everyone can update sales" on public.sales;
create policy "Everyone can update sales"
on public.sales
for update
to authenticated
using (true)
with check (true);
