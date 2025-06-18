programa
{	
	funcao inteiro buscarPorNome(cadeia nome, cadeia m1[][], inteiro contP){
		//não existe
		inteiro x = -1
							
		para(inteiro l = 0; l<contP; l++){
			se(nome==m1[l][0]){
				//existe
				x = l
			} 
		}
						
		retorne x
	}

	funcao listarTodos(inteiro l, cadeia m1[][], real m2[][]){
		escreva("\n\n----Produto número ",l, ":")							
		escreva("\nNome do produto: ", m1[l][0], "\t")
		escreva("\nDescrição do produto: ", m1[l][1], "\t")
		escreva("\nQuantidade do produto: ", m2[l][0], "\t")
		escreva("\nPreço do produto: ", m2[l][1], "\t")
		escreva("\n")
	}

	funcao digitoInvalido(){
		escreva("Dígito inválido")
	}

	funcao formatar(inteiro l, inteiro c, cadeia m1[][], real m2[][]){
		m1[l][c] = "#"
		m2[l][c] = 0.0
	}

	funcao menu(inteiro tipoMenu){
		escolha(tipoMenu){
			
			//menu principal
			caso 1:
				escreva("\n\n\n\n-----------Menu PRINCIPAL do <MARI MARKET>-----------")
				escreva("\nVocê deseja entrar no estoque ou realizar uma venda?")
				escreva("\n1- Estoque")
				escreva("\n2- Venda")
				escreva("\n3- Sair")
				escreva("\nSua opção: ")
			pare

			//menu estoque
			caso 2:
				escreva("\n\nMenu ESTOQUE do <MARI MARKET>-------------------------")
				escreva("\n1- Inserir um produto")
				escreva("\n2- Listar todos produtos")
				escreva("\n3- Alterar um produto")
				escreva("\n4- Deletar um produto")
				escreva("\n5- Ver o relatório financeiro")
				escreva("\n6- Consultar um produto")
				escreva("\n7- Sair")
				escreva("\nSua opção: ")
			pare

			//menu vendas
			caso 3:
				escreva("\n\nMenu VENDA do <MARI MARKET>---------------------------")
				escreva("\n1- Realizar uma venda")
				escreva("\n2- Listar produtos vendidos no dia e total")
				escreva("\n3- Todas as vendas por método de pagamento e total")
				escreva("\n4- Sair")
				escreva("\nSua opção: ")
			pare
		}
	}
	



	
	funcao inicio() {
		const inteiro li = 4
		const inteiro co = 2
		const inteiro p = 3
		
		cadeia m1[li][co], nome, desc
		inteiro op, contP=0, l, c, posicao, posicao2
		real m2[li][co], precoU, precoP, precoT, quantP, quantT, pag[p], quantVendas[li], acumuladorVendas, precoMenor, precoMaior
		logico existe, continuar

		para(l=0; l<li; l++){
			para(c=0; c<co; c++){
				formatar(l, c, m1, m2)
			}
		}

		escreva("---------------------------------------------------------------SEJA BEM VINDO AO <MARI MARKET>---------------------------------------------------------------\n\n")
		
		faca{
			//menu principal
			menu(1)
			leia(op)

		escolha(op){
			/////////////////////////////////////////////////////////////////////////////////////////estoque
			
			caso 1:
				faca{
				//menu estoque
				menu(2)
				leia(op)
		
			
				escolha(op){
					//estoque = inserir produto
					caso 1:
						se(contP>=li){
							escreva("\nCadastro lotado!")
							
						} senao{
							escreva("\nDigite o nome: ")
							leia(nome)
	
							posicao = buscarPorNome(nome, m1, contP)
	
							se(posicao == -1){
								m1[contP][0] = nome
								
								escreva("\nDigite a descrição: ")
								leia(m1[contP][1])
	
								escreva("\nDigite a quantidade: ")
								leia(m2[contP][0])
	
								escreva("\nDigite o preço: ")
								leia(m2[contP][1])
	
								contP++

								escreva("\nItem '", nome, "' adicionado!")
							} senao{
								escreva("\nEste item já existe no sistema. Digite a quantidade a adicionar: ")
								leia(quantP)
								m2[posicao][0] = m2[posicao][0] + quantP
								escreva("\nAdicionado(a) ", quantP, " ", nome, "(s) ao sistema.")
							}	
						}
									
					pare

					//estoque = listar todos produtos
					caso 2:										
						para(l=0; l<contP; l++){
							listarTodos(l, m1, m2)
						}
					
					pare

					//estoque = alterar um produto
					caso 3:
						escreva("\nEscreva o nome do produto para alterar: ")
						leia(nome)

						posicao = buscarPorNome(nome, m1, contP)
	
						se(posicao == -1){
							escreva("\nNão existe nenhum produto com esse nome no sistema")
						} senao{
							posicao2 = posicao
							escreva("\nO que você deseja alterar?")
							escreva("\n1- Nome")
							escreva("\n2- Descrição")
							escreva("\n3- Quantidade")
							escreva("\n4- Preço")
							escreva("\nSua opção: ")
							leia(op)
	
							escolha(op){
								caso 1:
								escreva("\nDigite o novo nome: ")
								leia(nome)
										
								posicao = buscarPorNome(nome, m1, contP)
	
								se(posicao != -1){
									escreva("\nEste item já existe no sistema.")
								} senao{
									m1[posicao2][0] = nome
									escreva("\nItem '", nome, "' com o nome atualizado: '", nome, "'")
								}								
								pare
									
								caso 2:
									escreva("\nDigite a nova descrição: ")
									leia(desc)
									m1[posicao][1] = desc
									escreva("Item '", m1[posicao2][0], "' com a descrição atualizada: '", desc, "'")
								pare
									
								caso 3:
									escreva("\nDigite a nova quantidade: ")
									leia(quantP)
									m2[posicao][0] = quantP
									escreva("\nItem '", m1[posicao2][0], "' com a quantidade atualizada: ", quantP)
								pare
									
								caso 4:
									escreva("\nDigite o novo preço: ")
									leia(precoU)
									m2[posicao][1] = precoU
									escreva("\nItem '", m1[posicao2][0], "' com o preço atualizado: R$", precoU)
								pare
									
								caso contrario:
									digitoInvalido()
								}
							
						}
					pare

					//estoque = deletar um produto
					caso 4:
						escreva("\nEscreva o nome do produto para deletar: ")
						leia(nome)

						posicao = buscarPorNome(nome, m1, contP)
	
						se(posicao == -1){
							escreva("\nEste item não existe no sistema.")
						} senao{
							m1[posicao][0] = m1[contP-1][0] 
							m1[posicao][1] = m1[contP-1][0] 
							m2[posicao][0] = m2[contP-1][0] 
							m2[posicao][1] = m2[contP-1][0] 
			
							contP--
		
							escreva("\nProduto '",nome, "', na posição ",posicao, ", foi excluído.")
						}
						
					
					pare

					//estoque = ver um relatorio financeiro
					caso 5:
						precoT = 0.0
						quantT = 0.0
						para(l=0; l<contP; l++){
							nome = m1[l][0]
							quantP = m2[l][0]
							precoU = m2[l][1]
							precoP = m2[l][0] * m2[l][1]
	
							escreva("\n----Produto ",l, "----")
							escreva("\nExiste(m) ",quantP, " ", nome, "(s) no sistema, cada uma custando ", precoU, " reais.") 
							escreva("\nEntão o seu valor total	referente a quantidade de produtos é R$", precoP, " reais.\n")
									
							precoT = precoT + precoP
							quantT = quantT + quantP
									
						}
						escreva("\n\n----Para os ", quantT, " produtos existentes, o valor total que a empresa pode adquirir vendendo-os é R$", precoT)
					pare

					//estoque = consultar um produto
					caso 6:
						escreva("\nVocê deseja consultar um(s) produto(s) por:")
						escreva("\n1- Nome")
						escreva("\n2- Quantidade")
						escreva("\n3- Preço")
						escreva("\nSua Opção: ")
						leia(op)
	
						escolha(op) {
							//estoque = consulta = por nome
							caso 1: 
								escreva("\nEscreva o nome do produto para buscar: ")
								leia(nome)

								posicao = buscarPorNome(nome, m1, contP)
	
								se(posicao == -1){
									escreva("\nEste item não existe no sistema.")
								} senao{
									listarTodos(posicao, m1, m2)
								}
								
						
							pare

							//estoque = consulta = por quantidade
							caso 2: 
								escreva("\nVocê deseja buscar um produto:")
								escreva("\n1- Acima de uma quantidade x?")
								escreva("\n2- Abaixo de uma quantidade x?")
								escreva("\n\nSua opção: ")
								leia(op)

								escolha(op){
									//estoque = consulta = por quantidade = MAIOR
									caso 1:
										escreva("\nEscreva a quantidade para buscar produtos iguais a ela ou maiores: ")
										leia(quantP)
						
										existe = falso
										para(l=0; l<contP; l++){
											se(quantP<=m2[l][0]){ 
												existe = verdadeiro
												listarTodos(l, m1, m2)
											} 
										
										}
										se(nao existe){
											escreva("\nNão existe nenhum produto com essa quantidade ou maior no sistema")
										}
									pare

									//estoque = consulta = por quantidade = MENOR
									caso 2:
										escreva("\nEscreva a quantidade para buscar produtos iguais a ela ou menores: ")
										leia(quantP)
						

										existe = falso		
										para(l=0; l<contP; l++){
											se(quantP>=m2[l][0]){ 
											existe = verdadeiro
											listarTodos(l, m1, m2)
											}
										}
										se(nao existe){
									 		escreva("\nNão existe nenhum produto com essa quantidade ou menor no sistema")
										}
									pare

									caso contrario:
										digitoInvalido()
								}
								
							pare

							//estoque = consulta = por preço
							caso 3:
								escreva("\nVocê deseja buscar um produto:")
								escreva("\n1- Acima de um preço x?")
								escreva("\n2- Abaixo de um preço x?")
								escreva("\n3- Entre dois valores x e y?")
								escreva("\n\nSua opção: ")
								leia(op)

								escolha(op){
									//estoque = consulta = por preço = MAIOR
									caso 1:
										escreva("\nEscreva o preço para buscar produtos iguais a ele ou maiores: R$")
										leia(precoU)
										
										existe = falso
										para(l=0; l<contP; l++){
											se(precoU<=m2[l][1]){ 
												existe = verdadeiro	
											}
										}
										se(nao existe){
											escreva("\nNão existe nenhum produto com esse preço ou maior no sistema")
										}
									pare

									//estoque = consulta = por preço = MENOR
									caso 2:
										escreva("\nEscreva o preço para buscar produtos iguais a ele ou menores: R$")
										leia(precoU)
								
										existe = falso
										para(l=0; l<contP; l++){
											se(precoU>=m2[l][1]){
												existe = verdadeiro
											}
										}
										se(nao existe){
											escreva("\nNão existe nenhum produto com esse preço ou menor no sistema")
										}
									pare

									caso 3:
										escreva("\nEscreva o menor preço: R$")
										leia(precoMenor)

										escreva("\nEscreva o maior preço: R$")
										leia(precoMaior)

										existe = falso
										para(l=0; l<contP; l++){
											se(precoMenor<=m2[l][1] e precoMaior >=m2[l][1]){
												existe = verdadeiro
												listarTodos(l, m1, m2)
											}
										}
										se(nao existe){
											escreva("\nNão existe nenhum produto com esse preço ou menor no sistema")
										}
									pare

									caso contrario:
										digitoInvalido()
								}


							pare
				
							caso contrario:
							digitoInvalido()
						}
												
					
					pare
					caso 7:
						escreva("\nSaindo...")
					pare
	
	
					caso contrario:
					digitoInvalido()
				}
	
			} enquanto(op!= 7)	
				
			pare

			///////////////////////////////////////////////////////////////////////////////////////////venda
			caso 2:
				faca{
					//menu venda
					menu(3)
					leia(op)
	
				escolha(op){
					//venda = realizar uma venda
					caso 1:
						acumuladorVendas=0
						escreva("\nOs produtos disponíveis em estoque são:")
						para(l=0; l<contP; l++){
							listarTodos(l, m1, m2)
						}

						faca{
							escreva("\n\nQual o nome do produto que você gostaria de comprar? ")
							leia(nome)
							posicao = buscarPorNome(nome, m1, contP)
							se(posicao == -1){
								continuar = falso
								escreva("\nEste item não existe no sistema")
							} senao{
								escreva("\nQual a quantidade que você deseja comprar? ")
								leia(quantP)
								se(quantP <= m2[posicao][0] e quantP > 0){
									m2[posicao][0] = m2[posicao][0] - quantP
									quantVendas[posicao] = quantVendas[posicao] + quantP
									continuar = verdadeiro
									acumuladorVendas = acumuladorVendas + (quantP * m2[posicao][1])
															
								} senao se(quantP <= 0) {
									continuar = falso
									escreva("\nNão é possível comprar 0 ou menos itens")
								} senao{
									continuar = falso
									escreva("\nEssa quantidade é maior do que a quantidade disponível no estoque")
								}
							}
							se(continuar==verdadeiro){	
								escreva("\nVocê deseja comprar algo a mais? ")
								escreva("\nSim - Digite 1")
								escreva("\nNão - Digite qualquer número")
								escreva("\nSua opção: ")
								leia(op)
							}
						} enquanto(op==1)

						escreva("\nCerto, e qual será a forma de pagamento? ")
						escreva("\n1- Pix")
						escreva("\n2- Débito")
						escreva("\n3- Crédito")
						escreva("\nSua opção: ")
						leia(op)

						escolha(op){
							caso 1:
								pag[0] = pag[0] + acumuladorVendas
								escreva("\nTudo certo! Você passou no PIX!")
							pare
									
							caso 2:
								pag[1] = pag[1] + acumuladorVendas
								escreva("\nTudo certo! Você passou no DÉBITO!")
							pare
								
							caso 3:
								pag[2] = pag[2] + acumuladorVendas
								escreva("\nTudo certo! Você passou no CRÉDITO!")
							pare
									
							caso contrario:
								escreva("\nNúmero inválido")
						}
						
					pare

					//venda = listar produtos vendidos no dia
					caso 2:
						escreva("\nForam vendidos no dia de hoje:")
						para(l=0; l<contP; l++){
							escreva("\n --> ", quantVendas[l], " ", m1[l][0], "(s), total = R$", quantVendas[l] * m2[l][1])
						}
						escreva("\n\nSendo o total: R$", (pag[0] + pag[1] + pag[2]))
					pare

					//venda = todas as vendas
					caso 3:
						escreva("\nO valor total arrecadado no dia foi R$", (pag[0] + pag[1] + pag[2]), ", sendo:")
						escreva("\nNo PIX: R$", pag[0])
						escreva("\nNo DÉBITO: R$", pag[1])
						escreva("\nNo CRÉDITO: R$", pag[2])
					pare

					caso 4:
						escreva("\nSaindo...")
					pare
		
					caso contrario:
						digitoInvalido()
				}
				} enquanto(op!=4)
					
			pare
			caso 3:
				escreva("\nSaindo...")
			pare	

			caso contrario:
				digitoInvalido()
		}
		
		} enquanto(op!=3)

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5245; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {m1, 3, 50, 2}-{m2, 30, 59, 2};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */