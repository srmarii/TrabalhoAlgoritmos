programa
{
	
	//fazer segunda parte
	
	//ajeitar funções buscar
	//consulta personalizada: busca por produtos acima de tal quantidade ou abaixo e intervalo de valores

	//venda = fazer um vetor auxiliar 
	
	funcao inteiro buscar(cadeia nome, cadeia m1[][], inteiro contP){
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



	
	funcao inicio() {
		const inteiro li = 4
		const inteiro co = 2
		cadeia m1[li][co], nome, desc
		inteiro op, contP=0, opC, l, posicao
		real m2[li][co], precoU, precoP, precoT, quantP, quantT, pag[3], quantVendas[li], acumuladorVendas
		logico existe, continuar

		para(l=0; l<li; l++){
			para(inteiro c=0; c<co; c++){
				m1[l][c] = "#"
				m2[l][c] = 0.0
			}
		}
	
		faca{
			escreva("\n\n\n\n----------------------MENU----------------------")
			escreva("\nVocê deseja entrar no estoque ou realizar uma venda?")
			escreva("\n1- Estoque")
			escreva("\n2- Venda")
			escreva("\n3- Sair")
			escreva("\nSua opção: ")
			leia(op)

		escolha(op){
			/////////////////////////////////////////////////////////////////////////////////////////estoque
			
			caso 1:
						
				faca{
				escreva("\n\n\n\n-----------ESTOQUE-----------")
				escreva("\n1- Inserir um produto")
				escreva("\n2- Listar todos produtos")
				escreva("\n3- Alterar um produto")
				escreva("\n4- Deletar um produto")
				escreva("\n5- Ver o relatório financeiro")
				escreva("\n6- Consultar um produto")
				escreva("\n7- Sair")
				escreva("\n\nSua opção: ")
				leia(op)
		
			
				escolha(op){
					//estoque = inserir produto
					caso 1:	
					escreva(contP)
						se(contP>=li){
							escreva("Cadastro lotado")
							
						} senao{
							escreva("Digite o nome: ")
							leia(nome)
	
							posicao = buscar(nome, m1, contP)
	
							se(posicao == -1){
								m1[contP][0] = nome
								
								escreva("Digite a descrição: ")
								leia(m1[contP][1])
	
								escreva("Digite a quantidade: ")
								leia(m2[contP][0])
	
								escreva("Digite o preço: ")
								leia(m2[contP][1])
	
								contP++
							} senao{
								escreva("Este item já existe no sistema. Digite a quantidade a adicionar: ")
								leia(quantP)
								m2[posicao][0] = m2[posicao][0] + quantP
							}
					
							
						//	para(l = 0; l<li; l++){
						//		se(nome==m1[l][0]){
						//			existe = verdadeiro
						//			escreva("Este item já existe no sistema. Digite a quantidade a adicionar: ")
						//			leia(quantP)
						//			m2[l][0] = m2[l][0] + quantP
						//		} 
						//	}
						
						//	se(nao existe){
						//		m1[contP][0] = nome
								
						//		escreva("Digite a descrição: ")
						//		leia(m1[contP][1])
	
						//		escreva("Digite a quantidade: ")
						//		leia(m2[contP][0])
	
						//		escreva("Digite o preço: ")
						//		leia(m2[contP][1])
	
						//		contP++
						//	}	
						}
									
					pare

					//estoque = listar todos produtos
					caso 2:										
						para(l=0; l<contP; l++){
							escreva("\n----Produto ",l, "----")							
							escreva("\nNome do produto: ", m1[l][0], "\t")
							escreva("\nDescrição do produto: ", m1[l][1], "\t")
							escreva("\nQuantidade do produto: ", m2[l][0], "\t")
							escreva("\nPreço do produto: ", m2[l][1], "\t")
						}
					
					pare

					//estoque = alterar um produto
					caso 3:
						escreva("Escreva o nome do produto para alterar: ")
						leia(nome)
						existe = falso
						para(l=0; l<li; l++){
							se(nome==m1[l][0] e nome != "#"){
								existe = verdadeiro
	
								escreva("\nO que você deseja alterar?")
								escreva("\n1- Nome")
								escreva("\n2- Descrição")
								escreva("\n3- Quantidade")
								escreva("\n4- Preço")
								leia(op)
	
								escolha(op){
									caso 1:
										existe = falso
										escreva("\nDigite o novo nome: ")
										leia(nome)
										para(l=0; l<contP; l++){
											se(nome==m1[l][0]){
												existe = verdadeiro
												escreva("Este item já existe no sistema.")
											}
										}
										se(nao existe){
											m1[l][0] = nome	
										}								
									pare
									
									caso 2:
										escreva("\nDigite a nova descrição: ")
										leia(desc)
										m1[l][1] = desc
									pare
									
									caso 3:
										escreva("\nDigite a nova quantidade: ")
										leia(quantP)
										m2[l][0] = quantP
									pare
									
									caso 4:
										escreva("\nDigite o novo preço: ")
										leia(precoU)
										m2[l][1] = precoU
									pare
									
									caso contrario:
										escreva("\nOpção inválida")
								}
						}	
							se(nao existe){
								escreva("Não existe nenhum produto com esse nome no sistema")
							}
					}		
					pare

					//estoque = deletar um produto
					caso 4:
						escreva("Escreva o nome do produto para deletar")
						leia(nome)
						existe = falso
						para(l=0; l<li; l++){
							se(nome==m1[l][0] e nome != "#"){
								existe = verdadeiro
						
							//	m1[l][0] = "#"
							//	m1[l][1] = "#"
							//	m2[l][0] = 0.0
							//	m2[l][1] = 0.0
	
								m1[l][0] = m1[contP-1][0] 
								m1[l][1] = m1[contP-1][0] 
								m2[l][0] = m2[contP-1][0] 
								m2[l][1] = m2[contP-1][0] 
	
									
								contP--
	
								escreva("\nProduto '",l, "' excluído")
								escreva("\nContador: ", contP)
							}
						}	
							se(nao existe){
								escreva("Não existe nenhum produto com esse nome no sistema")
							}
					pare

					//estoque = ver um relatorio financeiro
					caso 5:
						precoT = 0.0
						quantT = 0.0
						para(l=0; l<li; l++){
							se(m1[l][0] != "#"){
								nome = m1[l][0]
								quantP = m2[l][0]
								precoU = m2[l][1]
								precoP = m2[l][0] * m2[l][1]
	
								escreva("\n----Produto ",l, "----")
								escreva("\nExiste(m) ",quantP, " ", nome, "(s) no sistema, cada uma custando ", precoU, " reais.") 
								escreva("\nEntão o seu valor total	referente a quantidade de produtos é R$", precoP, " reais.")
									
								precoT = precoT + precoP
								quantT = quantT + quantP
									
							}
						}
						escreva("\n\nPara os ", quantT, " produtos existentes, o valor total que a empresa pode adquirir vendendo-os é R$", precoT)
					pare

					//estoque = consultar um produto
					caso 6:
						escreva("\nVocê deseja consultar um(s) produto(s) por:")
						escreva("\n1- Nome")
						escreva("\n2- Quantidade")
						escreva("\n3- Preço")
						escreva("\nSua Opção: ")
						leia(opC)
	
						escolha(opC) {
							//estoque = consulta = por nome
							caso 1: 
								escreva("\nEscreva o nome do produto para buscar: ")
								leia(nome)
								existe = falso
								para(l=0; l<li; l++){
									se(nome==m1[l][0]){
										existe = verdadeiro
										escreva("\n----Produto ",l, "----")
										escreva("\nNome do produto: ", m1[l][0], "\t")
										escreva("\nDescrição do produto: ", m1[l][1], "\t")
										escreva("\nQuantidade do produto: ", m2[l][0], "\t")
										escreva("\nPreço do produto: ", m2[l][1], "\t")	
									} 
									
								}
								se(nao existe){
									escreva("Não existe nenhum produto com esse nome no sistema")
								}
							pare

							//estoque = consulta = por quantidade
							caso 2: 
								escreva("\nEscreva a quantidade do produto para buscar: ")
								leia(quantP)
								existe = falso
								para(l=0; l<li; l++){
									se(quantP==m2[l][0]){
										existe = verdadeiro
											escreva("\n----Produto ",l, "----")
											escreva("\nNome do produto: ", m1[l][0], "\t")
											escreva("\nDescrição do produto: ", m1[l][1], "\t")
											escreva("\nQuantidade do produto: ", m2[l][0], "\t")
											escreva("\nPreço do produto: ", m2[l][1], "\t")	
									} 
									
								}
								se(nao existe){
									escreva("Não existe nenhum produto com essa quantidade no sistema")
								}
							pare

							//estoque = consulta = por preço
							caso 3:
								escreva("\nEscreva o preço do produto para buscar: R$")
								leia(quantP)
								existe = falso
								para(l=0; l<li; l++){
									se(quantP==m2[l][1]){
										existe = verdadeiro
											escreva("\n----Produto ",l, "----")
											escreva("\nNome do produto: ", m1[l][0], "\t")
											escreva("\nDescrição do produto: ", m1[l][1], "\t")
											escreva("\nQuantidade do produto: ", m2[l][0], "\t")
											escreva("\nPreço do produto: ", m2[l][1], "\t")	
									} 
									
								}
								se(nao existe){
									escreva("Não existe nenhum produto com esse preço no sistema")
								}
							pare
					
							caso contrario:
							escreva("Dígito inválido!")
						}
												
					
					pare
					caso 7:
						escreva("Saindo")
					pare
	
	
					caso contrario:
					escreva("Dígito inválido! Digite um número válido")
				}
	
			} enquanto(op!= 7)	
				
			pare

			///////////////////////////////////////////////////////////////////////////////////////////venda
			caso 2:
				faca{
					escreva("\n\n\n\n-----------VENDA-----------")
					escreva("\n1- Realizar uma venda")
					escreva("\n2- Listar produtos vendidos")
					escreva("\n3- Todas as vendas")
					escreva("\n4- Sair")
					escreva("\nSua opção: ")
					leia(op)
	
				escolha(op){
					//venda = realizar uma venda
					caso 1:
						acumuladorVendas=0
						escreva("\nOs produtos disponíveis em estoque são:")
						para(l=0; l<contP; l++){
							escreva("\n----Produto ",l, "----")							
							escreva("\nNome do produto: ", m1[l][0], "\t")
							escreva("\nDescrição do produto: ", m1[l][1], "\t")
							escreva("\nQuantidade do produto: ", m2[l][0], "\t")
							escreva("\nPreço do produto: ", m2[l][1], "\t")
						}

						faca{
						escreva("\n\nQual o nome do produto que você gostaria de comprar? ")
						leia(nome)
						posicao = buscar(nome, m1, contP)
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
							escreva("\n --> ", quantVendas[l], " ", m1[l][0], "(s) = R$", quantVendas[0] * m2[l][1])
						}
					pare

					//venda = todas as vendas
					caso 3:
						escreva("\nO valor arrecadado no dia foi R$", (pag[0] + pag[1] + pag[2]), ", sendo:")
						escreva("\nNo PIX: R$", pag[0])
						escreva("\nNo DÉBITO: R$", pag[1])
						escreva("\nNo CRÉDITO: R$", pag[2])
					pare

					caso 4:
						escreva("Saindo")
					pare
		
					caso contrario:
						escreva("\nDígito inválido!")
				}
				} enquanto(op!=4)
					
			pare
			caso 3:
				escreva("Saindo")
			pare	

			caso contrario:
				escreva("\nDígito inválido!")
		}
		
		} enquanto(op!=3)


	
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10526; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */