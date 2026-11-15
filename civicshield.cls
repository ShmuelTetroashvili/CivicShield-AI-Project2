% ==============================================================================
% civicshield.cls — Custom LaTeX Document Class for CivicShield AI Report
% Built specifically for LuaLaTeX + babel (bidi=basic) on MiKTeX (offline-safe)
% ==============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{civicshield}[2026/11/15 v1.1 CivicShield AI Preliminary Report Class]

\LoadClass[11pt,a4paper,openany]{report}

% --- Core Language, Fonts & BiDi Support (LuaLaTeX) ---
\RequirePackage{fontspec}
% luatexbase functionality is built into modern LaTeX2e ltluatex kernel
\expandafter\def\csname ver@luatexbase.sty\endcsname{2025/01/11 v1.3 ltluatex kernel}
\RequirePackage[bidi=basic, layout=lists.tabular]{babel}
\babelprovide[main, import=he, hyphenrules=+]{hebrew}
\babelprovide[import=en, hyphenrules=+]{english}
\AtBeginDocument{\lefthyphenmin=62\relax\righthyphenmin=62\relax\exhyphenchar=-1\relax}

% System fonts verified on Windows with full Hebrew & English glyph coverage
\babelfont{rm}[
  BoldFont={Arial Bold},
  ItalicFont={Arial Italic},
  BoldItalicFont={Arial Bold Italic}
]{Arial}
\babelfont{sf}[
  BoldFont={Arial Bold},
  ItalicFont={Arial Italic},
  BoldItalicFont={Arial Bold Italic}
]{Arial}
\babelfont{tt}[
  BoldFont={Courier New Bold}
]{Courier New}

\babelfont[hebrew]{rm}[
  BoldFont={David Bold},
  AutoFakeSlant=0.16
]{David}
\babelfont[hebrew]{sf}[
  BoldFont={Arial Bold},
  AutoFakeSlant=0.16
]{Arial}
\babelfont[hebrew]{tt}[
  BoldFont={Courier New Bold}
]{Courier New}

% --- Verified Installed Packages Only (Zero Auto-Install Risk) ---
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\usetikzlibrary{
  shapes.geometric,
  shapes.multipart,
  arrows.meta,
  positioning,
  fit,
  calc,
  backgrounds,
  shadows
}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{tcolorbox}
\RequirePackage{environ}
\RequirePackage{amsmath, amssymb}
\RequirePackage{array, tabularx, longtable}
\RequirePackage{listings}
\RequirePackage{etoolbox, calc, ragged2e}
\RequirePackage{url}

% --- Original CivicShield AI Color Palette ---
\definecolor{CivicNavy}{HTML}{0B1E3D}
\definecolor{CivicBlue}{HTML}{1E3A8A}
\definecolor{CivicTeal}{HTML}{0D9488}
\definecolor{CivicCyan}{HTML}{0284C7}
\definecolor{CivicGold}{HTML}{D97706}
\definecolor{CivicRed}{HTML}{DC2626}
\definecolor{CivicEmerald}{HTML}{15803D}
\definecolor{CivicSlate}{HTML}{334155}
\definecolor{CivicGrayBg}{HTML}{F1F5F9}
\definecolor{CivicTealBg}{HTML}{F0FDFA}
\definecolor{CivicGoldBg}{HTML}{FFFBEB}
\definecolor{CivicRedBg}{HTML}{FEF2F2}
\definecolor{CivicNavyBg}{HTML}{EFF6FF}
\definecolor{CivicBorder}{HTML}{CBD5E1}

% --- Explicit LuaTeX A4 Page Geometry (No geometry.sty dependency) ---
\pagewidth=210mm
\pageheight=297mm
\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\setlength{\hoffset}{0pt}
\setlength{\voffset}{0pt}
\setlength{\oddsidemargin}{\dimexpr 21mm - 1in\relax}
\setlength{\evensidemargin}{\dimexpr 21mm - 1in\relax}
\setlength{\textwidth}{168mm}
\setlength{\topmargin}{\dimexpr 14mm - 1in\relax}
\setlength{\headheight}{20pt}
\setlength{\headsep}{8mm}
\setlength{\textheight}{242mm}
\setlength{\footskip}{12mm}

% Comfortable academic line spacing, paragraph rhythm, and safe RTL line breaking
\renewcommand{\baselinestretch}{1.16}
\setlength{\parskip}{4.5pt plus 1.5pt minus 1pt}
\setlength{\parindent}{0pt}
\renewcommand{\arraystretch}{1.30}
\hyphenpenalty=10000
\exhyphenpenalty=10000
\tolerance=3500
\emergencystretch=2.2em

% --- Convenience BiDi Helpers ---
\newcommand{\en}[1]{\foreignlanguage{english}{#1}}
\newcommand{\he}[1]{\foreignlanguage{hebrew}{#1}}

% --- Keep Hierarchical Numbers LTR in RTL Headings, Captions & References ---
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\babelsublr{\arabic{chapter}.\arabic{section}}}
\renewcommand{\thesubsection}{\babelsublr{\arabic{chapter}.\arabic{section}.\arabic{subsection}}}
\renewcommand{\thesubsubsection}{\babelsublr{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}}
\renewcommand{\thefigure}{\babelsublr{\arabic{chapter}.\arabic{figure}}}
\renewcommand{\thetable}{\babelsublr{\arabic{chapter}.\arabic{table}}}
\renewcommand{\theequation}{\babelsublr{\arabic{chapter}.\arabic{equation}}}

% --- Custom Running Header & Footer (LTR-boxed to prevent TRT overflow) ---
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{}}
\newcommand{\ps@civicshield}{%
  \renewcommand{\@oddhead}{%
    \parbox{\textwidth}{%
      \he{\sffamily\footnotesize\color{CivicSlate}%
      \textbf{\color{CivicNavy}\en{CivicShield AI}} --- מגן התודעה הלאומי (מטלה 2: דוח מכין)%
      \hfill \leftmark}%
      \vspace{3pt}\par%
      \color{CivicTeal}\hrule height 0.9pt%
    }%
  }%
  \renewcommand{\@evenhead}{\@oddhead}%
  \renewcommand{\@oddfoot}{%
    \parbox{\textwidth}{%
      \color{CivicBorder}\hrule height 0.6pt%
      \vspace{4pt}%
      \he{\sffamily\footnotesize\color{CivicSlate}%
      אוניברסיטת חיפה | יישומי \en{AI} ו-\en{Vibe Coding} (ד"ר יורם סגל)%
      \hfill עמוד \textbf{\color{CivicNavy}\thepage}}%
    }%
  }%
  \renewcommand{\@evenfoot}{\@oddfoot}%
}
\pagestyle{civicshield}

\renewcommand{\ps@plain}{%
  \renewcommand{\@oddhead}{}%
  \renewcommand{\@evenhead}{}%
  \renewcommand{\@oddfoot}{%
    \parbox{\textwidth}{%
      \color{CivicBorder}\hrule height 0.6pt%
      \vspace{4pt}%
      \he{\sffamily\footnotesize\color{CivicSlate}%
      \textbf{\color{CivicNavy}\en{CivicShield AI}} --- מסמך חוזי והצעה למכרז לאומי%
      \hfill עמוד \textbf{\color{CivicNavy}\thepage}}%
    }%
  }%
  \renewcommand{\@evenfoot}{\@oddfoot}%
}

% --- Custom Chapter Heading Banner (Wrapped in english for exact TLT box coords) ---
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{4pt}%
  \noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicNavy,
    colframe=CivicGold,
    arc=3pt,
    boxrule=0pt,
    bottomrule=3pt,
    left=14pt, right=14pt, top=14pt, bottom=14pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}%
    {\sffamily\small\bfseries\color{CivicGold} פרק \thechapter}\\[4pt]
    {\sffamily\LARGE\bfseries\color{white} #1}%
    \end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}%
  \vspace{12pt}%
}

\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{4pt}%
  \noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicNavy,
    colframe=CivicTeal,
    arc=3pt,
    boxrule=0pt,
    bottomrule=2.5pt,
    left=14pt, right=14pt, top=12pt, bottom=12pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}%
    {\sffamily\LARGE\bfseries\color{white} #1}%
    \end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}%
  \vspace{12pt}%
}

% --- Section & Subsection Styling ---
\renewcommand{\section}{%
  \@startsection{section}{1}{\z@}%
  {-14pt plus -4pt minus -2pt}%
  {6pt plus 2pt}%
  {\sffamily\Large\bfseries\color{CivicNavy}}%
}
\renewcommand{\subsection}{%
  \@startsection{subsection}{2}{\z@}%
  {-10pt plus -3pt minus -2pt}%
  {4pt plus 1.5pt}%
  {\sffamily\large\bfseries\color{CivicTeal}}%
}
\renewcommand{\subsubsection}{%
  \@startsection{subsubsection}{3}{\z@}%
  {-8pt plus -2pt minus -1pt}%
  {3pt plus 1pt}%
  {\sffamily\normalsize\bfseries\color{CivicSlate}}%
}

% --- Five Custom Academic & Engineering Callout Boxes (BiDi-safe wrappers) ---
\NewEnviron{rfpbox}[1][דרישת מכרז ומענה חוזי]{%
  \par\vspace{6pt}\noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicGoldBg, colframe=CivicGold,
    coltitle=white, colbacktitle=CivicGold,
    fonttitle=\sffamily\bfseries,
    title={\he{#1}},
    arc=3pt, boxrule=1pt, rightrule=4pt,
    left=10pt, right=10pt, top=8pt, bottom=8pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}\BODY\end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}\vspace{6pt}\par
}

\NewEnviron{theorybox}[1][עוגן תיאורטי: תקשורת ומדעי המדינה]{%
  \par\vspace{6pt}\noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicNavyBg, colframe=CivicBlue,
    coltitle=white, colbacktitle=CivicBlue,
    fonttitle=\sffamily\bfseries,
    title={\he{#1}},
    arc=3pt, boxrule=1pt, rightrule=4pt,
    left=10pt, right=10pt, top=8pt, bottom=8pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}\BODY\end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}\vspace{6pt}\par
}

\NewEnviron{archbox}[1][מפרט ארכיטקטורה והנדסה]{%
  \par\vspace{6pt}\noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicTealBg, colframe=CivicTeal,
    coltitle=white, colbacktitle=CivicTeal,
    fonttitle=\sffamily\bfseries,
    title={\he{#1}},
    arc=3pt, boxrule=1pt, rightrule=4pt,
    left=10pt, right=10pt, top=8pt, bottom=8pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}\BODY\end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}\vspace{6pt}\par
}

\NewEnviron{mathbox}[1][מודל מתמטי והגדרה פורמלית]{%
  \par\vspace{6pt}\noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicGrayBg, colframe=CivicNavy,
    coltitle=white, colbacktitle=CivicNavy,
    fonttitle=\sffamily\bfseries,
    title={\he{#1}},
    arc=3pt, boxrule=1pt, rightrule=4pt,
    left=10pt, right=10pt, top=8pt, bottom=8pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}\BODY\end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}\vspace{6pt}\par
}

\NewEnviron{riskbox}[1][ביקורת צוות אדום וניהול סיכונים]{%
  \par\vspace{6pt}\noindent
  \begin{otherlanguage}{english}%
  \begin{tcolorbox}[
    colback=CivicRedBg, colframe=CivicRed,
    coltitle=white, colbacktitle=CivicRed,
    fonttitle=\sffamily\bfseries,
    title={\he{#1}},
    arc=3pt, boxrule=1pt, rightrule=4pt,
    left=10pt, right=10pt, top=8pt, bottom=8pt,
    width=\textwidth
  ]
    \begin{otherlanguage}{hebrew}\BODY\end{otherlanguage}%
  \end{tcolorbox}%
  \end{otherlanguage}\vspace{6pt}\par
}

% --- Safe TikZ Environment Wrapper (Forces TLT inside RTL document) ---
\newenvironment{tikzhebrew}{%
  \begin{center}\begin{otherlanguage}{english}%
}{%
  \end{otherlanguage}\end{center}%
}

% --- Code Listing Styling (for JSON / Python / Mesh Protocols) ---
\lstset{
  basicstyle=\ttfamily\footnotesize,
  backgroundcolor=\color{CivicGrayBg},
  frame=single,
  rulecolor=\color{CivicBorder},
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  keywordstyle=\color{CivicNavy}\bfseries,
  stringstyle=\color{CivicTeal},
  commentstyle=\color{CivicSlate}\itshape
}

\endinput
