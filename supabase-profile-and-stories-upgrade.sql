-- STORYVERSE 2.5 profile customization + new story quiz keys
-- Run in Supabase SQL Editor. This does not expose keys to the public client.
alter table public.profiles add column if not exists avatar_emoji text not null default '🌷';
alter table public.profiles add column if not exists profile_theme text not null default 'lavender';
alter table public.profiles add column if not exists scores_private boolean not null default true;
alter table public.profiles drop constraint if exists profiles_profile_theme_check;
alter table public.profiles add constraint profiles_profile_theme_check check (profile_theme in ('lavender','mint','rose','ocean','sunshine'));

insert into private.story_quiz_answer_key (story_id, question_index, correct_index)
values
 ('anansi',0,1),('anansi',1,0),('anansi',2,2),('anansi',3,1),('anansi',4,2),
 ('forest',0,1),('forest',1,2),('forest',2,0),('forest',3,1),('forest',4,2),
 ('ocean',0,0),('ocean',1,1),('ocean',2,2),('ocean',3,1),('ocean',4,2),
 ('lantern',0,0),('lantern',1,0),('lantern',2,1),('lantern',3,1),('lantern',4,2),
 ('clockwork',0,0),('clockwork',1,1),('clockwork',2,1),('clockwork',3,0),('clockwork',4,2),
 ('mountain',0,0),('mountain',1,1),('mountain',2,1),('mountain',3,0),('mountain',4,1)
on conflict (story_id, question_index) do update set correct_index=excluded.correct_index;
