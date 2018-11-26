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
--1.books �����٣�������ý��С��0��ع�
--2.�����뷢��
--3.�ظ����������ɿ�������仯