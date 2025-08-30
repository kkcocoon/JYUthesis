% 嘉应学院本科毕业论文Latex模板，来自： https://github.com/kkcocoon/JYUthesis/
% 修订时间为2025年8月30日

\NeedsTeXFormat{LaTeX2e}

% 加载 article 类，设置纸张大小为 A4，字号为 12pt
\LoadClass[a4paper,12pt,UTF8,heading=true,fontset=none]{ctexart}

% ======================= 基础宏包 =======================
% 数学相关宏包，提供数学公式排版功能
\RequirePackage{amsmath,amssymb, bm}
% 插入图片的宏包
\RequirePackage{graphicx}
% 支持子图排版的宏包
\RequirePackage{subcaption} 
% 保护脆弱命令，避免意外解析
\RequirePackage{cprotect}
% 设置代码环境的宏包
\RequirePackage{listings}
% 加载 xcolor 用于代码环境的颜色设置
\RequirePackage{xcolor}
% 首行缩进宏包，使段落首行自动缩进
\RequirePackage{indentfirst}
% 设置浮动体（如图表）的标题样式
\RequirePackage{caption}
% 定制列表环境的宏包
\RequirePackage{enumitem}
% 提供下划线功能的宏包
\RequirePackage{ulem}
% 尺寸计算宏包
\RequirePackage{calc}
% 用于条件判断和环境钩子的宏包
\RequirePackage{etoolbox}
% 在参考文献环境开始时，添加到目录中
\AtBeginEnvironment{thebibliography}{%
	\phantomsection
	\addcontentsline{toc}{section}{\refname}
}
% 附录宏包
\usepackage{appendix} 

% ======================= 封面部分 =======================
\newcommand{\major}[1]{\def\@major{#1}}           % 专业
\newcommand{\studentID}[1]{\def\@studentID{#1}}   % 学号
\newcommand{\teacher}[1]{\def\@teacher{#1}}       % 导师
\newcommand{\GraduationYear}[1]{\def\@GraduationYear{#1}}  % 毕业年份

% 需要的包
\RequirePackage{xifthen} % 提供条件判断功能
% 定义 Title 命令
\newcommand{\Title}[2]{%
	\ifthenelse{\isempty{#2}}
	{% 如果第二个参数为空
		\newcommand{\@titlelineone}{#1}
		\newcommand{\@titlelinetwo}{}
		\renewcommand{\@title}{#1} % 将第一个参数存入标准标题
	}
	{% 如果第二个参数不为空
		\newcommand{\@titlelineone}{#1}
		\newcommand{\@titlelinetwo}{#2}
		\renewcommand{\@title}{#1 #2} % 将两个参数合并存入标准标题
	}
}

\usepackage{xstring}
\newcommand{\PrintTitle}{
	\textbf{题\quad\quad 目：}\hspace{0.12cm}\uline{\makebox[9.01cm]{\@titlelineone}}
	\IfStrEq{\@titlelinetwo}{}{}{
		\\\hspace{2.8cm}\uline{\makebox[9.01cm]{\@titlelinetwo}}
	}
}



% ======================= 封面 =======================
\newcommand{\makecover}{
	\thispagestyle{empty}
	\begin{center}
		\begin{figure}[ht]
			\centering
			\includegraphics[width=0.7\linewidth]{./图片/嘉应学院logo.pdf}
		\end{figure}
		%{\zihao{1} \bfseries {嘉应学院}} \\
		\vspace{0.2cm}
		{\zihao{1} \bfseries 本科毕业论文（设计）} \\
		\vspace{1.5cm}
		{\zihao{2} \bfseries （\@GraduationYear 届）} \\
		\vspace{2cm}
		\begin{spacing}{2.0}
			{\zihao{-3} 
                \PrintTitle\\ % 输出两行或一行标题
				\textbf{姓\quad\quad 名：} \uline{\makebox[9cm]{\@author}} \\
				\textbf{学\quad\quad 号：} \uline{\makebox[9cm]{\@studentID}} \\
				\textbf{学\quad\quad 院：} \uline{\makebox[9cm]{数学学院}} \\
				\textbf{专\quad\quad 业：} \uline{\makebox[9cm]{\@major}} \\
				\textbf{指导老师：} \uline{\makebox[9cm]{\@teacher}} \\
				\textbf{申请学位：} \uline{\makebox[9cm]{理学学士}} \\
			}
		\end{spacing}
		
		\vspace{3cm}
		{\zihao{3} \bfseries  嘉\quad 应\quad 学\quad 院\quad 教\quad 务\quad 部 } \\
	\end{center}
\clearpage
}


% ======================= 承诺书 =======================
\newcommand{\commitment}[3]{
	\thispagestyle{empty}
	\begin{center}
		\bfseries \Large 毕业论文（设计）诚信承诺书
	\end{center}
    \vspace{0.2cm}
	本人郑重承诺：\par
	1.本人所呈交的毕业论文（设计），是在指导教师的指导下，严格按照学校有关规定完成的成果。\par
	2.本人在毕业论文（设计）中引用他人的文献、数据、图件、资料等均加以注释和说明，毕业论文（设计）的结论等成果为本人独立完成。\par
	3.本人承诺在毕业论文（设计）选题和研究内容过程中没有抄袭他人研究成果和伪造相关数据等行为。\par
	4.如本人的毕业论文（设计）涉及抄袭或剽窃等行为，本人愿意承担由此而造成的一切后果及法律责任。\par
	\vspace{1cm}
	
	\begin{flushright} % \raisebox{-0.4em}{}表示垂直向下移动内容距离-0.4em,用于图片上下位置微调
		毕业论文（设计）作者：\raisebox{-0.6em}{\includegraphics[height=2.2em]{#1}}\par  \vspace{0.2cm}
		指导老师（已阅）：\raisebox{-0.6em}{\includegraphics[height=2.2em]{#2}}\par\vspace{0.2cm}  
		#3
	\end{flushright}
}

% ======================= 目录部分 =======================
% 用于定制目录样式
\RequirePackage{titletoc}
% 用于定制目录、图表目录等样式
\RequirePackage[titles]{tocloft}
\renewcommand{\cftdot}{$\cdot$}
% 设置目录中节标题与页码之间的点的间隔
\renewcommand{\cftsecdotsep}{1.5} 
% 设置目录中节标题前的垂直间距
\setlength{\cftbeforesecskip}{7pt}
% 设置目录中子节标题前的垂直间距
\setlength{\cftbeforesubsecskip}{3pt}
% 设置目录中节标题的字体为四号加粗
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}}
% 设置目录中节标题与页码之间的填充方式
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
% 设置目录中节标题编号后的水平间距
%\renewcommand{\cftsecaftersnumb}{\hskip.4em}


% ======================= 文档布局设置 =======================
% 用于页面布局设置
\RequirePackage{geometry}
% 设置行距的宏包
\RequirePackage{setspace} 
% 设置页面边距
\geometry{top=25mm,bottom=25mm,left=20mm,right=20mm}
% 设置正文行间距
\linespread{1.37}
% 修改 tabular 环境，设置表格中的行间距为正文行间距
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
{\bgroup%
	\renewcommand{\arraystretch}{1.38}%
	\mcm@oldtabular}%
{\mcm@endoldtabular\egroup}
% 每行缩进两个汉字
\setlength\parindent{2em}


% ======================= 表格部分 =======================
% 用于表格排版的宏包
\RequirePackage{array}
% 支持长表格排版的宏包
\RequirePackage{longtable}
% 设置表格,  启用跨页功能（需要最新版tabularray）
\usepackage{tabularray}
\UseTblrLibrary{varwidth}     % 可选, 支持自动宽度
\SetTblrTemplate{head}{empty} % 禁用表格页眉
\SetTblrTemplate{foot}{empty} % 禁用表格页脚
% 提供 \toprule 等命令，用于美化表格
\RequirePackage{booktabs}
% 支持在表格中跨行排版
\RequirePackage{multirow}
% 调整表格间隔，使表格更美观
\RequirePackage{bigstrut}
% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 行高调整为默认值的1.5倍（建议1.3~1.8）
\renewcommand{\arraystretch}{1.37} 
% 表格脚注
\RequirePackage{threeparttable}


% ======================= 参考文献部分 =======================
% 采用国标参考文献样式
\usepackage{gbt7714}
% 参考文献按照引用先后顺序编码
\bibliographystyle{gbt7714-numerical}   
% 重定义参考文献环境
\renewenvironment{thebibliography}[1]
{\section*{\refname}%
	% 为页眉设置大写的参考文献名称
	\@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
	% 创建列表环境用于参考文献条目
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		% 设置左边界为标签宽度
		\leftmargin\labelwidth
		% 增加左边界和标签之间的间隔
		\advance\leftmargin\labelsep
		% 开启参考文献的代码设置
		\@openbib@code
		% 使用计数器 enumiv 进行编号
		\usecounter{enumiv}%
		% 清空父计数器的前缀
		\let\p@enumiv\@empty
		% 定义计数器显示为阿拉伯数字
		\renewcommand\theenumiv{\@arabic\c@enumiv}
		% 设置参考文献的行间距为单倍行距
		\setstretch{1} 
		% 设置参考文献的字号为五号字
		\zihao{5}} 
	% 允许文本松散排版
	\sloppy
	% 设置防止单个单词在页首的惩罚值
	\clubpenalty4000
	% 应用防止单个单词在页首的惩罚值
	\@clubpenalty \clubpenalty
	% 设置防止单个单词在页尾的惩罚值
	\widowpenalty4000%
	% 设置句号的间距因子
	\sfcode`\.\@m}
	{\def\@noitemerr
	% 若参考文献环境为空，给出警告
	{\@latex@warning{Empty `thebibliography' environment}}%
	% 结束列表环境
	\endlist}

% ======================= 页眉页脚部分 =======================
% 加载用于设置页眉页脚的宏包
\RequirePackage{fancyhdr}
% 设置页面样式为 fancy
\pagestyle{fancy}
% 清空页眉页脚的默认内容
\fancyhf{}
% 设置页眉为论文题目，使用小五
\fancyhead[C]{\zihao{-5}  \@title}  
% 设置页脚为页码，使用小五加粗字体
\fancyfoot[C]{\zihao{-5} \bfseries \thepage}  

% ======================= 标题部分 =======================
\usepackage{titlesec}
% 关键命令：每次 section 前分页
\newcommand{\sectionbreak}{\clearpage} 
% 定义一级标题格式与间距
\titleformat{\section}
{\centering\normalfont\zihao{3}\bfseries}  % 格式：四号加粗
{\thesection}                    % 标签（如 2.1）
{0.8em}                          % 标签与标题间距
{}                               % 标题前附加内容
[\vspace{-0.5em}]
\titlespacing*{\section}
{0pt}        % 左侧缩进（0pt无缩进）
{1.5\baselineskip}      % 标题前间距
{0.8\baselineskip}        % 标题后间距


% 定义二级标题格式与间距
\titleformat{\subsection}
{\normalfont\zihao{4}\bfseries}  % 格式：四号加粗
{\thesubsection}                 % 标签（如 2.1）
{0.5em}                          % 标签与标题间距
{}                               % 标题前附加内容
[\vspace{-0.3em}]
\titlespacing*{\subsection}
{0pt}        % 左侧缩进（0pt无缩进）
{1.2\baselineskip}        % 标题前间距
{0.6\baselineskip}     % 标题后间距

% 定义三级标题格式与间距
\titleformat{\subsubsection}
{\normalfont\zihao{-4}\bfseries}  % 格式：四号加粗
{\thesubsubsection}               % 标签（如 2.1）
{0.5em}                           % 标签与标题间距
{}                                % 标题前附加内容
[\vspace{-0.2em}]
\titlespacing*{\subsubsection}
{0pt}        % 左侧缩进（0pt无缩进）
{1.0\baselineskip}     % 标题前间距
{0.4\baselineskip}      % 标题后间距

% 修改标题编号格式，添加间距
\renewcommand{\thesubsection}{\thesection\hspace{0.1em}.\hspace{0.1em}\arabic{subsection}} % 二级标题：1 . 1
\renewcommand{\thesubsubsection}{\thesubsection\hspace{0.1em}.\hspace{0.1em}\arabic{subsubsection}} % 三级标题：1 . 1 . 2

% ======================= 字体部分 =======================
% 主字体：系统宋体 (SimSun)
\setCJKmainfont{SimSun}[
AutoFakeBold = {2.5}, % 数值控制加粗程度，通常 2~3
ItalicFont = KaiTi,  % 可选：楷体作为斜体
]

% ====== 英文字体设置 ======
\setmainfont{Times New Roman}[
    UprightFont = *,
    BoldFont = * Bold,
    ItalicFont = * Italic,
    BoldItalicFont = * Bold Italic
]



% ======================= 数学环境 =======================
% 定义各种数学定理、定义等环境的中文名称
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{lemma}{引理}
\newtheorem{corollary}{推论}
\newtheorem{assumption}{假设}
\newtheorem{conjecture}{猜想}
\newtheorem{axiom}{公理}
\newtheorem{principle}{定律}
\newtheorem{problem}{问题}
\newtheorem{example}{例}
\newtheorem{proof}{证明}
\newtheorem{solution}{解}
% 算法环境,算法伪代码
\usepackage{algorithm}  % 提供 algorithm 浮动环境
\usepackage{algorithmic} % 提供 algorithmic 环境和 \STATE 等命令

% ======================= 浮动 =======================
% 浮动环境设置
% 默认情况下，LaTeX 要求每页的文字至少占据 20%，否则该页就只单独放置一个浮动环境，
% 我们将这个要求降低到 5%
\renewcommand*{\textfraction}{0.05}
% 有时如果多个浮动环境连续放在一起，LaTeX 会将它们分在几个不同页，即使它们可在同一页放得下。
% 我们可以通过修改 \topfraction 和 \bottomfraction 分别设置顶端和底端的浮动环境的最大比例
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
% 有时 LaTeX 会把一个浮动环境单独放在一页，我们要求这个环境至少要占据 85% 才能单独放在一页。
% 注意：\floatpagefraction 的数值必须小于 \topfraction
\renewcommand*{\floatpagefraction}{0.85}

% ======================= 图表 =======================
% 关于图片 graphicx
% 如果图片没有指定后缀，依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% 设置图表搜索路径，可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
	{picture/}{pic/}{pics/}{image/}{images/}}

% 图表标题设置
% 定义小四字号标题字体
\DeclareCaptionFont{minusfour}{\zihao{-4}}
% 设置图的标题样式
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进，应该和 justification=raggedright 的效果一样
	labelsep=quad, % 分隔符是一个空格
	font={minusfour}, % 图的字体，小四
	position=bottom % position=bottom 不代表标题放在下面，标题仍放在你放 \caption 的位置
}
% 设置表的标题样式
\captionsetup[table]{%
	format=hang,   % 标题从第二行开始都有缩进，应该和 justification=raggedright 的效果一样
	labelsep=quad, % 分隔符是一个空格
	font={minusfour}, % 表的字体，小四
	position=top % position=bottom 不代表标题放在下面，标题仍放在你放 \caption 的位置
}

% 列表环境设置
\setlist{%
	topsep=0.3em, % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt, % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em, % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em % 包含标签的盒子的正常宽度；若实际宽度更宽，则使用实际宽度
}


% ======================= 超链接 =======================
% 超链接宏包
\RequirePackage{hyperref}
% 超链接设置
\hypersetup{%
	% xetex,
	% unicode=false, % hyperref 和 xetex 同时使用时不能开启 Unicode 选项
	pdfstartview=FitH,
	CJKbookmarks=true,
	bookmarksnumbered=true,
	bookmarksopen=true,
	colorlinks, % 注释掉此项则交叉引用为彩色边框(将 colorlinks 和 pdfborder 同时注释掉)
	pdfborder=001,   % 注释掉此项则交叉引用为彩色边框
	allcolors=black,
	breaklinks=true}%


% ======================= 代码部分 =======================
% 设置代码环境的宏包
\RequirePackage{listings}
% 定义几种颜色，用于代码环境设置
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

% 设置代码环境的样式
\lstset{
	frame=tb, % 代码框上下有边框
	aboveskip=3mm, % 代码框上方的垂直间距
	belowskip=3mm, % 代码框下方的垂直间距
	framexleftmargin=2mm,
	framexrightmargin=2mm,
	showstringspaces=false, % 不显示字符串中的空格
	columns=flexible, % 代码列的宽度可灵活调整
	framerule=1pt, % 边框线的宽度
	rulecolor=\color{gray!35}, % 边框线的颜色
	backgroundcolor=\color{gray!5}, % 代码框的背景颜色
	basicstyle={\footnotesize\ttfamily}, % 代码的基本字体样式
	numbers=none, % 不显示行号
	numberstyle=\tiny\color{gray}, % 行号的字体样式
	keywordstyle=\color{blue}, % 关键字的颜色
	commentstyle=\color{dkgreen}, % 注释的颜色
	stringstyle=\color{mauve}, % 字符串的颜色
	breaklines=true, % 允许代码换行
	breakatwhitespace=true, % 在空格处换行
	tabsize=3, % 制表符的宽度
}
% 定义一个新的代码环境 tcode
\lstnewenvironment{tcode}
{
	\lstset{basicstyle = \small\ttfamily,
		language=TeX,
		tabsize = 4,
		frame = single,
		escapechar = `,
		breaklines = true,
		breakatwhitespace = true,
		frameround = tttt,
	}
}
{}
% 结束当前文件的读取
\endinput
