# Cheatsheet: 06 – Shell Basics

Quick reference for essential shell commands and concepts: **redirection, pipes, environment variables, history, aliases, globbing, and core shell skills**.

---

## **Output Redirection**

| Symbol | Description                             |
| ------ | --------------------------------------- |
| `>`    | Redirect output to a file (overwrite)   |
| `>>`   | Redirect output to a file (append)      |
| `2>`   | Redirect standard error to a file       |
| `&>`   | Redirect both stdout & stderr to a file |

**Examples:**

```
echo "Hello World" > hello.txt
echo "Another Line" >> hello.txt
ls /not/here 2> error.log
```

---

## **Input Redirection**

| Symbol | Description                            |
| ------ | -------------------------------------- |
| `<`    | Use file content as input to a command |

**Example:**

```
sort < unsorted.txt
```

---

## **Pipes**

| Syntax    | Description |
| --------- | ----------- | ---------------------------------------------- |
| `command1 | command2`   | Send output of one command as input to another |

**Examples:**

```
ls -l | grep ".txt"
ps aux | grep python
dmesg | less
```

---

## **Combining Redirections**

**Examples:**

```
ls *.txt | wc -l > count.txt
grep "ERROR" app.log | sort | uniq -c > error_summary.txt
```

---

## **Environment Variables**

| Command                                | Description                                 |
| -------------------------------------- | ------------------------------------------- |
| `echo $VAR`                            | Show variable value                         |
| `export VAR=value`                     | Create/set variable for current session     |
| `printenv`                             | List all environment variables              |
| `env`                                  | Run a command with a custom environment     |
| `echo 'export VAR=value' >> ~/.bashrc` | Make variable permanent for future sessions |
| `source ~/.bashrc`                     | Reload shell configuration                  |

**Examples:**

```
echo $PATH
export MYVAR="Shaurya"         # temporary
printenv | grep MYVAR

# Make permanent
echo 'export MYVAR="Shaurya"' >> ~/.bashrc
source ~/.bashrc
```

---

## **Command History**

| Command   | Description                              |
| --------- | ---------------------------------------- |
| `history` | Show previous commands                   |
| `!n`      | Run command from history line number `n` |
| `!word`   | Run last command starting with `word`    |
| `Ctrl+R`  | Interactive reverse search in history    |

---

## **Aliases**

| Command                         | Description                |
| ------------------------------- | -------------------------- |
| `alias name='command'`          | Create temporary alias     |
| `unalias name`                  | Remove alias               |
| `echo "alias ..." >> ~/.bashrc` | Make alias permanent       |
| `source ~/.bashrc`              | Reload shell configuration |

**Example:**

```
alias ll='ls -la'
unalias ll
```

---

## **Globbing (Wildcards)**

| Pattern      | Matches                                               |
| ------------ | ----------------------------------------------------- |
| `*.txt`      | All files ending in `.txt`                            |
| `file?.txt`  | `file1.txt`, `file2.txt`, etc.                        |
| `[a-c]*.log` | Files starting with `a`, `b`, or `c` ending in `.log` |
| `{a,b}.txt`  | Matches `a.txt` or `b.txt`                            |
