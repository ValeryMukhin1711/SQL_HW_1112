use oe;

-- Вывести имя, фамилию покупателей и даты их заказов(order_date).

select cust_first_name, cust_last_name, order_date
from customers
join orders on customers.customer_id = orders.customer_id;

-- Вывести даты заказов продуктов и описание этих продуктов(product_description).

select order_date, product_description
from orders
join order_items on orders.order_id = order_items.order_id
join product_information on order_items.product_id = product_information.product_id;


-- Вывести имя, фамилию покупателей, даты заказов(orderdate), описание продуктов, 
-- которые они заказали и категории соответствующих продуктов (categoryname).

select cust_first_name, cust_last_name, order_date, product_description,
category_name
from
customers
join orders on customers.customer_id = orders.customer_id
join order_items on orders.order_id = order_items.order_id
join product_information on product_information.product_id = order_items.product_id
join categories_tab on product_information.category_id = categories_tab.category_id;



-- Вывести названия(productname), описания категорий(categorydescription)
-- и количества(quantity) тех продуктов,
-- у которых минимальная стоимость (min_price) больше 300.

select product_name, category_description, quantity
from product_information
join order_items on product_information.product_id = order_items.product_id
join categories_tab on categories_tab.category_id = product_information.category_id
where (product_information.min_price > 300);


-- Вывести имя, фамилию всех женатых мужчин покупателей,
-- которые купили продукты со стоимостью (list_price) больше 550.

select gender
from customers;

select cust_first_name, cust_last_name
from customers
left join orders on customers.customer_id = orders.customer_id
left join order_items on orders.order_id = order_items.order_id
left join product_information on product_information.product_id = order_items.product_id
where (customers.marital_status = 'married') and (gender = 'M');

-- Вывести те продукты(productname),
-- которых нет в заказанных (таблица orderitems).

select product_name
from product_information 
where product_id not in (
select product_id from order_items
);


