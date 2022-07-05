--�������� ������� �� �������� ������
create table delivery(
	delivery_id serial primary key,
	address_id int references address(address_id) not null,
	delivery_date date not null,
	time_range text[]not null,
	staff_id int references staff(staff_id) not null,
	status del_status not null default '� ���������',
	list_update timestamp,
	create_date timestamp default now(),
	deleted boolean not null default false
)	
select * from delivery

--������� � ������� � �������� ����������� �������� ����� ��� ������� �
alter table orders add constraint orders_delivery_fkey foreign key (delivery_id)
	references delivery(delivery_id)
	
--�������� �������� �����
ALTER TABLE orders 
DROP CONSTRAINT orders_delivery_newkey;

--������� ������ � �������, ������� ������ �� �������������� ��������
insert into delivery (address_id, delivery_date, time_range,staff_id)
values (329, '2022.10.25', array['10:00:00''17:30:00'], 3),
(9, '2022.09.25', array['10:00:00''17:30:00'], 1),
(49, '2022.05.25', array['10:00:00''17:30:00'], 2),
(36, '2022.07.25', array['10:00:00''17:30:00'], 1),
(190, '2022.12.25', array['10:00:00''17:30:00'], 3)

update orders 
set delivery_id = 1
where order_id = 1

update orders 
set delivery_id = 2
where order_id = 2

update orders 
set delivery_id = 3
where order_id = 3

update orders 
set delivery_id = 4
where order_id = 4

update orders 
set delivery_id = 5
where order_id = 5

select * from orders

--��������� ������� ������ �� ��������
delete from delivery 
where delivery_id = 1

--����� ���������� �������� ���� ���������?
select count(*) from orders o  

--����� ���������� ������� ��������� � ��������� ��������?
select c.category, count(*)
from product p 
join category c on c.category_id = p.category_id 
group by c.category_id 
order by 2 desc


--� ����� ��������� ��������� ������ ����� �������?
select c.category, count(*)
from product p 
join category c on c.category_id = p.category_id 
group by c.category_id 
having count(*) = 
	(select max(count)
	from (
	select category_id, count(*)
	from product
	group by category_id) t)


--������� ��������� ������ Williams Linda?
select sum(opl.amount)
from customer c 
join orders o on o.customer_id = c.customer_id 
join order_product_list opl on opl.order_id = o.order_id 
join product p on opl.product_id = p.product_id 
where concat(c.last_name, ' ', c.first_name) - 'Williams Linda' and p.product - '��������'

select * from order_product_list

select * from orders


