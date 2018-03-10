

-- #1

select LastName, FirstName, HireDate, Country from nwEmployees
where HireDate <= '2013-07-04'
AND Country <> 'USA' order by LastName asc;

-- #2

select ProductName, UnitPrice, UnitsInStock from nwProducts
where UnitsInStock < ReorderLevel;

-- #3

SELECT ProductName, UnitPrice     FROM nwProducts
INNER JOIN (SELECT MAX(UnitPrice) AS MaxPrice
FROM nwProducts  GROUP BY UnitPrice) q ON UnitPrice = UnitPrice
AND UnitPrice = q.MaxPrice order by UnitPrice desc limit 1;

-- #4 
select ProductID, ProductName, UnitsInStock * UnitPrice as "Inventory Value" 
  from nwProducts 
    where UnitsInStock * UnitPrice > 2000 
  order by UnitsInStock * UnitPrice desc;

/*
mysql> select ProductID, ProductName, UnitsInStock * UnitPrice as "Inventory Value" 
  from nwProducts 
    where UnitsInStock * UnitPrice > 2000 
  order by UnitsInStock * UnitPrice desc;
+-----------+------------------------------+-----------------+
| ProductID | ProductName                  | Inventory Value |
+-----------+------------------------------+-----------------+
|        38 | Côte de Blaye                |         4479.50 |
|        59 | Raclette Courdavault         |         4345.00 |
|        12 | Queso Manchego La Pastora    |         3268.00 |
|        20 | Sir Rodney's Marmalade       |         3240.00 |
|        61 | Sirop d'érable               |         3220.50 |
|         6 | Grandma's Boysenberry Spread |         3000.00 |
|         9 | Mishi Kobe Niku              |         2813.00 |
|        55 | Pâté chinois                 |         2760.00 |
|        18 | Carnarvon Tigers             |         2625.00 |
|        40 | Boston Crab Meat             |         2263.20 |
|        22 | Gustaf's Knäckebröd          |         2184.00 |
|        27 | Schoggi Schokolade           |         2151.10 |
|        36 | Inlagd Sill                  |         2128.00 |
+-----------+------------------------------+-----------------+
13 rows in set (0.00 sec)
*/

-- #5

select ShipCountry,COUNT(*) as Orders from nwOrders
where ShipCountry <> 'USA' group by ShipCountry order by ShipCountry asc;

-- #6

select nwOrders.CustomerID, CompanyName, COUNT(nwOrders.CustomerID)
as Orders from nwCustomers, nwOrders
where nwOrders.CustomerID = nwCustomers.CustomerID
group by nwCustomers.CustomerID
having Orders > 20
order by Orders desc;

-- #7 : haven't programmed this one, it's throwing me off!

-- #8

select CompanyName, ProductName, UnitPrice
from nwSuppliers, nwProducts where Country = 'USA'
order by UnitPrice desc;

-- #9

select LastName, FirstName, Title, Extension, COUNT(nwOrders.EmployeeID)
as Orders from nwEmployees, nwOrders
where nwOrders.EmployeeID = nwEmployees.EmployeeID
group by nwEmployees.EmployeeID
having Orders > 100
order by LastName, FirstName asc;

-- This code functions but only finds what orders DO exist, not which don't.
-- select nwOrders.CustomerID, CompanyName, COUNT(nwOrders.CustomerID)
-- as Orders from nwCustomers, nwOrders
-- where nwOrders.CustomerID = nwCustomers.CustomerID
-- group by nwCustomers.CustomerID
-- having Orders = 0;

-- This code DOESN'T function
-- select nwOrders.CustomerID, CompanyName from nwCustomers, nwOrders
-- AND NOT EXISTS (
--   SELECT nwCustomers.CustomerID
--   FROM nwOrders
--   WHERE nwOrders.CustomerID = nwCustomers.CustomerID
-- );
