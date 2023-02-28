import pyodbc 
import pandas as pd
from datetime import date, datetime

def layout_inicial():
    print("****************************************************")
    print("****************************************************")
    print("               GERADOR DE RELATORIOS                ")
    print("****************************************************")
    print("****************************************************\n")

def relatorio_saidas():
    str_data_inicial = input("\nInsira a data inicial no formato dd/mm/aaaa: ")
    str_data_final =  input("\nInsira a data final no formato dd/mm/aaaa: ")

    print("\n")

    data_inicial = datetime.strptime(str_data_inicial, '%d/%m/%Y').date()
    data_final = datetime.strptime(str_data_final, '%d/%m/%Y').date()
    
    df = pd.read_sql(r"select Data_movto, Num_docto, Desc_produto_est, Qtde_itens, Valor_total, Nome_ccusto from vwSaidasG where Cod_tipo_mv in ('1151', '1152', '1153', '1154') and Data_movto >= '{}' and Data_movto < '{}'".format(data_inicial,data_final),conn)
                   
    df.to_excel(r"{}\relatorio_SAIDAS.xlsx".format(caminho))

def relatorio_entradas():
    str_data_inicial = input("\nInsira a data inicial no formato dd/mm/aaaa: ")
    str_data_final =  input("\nInsira a data final no formato dd/mm/aaaa: ")

    data_inicial = datetime.strptime(str_data_inicial, '%d/%m/%Y').date()
    data_final = datetime.strptime(str_data_final, '%d/%m/%Y').date()
 
    df = pd.read_sql(r"select Data_lancto, Num_docto_aux, Cod_cli_for, Nome_cadastro, Desc_Rateio, valor_dc, Nome_ccusto from vwEntradasG where Cod_tipo_mv = 'T139' or Cod_tipo_mv = 'F105' and Data_lancto >= '{}' and Data_lancto < '{}'".format(data_inicial,data_final),conn)
                   
    df.to_excel(r"{}\relatorio_ENTRADAS.xlsx".format(caminho))

def comunica_laco():
    escolha = input("\nDeseja gerar outro relatorio?[sim/não] ")
    escolha = escolha.upper()
    if(escolha == 'SIM'):
        return 'T'
    else:
        return 'F'
    
conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=SERVIDOR;'                      
                        'Database=DATA;'
                        'UID=USUARIO;'
			                  'PWD=PASSWORD;'                     
                        'Trusted_Connection=yes;')
cursor = conn.cursor()

validacao = 'T'

layout_inicial()

while(validacao != 'F'):
    caminho = input("\nInsira o caminho para salvar o arquivo: \n")
    seletor = int(input("\n1. Entradas por serviço\n2. Saídas por barco\nQual relatorio deseja emitir (1 ou 2)? "))

    if(seletor == 1):
        relatorio_entradas()
        validacao = comunica_laco()

    elif(seletor == 2):
        relatorio_saidas()
        validacao = comunica_laco()

    else:
        print("Selecione uma opção válida!")
