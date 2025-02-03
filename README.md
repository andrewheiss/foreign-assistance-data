# ForeignAssistance dot gov data backup

USAID's [ForeignAssistance.gov](https://foreignassistance.gov/) was taken offline on January 31, 2025. It returned on February 3, 2025, but it's not clear how long it will be available.

As a backup, I've used [Datasette](https://datasette.io/) to create a mirror website/API of the entire ForeignAssistance dot gov dataset at <https://foreignassistance-data.andrewheiss.com/>. Everything as of December 19, 2024 is available there, both as a queryable SQL database and as downloadable CSV files.

This is the repository for that database. It uses Docker Compose to create a Datasette instance served through Caddy (for instant easy https).

This repository contains everything needed to create your own live copy of the data.

1. **Build a database**: Datasette uses SQLite as a backend. It has a helper utility for converting a folder of CSVs into an SQLite database, but it has some issues with different versions of Python and pandas and other dependencies. To simplify things, I've provided a `uv` project with all dependencies marked, as well as a bash script for downloading the raw CSVs, unzipping them, and automatically processing them.

   1. Install `uv`

   2. Navigate to the `data-processing` folder here and install the project:

      ```sh
      cd data-processing
      uv install
      ```

   3. Download the raw CSV files and generate the SQLite database:

      ```sh
      chmod u+x build-db.sh
      ./build-db.sh
      ```

2. **Run Docker Compose**: After creating the database, run this from the terminal (after installing Docker on your computer):

   ```sh
   docker compose -f "app/docker-compose.yml" up -d
   ```

3. **Access the site**: Everything should be accessible at `https://foreignassistance-data.localhost`
