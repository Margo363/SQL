-- создадим таблицу по доставке товара

create table delivery(
	delivery_id serial primary key,
	address_id int references address(address_id) not null,
	delivery_date date not null,
	time_range text[]not null,
	staff_id int references staff(staff_id) not null,
	status del_status not null default 'в обработке',
	list_update timestamp,
	create_date timestamp default now(),
	deleted boolean not null default false
)	
select * from delivery

--добавим в таблицу с заказами ограничение внешнего ключа для столбца с 
доставкой

alter table orders add constraint orders_delivery_fkey foreign key (delivery_id)
	references delivery(delivery_id)
	
--удаление внешнего ключа

ALTER TABLE orders 
DROP CONSTRAINT orders_delivery_newkey;

--изменим данные в заказах, добавив данные по идентификатору доставки

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

--попробуем удалить запись из доставки

delete from delivery 
where delivery_id = 1

