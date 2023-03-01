USE [DATABASE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwSaidasG] AS
SELECT SAIDAS.Chave_fato,
       SAIDAS.Num_docto,
       SAIDAS.Data_movto,
       SAIDAS.Status,
       SAIDAS.Qtde_itens,
       SAIDAS.Valor_total,
       SAIDAS.Cod_tipo_mv,
       SAIDAS.Status_ctb,
       SAIDAS.Cod_cli_for,
       SAIDASITEM.Cod_ccusto,
       SAIDASITEM.Cod_produto,
       PRODUTO.Desc_produto_est,
       CCUSTO.Nome_ccusto
FROM 
tbSaidas SAIDAS
INNER JOIN tbSaidasItem SAIDASITEM ON (SAIDASITEM.Chave_fato = SAIDAS.Chave_fato)
INNER JOIN tbProduto PRODUTO ON (SAIDASITEM.Cod_produto = PRODUTO.Cod_produto)
INNER JOIN tbCentroCusto CCUSTO ON (CCUSTO.Cod_ccusto = SAIDASITEM.Cod_ccusto)
GO

