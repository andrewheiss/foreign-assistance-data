#!/usr/bin/env sh
unzip data-raw_2025-02-03.zip -d data-raw_2025-02-03 
uv run csvs-to-sqlite data-raw ../data/2025-02-03_foreign-assistance.db
