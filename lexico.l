%{
#include <stdio.h>
#include "sintatico.tab.h"

int linha = 1;
extern int yylval;

%}

%%

"INICIO"		return(INICIO);
"HANK"			return(HANK);
"PRESTO"		return(PRESTO);
"BOBBY"			return(BOBBY);
"DIANA"			return(DIANA);
"SHEILA"                return(SHEILA);
"TIAMAT"   	   	return(TIAMAT);
"ATACA"			return(ATACA);
"ATIRA FLECHA"		return(ATIRA_FLECHA);
"USA TACAPE"		return(USA_TACAPE);
"DISPARA RAIO ARCANO"	return(DISPARA_RAIO_ARCANO);
"JOGA BASTAO MAGICO"	return(JOGA_BASTAO_MAGICO);
"INVISIVEL ATACA" 	return(INVISIVEL_ATACA);
"FIM"			return(FIM);
[a-z0-9]*       { return(INVALIDO); }
\n	        { ++linha; return (FIM_DE_LINHA); }
.		;
%%

