
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

export const supabase = createClient(
  'https://xfujufgkybbsutnvakpl.supabase.co',
  'sb_publishable_14GC4q296pEpOLRHeZz5vQ_Ibhj4ZzS',
  {
    auth: {
      persistSession: true,
      autoRefreshToken: true,
      detectSessionInUrl: true
    }
  }
);
