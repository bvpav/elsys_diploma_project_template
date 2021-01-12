% =============================================================================
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

\ProvidesClass{tu_coursework}[%
2009/01/09 Colin Perkins <csp@dcs.gla.ac.uk>.%
2009/09/16 Modified by Tim Storer <tws@dcs.gla.ac.uk> to support non pdf modes.%
2011/02/15 Modified by Gregg Hamilton <hamiltgr@dcs.gla.ac.uk> for use in final year projects.%
2012/10/18 Modified by Patrick Prosser, use geometry to control margins, simplified.%
2018/09/14 Modified by John Williamson, improve typographic appearance%
2020/05/30 Adapted by Vladimir Garistov for Technical University - Sofia%
]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}

\ProcessOptions
\LoadClass
[
    paper=A4,                   % paper size --> A4 is default in Germany
    twoside=true,               % onesite or twoside printing
    open=any,                   % doublepage cleaning ends up right side
    parskip=half,               % spacing value / method for paragraphs
    chapterprefix=true,         % prefix for chapter marks
    fontsize=9pt,               % font size
    headings=normal,            % size of headings
    bibliography=totoc,         % include bib in toc
    listof=totoc,               % include listof entries in toc
    titlepage=true,             % own page for each title page
    %captions=tableabove,       % display table captions above the float env
    chapterprefix=false,        % do not display a prefix for chapters
    appendixprefix=false,       % but display a prefix for appendix chapter
    draft=false,                % value for draft version
]
{scrreprt}

\usepackage[T2A,T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[main=bulgarian,english]{babel}

% make all cross-references clickable
\usepackage[hidelinks,unicode]{hyperref}

\usepackage{color} % colors
\usepackage[table,dvipsnames]{xcolor}
\RequirePackage{xifthen}

\renewcommand{\footnotesize}{\fontsize{8pt}{10pt}\selectfont}

\usepackage
[                           % clean thesis style
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
]
{cleanthesis}

\RequirePackage{dejavu}

\DefineBibliographyStrings{bulgarian}
{
  backrefpage = {цитирано на стр.},% originally "cited on page"
  backrefpages = {цитирано на стр.},% originally "cited on pages"
}

\usepackage{iftex}
\usepackage{pdfpages}
\usepackage{placeins}
\usepackage{multirow}
\usepackage{makecell}

\usepackage[libertine,bigdelims,vvarbb]{newtxmath} % bb from STIX
\usepackage[cal=boondoxo]{mathalfa} % mathcal

\usepackage{microtype} % improve typography
\usepackage{anyfontsize} % allow any size of font
\usepackage{amsmath,amsfonts,amsbsy,amssymb}
\usepackage[style]{abstract} % abstract styling

% set bibliography styling
%\usepackage{natbib}
%\bibpunct{(}{)}{;}{a}{}{;}

\usepackage{multicol}
\usepackage{etoolbox}
\usepackage{parskip} % adjustable line spacing
\usepackage{listings} % nice code listings

% remove dots from ToC
%\usepackage[titles]{tocloft} 
%\renewcommand{\cftdot}{}
% increase spacing in ToC to avoid ascenders and descenders colliding
%\renewcommand\cftsecafterpnum{\vskip 3pt}
%\renewcommand\cftbeforechapskip{5pt}
%\renewcommand\cftsubsecafterpnum{\vskip 1.5pt}
%\renewcommand\cftchapafterpnum{\vskip 4pt}
%\usepackage[nottoc]{tocbibind}

% from: https://gist.github.com/FelipeCortez/10729134
% set up listings for prettier output
\definecolor{bluekeywords}{rgb}{0.13, 0.19, 0.7}
\definecolor{greencomments}{rgb}{0.1, 0.5, 0.2}
\definecolor{redstrings}{rgb}{0.8, 0.15, 0.1}
\definecolor{graynumbers}{rgb}{0.5, 0.5, 0.5}
\definecolor{subtlegray}{rgb}{0.98, 0.98, 0.98}
\usepackage{lstautogobble}
\usepackage{listings}
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
    numberstyle=\color{graynumbers},
    basicstyle=\ttfamily\linespread{1.15},
    frame=tb,
    framesep=8pt,
    framexleftmargin=12pt,
    tabsize=4,
    captionpos=b
}
%% ---

% nice number printing
\usepackage{numprint}

% allow PDF graphics
\usepackage{graphicx}

% allow section styling
%\usepackage{sectsty}

\newcommand{\secfont}{\normalfont\sffamily}
% % style the sections and the abstract
% \allsectionsfont{\secfont}
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@reviewer}{}
\newcommand{\reviewer}[1]{\renewcommand{\@reviewer}{#1}}
\newcommand{\@admgroup}{}
\newcommand{\admgroup}[1]{\renewcommand{\@admgroup}{#1}}
\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\@fac}{}
\newcommand{\fac}[1]{\renewcommand{\@fac}{#1}}
\newcommand{\@facnumber}{}
\newcommand{\facnumber}[1]{\renewcommand{\@facnumber}{#1}}
\newcommand{\@city}{}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}

\usepackage[toc]{appendix}

% allow subfloats
\usepackage{subcaption}

% define the title page
\renewcommand\maketitle
{
    \begin{titlepage}
        \definecolor{UniBlue}{HTML}{00355F}

        %\let\footnotesize\small
        \let\footnoterule\relax
        \let\footnote \thanks

        % the logo, full page width
        \vspace{1in}
        \begin{figure}[h]
            \includegraphics[width=\linewidth]{images/TU-logo_long.png}
        \end{figure}
        \vskip 0.5em
        
        \color{UniBlue}
        \begin{center}
            \LARGE\sffamily\@faculty\\ 
        \end{center}

        % title and author
        \vspace{2cm}
        \Large
        \vskip 8em%
        \begin{center}
            \color{UniBlue}
            \noindent
            \Huge\scshape\@title\par
        \end{center}
        \vfill
        
        \begin{multicols}{2}
            Автор:\\
            {
                \large
                \textbf{\@author}\\
                \textbf{\@fac, Група: \@admgroup,\\ФК\textnumero: \@facnumber}
            }
            \vfill
            Научен ръководител:\\
            {
                \large
                \textbf{\@supervisor}\\
            }\\
            \ifthenelse{\equal{\@reviewer}{}}{}
            {
                Рецензент:\\
                {
                    \large
                    \textbf{\@reviewer}\\
                }
                \vfill
            }
        \end{multicols}
        
        \vfill
        
        \begin{center}
            \@date\\
            \@city
        \end{center}
    \end{titlepage}

    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@supervisor\@empty
    \global\let\@reviewer\@empty
    \global\let\@admgroup\@empty
    \global\let\@faculty\@empty
    \global\let\@fac\@empty
    \global\let\@facnumber\@empty
    \global\let\@date\@empty
    \global\let\@city\@empty
    \global\let\@consentname\@empty
    \global\let\@consentdate\@empty

    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\supervisor\relax
    \global\let\reviewer\relax
    \global\let\admgroup\relax
    \global\let\faculty\relax
    \global\let\fac\relax
    \global\let\facnumber\relax
    \global\let\date\relax
    \global\let\city\relax
    \global\let\and\relax
}

\usepackage{booktabs}

% Educational consent form
\newcommand{\educationalconsent}{
    \ifdefined\consentname
          \newpage
          \chapter*{Education Use Consent}

          I hereby grant my permission for this project to be stored, distributed and shown to other
          University of Glasgow students and staff for educational purposes. 
          \textbf{Please note that you are under no obligation to sign 
          this declaration, but doing so would help future students.}

          \begin{tabular}{@{}llll}
                &                     &            &                     \\
                &                     &            &                     \\
          Signature: & \consentname & Date: & \consentdate \\
                &                     &            &                     \\
                &                     &            &                     \\
          \end{tabular}
    \else
    \newpage
        \chapter*{Education Use Consent}
        Consent for educational reuse withheld. Do not distribute.
    \fi
}

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
%\setlength{\parindent}{0pt}

% use (a) in figures
\captionsetup{subrefformat=parens}

% Algorithm typesetting package
\usepackage[plain, noline, shortend, linesnumberedhidden]{algorithm2e}
\SetAlFnt{\sffamily \small}

% switch to roman numeral for frontmatter
\pagenumbering{roman}

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