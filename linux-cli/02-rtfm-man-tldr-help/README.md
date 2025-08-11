````markdown
# 02-rtfm-man-tldr-help

Practiced using **built-in help tools** in Linux (`man`, `--help`, `tldr`) to explore and troubleshoot commands without relying on Google.

---

## 📌 What I Did

1. **Used `man` (Manual Pages)**
   ```bash
   man ls
   man pwd
   man chmod
   ```
````

- Purpose: Access the **full documentation** of commands, including description, syntax, options, and examples.
- Notes:
  - Navigation: Up/Down arrows or `Space` to scroll, `q` to quit.
  - `man <section> <command>` lets you specify which manual section to view.

2. **Used `--help` Option**

   ```bash
   ls --help
   grep --help
   tar --help
   ```

   - Purpose: Get **quick reference** for a command’s usage and options.
   - Advantage: Works without needing `man` installed.

3. **Installed and Used `tldr`**

   ```bash
   sudo apt update
   sudo apt install tldr -y
   tldr ls
   tldr tar
   tldr chmod
   ```

   - Purpose: View **simplified, example-focused** command usage.
   - Example:
     ```bash
     tldr curl
     ```
     Gives short explanations with common use cases like:
     - Download a file.
     - Send a POST request.
     - Follow redirects.

4. **Explored `apropos`**
   ```bash
   apropos network
   ```
   - Purpose: Search man page descriptions for keywords (good for discovering related commands).

---

## 📝 Why This Matters

Knowing how to read and search Linux documentation:

- Saves time when you forget syntax or options.
- Helps you troubleshoot on any machine — even with no internet.
- Encourages self-reliance instead of always searching online.

---

## 🔗 Useful Links

- [GNU `man` Documentation](https://man7.org/linux/man-pages/man1/man.1.html)
- [`tldr` Project on GitHub](https://github.com/tldr-pages/tldr)
- [Linux `apropos` Command](https://man7.org/linux/man-pages/man1/apropos.1.html)

```

```
