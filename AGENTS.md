# AGENTS.md

## Build policy

Any change to this repository must leave the project in a state where:

- `make clean && make all` succeeds with exit code 0.
- The build produces **zero compiler warnings** and **zero errors**.
- The generated `out/SimpleOS.iso` and `out/SimpleOS.bin` are produced successfully.

## Required verification

Before considering work complete, run:

```sh
./check_warnings.sh
```

This script performs a clean build and fails if any `warning` or `error` appears in the build output. Do not submit or push changes unless this script exits successfully.

## Rules

- Do not suppress warnings with flags unless there is a documented freestanding/kernel reason.
- Fix the underlying cause of every warning instead of ignoring it.
- Keep changes consistent with the existing C/assembly style and project structure.
- Do not leave the repository with build artifacts as the only changes; source fixes are preferred.
