--1
--select max(Quantity), count(*)
--from tr_orderdetails;


--2
select distinct ProductID, Quantity
from tr_orderdetails
where Quantity = 3
order by ProductID asc,
Quantity desc



--3
select distinct
PropertyID
from tr_orderdetails;


-- 4 group by 
select ProductCategory, count(*) as COUNT
from tr_products
group by ProductCategory
order by 2 desc;

--5 
select
PropertyState
, count(*) as COUNT
from tr_propertyinfo
group by PropertyState
order by 2 desc;


--6
SELECT TOP 5 ProductID, SUM(CONVERT(int, Quantity)) AS Total_Quantity
FROM tr_orderdetails
GROUP BY ProductID
ORDER BY Total_Quantity DESC;

--7
select top 5 PropertyID, sum(convert(int,Quantity)) as Total_Quantity
from tr_orderdetails
group by PropertyID
order by 2 desc



--8

--Joins sql cases to get some details and other infos

select
o.*
, p.ProductName
, p.ProductCategory
, p.Price
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID;



--8.0

SELECT
    p.ProductName,
    SUM(CONVERT(int, o.Quantity)) AS Total_Quantity
FROM
    tr_orderdetails AS o
LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
GROUP BY
    p.ProductName
ORDER BY
    Total_Quantity DESC;

--8.1

select TOP 5
p.ProductName
, sum(convert(int,o.Quantity) * p.Price) as Sales 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by Sales desc


--9
SELECT TOP 5
    pi.PropertyCity,
    SUM(CONVERT(int, o.Quantity) * p.Price) AS Sales 
FROM
    tr_orderdetails AS o
LEFT JOIN
    tr_products AS p ON o.ProductID = p.ProductID
LEFT JOIN
    tr_propertyinfo AS pi ON o.PropertyID = pi."Prop ID"
GROUP BY
    pi.PropertyCity
ORDER BY
    Sales DESC;


-- 10

--10 , Arlington state using join function

select top 5
 pi.PropertyCity
, p.ProductName
, sum(convert(int,o.Quantity) * p.Price) as Sales 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi."Prop ID"
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, p.ProductName
order by Sales desc


