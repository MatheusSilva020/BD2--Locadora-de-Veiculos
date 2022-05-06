USE BD2_presentation

create view topcarros as
SELECT
modelo,
marca,
placa,
km
FROM carro;

CREATE VIEW carrosdisponiveis
as
select *
from carro
where disponivel =1;

CREATE VIEW carrosindisponiveis
as
select *
from carro
where disponivel =0 ;

CREATE VIEW Carromanutençãos
as
select
carro.marca,
carro.modelo,
reparo.dataInicio,
reparo.dataEntrega,
reparo.statusReparo,
reparo.placaCarro
from reparo
inner join carro on
reparo.placaCarro = carro.placa;

select *from carrosdisponiveis
select *from carrosindisponiveis
select *from Carromanutençãos