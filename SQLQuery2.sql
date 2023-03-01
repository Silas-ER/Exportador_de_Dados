
USE [DATABASE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwEntradasG] AS
SELECT MOVIMENTO.Chave_fato,
       MOVIMENTO.Cod_rotina, 
       MOVIMENTO.Cod_ccustoD, 
       MOVIMENTO.Data_lancto, 
       MOVIMENTO.Num_docto_aux, 
       MOVIMENTO.valor_dc,
       MOVIMENTO.Tipo_partida,
       NOMECUSTO.Cod_ccusto,
       NOMECUSTO.Nome_ccusto,
       ENTRADAS.Cod_cli_for,
       ENTRADAS.Cod_tipo_mv,
       NOMECDA.Nome_cadastro,
       TIPORATEIO.Desc_Rateio
FROM 
vwMovto MOVIMENTO
INNER JOIN tbEntradas ENTRADAS ON (MOVIMENTO.Chave_fato = ENTRADAS.Chave_fato)
INNER JOIN tbCentroCusto NOMECUSTO ON (MOVIMENTO.Cod_ccustoD = NOMECUSTO.Cod_ccusto)
INNER JOIN tbCadastroGeral NOMECDA ON (NOMECDA.Cod_cadastro = ENTRADAS.Cod_cli_for)
INNER JOIN tbCadRateio TIPORATEIO ON (MOVIMENTO.Cod_rateioD = TIPORATEIO.Cod_rateio)
GO
