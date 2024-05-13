%{
/* Include directives and definitions from the original tiny.flex */
/* ... (existing content) ... */

/* Additional definitions */
digit    [0-9]
number   {digit}+
letter   [a-z|A-Z]
identifier {letter}{letter}*
newline   \n
whitespace [ \t]+

%option noyywrap

%x COMMENT
%}

%%

/* Original lex rules */
/* ... (existing content) ... */

/* Additional lex rules */
"if"      {return IF;}
"else"    {return ELSE;}
"while"   {return WHILE;}  /* Added while keyword */
"int"     {return INT;}    /* Added int keyword */
"void"    {return VOID;}   /* Added void keyword */
"return"  {return RETURN;} /* Added return keyword */
":="      {return ASSIGN;}
"=="      {return EQ;}
">"       {return GT;} /* Added definition for GT token */
"<"       {return LT;}
"<="      {return LE;}
">="      {return GE;} 
"+"       {return PLUS;}
"-"       {return MINUS;}
"*"       {return TIMES;}
"/"       {return OVER;}
"("       {return LPAREN;}
")"       {return RPAREN;}
";"       {return SEMI;}
","       {return COMMA;}
"["       {return LBRACKET;}
"]"       {return RBRACKET;}
"{"       {return LBRACE;}
"}"       {return RBRACE;}
{number}  {return NUM;}
{identifier} {return ID;}
{newline}    {lineno++;}
{whitespace} {/* skip whitespace */}
"/*"      {BEGIN COMMENT;}
<COMMENT>"*/"  {BEGIN INITIAL;}
<COMMENT>.|\n  {/* ignore everything inside comments */}

.        {return ERROR;}

%%

/* getToken function */
/* ... (existing content) ... */

/* main function */
/* ... (existing content) ... */
