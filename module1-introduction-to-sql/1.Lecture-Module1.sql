/*1. Retrieve all columns in the Region table*/
SELECT * FROM Regions
/*2. Select the FirstName and LastName columns from the Employees table*/
SELECT FirstName, LastName
FROM Employees
/*3. Select the FirstName and LastName columns from the Employees table. Sort by LastName.*/
SELECT FirstName, LastName
FROM Employees
ORDER BY LastName
/*4. Create a report showing Northwind's orders sorted by Freight from most expensive tocheapest. Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight.*/
SELECT OrderID, OrderDate, ShippedDate, CustomerID, Freight
FROM Orders
ORDER BY Freight DESC
/*5. Create a report showing the title and the first and last name of all sales representatives.*/
SELECT Title, FirstName, LastName
FROM Employees
WHERE Title = "Sales Representative"
/*6. Create a report showing the first and last names of all employees who have a region specified.*/
SELECT FirstName, LastName
FROM Employees
WHERE Region IS NOT NULL
/*7. Create a report showing the first and last name of all employees whose last names start with a letter in the last half of the alphabet.
*Sort by LastName in descending order.*/
SELECT FirstName, LastName
FROM Employees
WHERE LastName >= 'M'
ORDER BY LastName DESC
/* 8. Create a report showing the title of courtesy and the first and
last name of all employees whose title of courtesy is "Mrs." or "Ms.".
*/
SELECT TitleOfCourtesy, FirstName, LastName
FROM Employees
WHERE TitleOfCourtesy LIKE 'M%'

SELECT TitleOfCourtesy, FirstName, LastName
FROM Employees
WHERE TitleOfCourtesy = 'Ms.' OR TitleOfCourtesy = 'Mrs.' OR TitleOfCourtesy = 'Mr.'

SELECT TitleOfCourtesy, FirstName, LastName
FROM Employees
WHERE TitleOfCourtesy IN ('Ms.','Mrs.', 'Mr.')
/*9. Create a report showing the first and last name of all sales representatives who are from Seattle or Redmond.*/
SELECT FirstName, LastName, City
FROM Employees
WHERE Title = 'Sales Representative' AND City IN ('Seattle' , 'Redmond')
/*10. Create a report that shows the company name, contact title, city and country of all
 * customers in Mexico or in any city in Spain except Madrid.*/
SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country = 'Mexico' OR (Country = 'Spain' AND City <> 'Madrid')

SELECT CompanyName, ContactTitle, City, Country
FROM Customers
WHERE Country IN ('Mexico', 'Spain') AND City <> 'Madrid'
/* 11. If the cost of freight is greater than or equal to $500.00,
it will now be taxed by 10%. Create a report that shows the
order id, freight cost, freight cost with this tax for all
orders of $500 or more.
*/
SELECT OrderID, Freight, Freight * 1.1 as FreightWithTax
FROM Orders
WHERE Freight >= 500
/* 12. Find the Total Number of Units Ordered of Product ID 3*/
SELECT SUM(Quantity) AS TotalUnits
FROM "Order Details"
WHERE ProductID=3
/* 13. Retrieve the number of employees in each city */
SELECT City, COUNT(EmployeeID) AS NumEmployees
FROM Employees
GROUP BY City
/* 14. Find the number of sales representatives in each city that contains
 * at least 2 sales representatives. Order by the number of employees.*/
SELECT City, COUNT(EmployeeID) AS NumEmployees
FROM Employees
WHERE Title = "Sales Representative"
GROUP BY City
HAVING COUNT(EmployeeID) > 1 ORDER BY NumEmployees
/* 15. Find the Companies (the CompanyName) that placed orders in 1997 */
SELECT CustomerID, OrderDate
FROM Orders
WHERE OrderDate
BETWEEN '1997-01-01' AND '1997-12-31'
         
SELECT CompanyName
FROM Customers
WHERE CustomerID IN
    (
   	 SELECT CustomerID
         FROM Orders
         WHERE OrderDate
         BETWEEN '1997-01-01' AND '1997-12-31'
     )
/* 16. Create a report showing employee orders.*/
SELECT e.EmployeeID, e.FirstName, e.LastName, o.OrderID, o.OrderDate
FROM Employees e
JOIN Orders o
ON e.EmployeeID = o.EmployeeID    
    
SELECT e.EmployeeID, e.FirstName, e.LastName, o.OrderID, o.OrderDate
FROM Employees e, Orders o
ON e.EmployeeID = o.EmployeeID
/*17. Create a report showing the Order ID, the name of the company that placed the order,
 * and the first and last name of the associated employee. Only show orders placed after January 1, 1998 that shipped after they were required. Sort by Company Name.*/
SELECT o.OrderID, c.CompanyName, e.FirstName, e.LastName, o.OrderDate
FROM Orders o, Employees e, Customers c
ON (e.EmployeeID = o.EmployeeID) AND (c.CustomerID = o.CustomerID)
WHERE o.ShippedDate > o.RequiredDate AND o.OrderDate > '1998-01-01'
ORDER BY c.CompanyName
/*18. Create a report that shows the total quantity of products (from the Order Details table) ordered.
Only show records for products for which the quantity ordered is fewer than 200.*/ 
SELECT p.ProductName, SUM(od.Quantity) AS TotalUnits
FROM "Order Details" od, Products p
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
HAVING TotalUnits < 200

