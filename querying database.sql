-- 1. Retrieve the names and contact details of all customers.
select CustomerName, phone
from customers;

 -- 2. List the products along with their corresponding suppliers' names.
 select p.productname, s.suppliername
 from products p
 join suppliers s
 on p.SupplierID=s.SupplierID;
 
-- 3. Find out which customers placed orders on 3rd of April, 2024.
select c.CustomerName
from customers c
join orders o
on c.CustomerID=o.CustomerID
where o.orderdate= '2024-04-03';

-- 4. Display the total quantity of each product sold.
select p.productname, sum(quantity) as total_quantity
from products p
join orderdetails od
on p.ProductID=od.ProductID
group by p.ProductName;

 -- 5. Display the order details, along with product names and customer name, for the customer identified by ID 2.
 select c.customername, p.productname, o.orderdate,od.*
 from customers c
 join orders o
 on c.CustomerID=o.CustomerID
 join orderdetails od
 on o.OrderID=od.OrderID
 join products p
 on od.ProductID=p.ProductID
 where c.CustomerID=2;
 
-- 6. Find the customers who have not placed any orders yet.
select CustomerName
from customers c
left join orders o
on c.Customerid=o.CustomerID
where OrderID is null;

-- 7. List the employees hired after July 1st, 2020.
select concat(firstname, ' ',lastname) as employee_name
from employees 
where hiredate>'2020-07-01';

 -- 8. Show the territories each employee is assigned to.
 select concat(firstname, ' ',lastname) as employee_name, territoryname
 from employees e
 join employeeterritories et
 on e.EmployeeID=et.EmployeeID
 join territories t
 on et.TerritoryID=t.TerritoryID;
 
 -- 9. Find out which products belong to a specific category.
 select p.productname, c.categoryname
 from products p
 join productcategories pc
 on p.productID=pc.ProductID
 join categories c
 on pc.CategoryID=c.CategoryID;
 
 -- 10. Display the total number of orders placed by each customer.
 select c.customerid, count(o.orderid) as total_orders
 from customers c
 join orders o
 on c.CustomerID=o.CustomerID
 group by CustomerID;
 
-- 11. List the orders along with the corresponding order details for the customer with ID 1.
select*
from orders o
join orderdetails od
on o.OrderID=od.OrderID
where customerid =1;

-- 12. Find the average quantity of products ordered in each order.
select orderID, avg(quantity)
from orderdetails
group by orderid;

 -- 13. Show the products that have not been ordered yet.
 select p.productName
 from products p
 left join orderdetails od
 on p.ProductID=od.ProductID
 where OrderID is null;
 
-- 14. Display the categories along with the number of products in each category.
select c.categoryName, count(p.productID) as product_count
from categories c
join productcategories pc
on c.CategoryID=pc.CategoryID
join products p
on pc.ProductID=p.ProductID
group by CategoryName;