CREATE DATABASE bd_intermedia_2024_G01;
GO

USE bd_intermedia_2024_G01;
GO


DROP TABLE IF EXISTS INT_DIM_CUSTOMER_G01;
CREATE TABLE INT_DIM_CUSTOMER_G01 (
    customerId INT NOT NULL,
    fullName VARCHAR(255),
    birthDate DATE,
    city VARCHAR(255),
    [state] VARCHAR(255),
    zipcode VARCHAR(255),
    customerCategory CHAR(1) NOT NULL
);

DROP TABLE IF EXISTS INT_DIM_EMPLOYEE_G01;
CREATE TABLE INT_DIM_EMPLOYEE_G01 (
    employeeId VARCHAR(255) NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    gender CHAR(4) NOT NULL,
    category VARCHAR(255) NOT NULL,
    employmentDate DATE NOT NULL,
    birthDate DATE NOT NULL,
    educationLevel VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS INT_DIM_PRODUCT_G01;
CREATE TABLE INT_DIM_PRODUCT_G01 (
    productId INT NOT NULL,
    detail VARCHAR(255) NOT NULL,
    package VARCHAR(255) NOT NULL,
    liters FLOAT NOT NULL
);

DROP TABLE IF EXISTS INT_DIM_REGIONS_G01;
CREATE TABLE INT_DIM_REGIONS_G01 (
    regionId VARCHAR(255) NOT NULL,
    [state] VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    zipcode INT NOT NULL
);

DROP TABLE IF EXISTS INT_PRICES_G01;
CREATE TABLE INT_PRICES_G01 (
    productId int NOT NULL,
    dateFrom date NOT NULL,
    dateUntil date NULL,
    price DECIMAL(5,2) NOT NULL
)

DROP TABLE IF EXISTS INT_DISCOUNTS_G01;
CREATE TABLE INT_DISCOUNTS_G01 (
    discountId int NOT NULL,
    [from] date NOT NULL,
    until date NULL,
	[percentage] INT NOT NULL,
    totalBilling INT NOT NULL,
);

DROP TABLE IF EXISTS INT_FACT_STOCK_G01;
CREATE TABLE INT_FACT_STOCK_G01 (
    productId INT NOT NULL,
    dateKey INT NOT NULL,
	[date] DATE NOT NULL,
    variation INT NOT NULL
);

DROP TABLE IF EXISTS INT_FACT_SALES_G01;
CREATE TABLE INT_FACT_SALES_G01 (
    billingId INT NOT NULL, 
    dateKey INT NOT NULL,
    customerKey INT NOT NULL,
	ageRangeCustomer VARCHAR(255),
    employeeKey INT NOT NULL,
    productKey INT NOT NULL,
	[Date] DATE NOT NULL,
    quantity INT NOT NULL,
	region VARCHAR(255) NOT NULL,
	totalAmountSale FLOAT NOT NULL,
	discountAmount FLOAT NULL,
	discountPercentage FLOAT NULL,
	totalLitersSale FLOAT NULL,
	latasVendidas INT NOT NULL
);



---------------------------------------Se debe hacer carga inicial por minima y m xima fecha
DROP TABLE IF EXISTS DIM_TIME_2024_G01;
CREATE TABLE DIM_TIME_2024_G01 (
	Fecha DATE NOT NULL,
	dateKey INT NOT NULL,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
	NombreMes VARCHAR(255) NOT NULL,
	A o INT NOT NULL,
	Trimestre INT NOT NULL,
	Semestre INT NOT NULL,
	DiaSemana INT NOT NULL,
	NombreDiaSemana VARCHAR(255) NOT NULL,
	Semana INT NOT NULL,
	DiaA o INT NOT NULL,
);
DROP TABLE IF EXISTS INT_HOLIDAY_G01;
CREATE TABLE INT_HOLIDAY_G01 (
    [date] DATE NOT NULL,
	dateKey INT NOT NULL,
    holiday VARCHAR(255) NOT NULL,
);

