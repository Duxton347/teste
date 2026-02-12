-- Add notes field to visits table
ALTER TABLE public.visits ADD COLUMN IF NOT EXISTS notes TEXT;

-- Add comment for documentation
COMMENT ON COLUMN public.visits.notes IS 'Observações sobre o propósito da visita (ex: oferecer químicos, trocador de calor, etc)';
