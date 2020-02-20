
#1
select sku, unit_price, date
from line_item
limit 10; 

#1.1
select count(*)
from line_item;

#2
select count(sku)
from line_item;

#3
select (sku), avg(unit_price)
from line_item
group by sku;

#3.1
select (sku), avg(unit_price)
from line_item
group by sku 
order by avg(unit_price) desc;

#4
select sku, product_quantity
from line_item
order by product_quantity DESC
limit 100;

#5 
select count(*) 
from orders;

#6
select state, count(state)
from orders
group by state;

#7
select created_date, id_order, state, total_paid
from orders
where created_date between '2017-01-01 00:00:00' and '2017-02-01- 00:00:00';

#8
select count(*)
from orders
where created_date between '2017-01-01 00:00:00' and '2017-02-01- 00:00:00';

#9
select count(state), state
from orders
where created_date between '2017-01-04 00:00:00' and '2017-01-05 00:00:00' 
group by state;

#10 
select month(created_date), count(*)
from orders
group by month(created_date);

#11
select sum(total_paid)
from orders;

#12 
select truncate(avg(total_paid), 2)
from orders;


#13 
select max(created_date), min(created_date)
from orders;

#14 day with highest amount of completed orders
select date(created_date), 
count(id_order)
from orders
group by date(created_date) 
order by count(id_order) desc;

#15 day with the highest amount paid 
select date(created_date), 
sum(total_paid)
from orders
group by date(created_date) 
order by sum(total_paid) desc;

select date(created_date),
max(total_paid)
from orders
group by date(created_date)
order by max(total_paid) desc;

#16 how many products
select count(*)
from products;


#17 how many brands 
select count(distinct(brand))
from products;

#18 how many categories 
select count(distinct(manual_categories))
from products;

#19 how many products per brand & per category
select manual_categories, count(manual_categories), brand, count(brand)
from products
group by manual_categories, brand;

#20 what's the average price per brand & average price per category
select avg(price), brand
from products
group by brand;

select truncate(avg(price), 2), manual_categories
from products
group by manual_categories;


#21 name and description of the most expensive product per brand and per category ???
select max(price), brand, 
from products
group by brand;

select max(categ), brand
from products
group by brand;


