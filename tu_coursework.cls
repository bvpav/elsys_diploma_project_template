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
2021/11/03 Minor improvements%
]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions

\LoadClass[
    % For some stupid reason the next line causes a warning. It's the default value anyway, so it stays commented.
	paper=A4,					% paper size --> A4 is default in Bulgaria
	twoside=true,				% onesite or twoside printing
	open=any,					% doublepage cleaning ends up right side
	parskip=half,				% spacing value / method for paragraphs
	chapterprefix=false,        % do not display a prefix for chapters
    appendixprefix=true,        % but display a prefix for appendix chapter
	fontsize=11pt,				% font size
	headings=normal,			% size of headings
	bibliography=totoc,			% include bib in toc
	listof=totoc,				% include listof entries in toc
	titlepage=true,				% own page for each title page
	captions=belowtable,		% display table captions below the float env
	draft=false,				% value for draft version
	DIV=8,                      % suppress DIV warnings, overwritten by cleanthesis.sty
]{scrreprt}

% Monospace font is Fira Mono Sans
% the body font used is FBB (Bembo)
\usepackage{iftex}
\ifPDFTeX
  \usepackage{fbb}
  \usepackage{FiraMono}
  \usepackage{FiraSans}
  \usepackage{textcomp}
  \usepackage[utf8]{inputenc}
  \usepackage[T2A,T1]{fontenc}
  \usepackage[main=bulgarian,english]{babel}
\else
  % make sure the fonts are actually set
  \usepackage{fontspec}
  \usepackage{polyglossia}
  \setromanfont[Path=./fonts/, BoldFont=fbb-Bold, UprightFont=fbb-Regular, ItalicFont=fbb-Italic, BoldItalicFont=fbb-BoldItalic]{fbb}
  \setmonofont[Path=./fonts/, BoldFont=FiraMono-Bold, UprightFont=FiraMono-Regular]{FiraMono.ttf}
  \setsansfont[Path=./fonts/, BoldFont=FiraSans-Bold, UprightFont=FiraSans-Regular, ItalicFont=FiraSans-Italic, BoldItalicFont=FiraSans-BoldItalic]{FiraSans.ttf}
\fi

\usepackage{xifthen}

% make all cross-references clickable
\usepackage[hidelinks,unicode]{hyperref}

\usepackage[titletoc]{appendix}

\renewcommand{\footnotesize}{\fontsize{9pt}{11pt}\selectfont}

\usepackage[                           % clean thesis style
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

\textheight=24cm

\usepackage{pdfpages}
\usepackage{placeins}
\usepackage{multirow}
\usepackage{makecell}
\usepackage{csvsimple}

\usepackage[libertine,bigdelims,vvarbb]{newtxmath} % bb from STIX
\usepackage[cal=boondoxo]{mathalfa} % mathcal

\usepackage{microtype} % improve typography
%\usepackage{anyfontsize} % allow any size of font
\usepackage{amsmath,amsfonts,amsbsy}
\usepackage{mathtools}
\usepackage[style]{abstract} % abstract styling

\usepackage{multicol}
\usepackage{etoolbox}
\usepackage{parskip} % adjustable line spacing
\usepackage{float}
% units for nice formatting of numbers
\usepackage[exponent-product=\cdot]{siunitx}

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
%% ---

% nice number printing
\usepackage{numprint}

% allow PDF graphics
\usepackage{graphicx}

% allow section styling
%\usepackage{sectsty}

\newcommand{\secfont}{\normalfont\sffamily}
% % style the sections and the abstract
%\allsectionsfont{\secfont}
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}
\newcommand{\@supervisorchair}{}
\newcommand{\supervisorchair}[1]{\renewcommand{\@supervisorchair}{#1}}
\newcommand{\@reviewer}{}
\newcommand{\reviewer}[1]{\renewcommand{\@reviewer}{#1}}
\newcommand{\@reviewerchair}{}
\newcommand{\reviewerchair}[1]{\renewcommand{\@reviewerchair}{#1}}
\newcommand{\@admgroup}{}
\newcommand{\admgroup}[1]{\renewcommand{\@admgroup}{#1}}
\newcommand{\@faculty}{}
\newcommand{\faculty}[1]{\renewcommand{\@faculty}{#1}}
\newcommand{\@fac}{}
\newcommand{\fac}[1]{\renewcommand{\@fac}{#1}}
\newcommand{\@facnumber}{}
\newcommand{\facnumber}[1]{\renewcommand{\@facnumber}{#1}}
\newcommand{\@speciality}{}
\newcommand{\speciality}[1]{\renewcommand{\@speciality}{#1}}
\newcommand{\@doctype}{}
\newcommand{\doctype}[1]{\renewcommand{\@doctype}{#1}}
\newcommand{\@city}{}
\newcommand{\city}[1]{\renewcommand{\@city}{#1}}

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
            \huge\sffamily\@faculty\\ 
        \end{center}

        % title and author
        \vspace{2cm}
        \large
        \vskip 8em%
        \begin{center}
            \noindent
            \fontsize{35}{35}
            \scshape\@doctype\par
            \normalsize
            \Large
            на тема\par
            \noindent
            \Huge\scshape\@title\par
        \end{center}
        \vfill
        
        \begin{multicols}{2}
            \noindent
            Автор:\\
            {
                \large
                \textbf{\@author}\\
                \textbf
                {
                    \@fac, Група \@admgroup,\\
                    ФК\textnumero\ \@facnumber\\
                    специалност \@speciality
                }
            }
            \vfill\null
            \columnbreak
            \noindent
            Научен ръководител:\\
            {
                \large
                \textbf
                {
                    \@supervisor\\
                    \ifthenelse{\equal{\@supervisorchair}{}}{}
                    {
                        катедра 
                        \@supervisorchair}\\
                    }
            }\\
            \ifthenelse{\equal{\@reviewer}{}}{}
            {
                Рецензент:\\
                {
                    \large
                    \textbf
                    {
                        \@reviewer\\
                        \ifthenelse{\equal{\@reviewerchair}{}}{}
                        {
                            катедра 
                            \@reviewerchair}\\
                        }
                }
            }
            \vfill
        \end{multicols}
        
        \vfill
        
        \begin{center}
            \@date\\
            \@city
        \end{center}
    	\normalsize
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
\newcommand{\todo}[1]{{\large \hl{TODO: #1}\PackageWarning{TODO:}{#1!}}}

% make urls less bulky and ugly
\renewcommand{\UrlFont}{\ttfamily\small}

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

\hypersetup{					    % настройки на пакета hyperref
	plainpages=false,			    %
	pdfborder={0 0 0},			    %
	breaklinks=true,			    % разрешаване на нови редове в линкове
	bookmarksnumbered=true,		    %
	bookmarksopen=true			    %
}

% Превод на \autoref
\addto\extrasbulgarian
{%
	\def\figureautorefname{фигура}%
}
\addto\extrasbulgarian
{%
	\def\tableautorefname{таблица}%
}
\addto\extrasbulgarian
{%
	\def\partautorefname{част}%
}
\addto\extrasbulgarian
{%
	\def\appendixautorefname{приложение}%
}
\addto\extrasbulgarian
{%
	\def\equationautorefname{уравнение}%
}
\addto\extrasbulgarian
{%
	\def\Itemautorefname{точка}%
}
\addto\extrasbulgarian
{%
	\def\chapterautorefname{глава}%
}
\addto\extrasbulgarian
{%
	\def\sectionautorefname{ред}%
}
\addto\extrasbulgarian
{%
	\def\subsectionautorefname{подточка}%
}
\addto\extrasbulgarian
{%
	\def\subsubsectionautorefname{подподточка}%
}
\addto\extrasbulgarian
{%
	\def\paragraphautorefname{параграф}%
}
\addto\extrasbulgarian
{%
	\def\Hfootnoteautorefname{бележка}%
}
\addto\extrasbulgarian
{%
	\def\AMSautorefname{уравнение}%
}
\addto\extrasbulgarian
{%
	\def\theoremautorefname{теорема}%
}

%\DeclareMathSizes{9}{10.5}{7.5}{7.5}
