# STORYVERSE — Teacher & Student Portals

A mobile-friendly Grade 7–9 reading platform with separate teacher and student portals, private classrooms, assignments, schedules, checklists, announcements, student profiles, and a three-book interactive story library.

## Pages

- `index.html` — STORYVERSE landing page and separate teacher/student entry points.
- `teacher.html` — teacher log in / create account and teacher dashboard. New teacher accounts require a private invitation code.
- `student.html` — student log in / create account. Students may self-register and join a classroom with a class code.
- `stories.html` — interactive 3D/AR story library.

## Core story library

1. Anansi’s Web — Grade 7
2. The Lost Forest — Grade 8
3. The Ocean’s Secret — Grade 9

Story text and quiz choices are in `data/stories.json`. Correct quiz answers are kept in the private Supabase schema and are not included in the public JSON.

## Upload

Upload the contents of this ZIP (not the ZIP itself) into the root of a GitHub repository. Keep `data/stories.json` inside the `data` folder. Enable GitHub Pages from `main` / `/(root)`.

## Supabase setup

Use the existing Supabase project and existing base schema. Do not rerun the original schema if it already ran successfully. Run the regular portal upgrade SQL if the class events, announcements, and student checklist tables are not present.

Run the separate owner-only SQL script `STORYVERSE_TEACHER_INVITE_SETUP.sql` in Supabase SQL Editor. That script creates the teacher invitation-code validator, ensures the profile customization columns are present, and installs private answer keys for only the three original stories. It must **never** be uploaded to public GitHub because it contains the teacher invitation-code hash and private answer keys.

In Supabase Authentication → Providers → Email, turn **Confirm email OFF** for no-verification email/password accounts. Google sign-in is not used. Configure the Site URL and Redirect URLs to your GitHub Pages address.

The browser uses a Supabase `sb_publishable_` key only. Never put a Supabase `sb_secret_` or `service_role` key in browser code.

## Teacher invitation

Give the teacher invitation code privately to trusted teachers only. The code is validated by a database function; users cannot grant themselves teacher permissions just by selecting the teacher portal or modifying browser data. The invitation code has a limited number of uses and an expiry.

## Research and privacy

Use pseudonymous student display names or study IDs where appropriate, collect only necessary data, and obtain school/adviser approval and required parent/student consent before using student accounts or research records. Students' personal checklist items are private to their own accounts. Teacher dashboards are limited by Supabase Row Level Security to the teacher's own classrooms.

## AR and sound

The 3D scene works on supported modern browsers. WebXR placement depends on device/browser support and HTTPS. Ambient sound begins only after a student presses the sound control because browsers generally require a user gesture before audio playback.
