<h1 align="center">Exportador de Dados</h1>

Programa desenvolvido no meu estágio atual, com objetivo de exportar dados do SQL para o excel.

Com a premissa de fornecer dados especificos para um funcionário que não tem acesso ao banco de dados, desenvolvi um programa que permite que o usuario coloque o caminho que o arquivo será salvo e selecione a data inicial e final que quer gerar a pesquisa, e assim consiga gerar um arquivo excel que será salvo no caminho selecionado.

O programa foi desenvolvido utilizando como base a linguagem python com as bibliotecas `pyodbc` para acesso ao banco e `pandas` para leitura dos dados do banco, bem como a formulação da planilha, e as views para a consulta foram criadas no MS-SQL e estão inseridas numa pasta desse projeto. 
