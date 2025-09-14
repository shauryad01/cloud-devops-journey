# Cheatsheet: 07 - Text-Processing

## Viewing Files

| Command              | Description                                        | Common Switches / Examples |
| -------------------- | -------------------------------------------------- | -------------------------- |
| `cat <file>`         | Show entire file contents                          | —                          |
| `tac <file>`         | Show file contents in reverse order (last → first) | —                          |
| `head -n <N> <file>` | Show first N lines of a file                       | `head -n 20 file.txt`      |
| `tail -n <N> <file>` | Show last N lines of a file                        | `tail -n 50 logs.txt`      |
| `tail -f <file>`     | Follow file output in real time                    | `tail -f /var/log/syslog`  |

---

## Searching & Filtering

| Command                 | Description                    | Common Switches / Examples                                                                                                       |
| ----------------------- | ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------- |
| `grep "pattern" <file>` | Search for matching lines      | `-i` ignore case, `-n` show line numbers, `-v` invert match, `-c` count matches, `-A <N>` after context, `-B <N>` before context |
| `egrep "pattern"`       | Extended regex search          | Same as `grep -E`                                                                                                                |
| `fgrep "string"`        | Fixed string search (no regex) | Same as `grep -F`                                                                                                                |

---

## Field Extraction & Column Tools

| Command                               | Description                                   | Common Switches / Examples                                                        |
| ------------------------------------- | --------------------------------------------- | --------------------------------------------------------------------------------- |
| `cut -d',' -f2 file.csv`              | Extract specific field(s) from delimited file | `-b` bytes, `-c` characters, `-d` delimiter, `--complement`, `--output-delimiter` |
| `awk -F',' '{print $1, $3}' file.csv` | Print selected fields from CSV                | `awk '{sum+=$2} END{print sum}' file.txt` sum a column                            |

---

## Editing & Transforming Streams

| Command                      | Description                      | Common Switches / Examples                                                   |
| ---------------------------- | -------------------------------- | ---------------------------------------------------------------------------- |
| `sed 's/foo/bar/g' file.txt` | Find & replace text in each line | `-i` in-place edit, `-n` + `p` to print only matches, `-e` multiple commands |
| `tr 'a-z' 'A-Z' < file.txt`  | Translate characters             | `-d` delete chars, `-s` squeeze repeats, `-c` complement set                 |

---

## Sorting & Removing Duplicates

| Command                    | Description                        | Common Switches / Examples                                             |
| -------------------------- | ---------------------------------- | ---------------------------------------------------------------------- |
| `sort file.txt`            | Sort file contents                 | `-r` reverse, `-n` numeric, `-k` sort key, `-u` unique, `-t` delimiter |
| `uniq file.txt`            | Remove adjacent duplicate lines    | `-c` count, `-d` only duplicates, `-u` only uniques                    |
| `sort file.txt \| uniq -c` | Count unique lines (after sorting) | —                                                                      |

---

## Merging & Joining

| Command             | Description                                                            | Common Switches / Examples                                                                          |
| ------------------- | ---------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| `paste file1 file2` | Merge files side-by-side                                               | `-d` change delimiter, `-s` serial merge                                                            |
| `join file1 file2`  | Join two files on a common field **(both files must be sorted first)** | `-1`/`-2` field numbers, `-t` delimiter, `-a` include unpaired, `-e` empty fill, `-o` output format |

---

## Splitting & Output Control

| Command                        | Description                             | Common Switches / Examples                                  |
| ------------------------------ | --------------------------------------- | ----------------------------------------------------------- |
| `split -l 1000 file.txt part_` | Split file into chunks of 1000 lines    | `-b` size in bytes, `-a` suffix length, `-d` numeric suffix |
| `tee output.txt`               | Write to file **and** display on screen | `-a` append mode                                            |

---

## Counting & Numbering

| Command          | Description  | Common Switches / Examples                                 |
| ---------------- | ------------ | ---------------------------------------------------------- |
| `wc -l file.txt` | Count lines  | `-w` words, `-c` bytes, `-m` characters, `-L` longest line |
| `nl file.txt`    | Number lines | `-ba` number all lines, `-v` start value, `-i` increment   |

---

## Tabs & Spaces

| Command             | Description            | Common Switches / Examples                   |
| ------------------- | ---------------------- | -------------------------------------------- |
| `expand file.txt`   | Convert tabs to spaces | `-t 4` set tab width, `-i` initial tabs only |
| `unexpand file.txt` | Convert spaces to tabs | `-a` all spaces, `-t 4` set tab width        |

---

## Pipelines & Practical Example

| Command Pipeline                                                                                | Purpose                                |
| ----------------------------------------------------------------------------------------------- | -------------------------------------- |
| `grep "ERROR" logs.txt \| cut -d' ' -f1 \| sort \| uniq -c \| sort -nr \| head -5`              | Show top 5 IPs causing errors          |
| `awk -F, '$3>100 {print $1,$3}' data.csv \| sort -k2 -n`                                        | Show rows with column 3 > 100, sorted  |
| `split -l 1000 data.txt part_ && for f in part_*; do grep "match" "$f" \| tee "${f}.out"; done` | Split, search each chunk, save results |
