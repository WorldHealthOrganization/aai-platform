# aai-platform

The Platform workstream of the WHO Assured AI programme: shared hosting and engineering. Programme status is held on GitHub issues; see the programme set-up request, [litlfred/folio-assistant#2605](https://github.com/litlfred/folio-assistant/issues/2605).

## Beans

Beans are the agents' work plan: one Markdown file per work item, read by the [`beans`](https://github.com/hmans/beans) CLI.

- **This repository's beans** live on the branch [`cat/aai-platform/beans`](../../tree/cat/aai-platform/beans). Run `scripts/state-mount.sh` to put it at `.state/`, where `.beans.yml` points the CLI.
- **The combined board**, [`pulled/README.md`](pulled/README.md), lists the beans of every repository in [`beans-sources.json`](beans-sources.json). To add or remove a repository, edit that file. Repositories on its `deny` list are refused.
- A bean that tracks programme work carries `issue:` with the URL of its GitHub issue. The issue is the source of truth; the board counts open beans without one.

```sh
bun run scripts/pull-beans.ts            # rebuild pulled/
bun run scripts/pull-beans.ts --dry-run  # print the summary only
bun run scripts/pull-beans.ts --check    # fail if pulled/ is out of date
```

The `Pull beans` workflow rebuilds the board every day and on demand.
