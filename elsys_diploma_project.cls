% =============================================================================
% elsys_diploma_project.cls
% Шаблон за документация на дипломна работа в ТУЕС към ТУ-София, адаптиран от:
%
% tu_coursework.cls
% Шаблон за курсова работа в ТУ-София, адаптиран от:
%
% l4proj.cls
%
% Template for final year projects in the School of Computing Science at the
% University of Glasgow. Adapted from the level 3 project template originally
% provided by Colin Perkins <csp@dcs.gla.ac.uk>.
%
% =============================================================================

\ProvidesClass{elsys_diploma_project}[%
2009/01/09 Colin Perkins <csp@dcs.gla.ac.uk>.%
2009/09/16 Modified by Tim Storer <tws@dcs.gla.ac.uk> to support non pdf modes.%
2011/02/15 Modified by Gregg Hamilton <hamiltgr@dcs.gla.ac.uk> for use in final year projects.%
2012/10/18 Modified by Patrick Prosser, use geometry to control margins, simplified.%
2018/09/14 Modified by John Williamson, improve typographic appearance%
2020/05/30 Adapted by Vladimir Garistov for Technical University - Sofia%
2021/11/03 Minor improvements%
2024/12/29 Adapted by Bozhidar Pavlov for Technological School "Electronic Systems", associated with Technical University - Sofia%
]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions

\LoadClass[
	twoside=true,				% onesite or twoside printing
	open=any,					% doublepage cleaning ends up right side
	parskip=half,				% spacing value / method for paragraphs
	chapterprefix=false,		% do not display a prefix for chapters
	appendixprefix=true,		% but display a prefix for appendix chapter
	fontsize=10pt,				% font size
	headings=normal,			% size of headings
	bibliography=totoc,			% include bib in toc
	listof=totoc,				% include listof entries in toc
	titlepage=true,				% own page for each title page
	captions=belowtable,		% display table captions below the float env
	draft=false,				% value for draft version
	DIV=9,						% suppress DIV warnings, overwritten by cleanthesis.sty
]{scrreprt}

% Monospace font was Fira Mono Sans and the body font was FBB (Bembo).
% Removed as cleanthesis overwrites them anyway.
\RequirePackage{iftex}
\ifPDFTeX
	\RequirePackage[utf8]{inputenc}
	\RequirePackage[T2A,T1]{fontenc}
	\RequirePackage[main=bulgarian,english]{babel}
	\pdfminorversion=7
\else
	% make sure the fonts are actually set
	\RequirePackage{fontspec}
	\RequirePackage{polyglossia}
\fi

% cleanthesis style
\RequirePackage[
	figuresep=colon,
	sansserif=true,
	hangfigurecaption=false,
	hangsection=true,
	hangsubsection=true,
	configurelistings=false,
	colorize=full,
	colortheme=bluemagenta,
	configurebiblatex=true,
	bibsys=biber,
	bibfile=references.bib,
	bibstyle=ieee,
	bibsorting=nty,
]{cleanthesis}

% Load packages
\RequirePackage{indentfirst}
\RequirePackage{scrhack}								% fixes a KOMA-Script related warning
\RequirePackage{xifthen}
\RequirePackage[titletoc]{appendix}
\RequirePackage{pdfpages}
\RequirePackage{placeins}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{csvsimple}
\RequirePackage[cal=boondoxo]{mathalpha}				% mathcal
\RequirePackage{amsmath,amsfonts,amsbsy}
\RequirePackage{mathtools}
\RequirePackage[style]{abstract}						% abstract styling
\RequirePackage{etoolbox}
\RequirePackage{float}
\RequirePackage{numprint}								% nice number printing
\RequirePackage{subcaption}								% allow subfloats
\RequirePackage{booktabs}
\RequirePackage{tcolorbox}
\RequirePackage{soul}
\RequirePackage{lstautogobble}

\RequirePackage[exponent-product=\cdot]{siunitx}		% units for nice formatting of numbers
\sisetup{mode = match}

\RequirePackage[americancurrents, americanvoltages, europeanresistors, americaninductors, siunitx, nooldvoltagedirection]{circuitikz}

\RequirePackage{multicol}
\setlength{\columnsep}{1.5pc}

\RequirePackage{listings}

% from: https://gist.github.com/FelipeCortez/10729134
% set up listings for prettier output
\definecolor{bluekeywords}{rgb}{0.13, 0.19, 0.7}
\definecolor{greencomments}{rgb}{0.1, 0.5, 0.2}
\definecolor{redstrings}{rgb}{0.8, 0.15, 0.1}
\definecolor{graynumbers}{rgb}{0.5, 0.5, 0.5}
\definecolor{subtlegray}{rgb}{0.98, 0.98, 0.98}

\lstset{
	autogobble,	
	columns=fullflexible,
	showspaces=false,
	showtabs=false,
	breaklines=true,
	showstringspaces=false,
	breakatwhitespace=true,
	escapeinside={(*@}{@*)},
	rulecolor=\color{lightgray},
	backgroundcolor=\color{subtlegray},
	commentstyle=\color{greencomments},
	keywordstyle=\color{bluekeywords},
	stringstyle=\color{redstrings},
	numbers=left,
	numberstyle=\color{graynumbers},
	basicstyle=\ttfamily\linespread{1.15}\footnotesize,
	frame=tb,
	framesep=12pt,
	framexleftmargin=12pt,
	tabsize=4,
	captionpos=b
}
\renewcommand{\lstlistingname}{Програмен код}

% Algorithm typesetting package
\RequirePackage[plain, noline, shortend, linesnumberedhidden]{algorithm2e}
\SetAlFnt{\sffamily \small}

\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=red!30]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=blue!30]
\tikzstyle{process} = [rectangle, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=orange!30]
\tikzstyle{decision} = [diamond, minimum width=1cm, minimum height=1cm, text centered, draw=black, fill=green!30, inner sep = -0.4cm]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{arrow_no_head} = [thick]

% Footnote font size
\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}

% make all cross-references clickable
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{						% hyperref settings
	plainpages=false,				%
	pdfborder={0 0 0},				%
	breaklinks=true,				% allow newlines in links
	bookmarksnumbered=true,			%
	bookmarksopen=true				%
}

% Must be loaded after hyperref
\RequirePackage[nameinlink,bulgarian]{cleveref_bg}

\textheight=24cm

% Metadata
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@speciality}{}
\newcommand{\speciality}[1]{\renewcommand{\@speciality}{#1}}
\newcommand{\@specialitycode}{}
\newcommand{\specialitycode}[1]{\renewcommand{\@specialitycode}{#1}}
\newcommand{\@profession}{}
\newcommand{\profession}[1]{\renewcommand{\@profession}{#1}}
\newcommand{\@professioncode}{}
\newcommand{\professioncode}[1]{\renewcommand{\@professioncode}{#1}}
\newcommand{\@doctype}{}
\newcommand{\doctype}[1]{\renewcommand{\@doctype}{#1}}
\newcommand{\@city}{}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}

% Define the title page
\renewcommand\maketitle
{
    \begin{titlepage}
        \begin{center}
            \begin{minipage}[t]{0.15\textwidth}
                \vspace{0pt}
                \includegraphics[width=\textwidth]{images/elsys_logo.png}
            \end{minipage}%
            \begin{minipage}[t]{0.83\textwidth}
                \vspace{0pt}
                \begin{center}
                    {\bfseries ТЕХНОЛОГИЧНО УЧИЛИЩЕ ЕЛЕКТРОННИ СИСТЕМИ}\\[0.5em]
                    {към ТЕХНИЧЕСКИ УНИВЕРСИТЕТ - СОФИЯ}
                \end{center}
            \end{minipage}
            
            \vspace{4cm}
            
            {\Huge\bfseries \MakeUppercase{\@doctype}}\\
            \vspace{1cm}
            
            {\bfseries
                \begin{tabular}{l}
                    по професия код {\@professioncode} ,,{\@profession}''\\
                    специалност код {\@specialitycode} ,,{\@speciality}''
                \end{tabular}
            }
            \vspace{2cm}
            
            {\Large Тема: \textbf{\@title}}\\
            \vspace{4cm}
            
            \begin{center}
                \begin{tabular}{l@{\hspace{2cm}}l}
                    {\large Дипломант:} & {\large Дипломен ръководител:} \\
                    {\large\@author} & {\large\@supervisor} \\
                \end{tabular}
            \end{center}
            
            \vfill
            
            {\Large \MakeUppercase{\@city}}\\[0.5em]
            {\large\the\year}
        \end{center}
    \end{titlepage}

    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@supervisor\@empty
    \global\let\@date\@empty
    \global\let\@city\@empty

    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\supervisor\relax
    \global\let\date\relax
    \global\let\city\relax
    \global\let\and\relax
}
\usepackage{booktabs}

% highlight boxes
\usepackage{tcolorbox}
\newenvironment{highlight}
{\begin{tcolorbox}[notitle,boxrule=0pt,colback=green!10,colframe=green!10]}
{
\end{tcolorbox}
}

\newenvironment{highlight_title}[1]
{\begin{tcolorbox}[title=#1,boxrule=2pt,colback=green!10,colframe=green!20,coltitle=black,fonttitle=\bfseries]}
{
\end{tcolorbox}
}

% adjust margins
\setlength{\parindent}{12pt}

% use (a) in figures
\captionsetup{subrefformat=parens}

% Algorithm typesetting package
\usepackage[plain, noline, shortend, linesnumberedhidden]{algorithm2e}
\SetAlFnt{\sffamily \small}

% switch to roman numeral for frontmatter
\pagenumbering{Roman}

% fix itemise so it looks reasonable
\renewcommand{\@listI}{%
      \leftmargin=25pt
      \rightmargin=0pt
      \labelsep=5pt
      \labelwidth=20pt
      \itemindent=0pt
      \listparindent=0pt
      \topsep=0pt plus 2pt minus 4pt
      \partopsep=0pt plus 1pt minus 1pt
      \parsep=1pt plus 1pt
      \itemsep=\parsep}

% allow highlighting of text for todo notes
\usepackage{soul}
\newcommand{\todo}[1]{\large \hl{TODO: #1}\PackageWarning{TODO:}{#1!}}

% make urls less bulky and ugly
\renewcommand{\UrlFont}{\ttfamily\small}

% units for nice formatting of numbers
\usepackage{siunitx}

\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=red!30]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=blue!30]
\tikzstyle{process} = [rectangle, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=orange!30]
\tikzstyle{decision} = [diamond, minimum width=1cm, minimum height=1cm, text centered, draw=black, fill=green!30, inner sep = -0.4cm]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{arrow_no_head} = [thick]


% Мърлява заобиколка на проблем с форматирането, причинен от редефинирането на \appendix от hyperref
\renewcommand{\appendix}
{%
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \renewcommand\chapapp{\appendixname}
    \renewcommand\thechapter{\Alph{chapter}}
    \renewcommand\theHchapter{\Alph{chapter}}
    \renewcommand{\chaptermark}[1]{%
        \markboth{%
            \ctfontfootertext
            % use \@chapapp instead of \chaptername to avoid
            % 'Chapter A Appendix ...', thanks to @farbverlust (issue #47)
    		{\color{ctcolorfootermark}\textbf{\chapapp\ \thechapter}}%
    		\hspace{.25cm}%
            %\protect\begin{minipage}[t]{.65\textwidth}%
                ##1%
            %\protect\end{minipage}%
        }{}%
    }
    %\cleardoublepage
    \clearpage
    \addcontentsline{toc}{chapter}{Приложения}%
}

%\DeclareMathSizes{9}{10.5}{7.5}{7.5}
