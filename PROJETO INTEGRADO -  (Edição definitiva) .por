programa
/*
Autor: Antonio Helkys de Oliveira Facundo
Projeto Integrado: Criação de um menu com 3 opções de jogos, que são eles: Jogo da forca, jogo da velha e jogo do jokenpo
Feito com portugol studio. 
V. 4.23

*/

{
	inclua biblioteca Texto --> txt
	inclua biblioteca Sons --> s
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> tp 
	funcao inicio()
	{
		inteiro Escolha = 0, contador = 0//VARIÁVEIS DO MENU PRINCIPAL
		inteiro som, som_erro = s.carregar_som("ERRO_DO_WINDOWS.mp3"), som_exit = s.carregar_som("Lose a Life.mp3")
		inteiro total_resp = 0, busca = 0, erro = 0, alet, rest//JOGO FORCA
		caracter d[] ={' ',' ',' ',' ',' ',' ',' '}
		cadeia computador[] = {"C","O","M","P","U","T","A","D","O","R"}, computador_resp[] = {"_","_","_","_","_","_","_","_","_","_"}
		cadeia programador[] = {"P","R","O","G","R","A","M","A","D","O","R"}, programador_resp[] = {"_","_","_","_","_","_","_","_","_","_","_"}
		cadeia Jogador[] = {"J","O","G","A","D","O","R"}, Jogador_resp[] = {"_","_","_","_","_","_","_"}, chave 
		inteiro pedra = 1, tesoura = 2, papel = 3, escolhapc, c = 0, jogador = 0, PC = 0//VARIÁVEIS DO JOGO JOKENPO
		cadeia teclado//Vai ser usado para validar dados
		inteiro jogador1 = 1, jogador2 = 0, opcaojv = 1, jogadas1 = 0, jogadas2 = 0, preencher, vitoria//Variáveis do jogo da velha
		caracter jogo_vazio[3][3]//Variáveis do jogo da velha
		
		enquanto(contador != 1){//Começo da escolha para o jogo
			//MENU DO PROJETO INTEGRADOR
			som = s.carregar_som("Super Mario Bros  Overworld Theme.mp3")
			s.reproduzir_som(som, falso)
			s.definir_volume(75)
			limpa()
			escreva("\t\t====== Bem-vindos ao FCDL-Games ======\n")
			escreva("\t\t=========== OPÇÕES DE JOGOS ==========\n")
			escreva("\t\t(1) - \tFORCA\n")
			escreva("\t\t(2) - \tJOGO DA VELHA\n")
			escreva("\t\t(3) - \tJOKENPO\n")
			escreva("\t\t(4) - \tSAIR\n")
			escreva("\t\t======================================\n")
			escreva("")
			c--
			escreva("----------------------------------------------\n")
			escreva("Escolha uma opção do MENU DE JOGOS: ")
			leia(teclado)
			se(tp.cadeia_e_inteiro(teclado, 10)){//Caso o jogador fazer besteira
				Escolha = tp.cadeia_para_inteiro(teclado, 10)
			}senao{
				Escolha = 9999
			}//Validação de dados
			escolha(Escolha){
				caso 1:
					escreva("\nCARREGANDO O JOGO ESCOLHIDO... AGUARDE...\n\n")
					u.aguarde(3000)
					limpa()
					para(inteiro p = 0; p < u.numero_elementos(d);p++){
						d[p] = ' '
					}
					escreva("\t\t=========== JOGO DA FORCA ==========\n")
					escreva("\t\t││###########\n")
					escreva("\t\t││          *\n")
					escreva("\t\t││          *\n")
					escreva("\t\t││          -\n")
					escreva("\t\t││          O\n")
					escreva("\t\t││         /│\\ \n")
					escreva("\t\t││          V\n")
					escreva("\t\t││         / \\ \n")
					escreva("\t\t││           \n")
					escreva("\t\t││           \n")
					escreva("\t\t******************\n")
					escreva("\t\t======================================\n")
					escreva("O computador está sorteando uma PALAVRA... Aguarde...")
					u.aguarde(3000)
					alet = sorteia(1,3)
					escolha(alet){
						caso 1://Palavra COMPUTADOR
						erro = 0
						total_resp = 0
						para(rest = 0;rest < u.numero_elementos(computador_resp);rest++){//para resetar a palavra
							computador_resp[rest] = "_"
						}//para resetar a palavra
							enquanto(verdadeiro){//Analise e respostas do jogo da forca
								limpa()
								escreva("\nTOTAL DE LETRAS DA PALAVRA É 10, TEMA: Tecnologia")
								escreva("\n=================================================\n")
								escreva("\t\t││###########\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          -\n")
								escreva("\t\t││          ",d[0],"\n")
								escreva("\t\t││         ",d[2],d[1],d[3],"\n")
								escreva("\t\t││          ",d[4],"\n")
								escreva("\t\t││         ",d[5]," ",d[6],"\n")
								escreva("\t\t││           \n")
								escreva("\t\t││           \n")
								escreva("\t\t******************\n")
								escreva("=================================================\n")
								para(inteiro num_resp = 0; num_resp < u.numero_elementos(computador_resp);num_resp++){//exibição da palavra
									escreva(computador_resp[num_resp]," ")
							}//exibição da palavra
							escreva("\n\nInforme uma letra: ")
							leia(chave)
							chave = txt.caixa_alta(chave)
							escreva("Analisando... agurdade...\n")
							u.aguarde(1000)
							para(inteiro posisao = 0; posisao < u.numero_elementos(computador);posisao++){//analise da letra
								busca++
								se(computador[posisao] == chave){
									se(computador_resp[posisao]  != computador[posisao]){
										 computador_resp[posisao] = computador[posisao]
										total_resp++
										busca--
									}senao{
										escreva("")
										busca--
									}
								}
								se(busca == 10){//quando a busca não tem a letra... adiciona +1 no erro
									escreva("")
									erro++
								}//quando a busca não tem a letra... adiciona +1 no erro
							}
							se(total_resp == u.numero_elementos(computador)){///condição para ganhar 
								escreva("\nA palavra é: \n")
								para(inteiro num_resp = 0; num_resp < u.numero_elementos(computador_resp);num_resp++){//exibição da palavra
									escreva(computador_resp[num_resp]," ")
								}//exibição da palavra
								escreva("\n\t\t=========== VOCÊ GANHOU!! ==========\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								u.aguarde(3750)
								pare
							}//condição para ganhar
							busca = 0
							se(erro == 0){//desenho do corpo na forca e condição para perder
								
							}senao se(erro == 1){
								d[0] = 'O'
							}senao se(erro == 2){
								d[1] = '│'
							}senao se(erro == 3){
								d[2] = '/'
							}senao se(erro == 4){
								d[3] = '\\'
							}senao se(erro == 5){
								d[4] = 'V'
							}senao se(erro == 6){
								d[5] = '/'
							}senao se(erro == 7){//desenho do corpo na forca e condição para perder
								limpa()
								d[6] = '\\'
								s.interromper_som(som)
								s.reproduzir_som(som_exit, falso)
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("\t\t││###########\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          -\n")
								escreva("\t\t││          ",d[0],"\n")
								escreva("\t\t││         ",d[2],d[1],d[3],"\n")
								escreva("\t\t││          ",d[4],"\n")
								escreva("\t\t││         ",d[5]," ",d[6],"\n")
								escreva("\t\t││           \n")
								escreva("\t\t││           \n")
								escreva("\t\t******************\n")
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								pare
							}//desenho do corpo na forca
						}//Analise e respostas do jogo da forca
						u.aguarde(3750)
							pare//Palavra COMPUTADOR - fim
						caso 2://Palavra PROGRAMADOR
						erro = 0
						total_resp = 0
						para(rest = 0;rest < u.numero_elementos(programador_resp);rest++){//para resetar a palavra
							 programador_resp[rest] = "_"
						}//para resetar a palavra
						enquanto(verdadeiro){
							limpa()
							escreva("\nTOTAL DE LETRAS DA PALAVRA É 11, TEMA: Tecnologia")
							escreva("\n=================================================\n")
							escreva("\t\t││###########\n")
							escreva("\t\t││          *\n")
							escreva("\t\t││          *\n")
							escreva("\t\t││          -\n")
							escreva("\t\t││          ",d[0],"\n")
							escreva("\t\t││         ",d[2],d[1],d[3],"\n")
							escreva("\t\t││          ",d[4],"\n")
							escreva("\t\t││         ",d[5]," ",d[6],"\n")
							escreva("\t\t││           \n")
							escreva("\t\t││           \n")
							escreva("\t\t******************\n")
							escreva("=================================================\n")
							para(inteiro num_resp = 0; num_resp < u.numero_elementos(programador_resp);num_resp++){//exibição da palavra
								escreva(programador_resp[num_resp]," ")
							}//exibição da palavra
							escreva("\n\nInforme uma letra: ")
							leia(chave)
							chave = txt.caixa_alta(chave)
							escreva("Analisando... agurdade...\n")
							u.aguarde(1000)
							para(inteiro posisao = 0; posisao < u.numero_elementos(programador);posisao++){//Busca da letra
								busca++
								se(programador[posisao] == chave){
									se(programador_resp[posisao]  != programador[posisao]){
										 programador_resp[posisao] = programador[posisao]
										total_resp++
										busca--
									}senao{
										escreva("")
										busca--
									}
								}
								se(busca == 11){//quando a busca não tem a letra... adiciona +1 no erro
									escreva("")
									erro++
								}//quando a busca não tem a letra... adiciona +1 no erro
							}//Busca da letra
							se(total_resp == u.numero_elementos(programador)){//condição para ganhar 
								escreva("\nA palavra é: \n")
								para(inteiro num_resp = 0; num_resp < u.numero_elementos(programador_resp);num_resp++){//exibição da palavra
									escreva(programador_resp[num_resp]," ")
								}//exibição da palavra
								escreva("\n\t\t=========== VOCÊ GANHOU!! ==========\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								u.aguarde(3750)
								pare
							}//condição para ganhar 
							busca = 0
							se(erro == 0){//desenho do corpo na forca e condição para perder
								
							}senao se(erro == 1){
								d[0] = 'O'
							}senao se(erro == 2){
								d[1] = '│'
							}senao se(erro == 3){
								d[2] = '/'
							}senao se(erro == 4){
								d[3] = '\\'
							}senao se(erro == 5){
								d[4] = 'V'
							}senao se(erro == 6){
								d[5] = '/'
							}senao se(erro == 7){
								limpa()
								d[6] = '\\'
								s.interromper_som(som)
								s.reproduzir_som(som_exit, falso)
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("\t\t││###########\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          -\n")
								escreva("\t\t││          ",d[0],"\n")
								escreva("\t\t││         ",d[2],d[1],d[3],"\n")
								escreva("\t\t││          ",d[4],"\n")
								escreva("\t\t││         ",d[5]," ",d[6],"\n")
								escreva("\t\t││           \n")
								escreva("\t\t││           \n")
								escreva("\t\t******************\n")
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								pare
							}//desenho do corpo na forca e condição para perder
						}
						u.aguarde(3750)
							pare//Palavra PROGRAMADOR - fim
						caso 3://Palavra JOGADOR
						erro = 0
						total_resp = 0
						para(rest = 0;rest < u.numero_elementos(Jogador_resp);rest++){//para resetar a palavra
							 Jogador_resp[rest] = "_"
						}//para resetar a palavra
						enquanto(verdadeiro){
							limpa()
							escreva("\nTOTAL DE LETRAS DA PALAVRA É 7, TEMA: Jogos")
							escreva("\n=================================================\n")
							escreva("\t\t││###########\n")
							escreva("\t\t││          *\n")
							escreva("\t\t││          *\n")
							escreva("\t\t││          -\n")
							escreva("\t\t││          ",d[0],"\n")
							escreva("\t\t││         ",d[2],d[1],d[3],"\n")
							escreva("\t\t││          ",d[4],"\n")
							escreva("\t\t││         ",d[5]," ",d[6],"\n")
							escreva("\t\t││           \n")
							escreva("\t\t││           \n")
							escreva("\t\t******************\n")
							escreva("=================================================\n")
							para(inteiro num_resp = 0; num_resp < u.numero_elementos(Jogador_resp);num_resp++){//exibição da palavra
								escreva(Jogador_resp[num_resp]," ")
							}//exibição da palavra
							escreva("\n\nInforme uma letra: ")
							leia(chave)
							chave = txt.caixa_alta(chave)
							escreva("Analisando... agurdade...\n")
							u.aguarde(1000)
							para(inteiro posisao = 0; posisao < u.numero_elementos(Jogador);posisao++){//Busca da letra
								busca++
								se(Jogador[posisao] == chave){
									se(Jogador_resp[posisao]  != Jogador[posisao]){
										 Jogador_resp[posisao] = Jogador[posisao]
										total_resp++
										busca--
									}senao{
										escreva("")
										busca--
									}
								}
								se(busca == 7){//quando a busca não tem a letra... adiciona +1 no erro
									escreva("")
									erro++
								}//quando a busca não tem a letra... adiciona +1 no erro
							}//Busca da letra
							se(total_resp == u.numero_elementos(Jogador)){//condição para ganhar 
								escreva("\nA palavra é: \n")
								para(inteiro num_resp = 0; num_resp < u.numero_elementos(Jogador_resp);num_resp++){//exibição da palavra
									escreva(Jogador_resp[num_resp]," ")
								}//exibição da palavra
								escreva("\n\t\t=========== VOCÊ GANHOU!! ==========\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								u.aguarde(3750)
								pare
							}//condição para ganhar 
							busca = 0
							se(erro == 0){//desenho do corpo na forca e condição para perder
								
							}senao se(erro == 1){
								d[0] = 'O'
							}senao se(erro == 2){
								d[1] = '│'
							}senao se(erro == 3){
								d[2] = '/'
							}senao se(erro == 4){
								d[3] = '\\'
							}senao se(erro == 5){
								d[4] = 'V'
							}senao se(erro == 6){
								d[5] = '/'
							}senao se(erro == 7){
								limpa()
								d[6] = '\\'
								s.interromper_som(som)
								s.reproduzir_som(som_exit, falso)
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("\t\t││###########\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          *\n")
								escreva("\t\t││          -\n")
								escreva("\t\t││          ",d[0],"\n")
								escreva("\t\t││         ",d[2],d[1],d[3],"\n")
								escreva("\t\t││          ",d[4],"\n")
								escreva("\t\t││         ",d[5]," ",d[6],"\n")
								escreva("\t\t││           \n")
								escreva("\t\t││           \n")
								escreva("\t\t******************\n")
								escreva("======================= VOCÊ PERDEU! ==========================\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								pare
							}
						}//desenho do corpo na forca e condição para perder
						u.aguarde(3750)
							pare//Palavra PROGRAMADOR - fim
					}
					pare
				caso 2://jogo da velha
				//RESEVADO PARA JOGO DA VELHA
				escreva("\nCARREGANDO O JOGO ESCOLHIDO... AGUARDE...\n\n")
				u.aguarde(3000)
				limpa()
				vitoria = 0
				preencher = 0
				jogadas1 = 0
				jogadas2 = 0
				jogador1 = 1
				jogador2 = 0
				para(inteiro l = 0; l < u.numero_linhas(jogo_vazio); l++){//preenchimento da matriz com número
					para(inteiro coluna = 0; coluna < u.numero_colunas(jogo_vazio); coluna++){
						preencher++
						jogo_vazio[l][coluna] = tp.inteiro_para_caracter(preencher)
					}
				}//preenchimento da matriz com número
				enquanto(jogadas1 != 5 e jogadas2 != 4){
					enquanto(jogador1 == 1){//Jogador 1
						enquanto(verdadeiro){//validação de dados do jogogador 01
							limpa()
							escreva("===== JOGO DA VELHA ====\n")
							escreva("\t",jogo_vazio[0][0],"| ",jogo_vazio[0][1]," |",jogo_vazio[0][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[1][0],"| ",jogo_vazio[1][1]," |",jogo_vazio[1][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[2][0],"| ",jogo_vazio[2][1]," |",jogo_vazio[2][2],"\n")
							escreva("========================\n\n")
							escreva("O número indica a posição a ser marcada.\n")
							escreva("Para DESISTIR digite 10\n\n")
					   		escreva("JOGADOR 1 Escolha aonde deseja marca o 'X': ")
					   		leia(teclado)
					   		se(tp.cadeia_e_inteiro(teclado, 10)){
					   			se(tp.cadeia_para_inteiro(teclado, 10) > 0 e tp.cadeia_para_inteiro(teclado, 10) <= 10){
					   				opcaojv = tp.cadeia_para_inteiro(teclado, 10)
					   				pare
					   			} senao{
					   				s.reproduzir_som(som_erro, falso)
									escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
									escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
									escreva("---------------------------------\n")
									u.aguarde(2000)
					   			}
					   		} senao{
					   		s.reproduzir_som(som_erro, falso)
							escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
							escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
							escreva("---------------------------------\n")
							u.aguarde(2000)
					   		}
						}//validação de dados do jogogador 01
					   		se(opcaojv == 1 e jogo_vazio[0][0] != 'X'e jogo_vazio[0][0] != 'O'){
					   			jogo_vazio[0][0] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
								
					   		}	
					   		se(opcaojv == 2 e jogo_vazio[0][1] != 'X'e jogo_vazio[0][1] != 'O'){
					   			jogo_vazio[0][1] = 'X' 
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 3 e jogo_vazio[0][2] != 'X'e jogo_vazio[0][2] != 'O'){
					   			jogo_vazio[0][2] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 4 e jogo_vazio[1][0] != 'X'e jogo_vazio[1][0] != 'O'){
					   			jogo_vazio[1][0] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 5 e jogo_vazio[1][1] != 'X'e jogo_vazio[1][1] != 'O'){
					   			jogo_vazio[1][1] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 6 e jogo_vazio[1][2] != 'X'e jogo_vazio[1][2] != 'O'){
					   			jogo_vazio[1][2] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 7 e jogo_vazio[2][0] != 'X'e jogo_vazio[2][0] != 'O'){
					   			jogo_vazio[2][0] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 8 e jogo_vazio[2][1] != 'X'e jogo_vazio[2][1] != 'O'){
					   			jogo_vazio[2][1] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 9 e jogo_vazio[2][2] != 'X'e jogo_vazio[2][2] != 'O'){
					   			jogo_vazio[2][2] = 'X'
								jogador1 = 0
								jogador2 = 1
								jogadas1++
					   		}
					   		se(opcaojv == 10){//surrender do jogador 01
					   		s.interromper_som(som)
							s.reproduzir_som(som_exit, falso)
				   			escreva("O JOGADOR 1 desistiu!\n")
				   			escreva("ENCERRANDO... AGUARDE...\n")
				   			jogadas1 = 5
							jogadas2 = 4
							jogador2 = 0
							u.aguarde(3750)
				   			pare
				   			}//surrender do jogador 01
					   		se(jogo_vazio[0][0] == 'X' e jogo_vazio[0][1] == 'X' e jogo_vazio[0][2] == 'X'){//condição de vitoria
								vitoria = 1
							} senao se(jogo_vazio[1][0] == 'X' e jogo_vazio[1][1] == 'X' e jogo_vazio[1][2] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[2][0] == 'X' e jogo_vazio[2][1] == 'X' e jogo_vazio[2][2] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[0][0] == 'X' e jogo_vazio[1][0] == 'X' e jogo_vazio[2][0] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[0][1] == 'X' e jogo_vazio[1][1] == 'X' e jogo_vazio[2][1] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[0][2] == 'X' e jogo_vazio[1][2] == 'X' e jogo_vazio[2][2] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[0][0] == 'X' e jogo_vazio[1][1] == 'X' e jogo_vazio[2][2] == 'X'){
								vitoria = 1
							} senao se(jogo_vazio[2][0] == 'X' e jogo_vazio[1][1] == 'X' e jogo_vazio[0][2] == 'X'){
								vitoria = 1
							}
							se(vitoria == 1){//condição de vitoria
								limpa()
								escreva("O JOGADOR 1 ganhou!\n")
								escreva("===== JOGO DA VELHA ====\n")
								escreva("\t",jogo_vazio[0][0],"| ",jogo_vazio[0][1]," |",jogo_vazio[0][2],"\n")
								escreva("      -----------\n")
								escreva("\t",jogo_vazio[1][0],"| ",jogo_vazio[1][1]," |",jogo_vazio[1][2],"\n")
								escreva("      -----------\n")
								escreva("\t",jogo_vazio[2][0],"| ",jogo_vazio[2][1]," |",jogo_vazio[2][2],"\n")
								escreva("========================\n\n")
								escreva("ENCERRANDO... AGUARDE...\n")
								jogadas1 = 5
								jogadas2 = 4
								jogador2 = 0
								u.aguarde(3000)
								pare
							}
				    		} //Jogador 1
			    		enquanto(jogador2 == 1){//Jogador 2
			    			enquanto(verdadeiro){//validação de dados do jogogador 02
			    				limpa()
							escreva("===== JOGO DA VELHA ====\n")
							escreva("\t",jogo_vazio[0][0],"| ",jogo_vazio[0][1]," |",jogo_vazio[0][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[1][0],"| ",jogo_vazio[1][1]," |",jogo_vazio[1][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[2][0],"| ",jogo_vazio[2][1]," |",jogo_vazio[2][2],"\n")
							escreva("========================\n\n")
			    				escreva("O número indica a posição a ser marcada.\n")
							escreva("Para DESISTIR digite 10\n\n")
					   		escreva("JOGADOR 2 Escolha aonde deseja marca o 'O': ")
					   		leia(teclado)
					   		escreva("----------------------------------------------\n\n")
					   		se(tp.cadeia_e_inteiro(teclado, 10)){
					   			se(tp.cadeia_para_inteiro(teclado, 10) > 0 e tp.cadeia_para_inteiro(teclado, 10) <= 10){
					   				opcaojv = tp.cadeia_para_inteiro(teclado, 10)
					   				pare
					   			} senao{
					   				s.reproduzir_som(som_erro, falso)
									escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
									escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
									escreva("---------------------------------\n")
									u.aguarde(2000)
					   			}
					   		} senao{
					   		s.reproduzir_som(som_erro, falso)
							escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
							escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
							escreva("---------------------------------\n")
							u.aguarde(2000)
					   		}
						}//validação de dados do jogogador 02
				   		se(opcaojv == 1 e jogo_vazio[0][0] != 'X'e jogo_vazio[0][0] != 'O'){
				   			jogo_vazio[0][0] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 2 e jogo_vazio[0][1] != 'X'e jogo_vazio[0][1] != 'O'){
				   			jogo_vazio[0][1] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 3 e jogo_vazio[0][2] != 'X'e jogo_vazio[0][2] != 'O'){
				   			jogo_vazio[0][2] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 4 e jogo_vazio[1][0] != 'X'e jogo_vazio[1][0] != 'O'){
				   			jogo_vazio[1][0] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 5 e jogo_vazio[1][1] != 'X'e jogo_vazio[1][1] != 'O'){
				   			jogo_vazio[1][1] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 6 e jogo_vazio[1][2] != 'X'e jogo_vazio[1][2] != 'O'){
				   			jogo_vazio[1][2] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 7 e jogo_vazio[2][0] != 'X'e jogo_vazio[2][0] != 'O'){
				   			jogo_vazio[2][0] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 8 e jogo_vazio[2][1] != 'X'e jogo_vazio[2][1] != 'O'){
				   			jogo_vazio[2][1] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 9 e jogo_vazio[2][2] != 'X'e jogo_vazio[2][2] != 'O'){
				   			jogo_vazio[2][2] = 'O'
			    				jogador2 = 0
			    				jogador1 = 1
			    				jogadas2++ 
				   		}
				   		se(opcaojv == 10){//surrender do jogador 02
				   			s.interromper_som(som)
							s.reproduzir_som(som_exit, falso)
				   			escreva("O JOGADOR 2 desistiu!\n")
				   			escreva("ENCERRANDO... AGUARDE...\n")
				   			jogadas1 = 5
							jogadas2 = 4
							jogador2 = 0
							u.aguarde(3750)
				   			pare
				   			}//surrender do jogador 02
				   		se(jogo_vazio[0][0] == 'O' e jogo_vazio[0][1] == 'O' e jogo_vazio[0][2] == 'O'){//condição de vitoria
							vitoria = 1
						} senao se(jogo_vazio[1][0] == 'O' e jogo_vazio[1][1] == 'O' e jogo_vazio[1][2] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[2][0] == 'O' e jogo_vazio[2][1] == 'O' e jogo_vazio[2][2] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[0][0] == 'O' e jogo_vazio[1][0] == 'O' e jogo_vazio[2][0] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[0][1] == 'O' e jogo_vazio[1][1] == 'O' e jogo_vazio[2][1] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[0][2] == 'O' e jogo_vazio[1][2] == 'O' e jogo_vazio[2][2] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[0][0] == 'O' e jogo_vazio[1][1] == 'O' e jogo_vazio[2][2] == 'O'){
							vitoria = 1
						} senao se(jogo_vazio[2][0] == 'O' e jogo_vazio[1][1] == 'O' e jogo_vazio[0][2] == 'O'){
							vitoria = 1
						}
						se(vitoria == 1){//condição de vitoria
							limpa()
							escreva("O JOGADOR 2 ganhou!\n")
							escreva("===== JOGO DA VELHA ====\n")
							escreva("\t",jogo_vazio[0][0],"| ",jogo_vazio[0][1]," |",jogo_vazio[0][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[1][0],"| ",jogo_vazio[1][1]," |",jogo_vazio[1][2],"\n")
							escreva("      -----------\n")
							escreva("\t",jogo_vazio[2][0],"| ",jogo_vazio[2][1]," |",jogo_vazio[2][2],"\n")
							escreva("========================\n\n")
							escreva("ENCERRANDO... AGUARDE...\n")
							jogadas1 = 5
							jogadas2 = 4
							jogador1 = 0
							u.aguarde(3000)
							pare
						}
			    		}//Jogador 2
				}
				se(jogadas1 == 4 e jogadas2 == 4 e jogador1 == 1 e jogador2 == 0){//informa se o game deu empate
					limpa()
					escreva("===== JOGO DA VELHA ====\n")
					escreva("\t",jogo_vazio[0][0],"| ",jogo_vazio[0][1]," |",jogo_vazio[0][2],"\n")
					escreva("      -----------\n")
					escreva("\t",jogo_vazio[1][0],"| ",jogo_vazio[1][1]," |",jogo_vazio[1][2],"\n")
					escreva("      -----------\n")
					escreva("\t",jogo_vazio[2][0],"| ",jogo_vazio[2][1]," |",jogo_vazio[2][2],"\n")
					escreva("========================\n\n")
		    			escreva("<<EMPATE>>\n")
		    			escreva("ENCERRANDO... AGUARDE...\n")
		    			jogadas1 = 5
					jogadas2 = 4
					jogador1 = 0
					u.aguarde(3750)
				}//informa se o game deu empate
				pare//jogo da velha - fim
				caso 3:
				//MENU DO JOGO	JOKENPO
				escreva("\nCARREGANDO O JOGO ESCOLHIDO... AGUARDE...\n\n")
				u.aguarde(3000)
				//MENU DO JOGO JOKENPO
				enquanto(c != 4){//COMEÇO DO JOGO jokenpo
				limpa()
				escreva("\t\t======= PEDRA, PAPEL E TESOURA =======\n")
				escreva("\t\t\t(1) - \tPEDRA\n")
				escreva("\t\t\t(2) - \tTESOURA\n")
				escreva("\t\t\t(3) - \tPAPEL\n")
				escreva("\t\t\t(4) - \tSAIR\n")
				escreva("\t\t=======================================\n")
				escreva("----------------------------------------------\n")
				escreva("Escolha a opção: ")
				leia(teclado)
				escolhapc = sorteia(1,3)
				se(tp.cadeia_e_inteiro(teclado, 10)){
					Escolha = tp.cadeia_para_inteiro(teclado, 10)
				}senao{
					Escolha = 9999
				}
				escolha(Escolha){
					caso 1://QUANDO A ESCOLHA É PEDRA
					escreva("Você escolheu PEDRA.\n")
					u.aguarde(1000)
					escreva("O computador está pensando... Aguarde...\n")
					u.aguarde(2000)
					se(pedra == escolhapc){
						escreva("Ambos escolheram PEDRA e deu EMPATE!\n")
						u.aguarde(3000)
					}senao{
						se(escolhapc == papel ){
							escreva("O computador escolheu PAPEL. Você perdeu essa!\n")
							PC++//CONTADOR DE PONTOS
							u.aguarde(3000)
						}senao{
							escreva("O computador escolheu TESOURA. Você ganhou essa!\n")
							jogador++//CONTADOR DE PONTOS
							u.aguarde(3000)
						}
					}
						pare//Fim da escolha no caso 1
					caso 2://QUANDO A ESCOLHA É TESOURA
						escreva("Você escolheu TESOURA.\n")
						u.aguarde(1000)
						escreva("O computador está pensando... Aguarde...\n")
						u.aguarde(2000)
						se(tesoura == escolhapc){
							escreva("Ambos escolheram TESOURA e deu EMPATE!\n")
							u.aguarde(3000)
						}senao{
							se(escolhapc == pedra ){
								escreva("O computador escolheu PEDRA. Você perdeu essa!\n")
								PC++//CONTADOR DE PONTOS
								u.aguarde(3000)
							}senao{
								escreva("O computador escolheu PAPEL. Você ganhou essa!\n")
								jogador++//CONTADOR DE PONTOS
								u.aguarde(3000)
							}
						}
							pare//Fim da escolha no caso 2
						caso 3://QUANDO A ESCOLHA É PAPEL
						escreva("Você escolheu PAPEL.\n")
						u.aguarde(1000)
						escreva("O computador está pensando... Aguarde...\n")
						u.aguarde(2000)
						se(papel == escolhapc){
							escreva("Ambos escolheram PAPEL e deu EMPATE!\n")
							u.aguarde(3000)
						}senao{
							se(escolhapc == tesoura ){
								escreva("O computador escolheu TESOURA. Você perdeu essa!\n")
								PC++//CONTADOR DE PONTOS
								u.aguarde(3000)
							}senao{
								escreva("O computador escolheu PEDRA. Você ganhou essa!\n")
								jogador++//CONTADOR DE PONTOS
								u.aguarde(3000)
								}
							}
								pare//Fim da escolha no caso 3
							caso 4://FIM DO JOGO
							escreva("SAIR DO JOGO. AGUARDE...\n")
							u.aguarde(2000)
							c = 4
								pare
							caso contrario://Quando for uma opção errada.
							s.reproduzir_som(som_erro, falso)
							escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
							escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
							u.aguarde(2000)
								pare
						}
					}//FIM DO ENQUANTO
					//RESULTADOS DO JOGO 
					escreva("\t\t============ FIM DO JOGO! =============\n")
					escreva("   SEU PLACAR DE VITÓRIA FOI DE ", jogador," PONTO(S), E DE DERROTA FOI ", PC," PONTO(S).\n")
					escreva("===========================================================================")
					escreva("\n\n")
					u.aguarde(3500)
					pare//FIM DO JOGO JOKENPO
				caso 4://FIM DA SELEÇÃO DE JOGOS
					s.interromper_som(som)
					s.reproduzir_som(som_exit, falso)
					escreva("ENCERRANDO... AGUARDE...\n")
					u.aguarde(3750)
					contador++
					pare
				caso contrario:
					s.reproduzir_som(som_erro, falso)
					escreva("\n======= OPÇÃO INVÁLIDA!!! ======\n")
					escreva("=== ESCOLHA UMA OPÇÃO VÁLIDA ===\n")
					u.aguarde(2000)
					pare
			}
		}//Fim da escolha dos Jogos
		escreva("\t\t============ FIM DO JOGO! =============\n")
		escreva("\n\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6965; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {jogador1, 26, 10, 8}-{jogador2, 26, 24, 8}-{jogadas1, 26, 51, 8}-{jogadas2, 26, 65, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */