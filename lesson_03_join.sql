--получим данные из каких городов какие заказы совершались
select o.order_id , c.city 
from orders o 
join delivery d on o.delivery_id = d.delivery_id 
join address a on a.address_id = d.address_id 
join city c on c.city_id = a.city_id 

--получим все возможные комбинации имен пользователей, так, чтобы имя А не было равно имени А
select c.first_name , c2.first_name 
from customer c 
cross join customer c2 
where c.first_name != c2.first_name 

--получим список заказов по которым отсутствует доставка
select o.order_id , d.delivery_id 
from orders o 
left join delivery d on d.delivery_id = o.delivery_id 
where d.delivery_id is null