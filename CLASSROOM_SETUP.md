# STORYVERSE — launch and database checklist

## 1. Update Supabase

Use your existing project. Do not rerun the original schema if it succeeded before.

- If you have not run the portal feature upgrade, run the previously supplied `supabase-portal-upgrade.sql` once. It adds assignment instructions/deadlines, class events, announcements, and private student checklists.
- Run the separate owner-only `STORYVERSE_TEACHER_INVITE_SETUP.sql` script provided with this update. It installs the teacher invitation-code validator, profile customisation columns, and private quiz answer keys for the three original stories.
- **Never upload `STORYVERSE_TEACHER_INVITE_SETUP.sql` to public GitHub.** It contains private access configuration and answer keys.

## 2. Teacher invitation code

The teacher invitation code is supplied separately to the project owner. Share it only with trusted teachers, privately. It can be used up to five times and expires 180 days after the SQL script is run. The actual code is deliberately not written in this guide or the public website package. To issue a replacement, generate a new high-entropy code, insert its SHA-256 hash into `private.teacher_invite_codes` using the same pattern in the SQL file, and deactivate the old code. Do not publish the code in a public repository or screenshot.

Teacher sign-up requires this code. Existing accounts can enter it on the Teacher Portal login screen to activate teacher access. The database validates it and sets the role; changing browser text or signup metadata cannot grant teacher access.

## 3. Disable email verification

Supabase Dashboard → Authentication → Providers → Email → turn **Confirm email OFF** → Save. Keep email/password enabled. No Google provider is required.

## 4. GitHub Pages

Upload the contents of the website ZIP to the repository root. Do not upload the ZIP itself. Preserve this layout:

```text
index.html
teacher.html
student.html
stories.html
app.js
portal.js
portal.css
premium.css
storybook.css
supabase-client.js
data/stories.json
```

Then GitHub → Settings → Pages → Deploy from a branch → `main` → `/(root)` → Save.

## 5. Supabase URL configuration

For the repository `storyverse-classroom`, set the Site URL to:

`https://saint-laurent16.github.io/storyverse-classroom/`

Add these Redirect URLs:

- `https://saint-laurent16.github.io/storyverse-classroom/teacher.html`
- `https://saint-laurent16.github.io/storyverse-classroom/student.html`

If your repository name differs, use its actual GitHub Pages URL instead.

## 6. Test before research use

- Register a student account and verify it can join a class with the classroom code.
- Register a teacher account using the private invitation code. Confirm teacher access is activated without a manual role update.
- Confirm a teacher without a valid code cannot access the teacher dashboard.
- Assign each of the three stories and open each from the student portal.
- Verify scene progress and quiz submissions sync.
- Verify a student's checklist remains private.
- Test on a phone and a laptop.

## Story-library loading fix

`app.js` and `portal.js` now resolve `data/stories.json` relative to their own module URLs. This supports GitHub Pages project URLs. If the story page reports an HTTP 404, verify `data/stories.json` is at the repository root inside the `data` folder—not in a nested extracted-folder directory.

## Research and privacy

Obtain school/research-adviser approval and required parental/student consent before entering minors' information. Prefer pseudonymous student IDs and avoid collecting unnecessary personal details. Quiz attempts are formative learning measures; pre-/post-tests should use your approved research instrument.
