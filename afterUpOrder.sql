use DB1
go
create trigger afterOrdUp on orders after update 
as 
begin 
	declare @old_num int , @new_num int, @gid int, @book_num int
	select @old_num=book from deleted
	select @new_num=book from inserted
	select @gid=goodsId from inserted
	select @book_num=stock from goods where goodsId=@gid
	if @book_num-(@new_num-@old_num)>=0
	begin
		update goods set stock=stock-(@new_num-@old_num) where goodsId=@gid
	end
	else
	begin
		rollback
	end
end
--1.books 库存减少，如果所得结果小于0则回滚
--2.进货与发货
--3.重复点击不会造成库存连续变化