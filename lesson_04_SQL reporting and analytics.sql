--��������� ��������� ������� � ������� ��������� ���� �������
select opl.product_id , sum(o.amount)
from orders o
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id = opl.product_id 
group by opl.product_id 

select product_id , price
from product p 

select t.product_id , sum / price 
from (select opl.product_id , sum(o.amount) 
from orders o
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id) t 
join (select product_id , price
from product p ) t2 on t2.product_id = t.product_id 

select t.product_id , sum / (select price from product p where p.product_id = t.product_id )
from (select opl.product_id , sum(o.amount) 
from orders o
join order_product_list opl on o.order_id = opl.order_id 
group by opl.product_id) t 

--��������� ��������� ������� � ������� ��������� ���� �������
select distinct opl.product_id , sum(o.amount) over (partition by p.product_id) / price 
from orders o 
join order_product_list opl on o.order_id = opl.order_id 
join product p on p.product_id = opl.product_id 

--������� ������ � ������ 1000 ������
select *
from (
select order_id , customer_id , amount ,
	row_number () over (order by order_id)
from orders) t
where t.row_number % 1000 = 0


--������� ������������� ����� �������� �� ������� ������������
select order_id , customer_id , amount ,
	sum(amount) over (partition by customer_id order by order_id)
from orders	

select order_id , customer_id , amount ,
	avg(amount) over (partition by customer_id order by order_id)
from orders	

-- ����� ��������� �������� ������ �� ���������� ������ ������������
create view task_1 as
select *
from (
select order_id , customer_id , amount ,
	row_number () over (partition by customer_id order by order_id desc)
from orders) t
where row_number = 1

select * from task_1 

--����� ��������� �������� ������ �� ���������� ������ ������������ � ����������������� ��������������
create materialized view task_2 as
select *
from (
select order_id , customer_id , amount ,
	row_number () over (partition by customer_id order by order_id desc)
from orders) t
where row_number = 1
with no data

select * from task_2 

--������� ������ � ����������������� �������������
refresh materialized view task_2 

--������ ����������������� �������������
drop materialized view task_2 

