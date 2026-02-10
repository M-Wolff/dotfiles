local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {

    -- Letter template
    s("letter", fmt([[
%!TeX ts-program = xelatex
%!TeX encoding = utf-8 Unicode
\documentclass[a4paper,11pt]{{letter}}
\usepackage[margin=1.25in]{{geometry}}
\usepackage[proportional,osf,scaled=1.064]{{erewhon}}
\usepackage{{pdfpages}}
\address{{
    {} \\\\
    {} \\\\
    {}
}}
\signature{{
    {} \\\\
    {} \\\\
    {}
}}
\begin{{document}}
\begin{{letter}}{{{}}}
\opening{{Dear Recipient,}}

{}

\closing{{Sincerely,}}
\ps{{\textsc{{p.s.}} Please find a document attached.}}
\end{{letter}}
%\includepdf[pages={{-}},scale=0.85]{{document.pdf}} % attachments
\end{{document}}
]], { i(1,"Address line 1"), i(2,"Address line 2"), i(3,"Address line 3"),
     i(4,"Author"), i(5,"Email address"), i(6,"Phone number"),
     i(7,"Recipient"), i(0) })),

    -- Note template
    s("note", fmt([[
%!TeX ts-program = xelatex
%!TeX encoding = utf-8 Unicode
\documentclass[11pt,a4paper]{{article}}
\title{{{}}}
\author{{{}}}
\begin{{document}}
\maketitle
{}
\end{{document}}
]], { i(1,"Title"), i(2,"Author"), i(0) })),

    -- Table of contents
    s("toc", fmt([[
\tableofcontents
\listoffigures
\listoftables
\pagebreak
]], {})),

    -- Abstract
    s("abs", fmt([[
\begin{{abstract}}

{}

\end{{abstract}}
]], { i(0) })),

    -- Summary block
    s("sum", fmt([[
\phantomsection\addcontentsline{{toc}}{{section}}{{Summary}}
\section*{{Summary}} % (fold)

{}

% section summary (end)
]], { i(0) })),

    -- Begin and block
    s("beg", fmt([[
\begin{{{}}}

{}

\end{{{}}}
]], { i(1,"env"), i(0), rep(1) })),

    -- Section
    s("sec", fmt([[
\section{{{}}}
\label{{sec:{}}}

{}

% section {} (end)
]], { i(1,"SecName"), i(2,"sec_label"), i(0), rep(2) })),

    -- Subsection
    s("sub", fmt([[
\subsection{{{}}}
\label{{sub:{}}}

{}

% subsection {} (end)
]], { i(1,"SubName"), i(2,"sub_label"), i(0), rep(2) })),

    -- Subsubsection
    s("subs", fmt([[
\subsubsection{{{}}}
\label{{ssub:{}}}

{}

% subsubsection {} (end)
]], { i(1,"SubsubName"), i(2,"subsub_label"), i(0), rep(2) })),

    -- Enumerate list
    s("enum", fmt([[
\begin{{enumerate}}
  \item {}
\end{{enumerate}}
]], { i(1) })),

    -- Itemized list
    s("itm", fmt([[
\begin{{itemize}}
  \item {}
\end{{itemize}}
]], { i(1) })),

    -- Item line
    s("it", fmt([[
\item {}
]], { i(1) })),

    -- Description
    s("des", fmt([[
\begin{{description}}
  \item[{}] {}
\end{{description}}
]], { i(1,"Label"), i(0) })),

    -- Figure
    s("fig", fmt([[
\begin{{figure}}[H]
  \centering
  \includegraphics[angle=0,width=1.0\textwidth]{{{}}}
  \caption{{{}}}
  \label{{fig:{}}}
\end{{figure}}
]], { i(1,"Filename"), i(0), i(2,"fig_label") })),

    -- Table
    s("tabl", fmt([[
\begin{{table}}[H]
\caption{{{}}}
\label{{tab:{}}}
\centering
  \begin{{tabular}}{{+l^c}}
  \rowstyle{{\itshape}}
    Label1 & Label2 \\\\
    {} & {}
  \end{{tabular}}
\end{{table}}
]], { i(1,"Description"), i(2,"tab_label"), i(3,"Full spectrum"), i(4,"0.358") })),

    -- Paragraph
    s("par", fmt([[
\paragraph{{{}}} % (fold)
\label{{par:{}}}

{}

% paragraph {} (end)
]], { i(1,"paragraph name"), i(2,"par_label"), i(0), rep(2) })),

    -- Include PDF
    s("pdf", fmt([[
\includepdf[scale=1.0,angle=0,pages={{-}},pagecommand={{}}]{{{}.pdf}}
]], { i(1,"Filename") })),

    -- Reference block
    s("ref", fmt([[
\phantomsection\addcontentsline{{toc}}{{section}}{{References}}
\begin{{thebibliography}}{{9}}
\bibitem{{{}}}
  {},
  \emph{{{}}}, 
  {}.
\end{{thebibliography}}
]], { i(1,"label"), i(2,"Author"), i(3,"Title"), i(4,"Date") })),

    -- Bib item
    s("bi", fmt([[
\bibitem{{{}}}
  {},
  \emph{{{}}}, 
  {}.
]], { i(1,"label"), i(2,"Author"), i(3,"Title"), i(4,"Date") })),

    -- Appendix
    s("apdx", fmt([[
\pagebreak
\appendix

{}
]], { i(0) })),

    -- Emphasize
    s("em", fmt([[
\emph{{{}}}
]], { i(1) })),

    -- Bold
    s("bf", fmt([[
\textbf{{{}}}
]], { i(1) })),

    -- Small caps
    s("sc", fmt([[
\textsc{{{}}}
]], { i(1) })),

    -- Superscripts
    s("sr", t("^2")),
    s("cb", t("^3")),
    s("compl", t("^{c}")),
    s("td", fmt([[
^{{{}}}
]], { i(1) })),

    -- Fraction
    s("//", fmt([[
\\frac{{{}}}{{{}}}
]], { i(1), i(2) })),

    -- Frame
    s("frm", fmt([[
\begin{{frame}}
{}
\end{{frame}}
]], { i(0) })),

    -- Animated itemized/enumerate
    s("itmAnim", fmt([[
\begin{{itemize}}[<+->]
  \item {}
\end{{itemize}}
]], { i(1) })),

    s("enumAnim", fmt([[
\begin{{enumerate}}[<+->]
  \item {}
\end{{enumerate}}
]], { i(1) })),

    -- Lstlisting
    s("lstlisting", fmt([[
\begin{{lstlisting}}[style={}, caption={{Caption}}]
{}
\end{{lstlisting}}
]], { i(1,"style"), i(2) })),

    -- Table row variable (dynamic placeholders)
    s({trig="tr(%d+)", regTrig=true, hidden=true}, f(function(_, snip)
        local n = tonumber(snip.captures[1])
        local row = {}
        for j=1,n do table.insert(row, "$"..j) end
        return table.concat(row," & ")
    end, {})),

})
