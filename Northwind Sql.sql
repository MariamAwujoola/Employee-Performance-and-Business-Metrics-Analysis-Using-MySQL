-- 1) WHAT IS THE NAME OF THE COMPANY THAT SUPPLIED THE PRODUCT WITH PRODUCTID 1--
SELECT P.ProductID, S.CompanyName
FROM Products P
JOIN Suppliers S
ON P.SupplierID = S.SupplierID
WHERE P.ProductID = 1;

-- 2) WHAT IS THE NAME OF THE EMPLOYEE WHO MADE THE SALE WITH ORDERID 10248--

SELECT O.OrderId, E.Lastname, E.FirstName
FROM Orders O
JOIN Employees E
ON E.EmployeeID = O.EmployeeID
Where orderId= '10248';

-- 3) HOW MANY PRODUCTS DOES THE CATEGORY WITH CATEGORYID 1 HAVE--

SELECT C.CategoryID,COUNT(C.CategoryID) AS PRODUCT_COUNT
FROM categories C
JOIN Products P ON 
C.CategoryID = P.CategoryID
Where P.CategoryID = 1 ;

-- 4) WHAT IS THE TOTAL PRICE OF THE PRODUCTS ORDERED IN ORDERID 10248

SELECT ORDERID, SUM(Unitprice) AS Total_Price
FROM  `ORDER DETAILS`
WHERE ORDERID = 10248
GROUP BY OrderID;

-- 5) WHAT IS THE NAME OF THE CUSTOMER WITH CUSTOMERID ALFKI--
SELECT CustomerID, CompanyName
FROM customers
WHERE TRIM(CustomerID) = TRIM('ALFKI'); 

-- 6) WHAT IS THE TOTAL NUMBER OF ORDERS PLACED BY THE CUSTOMER WITH CUSTOMERID ALFKI--
SELECT C.CustomerID, COUNT(O.orderid)  AS Total_orders
FROM Customers C 
JOIN ORDERS O 
ON C.CustomerID = O.CustomerID
WHERE C.customerid = 'ALFKI';

-- 7) WHAT IS THE NAME OF THE SUPPLIER THAT SUPPLIED THE PRODUCT WITH PRODUCTID 1 --

SELECT S.contactname AS Supplier_Name, P.ProductId
FROM SUPPLIERS S
JOIN Products P
ON S.supplierid = P.supplierid
WHERE PRODUCTID = 1
GROUP BY Productid;

-- 8) WHAT IS THE NAME OF THE EMPLOYEE WITH EMPLOYEE ID 5--
SELECT * FROM Employees;
SELECT EmployeeId, Firstname, LastName
FROM Employees
WHERE EmployeeID= 5;

-- 9) WHAT IS THE TOTAL NUMBER OF CUSTOMERS IN THE CUSTOMERS TABLE --
SELECT COUNT(CUSTOMERID) AS Total_Customers 
FROM CUSTOMERS;

-- 10) WHAT IS THE TOTAL NUMBERS OF EMPLOYEE IN THE EMPLOYEEES TABLE--
SELECT * FROM EMPLOYEES;
SELECT COUNT(EMPLOYEEID) AS TOTAL_EMPLOYEES FROM EMPLOYEES;

-- 11) WHAT IS THE TOTAL NUMBER OF ORDERS IN THE ORDERS TABLE--
SELECT * FROM ORDERS;
SELECT COUNT(orderid) AS Total_Orders FROM ORDERS;

-- 12) WHAT IS THE TOTAL NUMBER OF PRODUCT IN THE PRODUCTS TABLE --
SELECT * FROM PRODUCTS;
SELECT COUNT(productid) FROM PRODUCTS;

-- 13) WHAT IS THE TOTAL NUMBERS OF CATEGORIES IN THE CATEGORIES TABLE --
SELECT * FROM CATEGORIES;
SELECT COUNT(CATEGORYID) As Total_Categories FROM CATEGORIES;

-- 14) WHAT IS THE TOTAL NUMBERS OF SUPPLIERS IN THE SUPPLIERS TABLE --
SELECT * FROM SUPPLIERS;
SELECT COUNT(SUPPLIERID) As Total_Suppliers FROM SUPPLIERS;

-- 15) WHAT IS THE TOTAL NUMBER OF SHIPPERS IN THE SHIPPERS TABLE --
SELECT * FROM SHIPPERS;
SELECT COUNT(SHIPPERID) AS Total_Shippers FROM SHIPPERS;

-- 16) WHAT IS THE TOTAL NUMBER OF TERRITORIES IN THE TERRITORY TABLE--
SELECT * FROM TERRITORIES;
SELECT COUNT(Territoryid) AS Total_Territories FROM territories;

-- 17) WHAT IS THE TOTAL NUMBER OF REGIONS IN THE REGIONS TABLE --
select * FROM REGION;
SELECT COUNT(REGIONID) AS Total_Region FROM REGION;

-- 18) WHAT IS THE NAME OF THE SHIPPER WITH SHIPPERID 2 --
SELECT * FROM SHIPPERS;
SELECT Shipperid, CompanyName
FROM SHIPPERS 
WHERE SHIPPERID = 2;

-- 19) WHAT IS THE PHONE NUMBER OF THE CUSTOMER WITH CUSTOMERID ANATR--
SELECT CUSTOMERID, PHONE
FROM CUSTOMERS
WHERE CUSTOMERID = 'ANATR';

-- 20) WHAT IS THE CITY OF THE CUSTOMER WITH CUSTOMERID ANATR--
SELECT Customerid, City
FROM Customers
WHERE Customerid = 'ANATR';

-- 21) WHAT IS THE POSTAL CODE OF THE CUSTOMER WITH CUSTOMERID ANATR--
SELECT Customerid, PostalCode
FROM Customers
WHERE Customerid = 'ANATR';

-- 22) WHAT IS THE NAME OF THE CONTACT PERSON FOR THE CUSTOMER WITH CUSTOMERID ANATR--
SELECT Customerid, ContactName
FROM Customers
WHERE Customerid = 'ANATR';

-- 23)  WHAT IS THE NAME OF THE PRODUCT WITH PRODUCTID 1 --
SELECT Productid, ProductName
FROM products
WHERE Productid = 1;

-- 24) WHAT IS THE UNIT PRICE OF THE PRODUCT WITH PRODUCTID 1--
SELECT Productid, Unitprice
FROM products
WHERE Productid = 1;

-- 25) WHAT IS THE QUANTITY OF THE PRODUCT WITH PRODUCTID 1 IN STOCK --
SELECT Productid, Quantityperunit
FROM products
WHERE Productid = 1;


-- 26) WHAT IS THE NAME OF THE CATEGORY WITH CATEGORYID 1 -- 
SELECT CategoryID, CategoryName
FROM CATEGORIES
WHERE CATEGORYID = 1 AND CATEGORYID IS NOT NULL;

-- 27) WHAT IS THE NAME OF THE SUPPLIER WITH SUPPLIERID 1--
SELECT * FROM SUPPLIERS;
SELECT Supplierid, CompanyName
FROM Suppliers
WHERE Supplierid = 1;

-- 28) WHAT IS THE NAME OF THE SHIPPER WITH SHIPPERID 1 --
SELECT Shipperid, CompanyName
FROM Shippers
WHERE Shipperid = 1;

-- 29) WHAT IS THE NAME OF THE REGION WITH REGIONID 1 --
SELECT RegionId, Regiondescription AS Region_Name
From Region 
WHERE Regionid = 1;

-- 30) WHAT IS THE NAME OF THE TERRITORY WITH TERRITORYID 1 --
SELECT * From territories;
SELECT Territoryid, Territorydescription AS Territory_Name
FROM territories;

-- 31) WHAT IS THE TOTAL REVENUE EARNED BY THE COMPANY IN THE YEAR 1997--

SELECT SUM(`order details`.Unitprice * `Order details`.Quantity) AS Total_Revenue_1997
FROM `order details`
JOIN Orders ON Orders.orderid = `order details`.orderid
WHERE Orders.orderdate BETWEEN '1997-01-01' AND '1997-12-31';


-- 32)  WHAT ARE THE NAMES OF ALL THE PRODUCTS THAT HAVE BEEN DISCONTINUED--
SELECT * FROM PRODUCTS;
SELECT ProductName, Discontinued
FROM products
WHERE Discontinued = 1;

-- 33) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED--

SELECT Products.productid, Products.productName, SUM(`Order details`.Quantity) AS Total_Quantity_Ordered
FROM products
JOIN `Order Details` ON 
Products.Productid = `Order Details`.Productid
GROUP BY Products.productid
ORDER BY Total_Quantity_Ordered;

-- 34) WHICH CUSTOMER HAS PLACED THE MOST NUMBER OF ORDERS--

SELECT Orders.customerid, SUM(`Order details`.Quantity) AS Total_Quantity_Ordered_ByCustomers
FROM orders
JOIN `Order Details` ON 
Orders.orderid = `Order Details`.Orderid
GROUP BY Orders.Customerid
HAVING Total_Quantity_Ordered_ByCustomers >= 4958
ORDER BY Total_Quantity_Ordered_ByCustomers;

-- 35) WHAT IS THE TOTAL AMOUNT SPENT BY EACH CUSTOMER IN THE YEAR 1998--

SELECT Orders.customerid, SUM(`Order details`.UnitPrice * `Order Details`.Quantity) AS Total_Amount_Spent
FROM orders
JOIN `Order Details` ON 
Orders.Orderid = `Order Details`.Orderid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY Customerid;

-- 36) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN FRANCE --
SELECT DISTINCT Orders.ShipCountry, Employees.EmployeeId, Employees.FirstName, Employees.LastName
FROM orders
JOIN Employees ON 
Orders.Employeeid = Employees.Employeeid
WHERE Shipcountry = 'France';


-- 37) WHAT IS THE AVERAGE NUMBER OF DAYS IT TAKES FOR AN ORDER TO BE SHIPPED AFTER IT IS PLACED --
SELECT * FROM ORDERS;
SELECT AVG(DATEDIFF(Shippeddate, Orderdate)) AS AverageShippingDays
FROM orders;


-- 38) WHAT ARE THE NAMES OF ALL CUSTOMERS WHO HAVE NOT PLACED ANY ORDERS--

SELECT Customers.CompanyName
From Customers
LEFT JOIN Orders
ON Customers.customerid = Orders.Customerid
Where Orders.orderid is NULL;


-- 39) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCTS THAT HAS BEEN ORDERED BY CUSTOMERS IN GERMANY--

SELECT Orders.Customerid, sum(`ORDER DETAILS`.Quantity) AS Total_Quantity, Shipcountry
FROM `Order Details`
JOIN Orders ON
`Order details`.orderid = Orders.orderid
WHERE Shipcountry = 'Germany'
GROUP BY Customerid;

-- 40) WHAT IS THE AVERAGE PRICE OF ALL PRODUCTS IN THE DATABASE--
SELECT * FROM PRODUCTS;
SELECT AVG(UnitPrice) AS Average_Price
FROM Products;


-- 41) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN GERMANY--

SELECT DISTINCT Employees.FirstName, Employees.LastName, Shipcountry
FROM Employees
JOIN Orders ON 
Employees.Employeeid = Orders.Employeeid
WHERE ShipCountry = 'Germany';


-- 42) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1998--

SELECT SUM(`Order details`.Quantity) AS Total_Quantity
FROM `Order Details`
JOIN Orders ON 
`Order details`.orderid = Orders.Orderid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31';

-- 43) WHAT IS THE TOTAL REVENUE EARNED BY EACH CATEGORY OF PRODUCTS--

SELECT SUM(`Order details`.UnitPrice * Quantity) AS Total_Revenue,Categoryid
FROM products
JOIN `Order Details` ON 
Products.productid = `Order details`.productid
GROUP BY Categoryid;

-- 44) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1997--

SELECT SUM(`Order details`.Quantity) AS Total_Quantity
FROM `Order Details`
JOIN Orders ON 
`Order details`.orderid = Orders.Orderid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31';


-- 45) WHAT IS THE AVERAGE QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED --
SELECT * FROM `Order details`;
SELECT AVG(Quantity), Productid 
FROM `Order details`
GROUP BY Productid;

-- 46) WHAT ARE THE NAMES OF ALL CUSTOMERS WHO HAVE PLACED ORDERS IN THE YEAR 1997--
SELECT DISTINCT CompanyName, Orders.Customerid
FROM orders
JOIN Customers ON 
orders.customerid = Customers.customerid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31';

-- 47) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE USA 
SELECT * FROM `ORDER DETAILS`;
SELECT SUM(`Order details`.Quantity) AS Total_Quantity, Products.productName AS Product_Name
FROM `Order details`
JOIN Products ON 
`order details`.productid = Products.productid
JOIN Orders ON 
`Order details`.Orderid = Orders.Orderid
WHERE Orders.Shipcountry = 'USA'
GROUP BY Product_Name;


-- 48) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN THE YEAR 1997

SELECT DISTINCT E.FirstName,E.LastName
FROM Employees E
JOIN Orders ON 
E.Employeeid = Orders.Employeeid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31';

-- 49) WHAT IS THE TOTAL REVENUE EARNED BY EACH EMPLOYEE
SELECT E.FirstName, E.LastName, SUM(UNITPRICE* QUANTITY) AS Total_Revenue
FROM Employees E
JOIN Orders O ON  
E.Employeeid = O.Employeeid 
JOIN `Order details` ON 
O.orderid = `Order details`.Orderid 
GROUP BY E.FirstName, E.LastName;

-- 50) WHAT ARE THE NAMES OF ALL THE PRODUCTS THAT HAVE BEEN ORDERED BY CUSTOMERS IN THE YEAR 1997
SELECT DISTINCT ProductName
FROM products
JOIN `Order details` O ON 
Products.productid = O.productid
JOIN Orders ON 
O.orderid = Orders.orderid
WHERE Orderdate >= '1997-01-01' AND orderdate <= '1997-12-31';

-- 51)  WHAT IS THE TOTAL REVENUE EARNED BY THE COMPANY IN THE YEAR 1998--
SELECT SUM(O.Quantity * O.unitprice) AS Total_Revenue
FROM `Order details` O 
JOIN Orders R ON 
O.orderid = R.Orderid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31';


-- 52) WHAT IS THE AVERAGE QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1998--
SELECT AVG(Quantity) AS Average_Quantity, ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY ProductName;

-- 53) WHAT IS THE TOTAL AMOUNT SPENT BY EACH CUSTOMER IN THE YEAR 1997--
SELECT CompanyName, SUM(O.Unitprice * o.Quantity * (1-O.Discount))  AS Total_Spent 
From Customers C 
JOIN Orders R ON 
C.customerid = R.Customerid
JOIN `Order Details` O ON 
R.Orderid = O.Orderid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY CompanyName;


-- 54) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN THE YEAR 1998
SELECT DISTINCT E.FirstName, E.LastName
FROM Employees E 
JOIN Orders R ON 
E.employeeid = R.Employeeid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31';

-- 55) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1996
SELECT Products.productid,SUM(`Order details`.Quantity) AS Total_Quantity, Products.productName AS Product_Name
FROM `Order details`
JOIN Products ON 
`order details`.productid = Products.productid
JOIN Orders ON 
`Order details`.Orderid = Orders.Orderid
WHERE Orderdate BETWEEN '1996-01-01' AND '1996-12-31'
GROUP BY Product_Name,Products.productid
ORDER BY Total_Quantity DESC;

-- 56)  WHAT IS THE TOTAL REVENUE EARNED BY EACH SUPPLIER 
SELECT S.Supplierid, S.CompanyName, SUM(OD.UnitPrice* OD.Quantity) AS Total_Revenue 
FROM `Order Details` OD
JOIN Products P
ON OD.Productid = P.Productid
JOIN Suppliers S ON 
P.Supplierid = S.Supplierid
GROUP BY S.CompanyName, S.Supplierid
ORDER BY S.CompanyName ASC;

--  57) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1998--
SELECT SUM(O.Quantity) AS Total_Quantity, P.ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY P.ProductName;

-- 58) WHAT ARE THE NAMES OF ALL THE CUSTOMERS WHO HAVE PLACED ORDERS IN THE YEAR 1998
SELECT DISTINCT C.CompanyName, C.Customerid
FROM Customers C 
JOIN Orders R ON 
C.customerid = R.customerid
JOIN `Order Details` O ON 
R.orderid = O.orderid 
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY C.Customerid;

-- 59) WHAT IS THE AVERAGE PRICE OF ALL THE PRODUCTS IN EACH CATEGORY
SELECT Categoryid, P.ProductName, AVG(P.UnitPrice) AS Average_Price
FROM products P
GROUP BY Categoryid, P.productName;


-- 60) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1999
SELECT SUM(O.Quantity) AS Total_Quantity, P.ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1999-01-01' AND '1999-12-31'
GROUP BY P.ProductName;

-- 61) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN THE USA 
SELECT  DISTINCT E.FirstName, E.LastName
FROM Employees E
JOIN Orders R 
ON E.Employeeid = R.Employeeid
WHERE Shipcountry = 'USA';

-- 62) WHAT IS THE TOTAL REVENUE EARNED BY EACH CUSTOMER IN THE YEAR 1998
SELECT C.customerid, C.CompanyName, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Customers C
JOIN Orders O 
ON C.customerid = O.customerid
JOIN `Order details` OD 
ON O.orderid = OD.Orderid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY C.customerid, C.companyName;

-- 63) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCTS THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1994
SELECT P.Productid, SUM(O.Quantity) AS Total_Quantity, P.ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1994-01-01' AND '1994-12-31'
GROUP BY P.ProductName, P.Productid;

-- 64)  WHAT ARE THE NAMES OF ALL THE PRODUCTS THAT HAVE BEEN ORDERED BY CUSTOMERS IN THE USA 
SELECT ProductName
FROM products P
JOIN `Order details` OD 
ON P.Productid = OD.productid
JOIN Orders O 
ON OD.orderid = O.orderid
WHERE Shipcountry = 'USA';

-- 65)  WHAT IS THE AVERAGE NUMBER OF DAYS IT TAKES FOR AN ORDER TO BE SHIPPED AFTER IT IS PLACED, FOR EACH CUSTOMER
SELECT AVG(DATEDIFF(Shippeddate, Orderdate)) AS Average_Days
FROM Orders;

-- 66) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCTS THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1993
SELECT P.Productid, SUM(O.Quantity) AS Total_Quantity, P.ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1993-01-01' AND '1993-12-31'
GROUP BY P.ProductName, P.Productid;

-- 67) WHAT IS THE TOTAL REVENUE EARNED BY EACH EMPLOYEE IN THE YEAR 1997
SELECT  E.FirstName, E.LastName, E.Employeeid, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Employees E
JOIN Orders R 
ON E.Employeeid = R.Employeeid
JOIN `Order details` OD
ON R.orderid = OD.Orderid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY E.Employeeid;

-- 68) WHAT IS THE TOTAL REVENUE EARNED BY EACH CUSTOMER IN THE YEAR 1996
SELECT C.customerid, C.CompanyName, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Customers C
JOIN Orders O 
ON C.customerid = O.customerid
JOIN `Order details` OD 
ON O.orderid = OD.Orderid
WHERE Orderdate BETWEEN '1996-01-01' AND '1996-12-31'
GROUP BY C.customerid, C.companyName;

-- 69) WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN THE YEAR 1996
SELECT  DISTINCT E.FirstName, E.LastName
FROM Employees E
JOIN Orders R 
ON E.Employeeid = R.Employeeid
WHERE Orderdate BETWEEN '1996-01-01' AND '1996-12-31';


-- 70) WHAT IS THE TOTAL REVENUE EARNED BY EACH CATEGORY OF PRODUCTS IN THE YEAR 1998
SELECT P.Categoryid, P.ProductName, P.Productid, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Products P 
JOIN `Order details` OD 
ON P.productid = OD.Productid
JOIN Orders O 
ON OD.orderid = O.orderid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY P.Categoryid, P.productid
ORDER BY P.Categoryid ASC;

-- 71) WHAT ARE THE NAMES OF ALL CUSTOMERS WHO HAVE PLACED ORDER IN THE 1996
SELECT DISTINCT C.CompanyName, C.Customerid
FROM Customers C 
JOIN Orders R ON 
C.customerid = R.customerid
JOIN `Order Details` O ON 
R.orderid = O.orderid 
WHERE Orderdate BETWEEN '1996-01-01' AND '1996-12-31'
GROUP BY C.Customerid
ORDER BY CompanyName ASC;

-- 72) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1998 AND HAS NOT BEEN DISCONTINUED
SELECT P.Productid, SUM(O.Quantity) AS Total_Quantity, P.ProductName, p.Discontinued AS Not_discontinued
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
AND DISCONTINUED <= 0
GROUP BY P.ProductName, P.Productid;


-- 73) WHAT IS THE TOTAL REVENUE EARNED BY EACH SUPPLIER IN THE YEAR 1997
SELECT S.Supplierid, S.CompanyName, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Suppliers S
JOIN Products P ON 
S.supplierid = P.Supplierid
JOIN `Order details` OD ON 
P.productid = OD.Productid
JOIN Orders O ON 
OD.orderid = O.orderid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31'
GROUP BY S.Supplierid, S.CompanyName;


-- 74)  WHAT ARE THE NAMES OF ALL CUSTOMERS WHO HAVE PLACED ORDERS IN THE YEAR 1999
SELECT DISTINCT C.CompanyName, C.Customerid
FROM Customers C 
JOIN Orders R ON 
C.customerid = R.customerid
JOIN `Order Details` O ON 
R.orderid = O.orderid 
WHERE Orderdate BETWEEN '1999-01-01' AND '1999-12-31'
GROUP BY C.Customerid
ORDER BY CompanyName ASC;


-- 75) WHAT IS THE AVERAGE PRICE OF ALL THE PRODUCTS THAT HAVE BEEN ORDERED BY CUSTOMERS IN THE YEAR 1998
SELECT P.Productid, AVG(O.Unitprice) AS Average_Price, ProductName
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY ProductName, P.Productid
ORDER BY P.productid ASC;


-- 76) WHAT IS THE TOTAL QUANTITY OF EACH PRODUCT THAT HAS BEEN ORDERED BY CUSTOMERS IN THE YEAR 1997 AND HAS NOT BEEN DISCONTINUED
SELECT P.Productid, SUM(O.Quantity) AS Total_Quantity, P.ProductName, p.Discontinued AS Not_discontinued
FROM `Order Details` O 
JOIN Orders R ON 
O.orderid = R.Orderid 
JOIN Products P ON 
O.productid = P.productid
WHERE Orderdate BETWEEN '1997-01-01' AND '1997-12-31'
AND DISCONTINUED <= 0
GROUP BY P.ProductName, P.Productid;


-- 77)  WHAT ARE THE NAMES OF ALL THE EMPLOYEES WHO HAVE SOLD PRODUCTS TO CUSTOMERS IN THE YEAR 1995 
SELECT  DISTINCT E.FirstName, E.LastName
FROM Employees E
JOIN Orders R 
ON E.Employeeid = R.Employeeid
WHERE Orderdate BETWEEN '1995-01-01' AND '1995-12-31';


-- 78) WHAT IS THE TOTAL REVENUE EARNED BY EACH CUSTOMERS IN THE YEAR 1995
SELECT C.customerid, C.CompanyName, SUM(OD.Unitprice * OD.Quantity) AS Total_Revenue
FROM Customers C
JOIN Orders O 
ON C.customerid = O.customerid
JOIN `Order details` OD 
ON O.orderid = OD.Orderid
WHERE Orderdate BETWEEN '1995-01-01' AND '1995-12-31'
GROUP BY C.customerid, C.companyName;





