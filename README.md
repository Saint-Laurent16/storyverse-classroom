# STORYVERSE 2.0 — Teacher & Student Portals

A mobile-friendly Grade 7–9 reading platform with interactive storybooks, separate teacher/student portals, private classrooms, assignments, schedules, student checklists, announcements, and reading-comprehension tracking.

## Start here

- `index.html` — main landing page with separate **For Teachers** and **For Students** entry cards.
- `teacher.html` — teacher login/request-access page and teacher dashboard.
- `student.html` — student login/registration page and student dashboard.
- `stories.html` — the original 3D/AR storybook library.

## Portal features

### Teachers

- Request teacher access using email/password (administrator approval required).
- Create multiple classrooms with private join codes.
- Share a direct student invite link containing the classroom code.
- Assign Anansi's Web, The Lost Forest, and The Ocean's Secret.
- Add assignment instructions and due dates.
- View class rosters, scene progress, quiz attempts, and quiz averages.
- Record approved research pre-test and post-test percentages.
- Add class schedule events and announcements.

### Students

- Register independently using email/password, or use an invite link from a teacher.
- Join a classroom with a private code after registration or login.
- View assigned storybooks, instructions, deadlines, tasks, and class schedules.
- Track personal reading progress and quiz results.
- Keep a private checklist for school tasks and personal chores. These checklist items are visible only to the student account.

## Project files

```text
storyverse-classroom/
├── index.html
├── portal.css
├── portal.js
├── teacher.html
├── student.html
├── stories.html
├── storybook.css
├── app.js
├── supabase-client.js
├── supabase-schema.sql
├── supabase-portal-upgrade.sql
├── CLASSROOM_SETUP.md
├── README.md
└── data/
    └── stories.json
```

The `PRIVATE_QUIZ_ANSWER_KEY.sql` script is supplied separately and must only be run in Supabase SQL Editor. **Do not upload it to public GitHub.**

## Setup summary

1. Use your existing Supabase project. If the original STORYVERSE database schema has already run successfully, do not run it again.
2. Run `supabase-portal-upgrade.sql` in Supabase SQL Editor to add event, announcement, deadline, and private checklist features.
3. If the private quiz answer key has not yet been loaded, run the separately supplied `STORYVERSE_PRIVATE_QUIZ_ANSWER_KEY.sql` in Supabase SQL Editor.
4. In Supabase Authentication → URL Configuration, set the Site URL and Redirect URLs to your new GitHub Pages site. See `CLASSROOM_SETUP.md`.
5. Create a new public GitHub repository named `storyverse-classroom`, and upload the contents of this folder to its root.
6. Enable GitHub Pages from `main` / `/(root)`.
7. Register a teacher account and promote it using the admin-only SQL in `CLASSROOM_SETUP.md`.
8. Test one teacher account and one student account before using the system with participants.

## Important notes

- The browser contains only a Supabase **publishable** key. Never place a Supabase Secret or `service_role` key in browser code or GitHub.
- Teacher privileges are not granted by selecting the teacher portal or by self-registration. A project administrator must approve the teacher profile in Supabase.
- The public story JSON contains quiz prompts and choices but not correct-answer indexes or answer explanations. Correct choices are stored in the private Supabase schema and scored by the database function.
- Students' personal checklist items are private; teachers do not see personal chores.
- Teacher dashboards show records only for the teacher's own classrooms, enforced by Supabase Row Level Security.
- Pre/post research assessment scores are teacher-entered and should come from the same approved instrument and conditions. Story quizzes are formative activities, not validated standardized reading tests.
- Obtain school/research-adviser approval and the necessary consent before using student accounts and research records. Prefer pseudonymous study IDs and collect only necessary data.

## Dependencies

The site uses free browser-loaded libraries: Three.js, QRCode.js, html5-qrcode, and the Supabase JavaScript client. GitHub Pages serves static files; Supabase handles accounts and data.


## STORYVERSE 2.5 visual and learning upgrade
- Fresh responsive light theme with reduced-motion support and touch-friendly navigation.
- Separate teacher and student portals, each with its own Log in and Create account tabs.
- Three additional original stories: The Lantern Keeper, The Clockwork Garden, and The Mountain's Echo.
- Student profile icon, colour themes, achievements, and score privacy preference.
- Story scenes retain the interactive Three.js worlds; ambient sound is generated in-browser after the learner presses the sound control (no external audio downloads).

### No email verification
In Supabase Dashboard, open Authentication → Providers → Email and turn **Confirm email OFF**. This allows email/password registration to return a session immediately. No Google provider is used. Teacher accounts remain requests until the project administrator approves their role in `profiles`.

### Profile + new quiz key upgrade
Run `supabase-profile-and-stories-upgrade.sql` in SQL Editor. This adds profile customisation columns and the private answer-key rows for the three new stories. Never put private quiz answer keys or a Supabase secret/service-role key in GitHub.
