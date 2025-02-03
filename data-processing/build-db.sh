#!/usr/bin/env sh
curl -L -o data-raw_2025-02-03.zip "https://www.dropbox.com/scl/fi/btzeaaq84wdpahb7c033g/data-raw_2025-02-03.zip?rlkey=atqpr633ayy4ya9p428vi6lon&dl=1"
unzip data-raw_2025-02-03.zip -d data-raw_2025-02-03 
uv run csvs-to-sqlite data-raw ../data/2025-02-03_foreign-assistance.db
