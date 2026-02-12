-- Add external_salesperson column to sales table
alter table public.sales 
add column if not exists external_salesperson text; -- Storing name for simplicity, or UUID if linked strictly

-- Add scheduler_id column if we want to distinguish from the registrant
-- operator_id is currently used as the "Sales Owner". 
-- If the sale is external, operator_id might be the "Internal Rep/Scheduler".
-- We will clarify this in usage.
