# Estrutura do Modelo Dimensional de Vendas

## 1. F_VENDAS

Tabela fato central do modelo, destinada a armazenar os registros de vendas e suas métricas.

| Campo | Descrição |
|---|---|
| VendaKey | Chave primária substituta do registro |
| ProdutoKey | Chave estrangeira para D_PRODUTOS |
| DetalheKey | Chave estrangeira para D_DETALHES |
| DescontoKey | Chave estrangeira para D_DESCONTOS |
| DataKey | Chave estrangeira para D_CALENDARIO |
| UnitsSold | Quantidade de unidades vendidas |
| SalePrice | Preço de venda unitário |
| GrossSales | Valor bruto das vendas |
| Discounts | Valor dos descontos |
| Sales | Valor final das vendas |
| COGS | Custo dos produtos vendidos |
| Profit | Lucro registrado |

## 2. Dimensões

### D_PRODUTOS

- ProdutoKey — chave primária substituta.
- Produto — nome do produto.
- ManufacturingPrice — preço de fabricação informado na fonte.

### D_DETALHES

- DetalheKey — chave primária substituta.
- Segment — segmento de mercado.
- Country — país associado ao registro.

### D_DESCONTOS

- DescontoKey — chave primária substituta.
- DiscountBand — faixa de desconto.

### D_CALENDARIO

- DataKey — chave primária no formato AAAAMMDD.
- DataCompleta — data completa.
- Dia — dia do mês.
- NomeDiaSemana — nome do dia da semana.
- Mes — número do mês.
- NomeMes — nome do mês.
- Trimestre — trimestre do ano.
- Semestre — semestre do ano.
- Ano — ano da data.
- AnoMes — ano e mês no formato AAAA-MM.

## 3. Relacionamentos

As dimensões se relacionam com a tabela fato em relações de um para muitos (1:N), com a dimensão no lado 1 e a tabela fato no lado N.

- D_PRODUTOS → F_VENDAS
- D_DETALHES → F_VENDAS
- D_DESCONTOS → F_VENDAS
- D_CALENDARIO → F_VENDAS

## 4. Granularidade

A granularidade pretendida é de um registro da fonte de vendas para cada linha da tabela F_VENDAS.

A chave VendaKey identifica cada registro inserido na tabela fato. Ela não substitui um identificador original da fonte e, por si só, não impede a duplicação de registros durante cargas repetidas.

## 5. Fonte e premissas

O modelo foi planejado para utilizar o conjunto de dados Microsoft Financial Sample, com campos de produtos, segmento, país, descontos, quantidades, valores financeiros e datas.

A implementação depende da importação correta da fonte para a tabela financial_sample no MySQL.

Os scripts SQL representam uma proposta de implementação e ainda precisam ser executados e validados. Este documento descreve a estrutura planejada, não uma implementação comprovadamente funcional.
