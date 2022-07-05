--отношение стоимости товаров к единице стоимости этих товаров
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

--отношение стоимости товаров к единице стоимости этих товаров
select distinct opl.product_id , sum(o.amount) over (partition by p.product_id) / price 
from orders o 
join order_product_list opl on o.order_id = opl.order_id 
join product p on p.product_id = opl.product_id 

--получим данные о каждом 1000 заказе
select *
from (
select order_id , customer_id , amount ,
	row_number () over (order by order_id)
from orders) t
where t.row_number % 1000 = 0


--получим накопительную сумму платежей по каждому пользователю
select order_id , customer_id , amount ,
	sum(amount) over (partition by customer_id order by order_id)
from orders	

select order_id , customer_id , amount ,
	avg(amount) over (partition by customer_id order by order_id)
from orders	


