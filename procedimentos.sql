USE BD2_presentation

/*CRIANDO PROCEDIMENTOS:*/
/*Inserindo clientes:*/
create procedure cria_cliente
@id int,
@cpf char(11),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@rg char(10),
@idade smallint,
@cnh char(11),
@cartao char(25)
as
begin transaction
insert into pessoa values(@id, @cpf, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de pessoa bem sucedida */
begin
	insert into cliente values(@id, @rg, @idade, @cnh, @cartao)
	if @@rowcount > 0	/* insercao de cliente bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Inserindo atendentes:*/
create procedure cria_atendente
@id int,
@cpf char(11),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@cartTrab char(20),
@salario smallmoney
as
begin transaction
insert into pessoa values(@id, @cpf, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de pessoa bem sucedida */
begin
	insert into atendente values(@id, @cartTrab, @salario)
	if @@rowcount > 0	/* insercao de atendente bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Inserindo seguradoras:*/
create procedure cria_seguradora
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@cobertura char(20)
as
begin transaction
insert into Pjuridica values(@cnpj, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de p. juridica bem sucedida */
begin
	insert into seguradora values(@cnpj, @cobertura)
	if @@rowcount > 0	/* insercao de seguradora bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Inserindo auto-mecanicas:*/
create procedure cria_mecanica
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@espec char(20)
as
begin transaction
insert into Pjuridica values(@cnpj, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de p. juridica bem sucedida */
begin
	insert into mecanica values(@cnpj, @espec)
	if @@rowcount > 0	/* insercao de mecanica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Inserindo concessionarias:*/
create procedure cria_concessionaria
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@marca char(20)
as
begin transaction
insert into Pjuridica values(@cnpj, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de p. juridica bem sucedida */
begin
	insert into concessionaria values(@cnpj, @marca)
	if @@rowcount > 0	/* insercao de concessionaria bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Inserindo estacionamentos:*/
create procedure cria_estacionamento
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@avaliacao int
as
begin transaction
insert into Pjuridica values(@cnpj, @telefone, @endereco, @email, @nome)
if @@rowcount > 0  /* insercao de p. juridica bem sucedida */
begin
	insert into estacionamento values(@cnpj, @avaliacao)
	if @@rowcount > 0	/* insercao de concessionaria bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*ALTERACOES:*/
/*Alterando clientes:*/
create procedure alter_cliente
@id int,
@cpf char(11),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@rg char(10),
@idade smallint,
@cnh char(11),
@cartao char(25)
as
begin transaction
update pessoa
set cpf = @cpf, telefone = @telefone,endereco = @endereco, email = @email, nome = @nome where id = @id
if @@rowcount > 0
begin
	update cliente
	set rg = @rg, idade = @idade, cnh = @cnh, cartao = @cartao where id = @id
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end
	
/*Alterando atendentes:*/
create procedure alter_atendente
@id int,
@cpf char(11),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@cartTrab char(20),
@salario smallmoney
as
begin transaction
update pessoa
set cpf = @cpf, telefone = @telefone, endereco = @endereco, email = @email, nome = @nome where id = @id
if @@rowcount > 0
begin
	update atendente
	set cartTrab = @cartTrab, salario = @salario where id = @id
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end
	
/*Alterando seguradora:*/
create procedure alter_seguradora
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@cobertura char(20)
as
begin transaction
update Pjuridica
set telefone = @telefone, endereco = @endereco, email = @email, nome = @nome where cnpj = @cnpj
if @@rowcount > 0
begin
	update seguradora
	set cobertura = @cobertura where cnpj= @cnpj
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Alterando auto-mecanica:*/
create procedure alter_mecanica
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@espec char(20)
as
begin transaction
update Pjuridica
set telefone = @telefone, endereco = @endereco, email = @email, nome = @nome where cnpj = @cnpj
if @@rowcount > 0
begin
	update mecanica
	set espec = @espec where cnpj= @cnpj
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Alterando concessionária:*/
create procedure alter_concessionaria
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@marca char(20)
as
begin transaction
update Pjuridica
set telefone = @telefone, endereco = @endereco, email = @email, nome = @nome where cnpj = @cnpj
if @@rowcount > 0
begin
	update concessionaria
	set marca = @marca where cnpj= @cnpj
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*Alterando estacionamento:*/
create procedure alter_estacionamento
@cnpj char(14),
@telefone char(10),
@endereco char(50),
@email char(25),
@nome char(35),
@avaliacao int
as
begin transaction
update Pjuridica
set telefone = @telefone, endereco = @endereco, email = @email, nome = @nome where cnpj = @cnpj
if @@rowcount > 0
begin
	update estacionamento
	set avaliacao = @avaliacao where cnpj= @cnpj
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*EXCLUSÃO:*/
/*excluindo cliente:*/
create procedure del_cliente
@id int,
@rg char(10)
as
begin transaction
delete cliente where rg = @rg
if @@rowcount > 0 /* exclusão de cliente bem sucedida */
begin
	delete pessoa
	where id = @id
	if @@rowcount > 0 /* exclusão de pessoa_fisica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*excluindo atendente:*/
create procedure del_atendente
@id int,
@cartTrab char(10)
as
begin transaction
delete atendente where cartTrab = @cartTrab
if @@rowcount > 0 /* exclusão de atendente bem sucedida */
begin
	delete pessoa
	where id = @id
	if @@rowcount > 0 /* exclusão de pessoa_fisica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*excluindo seguradora:*/
create procedure del_seguradora
@cnpj char(14)
as
begin transaction
delete seguradora where cnpj = @cnpj
if @@rowcount > 0 /* exclusão de seguradora bem sucedida */
begin
	delete Pjuridica
	where cnpj = @cnpj
	if @@rowcount > 0 /* exclusão de Pjuridica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*excluindo auto-mecanica:*/
create procedure del_mecanica
@cnpj char(14)
as
begin transaction
delete mecanica where cnpj = @cnpj
if @@rowcount > 0 /* exclusão de mecanica bem sucedida */
begin
	delete Pjuridica
	where cnpj = @cnpj
	if @@rowcount > 0 /* exclusão de Pjuridica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*excluindo concessionaria:*/
create procedure del_concessionaria
@cnpj char(14)
as
begin transaction
delete concessionaria where cnpj = @cnpj
if @@rowcount > 0 /* exclusão de concessionaria bem sucedida */
begin
	delete Pjuridica
	where cnpj = @cnpj
	if @@rowcount > 0 /* exclusão de Pjuridica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*excluindo estacionamento:*/
create procedure del_estacionamento
@cnpj char(14)
as
begin transaction
delete estacionamento where cnpj = @cnpj
if @@rowcount > 0 /* exclusão de estacionamento bem sucedida */
begin
	delete Pjuridica
	where cnpj = @cnpj
	if @@rowcount > 0 /* exclusão de Pjuridica bem sucedida */
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*PROCEDIMENTOS ESPECIAIS:*/
/*Comprando um novo carro:*/
create procedure compra_carro
@placa char(10),
@marca char(15),
@modelo char(20),
@ano smallint,
@km int,
@combustivel int,
@valor smallmoney,
@manutencao bit,
@seguro bit,
@disponivel bit,
@codigo int,
@valorCarro smallmoney,
@dataCompra smalldatetime,
@cnpj_conc char(14)
as
begin transaction
insert into carro values(@placa, @marca, @modelo, @ano, @km, @combustivel, @valor, @manutencao, @seguro, @disponivel)
if @@rowcount > 0
begin
	insert into NFcompra values(@codigo, @valorCarro, @dataCompra, @cnpj_conc, @placa)
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end
	
/*Vendendo um carro:*/
create procedure vende_carro
@placa char(10),
@codigo int,
@valor smallmoney,
@dataCompra smalldatetime,
@cnpj_est char(14),
@idCliente int
as
begin transaction
delete reparo where placaCarro = @placa
if @@rowcount > 0
begin
	delete aluguel where placaCarro = @placa
	if @@rowcount > 0
	begin
		delete NFcompra where placa_carro = @placa
		if @@rowcount > 0
		begin
			delete carro where placa = @placa
			if @@rowcount > 0
			begin
				insert into NFvenda values(@codigo, @valor, @dataCompra, @cnpj_est, @idCliente, @placa)
				if @@rowcount > 0
				begin
					commit transaction
					return 1
				end
				else
				begin
					rollback transaction
					return 0
				end
			end
			else
			begin
				rollback transaction
				return 0
			end
		end
		else
		begin
			rollback transaction
			return 0
		end
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*inserindo um novo aluguel:*/
/*CHAMA TRIGGER*/
create procedure novo_aluguel
@codigo int,
@dataInicio datetime,
@dataEntrega datetime,
@prazo datetime,
@statusAluguel bit,
@placaCarro char(10),
@idCliente int,
@idAtendente int,
@manutencao bit,
@seguro bit
as
begin transaction
insert into aluguel values(@codigo, @dataInicio, @dataEntrega, @prazo, (select valor from carro where placa = @placaCarro), 0, 0, @statusAluguel, @placaCarro, @idCliente, @idAtendente)
if @@rowcount > 0
begin
	update carro
	set  manutencao = @manutencao, seguro = @seguro, disponivel = 0
	where placa = @placaCarro AND manutencao = 0 AND seguro = 1
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*alterando aluguel:*/
/*CHAMA TRIGGER PARA CALCULAR O VALOR*/
create procedure alter_aluguel_pago
@codigo int,
@dataEntrega smalldatetime,
@placaCarro char(10),
@taxas smallmoney,
@km int,
@combustivel int
as
begin transaction
update aluguel 
set dataEntrega = @dataEntrega, taxas = @taxas where codigo = @codigo
if @@rowcount > 0
begin
	declare @dataDif int
	set @dataDif = DATEDIFF(day, (select dataInicio from aluguel where codigo = @codigo), (select dataEntrega from aluguel where codigo = @codigo))
	declare @dataDifPrazo int
	set @dataDifPrazo = DATEDIFF(day,(select dataInicio from aluguel where codigo = @codigo), (select prazo from aluguel where codigo = @codigo))
	update carro
	set disponivel = 1, km = km + @km, combustivel = @combustivel where placa = @placaCarro
	if @@rowcount > 0
	begin
		if @dataDif > @dataDifPrazo
		begin
			update aluguel
			set taxas = valor * (0.20*(@dataDif-@dataDifPrazo)) where codigo = @codigo
			if @@rowcount > 0
			begin
				commit transaction
				return 1
			end
			else
			begin
				rollback transaction
				return 0
			end
		end
		else
		begin
			update aluguel
			set taxas = 0 where codigo = @codigo
			if @@rowcount > 0
			begin
				commit transaction
				return 1
			end
			else
			begin
				rollback transaction
				return 0		
			end
		end
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*inserindo um novo reparo:*/
create procedure novo_reparo
@codigo int,
@dataInicio datetime,
@dataEntrega datetime,
@valor smallmoney,
@info char(30),
@placaCarro char(10),
@cnpj_mec char(14),
@cnpj_seg char(14),
@manutencao bit,
@seguro bit
as
begin transaction
insert into reparo values(@codigo, @dataInicio, @dataEntrega, @valor, @info, 1, @placaCarro, @cnpj_mec, @cnpj_seg)
if @@rowcount > 0
begin
	update carro
	set  manutencao = @manutencao, seguro = @seguro, disponivel = 0
	where placa = @placaCarro AND disponivel != 0 AND @manutencao = 1
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end

/*alterando um reparo:*/
create procedure alter_reparo
@codigo int,
@dataEntrega datetime,
@placaCarro char(10)
as
begin transaction
update reparo
set dataEntrega = @dataEntrega, statusReparo = 0 where codigo = @codigo
if @@rowcount > 0
begin
	update carro
	set  manutencao = 0, disponivel = 1
	where placa = @placaCarro AND disponivel = 0 
	if @@rowcount > 0
	begin
		commit transaction
		return 1
	end
	else
	begin
		rollback transaction
		return 0
	end
end
else
begin
	rollback transaction
	return 0
end
