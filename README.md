# world_cup
This project is a PostgreSQL-based database system built to track and analyze final round matches from the FIFA World Cup tournaments (2014 and 2018).

---

## 📁 Files in the Repository

| File | Description |
|------|-------------|
| `games.csv` | Raw dataset containing all 32 World Cup final-round matches since 2014 |
| `insert_data.sh` | Bash script to insert data from `games.csv` into PostgreSQL database |
| `queries.sh` | Bash script containing SQL queries to extract insights from the database |
| `expected_output.txt` | Output that must match the result of `queries.sh` |
| `worldcup.sql` | SQL dump of the entire database (schema + data), useful for re-import |

---

## 📌 Requirements

- PostgreSQL (used version 12+)
- Bash Shell
- `psql` CLI access
- freeCodeCamp test suite or local test environment (optional)

---

## ✅ Objectives & User Stories

### 🗃️ Database Creation

- [x] Created a database named `worldcup`
- [x] Created `teams` table:
  - `team_id`: SERIAL PRIMARY KEY
  - `name`: UNIQUE and NOT NULL
- [x] Created `games` table:
  - `game_id`: SERIAL PRIMARY KEY
  - `year`, `round`, `winner_id`, `opponent_id`, `winner_goals`, `opponent_goals` — all NOT NULL
  - `winner_id` and `opponent_id` are FOREIGN KEY references to `teams`

### 📥 Data Insertion (via `insert_data.sh`)

- [x] Read and parsed `games.csv`
- [x] Inserted all 24 unique team names into `teams` table
- [x] Inserted 32 rows into `games` table (one for each match)
- [x] Looked up team IDs dynamically — no hard-coded IDs

### 🔍 Data Analysis Queries (via `queries.sh`)

Extracted insights like:

- Total and average goals (winning and both teams)
- Most goals scored in a single match
- Number of high-scoring matches
- Winner of the 2018 World Cup
- Teams that played in a specific round
- List of all unique winning teams
- Champions by year
- Teams whose name starts with "Co"

> Outputs from `queries.sh` were validated against `expected_output.txt` using `diff`

---

## 🧪 Example Queries

```sql
-- Total number of goals by winning teams
SELECT SUM(winner_goals) FROM games;

-- Winner of 2018 tournament
SELECT name FROM teams INNER JOIN games ON teams.team_id = games.winner_id WHERE round='Final' AND year=2018;
