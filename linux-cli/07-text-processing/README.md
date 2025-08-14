# 07-text-processing

Explored common Linux text-processing utilities and pipelines (search, transform, join, split, count) for working with logs, CSVs and streams.

## 📌 **What I Did**

**1. Viewed files**

- `cat file.txt` — show whole file. `tac file.txt` — show file backwards.
- `head -n 10 file.txt`, `tail -n 10 file.txt`, `tail -f /var/log/syslog` — inspect starts/ends and follow logs.

**2. Search & filter**

- `grep "pattern" file.txt` — basic search. Use `-i` (ignore case), `-r` (recursive), `-v` (invert match), `-E` (ERE/egrep), `-F` (fixed/fgrep), `-n` (line numbers), `-c` (count), `-A`/`-B` (context).

**3. Field extraction & column tools**

- `cut -d',' -f2 file.csv` — extract fields (`-b` bytes, `-c` chars, `-f` fields, `-d` delimiter, `--complement`, `--output-delimiter`).
- `awk -F',' '{print $1, $3}' file.csv` — powerful field processing, aggregations: `awk '{sum+=$2} END{print sum}'`. Also useful with `NR`, `FNR`, and conditionals for multi-file processing.

**4. Stream editing / transforms**

- `sed 's/foo/bar/g' file.txt` — substitutions; `-i` for in-place (use with a backup extension for safety, e.g. `-i.bak`), `-n` + `p` to suppress auto-print, `-e` for multiple commands, `-f script.sed` for scripts, `-r` for extended regex.
- `tr 'a-z' 'A-Z' < file.txt` — translate; `-d` delete, `-s` squeeze repeats, `-c` complement set.

**5. Sorting and uniqueness**

- `sort -k2 -n -r file.txt` — sort by column, numeric, reverse; `sort -u` / `sort | uniq` to dedupe.
- `uniq -c` — count adjacent duplicates; useful after `sort`. Flags: `-c`, `-d`, `-u`, `-i`, `-s`, `-f`.

**6. Merging & joining**

- `paste file1 file2` — merge files side-by-side (default tab, `-d` to change delimiter, `-s` to merge serially).
- `join -1 1 -2 1 -t ',' f1 f2` — join on key (files must be sorted on the join field; always sort both files before joining to avoid incorrect results). Use `-a` to keep unpaired lines, `-e` to fill empties, `-o` to control output fields.

**7. Chunking & streaming output**

- `split -l 1000 big.log part_` — split by lines; `-b 1M` by bytes; `-a` to change suffix length; `split -d` for numeric suffixes.
- `tee out.txt` — write output to file and stdout; `-a` to append.

**8. Counting & numbering**

- `wc -l file.txt` — count lines; `wc -w` words; `wc -c` bytes; `wc -m` characters; `wc -L` longest line length.
- `nl file.txt` — number lines; options: `-ba` (number all), `-v` start value, `-i` increment, `-w` width, `-n` format.

**9. Tabs and spaces**

- `expand -t 4 file.txt` — convert tabs to spaces (custom tab width).
- `unexpand -a -t 4 file.txt` — convert spaces to tabs (`-a` converts all blanks).

**10. Pipelines & practical examples**

- `grep "ERROR" /var/log/app.log | cut -d' ' -f1 | sort | uniq -c | sort -nr | head -10` — top 10 IPs or keys causing errors.
- `awk -F, '$3>100 {print $1,$3}' data.csv | sort -k2 -n` — filter & sort numeric column.
- `split -l 1000 big.log part_ && for f in part_*; do grep "ERROR" "$f" | tee "${f}.err"; done` — chunk + process + save intermediate outputs.

## 📝 **Why This Matters**

Text processing is the backbone of log analysis, quick data munging, and automation on Linux. Mastering small tools + pipes makes you fast and scripts simple and robust.

## 🔗 **Useful Links**

- [GNU Coreutils Manual (grep, cut, sort, uniq, wc, nl, tee, etc.)](https://www.gnu.org/software/coreutils/manual/coreutils.html)
- [GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html)
- [GNU sed Manual](https://www.gnu.org/software/sed/manual/sed.html)
- [Grep Cheat Sheet](https://ryanstutorials.net/linuxtutorial/cheatsheetgrep.php)
- [Awk Cheat Sheet](https://awk.readthedocs.io/en/latest/)
- [Sed Cheat Sheet](https://github.com/adrianlarion/useful-sed)
