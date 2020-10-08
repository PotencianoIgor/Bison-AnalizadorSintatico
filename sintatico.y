%{
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;
extern int linha;
extern int random_generator(int i);

float HP_HANK = 20000;
float HP_PRESTO = 20000;
float HP_DIANA = 20000;
float HP_SHEILA = 20000;
float HP_BOBBY = 20000;
float HP_ERICK = 20000;
float HP_TIAMAT = 150000;
float ATAQUE_HANK = 0.10;
float ATAQUE_PRESTO = 0.05;
float ATAQUE_BOBBY = 0.15;
float ATAQUE_DIANA = 0.07;
float ATAQUE_SHEILA = 0.09;

int yyerror(const char *mens);
%}
%start batalha
%token HANK 
%token ATIRA_FLECHA
%token PRESTO
%token DISPARA_RAIO_ARCANO
%token BOBBY
%token USA_TACAPE
%token DIANA
%token JOGA_BASTAO_MAGICO
%token SHEILA
%token INVISIVEL_ATACA
%token ATACA
%token INVALIDO
%left HANK PRESTO BOBBY DIANA SHEILA TIAMAT INICIO FIM_DE_LINHA FIM 
%%

batalha : INICIO FIM_DE_LINHA jogar FIM_DE_LINHA{
		exit(0);
	};

jogar :  HANK comandoHank FIM_DE_LINHA jogar|
         PRESTO comandoPresto FIM_DE_LINHA jogar|
         BOBBY comandoBobby FIM_DE_LINHA jogar|
	 DIANA comandoDiana FIM_DE_LINHA jogar|
         SHEILA comandoSheila FIM_DE_LINHA jogar|
 	 TIAMAT comandoTiamat FIM_DE_LINHA jogar|
	 fim/*|
	 HANK comandoHank FIM_DE_LINHA
         PRESTO comandoPresto FIM_DE_LINHA
         PRESTO comandoPresto FIM_DE_LINHA
	 DIANA comandoDiana FIM_DE_LINHA 
         SHEILA comandoSheila FIM_DE_LINHA
 	 TIAMAT comandoTiamat FIM_DE_LINHA
         DIANA comandoDiana FIM_DE_LINHA
         BOBBY comandoBobby FIM_DE_LINHA
         PRESTO comandoPresto FIM_DE_LINHA
 	 HANK comandoHank FIM_DE_LINHA
	 HANK comandoHank FIM_DE_LINHA
	 fim*/

comandoHank : 
	      ATIRA_FLECHA
              {
		 if(random_generator(10) < random_generator(20)){
		      HP_TIAMAT -= HP_TIAMAT * ATAQUE_HANK;
		      printf("Hank: Acertei o Tiamat! HP Tiamat: %f\n", HP_TIAMAT);
		 }
		 else{
			 printf("Hank: Errei o Tiamat!\n");
		}
	      };
comandoPresto : 
	      DISPARA_RAIO_ARCANO
              {
		 if(random_generator(10) < random_generator(20)){
		      HP_TIAMAT -= HP_TIAMAT * ATAQUE_PRESTO;
		      printf("Presto: Acertei o Tiamat! HP Tiamat: %f\n", HP_TIAMAT);
		 }
		 else{
			 printf("Presto: Errei o Tiamat!\n");
		 }
              };
comandoBobby : 
	      USA_TACAPE
              {
	         if(random_generator(10) < random_generator(20)){
		      HP_TIAMAT -= HP_TIAMAT * ATAQUE_BOBBY;
		      printf("Bobby: Acertei o Tiamat! HP Tiamat: %f\n", HP_TIAMAT);
		 }
		 else{
			 printf("Bobby: Errei o Tiamat!\n");
		 }
              };
comandoSheila : 
	       INVISIVEL_ATACA
	       {
	             if(random_generator(10) < random_generator(20)){
		      HP_TIAMAT -= HP_TIAMAT * ATAQUE_SHEILA;
		      printf("Sheila: Acertei o Tiamat! HP Tiamat: %f\n", HP_TIAMAT);
		 }
		 else{
			 printf("Sheila: Errei o Tiamat!\n");
		 }
               };
comandoDiana : 
	      JOGA_BASTAO_MAGICO
	      {
		    if(random_generator(10) < random_generator(20)){
		      HP_TIAMAT -= HP_TIAMAT * ATAQUE_DIANA;
		      printf("Diana: Acertei o Tiamat! HP Tiamat: %f\n", HP_TIAMAT);
		 }
		 else{
			 printf("Diana: Errei o Tiamat!\n");
		 }
              };
comandoTiamat : 
	       ATACA
 	       {
		    int cabecaTiamat = 0;
	            for(int i = 0 ; i < 5 ; i++){
			    cabecaTiamat = random_generator(5);
			    switch(cabecaTiamat){
				case 0: 
					printf("Tiamat: ####### Raios Congelantes #######\n");
					if(random_generator(20) > random_generator(10)){
					    printf("Erick: Defendi!\n");
					}
					else{
					   int vitima = random_generator(6);
					   switch(vitima){
						case 0:  HP_HANK -= HP_HANK * 0.15;
							 printf("HP Hank: %f\n", HP_HANK);
						break;
						case 1:  HP_PRESTO -= HP_PRESTO * 0.15;
							 printf("HP Presto: %f\n", HP_PRESTO);
						break;
						case 2:  HP_BOBBY -= HP_BOBBY * 0.15;
							 printf("HP Bobby: %f\n", HP_BOBBY);
						break;
						case 3:  HP_SHEILA -= HP_SHEILA * 0.15;
							 printf("HP Sheila: %f\n", HP_SHEILA);
						break;
						case 4:  HP_DIANA -= HP_DIANA * 0.15;
							 printf("HP Diana: %f\n", HP_DIANA);
						break;
						case 5: HP_ERICK -= HP_ERICK * 0.15;
							printf("HP Erick: %f\n", HP_ERICK);
					   }
					}
				break;
				case 1: 
					printf("Tiamat: ####### Gás Venenoso #######\n");
					if(random_generator(20) > random_generator(10)){
					    printf("Erick: Defendi!\n");
					}
					else{
					   int vitima = random_generator(5);
					   switch(vitima){
						case 0:  HP_HANK -= HP_HANK * 0.10;
							 printf("HP Hank: %f\n", HP_HANK);
						break;
						case 1:  HP_PRESTO -= HP_PRESTO * 0.10;
							 printf("HP Presto: %f\n", HP_PRESTO);
						break;
						case 2:  HP_BOBBY -= HP_BOBBY * 0.10;
							 printf("HP Bobby: %f\n", HP_BOBBY);
						break;
						case 3:  HP_SHEILA -= HP_SHEILA * 0.10;
							 printf("HP Sheila: %f\n", HP_SHEILA);
						break;
						case 4:  HP_DIANA -= HP_DIANA * 0.10;
							 printf("HP Diana: %f\n", HP_DIANA);
						break;
						case 5: HP_ERICK -= HP_ERICK * 0.15;
							printf("HP Erick: %f\n", HP_ERICK);
					   }
					}
				break;
				case 2: 
					printf("Tiamat: ####### Fogo #######\n");
					if(random_generator(20) > random_generator(10)){
					    printf("Erick: Defendi!\n");
					}
					else{
					   int vitima = random_generator(5);
					   switch(vitima){
						case 0:  HP_HANK -= HP_HANK * 0.20;
							 printf("HP Hank: %f\n", HP_HANK);
						break;
						case 1:  HP_PRESTO -= HP_PRESTO * 0.20;
							 printf("HP Presto: %f\n", HP_PRESTO);
						break;
						case 2:  HP_BOBBY -= HP_BOBBY * 0.20;
							 printf("HP Bobby: %f\n", HP_BOBBY);
						break;
						case 3:  HP_SHEILA -= HP_SHEILA * 0.20;
							 printf("HP Sheila: %f\n", HP_SHEILA);
						break;
						case 4:  HP_DIANA -= HP_DIANA * 0.20;
							 printf("HP Diana: %f\n", HP_DIANA);
						break;
						case 5: HP_ERICK -= HP_ERICK * 0.20;
							printf("HP Erick: %f\n", HP_ERICK);
					   }
					}
				break;
	   			case 3: 
					printf("Tiamat: ####### Raios #######\n");
					if(random_generator(20) > random_generator(10)){
					    printf("Erick: Defendi!\n");
					}
					else{
					   int vitima = random_generator(5);
					   switch(vitima){
						case 0:  HP_HANK -= HP_HANK * 0.09;
							 printf("HP Hank: %f\n", HP_HANK);
						break;
						case 1:  HP_PRESTO -= HP_PRESTO * 0.09;
							 printf("HP Presto: %f\n", HP_PRESTO);
						break;
						case 2:  HP_BOBBY -= HP_BOBBY * 0.09;
							 printf("HP Bobby: %f\n", HP_BOBBY);
						break;
						case 3:  HP_SHEILA -= HP_SHEILA * 0.09;
							 printf("HP Sheila: %f\n", HP_SHEILA);
						break;
						case 4:  HP_DIANA -= HP_DIANA * 0.09;
							 printf("HP Diana: %f\n", HP_DIANA);
						break;
						case 5: HP_ERICK -= HP_ERICK * 0.09;
							printf("HP Erick: %f\n", HP_ERICK);
					   }
					}
				break;
				case 4: 
					printf("Tiamat: ####### Ácido #######\n");
					if(random_generator(20) > random_generator(10)){
					    printf("Erick: Defendi!\n");
					}
					else{
					   int vitima = random_generator(5);
					   switch(vitima){
						case 0:  HP_HANK -= HP_HANK * 0.07;
							 printf("HP Hank: %f\n", HP_HANK);
						break;
						case 1:  HP_PRESTO -= HP_PRESTO * 0.07;
							 printf("HP Presto: %f\n", HP_PRESTO);
						break;
						case 2:  HP_BOBBY -= HP_BOBBY * 0.07;
							 printf("HP Bobby: %f\n", HP_BOBBY);
						break;
						case 3:  HP_SHEILA -= HP_SHEILA * 0.07;
							 printf("HP Sheila: %f\n", HP_SHEILA);
						break;
						case 4:  HP_DIANA -= HP_DIANA * 0.07;
							 printf("HP Diana: %f\n", HP_DIANA);
						break;
						case 5: HP_ERICK -= HP_ERICK * 0.07;
							printf("HP Erick: %f\n", HP_ERICK);
					   }
					}
			    }
			}
               };

fim : 
	FIM
	{
	     float HP_HEROES = HP_HANK + HP_PRESTO + HP_ERICK + HP_SHEILA + HP_DIANA + HP_BOBBY;
             if(HP_HEROES > HP_TIAMAT){
		printf("Os herois venceram!\n");
	     }
	     else{
		printf("Tiamat venceu!\n");
	     }
	}
%%
/* codigo do usuario */

int main(int argc, char **argv)
{
	srand((time(NULL)));
	FILE *arquivo;
	arquivo = fopen("entrada1.txt","r");
	if (!arquivo) {
		printf("\nFalha ao abrir arquivo.\n");
		return -1;
	}
	// Seta o LEX para ler o arquivo1 através da variável yyin
	yyin = arquivo;
	// Realiza o parse para o arquivo
	do {
		yyparse();
	} while ( !feof(arquivo) );
	fclose(arquivo);
	return(0);
}
int yyerror(const char *mens)
{
	fprintf(stderr, "Comando da linha %d inválido: %s\n\n", linha, mens);
	return(1);
}

int yywrap(void) {	
	return(1);
}

int random_generator(int i)
{	
     return rand()%i;
}
