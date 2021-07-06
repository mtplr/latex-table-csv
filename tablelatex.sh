#!/bin/sh

# Matteo Paolieri - 2020 - MIT license
# Convert csv table to LaTex tables
# Usage: tabellaltex.sh tabella.csv


echo Reading $1

file=$1
out=table-${file/.*/}.tex

# Substitute commas and return

cat $1 | sed \
    -e 's:&:\\&:g' \
    -e 's:,:\t\&\t:g' \
    -e 's:"::g' \
    -e 's/_/\\_/g'  \
    -e 's:$:\t\\\\:g' > $out

# Latex table snippet
ed $out << END
1i
\begin{table}[h]
\centering
\begin{adjustbox}{max width=\textwidth}
\begin{tabular}{ll %FIXME}
\toprule
Header 1 & Header 2 & %FIXME  \\\\
\midrule
.
\$a
\bottomrule
\end{tabular}
\end{adjustbox}
\caption{Caption}
\label{table:name}
\end{table}
.
wq
END

echo "Done. Output: $out"
