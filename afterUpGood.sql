USE [DB1]
GO
ALTER trigger [dbo].[afterGoodUp] on [dbo].[goods] after update,insert
as 
begin 
	declare @new_num int, @price int
	select @new_num=stock, @price=price from inserted
	if @new_num<0 or @price<=0
	begin
		rollback
	end
end