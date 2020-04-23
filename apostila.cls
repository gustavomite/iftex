\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apostila}
% baseado em ifestagio \ProvidesClass{ifestagio}[2017/01/26 v2.0 Classe IF para relatório de estágio por Marcos Roberto Ribeiro (https://github.com/ribeiromarcos/iftex)]

% Repassa demais opções a abntex2
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{abntex2}%
}
\ProcessOptions\relax

% ===============================================
% Herança da classe `abntex2' e inclusão das opções padrões
% ===============================================
\LoadClass[12pt,a4paper]{abntex2}

% ===============================================
% Pacotes Usados
% ===============================================
\RequirePackage[T1]{fontenc}          % Seleção de códigos de fonte
\RequirePackage[utf8]{inputenc}       % Codificação automática de caracteres especiais
\RequirePackage{morewrites}           % Resolve o erro “No room for a new \write”
%\RequirePackage[lighttt]{lmodern}     % Usa a fonte Latin Modern
\RequirePackage[scaled]{helvet}       % Usa a fonte Helvetia
\RequirePackage{}
\RequirePackage{lastpage}             % Contagem de páginas
\RequirePackage{indentfirst}          % Indenta primeiro parágrafo de cada seção
\RequirePackage{color, xcolor}        % Controle das cores
\RequirePackage{graphicx}             % Inclusão de gráficos
\RequirePackage{caption}              % Pacote para definição dos captions
\RequirePackage{microtype}            % Melhorias de justificação
\RequirePackage{pdfpages}             % inclusão de arquivos PDF
\RequirePackage{hyphenat}             % Retira hifenização do Preâmbulo
\RequirePackage{amsmath,amsfonts}     % Pacotes matemáticos
\RequirePackage{amssymb,amsthm}       % Pacotes matemáticos
\RequirePackage{url}                  % Tratamento correto de URL
\RequirePackage{enumerate}            % Listas numerados personalizadas
\RequirePackage{cleveref}             % Correção de links para sub-equações
\RequirePackage{float}                % Ambientes flutuantes personalizados
\RequirePackage{geometry}
%\RequirePackage[center,pagestyles]{titlesec}
%\RequirePackage{apptools}

\RequirePackage{tikz}                 % Pacote para desenho
\usetikzlibrary{shapes,arrows,matrix,positioning,backgrounds,calc,trees,fit}%
\RequirePackage{adjustbox}            % Pacote para reduzir/ampliar

% Preserva comando \bibcite alterado pelo pacote abntex2cite
\let\oldbibcite\bibcite%
\RequirePackage[alf,abnt-repeated-author-omit=yes,abnt-etal-list=0
]{abntex2cite}    % Citações ABNT
\let\bibcite\oldbibcite%

% -----------------------------------------------
% Configurações
% -----------------------------------------------

% Unidade
\providecommand{\imprimirunidade}{Campus Rio Pomba}%
\newcommand{\unidade}[1]{%
  \renewcommand{\imprimirunidade}{#1}%
}%

% Empresa
\providecommand{\imprimirempresa}{Empresa}%
\newcommand{\empresa}[1]{%
  \renewcommand{\imprimirempresa}{#1}%
}%

% Horas
\providecommand{\imprimirhoras}{99999}%
\newcommand{\horas}[1]{%
  \renewcommand{\imprimirhoras}{#1}%
}%


% Curso e Título obtido
\providecommand{\imprimircurso}{}%
\providecommand{\imprimirtitulocurso}{}%
\newcommand{\curso}[2]{%
  \renewcommand{\imprimirtitulocurso}{#1}%
  \renewcommand{\imprimircurso}{#2}%
}%

% Imagem da capa
\newcommand{\capaimg}[1]{\gdef\@cover{#1}}

% Cores
\definecolor{divisorcapa}{RGB}{50,160,65}%
\definecolor{cortitulo}{RGB}{0,100,2}%

% Preâmbulo
\preambulo{%
  \@title do Curso de {\imprimirtitulocurso} em {\imprimircurso} do Instituto Federal de Educação, Ciência e Tecnologia de Minas Gerais - {\imprimirunidade}. Autor: \@author
}%

% Citações explícitas
\newcommand{\citet}{\citeonline}%

% -----------------------------------------------
% Fonte padrão section, subsection e subsubsection
% -----------------------------------------------
\renewcommand{\ABNTEXchapterfont}{\color{cortitulo}\LARGE\bfseries}%

% -----------------------------------------------
% Definições de comprimento
% -----------------------------------------------
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{120mm}%
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{64mm}%
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{120mm}%
\setlength{\parindent}{1.25cm}%

% -----------------------------------------------
% Contadores
% -----------------------------------------------
% Equações com numeração contínua
\counterwithout{equation}{chapter}%
% Numerar sub-sub-seções
\setsecnumdepth{subsubsection}%
% Sumário contém apenas até as subseções
\settocdepth{subsection}%
% Figuras com numeração reiniciao nos capítulos
\newsubfloat{figure}%

% -----------------------------------------------
% Quadros
% -----------------------------------------------
% Cria o ambiente para quadros
\newcommand{\quadronome}{Quadro}%
\newcommand{\listquadronome}{Lista de Quadro}%
\newlistof{listofquadros}{loq}{\listquadronome}%
\newfloat{quadro}{loq}{\quadronome}%
\newlistentry{quadro}{loq}{0}%
\renewcommand{\cftquadroname}{\quadronome\space}%
\renewcommand*{\cftquadroaftersnum}{\hfill\textendash\hfill}%

% Mudança de estilo
\floatstyle{ruled}%
\captionsetup[quadro]{labelsep=endash}%

% -----------------------------------------------------------------------------
% Logos do IF
% -----------------------------------------------------------------------------
% Logo
\newcommand{\iflogo}{
\begin{tikzpicture}[node distance=0.1cm]
\tikzstyle{circulo}=[circle, fill={rgb:red,200;green,25;blue,30}, minimum size=1.1cm]
\tikzstyle{quadrado}=[rounded corners=0.1cm, fill={rgb:red,50;green,160;blue,65}, minimum size=1cm]
\node (q12) [quadrado] {};
\node (q13) [quadrado, right=of q12] {};
\node (q22) [quadrado, below=of q12] {};
\node (q21) [quadrado, left=of q22] {};
\node (q31) [quadrado, below=of q21] {};
\node (q32) [quadrado, right=of q31] {};
\node (q33) [quadrado, right=of q32] {};
\node (q41) [quadrado, below=of q31] {};
\node (q42) [quadrado, right=of q41] {};
\node (c) [circulo] at (q12 -| q21) {};
\end{tikzpicture}
}
% Logo com descrição
\newcommand{\iffull}{%
  {%
    \sffamily\large%
    \begin{tikzpicture}[node distance=0.05cm]%
    \tikzstyle{circulo}=[circle, fill={rgb:red,200;green,25;blue,30}, minimum size=.6cm]%
    \tikzstyle{quadrado}=[rounded corners=0.05cm, fill={rgb:red,50;green,160;blue,65}, minimum size=0.5cm, ,inner sep=0,outer sep=0,text depth=0pt]%
    \tikzstyle{texto}=[inner sep=0,outer sep=0,text depth=0pt, node distance=0.65cm]%
    \node (q12) [quadrado] {};%
    \node (q13) [quadrado, right=of q12] {};%
    \node (q22) [quadrado, below=of q12] {};%
    \node (q21) [quadrado, left=of q22] {};%
    \node (q31) [quadrado, below=of q21] {};%
    \node (q32) [quadrado, right=of q31] {};%
    \node (q33) [quadrado, right=of q32] {};%
    \node (q41) [quadrado, below=of q31] {};%
    \node (q42) [quadrado, right=of q41] {};%
    \node (c)   [circulo] at (q12 -| q21) {};%
    \node (if)  [texto, right=of q12.south east, anchor=south west] {\textbf{INSTITUTO FEDERAL}};%
    \node (edu) [texto, right=of q22.south east, anchor=south west] {\textbf{DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA}};%
    \node (mg)  [texto, right=of q32.south east, anchor=south west] {Minas Gerais};%
    \node (uni) [texto, right=of q42.south east, anchor=south west] {\imprimirunidade};%
    \end{tikzpicture}%
  }%
}%

% -----------------------------------------------
% Ajuste de cabeçalho e rodapé
% -----------------------------------------------
\makepagestyle{eescchaplast}%
\makeevenhead{eescchaplast}%
{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}%
\makeoddhead{eescchaplast}%
{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}%
\makeheadrule{eescchaplast}{\textwidth}{\normalrulethickness}%
\makepagestyle{eescpartlast}%
\makeoddhead{eescpartlast}{}{}{\ABNTEXfontereduzida\thepage}%
\makeevenhead{eescpartlast}{\ABNTEXfontereduzida\thepage}{}{}%

% -----------------------------------------------
% Configuração de Páginas
% -----------------------------------------------
% Configuração de páginas pré-textuais
\renewcommand{\pretextual}{%
  \aliaspagestyle{chapter}{empty}%
  \pagestyle{empty}%
  \aliaspagestyle{cleared}{empty}%
  \aliaspagestyle{part}{empty}%
}%
\renewcommand{\frontmatter}{\pretextual} %

% Configuração de páginas textuais
\renewcommand{\textual}{%
  \pagestyle{abntheadings}
  \aliaspagestyle{chapter}{abntchapfirst}%
  \aliaspagestyle{cleared}{eescchaplast}%
  \aliaspagestyle{part}{eescchaplast}%
  \nouppercaseheads%
}%

% Configuração de páginas pós-textuais
\renewcommand{\postextual}{%
  \pagestyle{abntheadings}%
  \aliaspagestyle{chapter}{abntchapfirst}%
  \aliaspagestyle{cleared}{eescchaplast}%
  \aliaspagestyle{part}{eescpartlast}%
  \aliaspagestyle{afterpart}{eescpartlast}%
}%
\renewcommand{\backmatter}{\postextual}%

% ===============================================
% Elementos Pré-Textuais
% ===============================================

% -----------------------------------------------
% Capa
% -----------------------------------------------
\renewcommand{\imprimircapa}{%
    \pdfbookmark[0]{Capa}{}%

    \newgeometry{margin = 0in}
    \parindent=0pt
    
    \includegraphics[width=\linewidth]{\@cover}
    \setlength{\fboxsep}{0pt}
    \colorbox{divisorcapa}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.3in}}}}
    
    \parindent=2pt
    \vfill
    
    \begin{center}
    {\fontsize{50}{60}\selectfont\sffamily \@title}
    \vspace{0.2in}
    %{\Huge{\textbf{\@title}}}%
    \par{\large\textbf{\imprimirautor}}%
    \end{center}
    \vfill
    
    \begin{center}
        {\adjustbox{scale=0.6}{\iflogo}}
        {\par\Large{\sffamily\textbf{Instituto}}}
        {\par\Large{\sffamily\textbf{Federal}}}
        {\par\large{\sffamily Sudeste de}}
        {\par\large{\sffamily Minas Gerais}}
        {\par\large{\imprimirunidade}}      
    \end{center}

    \vfill
    
    \parindent=0pt
    \setlength{\fboxsep}{0pt}
    \colorbox{divisorcapa}{\makebox[\linewidth][l]{\shortstack[l]{\vspace{0.3in}}}}
    \restoregeometry

    \cleardoublepage%
}

% -----------------------------------------------
% Folha de Rosto
% -----------------------------------------------
\renewcommand{\folhaderostocontent}{%
  \setcounter{page}{1}%
  \begin{center}%
    \vfill%
    {\large\textbf{\imprimirautor}}%
    \vfill%
    {\Large{\textbf{\@title}}}%
    \vfill%
    \hspace{.45\textwidth}%
    \begin{minipage}{.5\textwidth}%
        \imprimirpreambulo%
    \end{minipage}%
    \vfill%
    \textbf{\imprimirlocal}\par%%
    \textbf{\@year}%
  \end{center}%
}%

\newcommand{\gerafolharosto}{%
  \imprimirfolhaderosto{}%
}%

% -----------------------------------------------
% Dedicatória
% -----------------------------------------------
\newcommand{\inserirdedicatoria}[1]{%
  \newcommand{\textodedicatoria}{#1}%
}

\newcommand{\geradedicatoria}{%
  \ifthenelse{\isundefined{\textodedicatoria}}
  {}{%
        \begin{dedicatoria}%
        \vspace*{\fill}%
        \centering%
        \noindent%
        \textit{\textodedicatoria}%
        \vspace*{\fill}%
    \end{dedicatoria}%
  }%
}%

% -----------------------------------------------
% Agradecimentos
% -----------------------------------------------
\newcommand{\inseriragradecimentos}[1]{%
  \newcommand{\textoagradecimentos}{#1}%
}

\newcommand{\geraagradecimentos}{%
  \ifthenelse{\isundefined{\textoagradecimentos}}
  {}{%
    \begin{agradecimentos}%
      \textoagradecimentos%
    \end{agradecimentos}%
  }%
}%

% -----------------------------------------------
% Epígrafe
% -----------------------------------------------
\newcommand{\inserirepigrafe}[1]{%
  \newcommand{\textoepigrafe}{#1}%
}

\newcommand{\geraepigrafe}{%
\ifthenelse{\isundefined{\textoepigrafe}}
  {}{%
    \begin{epigrafe}%
      \vspace*{\fill}%
      \begin{flushright}%
        \textit{\textoepigrafe}%
      \end{flushright}%
    \end{epigrafe}%
  }%
}%

% ===============================================
% Listas e Sumário
% ===============================================


% -----------------------------------------------
% Lista de ilustrações
% -----------------------------------------------
\newcommand{\incluirlistailustracoes}{FALSE}%
\newcommand{\inserirlistafiguras}{%
  \renewcommand{\incluirlistailustracoes}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listfigurename}%
    {Lista de Figuras}%
}

\newcommand{\geralistailustracoes}{%
  \ifthenelse{\equal{\incluirlistailustracoes}{TRUE}}{%
    \pretextualchapter{\listfigurename}
    \@starttoc{lof}
    \cleardoublepage%
   }{}%
}%

% -----------------------------------------------
% Lista de quadros
% -----------------------------------------------
\newcommand{\incluirlistaquadros}{FALSE}%
\newcommand{\inserirlistaquadros}{%
  \renewcommand{\incluirlistaquadros}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listquadronome}%
    {Lista de Quadros}%
}

\newcommand{\geralistaquadros}{%
  \ifthenelse{\equal{\incluirlistaquadros}{TRUE}}{%
    \pretextualchapter{\listquadronome}
    \@starttoc{loq}
    \cleardoublepage%
   }{}%
}%

% -----------------------------------------------
% Lista de tabelas
% -----------------------------------------------
\newcommand{\incluirlistatabelas}{FALSE}%
\newcommand{\inserirlistatabelas}{%
  \renewcommand{\incluirlistatabelas}{TRUE}%
}%
\addto\captionsbrazil{%
  \renewcommand{\listtablename}%
    {Lista de Tabelas}%
}

\newcommand{\geralistatabelas}{%
  \ifthenelse{\equal{\incluirlistatabelas}{TRUE}}{%
    \pretextualchapter{\listtablename}
    \@starttoc{lot}
    \cleardoublepage%
  }{}%
}

% -----------------------------------------------
% Sumário
% -----------------------------------------------
\newcommand{\sumario}{%
  \pretextualchapter{\contentsname}
  \thispagestyle{empty}
  \pagestyle{empty}
  \@starttoc{toc}
  \cleardoublepage
}

% ===============================================
% Redefinição do \maketitle
% ===============================================
\renewcommand{\maketitle}{%
  \pretextual
  % Capa
  \imprimircapa

  % Sumário
  \sumario

  % Formatação de páginas textuais
  \mainmatter
}


% -----------------------------------------------
% Configurações de aparência do PDF final
% -----------------------------------------------
\AtBeginDocument{%
\makeatletter%
\hypersetup{%
    pdftitle={Relatório de Estágio Supervisionado},%
    pdfauthor={\@author},%
    pdfsubject={\imprimirpreambulo},%
    pdfcreator={\@author},%
    bookmarksdepth=4,%
    breaklinks=true%
}%
\makeatother%
}%

% -----------------------------------------------
% Ambiente baseados em teoremas
% -----------------------------------------------
\theoremstyle{definition}%
\newtheorem{corolario}{Corolário}%
\newtheorem{definicao}{Definição}%
\newtheorem{exemplo}{Exemplo}%
\newtheorem{lema}{Lema}%
\newtheorem{observacao}{Observação}%
\newtheorem{proposicao}{Proposição}%
\newtheorem{teorema}{Teorema}%
\newenvironment{demonstracao}{\begin{proof}[Demonstração]}{\end{proof}}%

% -----------------------------------------------
% Evita violação de margens
% -----------------------------------------------
\sloppy%

