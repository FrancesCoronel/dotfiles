# workflows

Shared GitHub Actions for all of [@FrancesCoronel](https://github.com/FrancesCoronel)'s repos. Define once, call everywhere. ✨

Each repo keeps a tiny caller file. The real logic lives here, so a fix in this repo reaches every project at once.

## What's inside

| Workflow | What it does |
| --- | --- |
| [`ci-node.yml`](.github/workflows/ci-node.yml) | Detects npm, pnpm or yarn, installs from the lockfile, then runs whichever of `lint`, `typecheck` (or `tsc --noEmit`), `test` and `build` the repo has. Audits production deps for high and critical vulns. |
| [`dependabot-automerge.yml`](.github/workflows/dependabot-automerge.yml) | Runs only after CI passes. Squash-merges Dependabot patch and minor bumps. Major bumps get a `major-update` label and a comment, then wait for a human. |
| [`codeql.yml`](.github/workflows/codeql.yml) | CodeQL security scanning, with languages as an input. |
| [`community-triage.yml`](.github/workflows/community-triage.yml) | Labels PRs from outside contributors as `community` so they get a careful review and never get auto-merged. |

## Add to a repo

1. Copy the files from [`templates/`](templates) into the repo's `.github/` folder:
   - `templates/workflows/pr.yml` → `.github/workflows/pr.yml` (CI + Dependabot auto-merge)
   - `templates/workflows/codeql.yml` → `.github/workflows/codeql.yml`
   - `templates/workflows/community.yml` → `.github/workflows/community.yml`
   - `templates/dependabot.yml` → `.github/dependabot.yml`
2. Delete any old workflows that these replace.
3. In the repo's **Settings → General**, turn on **Allow auto-merge** and **Automatically delete head branches**.
4. Optional, for public repos: add a branch ruleset on `main` that requires the `ci / ci` check. Auto-merge will then also wait for any other required checks, such as Vercel.

A caller looks like this:

```yaml
jobs:
  ci:
    uses: FrancesCoronel/workflows/.github/workflows/ci-node.yml@main

  dependabot:
    needs: ci
    uses: FrancesCoronel/workflows/.github/workflows/dependabot-automerge.yml@main
    permissions:
      contents: write
      pull-requests: write
```

## Inputs

**`ci-node.yml`**

| Input | Default | |
| --- | --- | --- |
| `node-version` | `22` | |
| `working-directory` | `.` | For monorepos or apps in a subfolder |
| `run-build` | `true` | Set `false` if the build needs secrets that Dependabot PRs can't read |
| `audit` | `true` | npm only: `npm audit --omit=dev --audit-level=high` |

**`dependabot-automerge.yml`**

| Input | Default | |
| --- | --- | --- |
| `merge-method` | `squash` | `squash`, `merge` or `rebase` |
| `allow-major` | `false` | Auto-merge majors too (only for repos with strong tests) |

**`codeql.yml`**

| Input | Default |
| --- | --- |
| `languages` | `'["javascript-typescript","actions"]'` |

## Good to know

- **Dependabot PRs can't read Actions secrets.** Any job that needs one (an AI review, Sentry upload) should skip bot PRs with `if: github.event.pull_request.user.type != 'Bot'`, or it will fail on every bump.
- **Merges made by the workflow don't trigger other workflows.** GitHub won't start new runs from a `GITHUB_TOKEN` push. Deploys through the Vercel or Netlify apps are unaffected.
- **Private repos can call these** because this repo is public.
- **Pin to a tag for stability.** `@main` always gets the latest. Tag a release (`v1`) and call `@v1` if you want changes to roll out on your schedule.
