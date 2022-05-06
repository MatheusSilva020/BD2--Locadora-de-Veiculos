USE BD2_presentation

/*GATILHOS:*/

/*Gatilhos para aluguel:*/
/*insert - novo aluguel*/
create trigger new_aluguel
on aluguel for insert
as
begin
	update aluguel
	set statusAluguel = 1 where codigo = (select codigo from inserted)
	if @@rowcount = 0
		rollback transaction
	end
			
/*update - atualizar status aluguel e seu valor final*/
create trigger alteration_aluguel
on aluguel for update
as
begin
	update aluguel
	set statusAluguel = 0, valorFinal = (valor + taxas) where codigo = (select codigo from inserted)
	if @@rowcount = 0
		rollback transaction
	end

/*Gatilhos para reparo:*/
/*insert - novo reparo*/
create trigger new_reparo
on reparo for insert
as
begin
	update reparo
	set statusReparo = 1 where codigo = (select codigo from inserted)
	if @@rowcount = 0
		rollback transaction
	end
		
/*update - atualizar status reparo*/
create trigger alteration_reparo
on reparo for update
as
begin
	update reparo
	set statusReparo = 0 where codigo = (select codigo from inserted)
	if @@rowcount = 0
		rollback transaction
	end