--вычитаем налоги из зарплаты сотрудников
select staff_id , salary - (salary * 0.2) - (salary * 0.13) - (salary*0.08) 
from staff 

--получим пользователей, имена которых начинаютс€ на ¬
select last_name , first_name 
from customer
where first_name like 'B%'

--получим товар, который начинаетс€ на ƒ и заканчиваетс€ на 1
select product 
from product
where product like 'ƒ%1'

--заменим первую букву имени на ’ у пользователей с именами на ¬
select first_name , last_name , overlay(first_name placing 'X' from 1 for 1)
from customer
where first_name like 'B%'

--получить год из 15.02.2021
select date_part('year', '2021.02.15'::date) 

--получить число из 15.02.2021
select date_part('day', '2021.02.15'::date)

--получить мес€ц с учетом года из 15.02.2021
select date_trunc('month', '2021.02.15'::date)

--получить число из 15.02.2021
select date_trunc('day', '2021.02.15'::date)
