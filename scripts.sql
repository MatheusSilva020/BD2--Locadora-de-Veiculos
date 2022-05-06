USE BD2_presentation

/*teste de tabelas*/
select * from carro
select * from cliente
select * from atendente
select * from pessoa
select * from Pjuridica
select * from mecanica
select * from seguradora
select * from concessionaria
select * from estacionamento
select * from NFcompra
select * from NFvenda
select *from aluguel
select *from reparo

/*inserindo valores nas tabelas base:*/
/*PESSOA:*/
insert into pessoa values (1, '23071923007', 40028922, 'R. das araras 22 Limeira-SP', 'math@unicamp', 'Matheus Silva')
insert into pessoa values (2, '23794823794', 23237070, 'R. leão 3 Salvador-BA', 'jon@unicamp', 'Jonatas Goes')
/*CLIENTE:*/
insert into cliente values(1, '2307192307', 20, '8093120200X', '70706633-909055-5888-9090')
/*ATENDENTE:*/
insert into atendente values(2, '3535358822', 1500.00)
/*P.JURIDICA:*/
insert into Pjuridica values(101010, 0800777, 'Av. maré alta 300 Limeira-SP', 'sac@seguroauto', 'Seguros Auto')
insert into Pjuridica values(202020, 0800666, 'Rua Caiçaras 149 Limeira-SP', 'sac@safework', 'SafeWork seguros')
insert into Pjuridica values(303030, 0800555, 'Rua Capitão Clemente 300 Limeira-SP', 'jonas@mecanica', 'Jonas auto-mecânica')
insert into Pjuridica values(313131, 0800555, 'Av. Senador Vergueiro 80 Limeira-SP', 'motor@mecanica', 'Motor auto-mecânica')
insert into Pjuridica values(404040, 9999111, 'Rua Leão Santos 34 Limeira-SP', 'sac@honda', 'Honda Aversa')
insert into Pjuridica values(505050, 8888111, 'Rua Senador Vergueiro 77 Limeira-SP', 'sac@renault', 'Renault Andretta')
insert into Pjuridica values(4356400, 8912893, 'Av. Piracicaba 3400 Limeira-SP', 'sac@volkswagen', 'Volkswagen Germânica')
insert into Pjuridica values(606060, 8888111, 'Av. Fabrício Vampré 1090 Limeira-SP', 'senna@estacionamento', 'Senna multimarcas')
/*SEGURADORAS:*/
insert into seguradora values(101010, 'Completo')
insert into seguradora values(202020, 'Batidas')
/*MECANICAS:*/
insert into mecanica values(303030, 'Funilaria e pintura')
insert into mecanica values(313131, 'Mecânica geral')
/*CONCESSIONARIAS:*/
insert into concessionaria values(404040, 'Honda')
insert into concessionaria values(505050, 'Renault')
insert into concessionaria values(4356400, 'Volkswagen')
/*ESTACIONAMENTOS:*/
insert into estacionamento values(606060, 4)
/*CARROS:*/
insert into carro values('WQE2B22', 'Honda', 'City', 2014, 140000, 89, 85.00, 0, 1, 1)
insert into carro values('DMM6U89', 'Renault', 'Sandero RS', 2019, 87000, 65, 90.00, 0, 1, 1)
insert into carro values('JGS3K00', 'Hyundai', 'Hb20', 2016, 160000, 50, 65.00, 0, 1, 1)
insert into carro values('EMM8A77', 'Chevrolet', 'Onix', 2016, 164500, 100, 60.00, 0, 1, 1)
insert into carro values('GGW0P52', 'Ford', 'Fusion', 2020, 30000, 70, 250.00, 0, 1, 1)

/*Testando procedimentos:*/
/*teste cria_cliente:*/
declare @ret int
exec @ret = cria_cliente 3, '23093012903', '3405940022', 'Rua Jair Marques 45 Limeira-SP ',
			'antonio@bol', 'Antonio Herrera', '239872323100', 34, '103390901W', '50508833-000055-5222-8888'
print @ret

/*teste altera_cliente:*/
declare @ret2 int
exec @ret2 = alter_cliente 3, '23093012900', '3405940020', 'Rua Jair Marques 40 Limeira-SP ',
			'antonio@uol', 'Antonio Herrera Machado', '239872323100', 34, '103390900W', '50508833-000055-5222-8880'
print @ret2

/*teste del_cliente:*/
declare @ret3 int
exec @ret3 = del_cliente 3, '239872323100'
print @ret3

/*teste compra_carro(cria NFcompra):*/
declare @ret4 int
exec @ret4 = compra_carro 'FGG8A99', Volkswagen, Polo, 2020, 0, 100, 95, 0, 1, 1,1, 100000, '20210502 01:14:34:00 PM', '4356400'       
print @ret4

/*teste vende_carro(cria NFvenda):*/
declare @ret5 int
exec @ret5 = vende_carro 'FGG8A99', 1, 92000, '20210902 05:19:34:00 PM', '606060', null       
print @ret5

delete reparo where placaCarro = 'FGG8A99'
delete aluguel where placaCarro = 'FGG8A99'
delete NFcompra where placa_carro = 'FGG8A99'
delete carro where placa = 'FGG8A99'
insert into NFvenda values(1, 92000, '20210902 05:19:34:00 PM', '606060', null, 'FGG8A99')

/*ALUGUEIS - criando um novo e atualizando:*/
declare @ret6 int
exec @ret6 = novo_aluguel 1, '20210908 03:14:34:00 PM', null, '20210910 03:14:34:00 PM', 1, 'FGG8A99', 1, 2, 0, 1
print @ret6

/*teste alter_aluguel_pago:*/
declare @ret7 int
exec @ret7 = alter_aluguel_pago 1, '20210911 03:14:34:00 PM', 'FGG8A99', 0, 200, 60
print @ret7

/*REPAROS - criando um novo e atualizando:*/
/*teste novo_reparo:*/
declare @ret8 int
exec @ret8 = novo_reparo 1, '20210915 03:14:34:00 PM', null, 600, 'ajuste de embreagem', 'FGG8A99', 313131, 101010, 1, 1
print @ret8

/*teste alter_reparo:*/
declare @ret9 int
exec @ret9 = alter_reparo 1, '20210917 04:24:34:00 PM', 'FGG8A99'
print @ret9

drop table aluguel, reparo, NFcompra, NFvenda, concessionaria, estacionamento, mecanica, seguradora, Pjuridica, cliente, atendente, pessoa,carro