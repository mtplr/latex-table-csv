# LaTex table generator
LaTex table generator in bash, starting from a `.csv` file.

Usage:

```
latextable.sh table.csv
```

It generates a `.tex` file containing the table from the provided `.csv` file ready to be used with `\usepackage{booktabs}`.

Column headers and centerings must be done manually ☹️ 
Because of this, `%FIXME` are introduced. Pull request to fix this are welcome!
