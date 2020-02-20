QUERY 2
#JOINING TABLES

#QUERY1
select l.sku, l.product_quantity, l.date, l.unit_price, p.name_en, p.price
from line_item l
join products p
on l.sku = p.sku;

#QUERY 2
select I.sku, I.product_quantity, I.date, I.unit_price,
p.name_en, p.price,
(p.price - I.unit_price) as price_dif
from line_item I
join products p
on I.sku = p.sku;

#QUERY 3
select p.manual_categories, sum(p.price - I.unit_price)
from line_item I
join products p
on I.sku = p.sku
group by p.manual_categories;

#QUERY 4
select p.brand, sum(p.price - I.unit_price)
from line_item I
join products p
on I.sku = p.sku
group by p.brand;

#QUERY 5 
select p.brand, truncate(avg(p.price - I.unit_price), 2) as avg_price_dif
from line_item I
join products p
on I.sku = p.sku
group by p.brand
having avg_price_dif > 50000;


select *
from products;
#QUERY 6
select l.sku, o.id_order, l.id_order
from line_item l
join orders o
on l.id_order = o.id_order;

#QUERY 7
select l.sku, o.id_order, l.id_order, p.brand, p.manual_categories
from line_item l
join orders o
on l.id_order = o.id_order
join products p
on l.sku = p.sku;

#QUERY 8 

select * from orders limit 10;

select l.sku, l.id_order, p.manual_categories, p.sku, o.id_order, p.brand, o.state
from line_item l
join products p
on l.sku = p.sku
join orders o
on l.id_order = o.id_order
where o.state = "Cancelled";