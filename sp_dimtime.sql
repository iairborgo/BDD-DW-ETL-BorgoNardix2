USE [bd_intermedia_2024_G01]
GO

ALTER PROCEDURE dbo.stored_procedure_int_tiempo
    @StartDate date,
    @EndDate date
AS
BEGIN
    -- Limpiar la tabla antes de insertar nuevos registros
    TRUNCATE TABLE dim_time_2024_G01;

    WITH Fechas(Fecha) AS (
        SELECT @StartDate
        UNION ALL
        SELECT DATEADD(d, 1, Fecha)
        FROM Fechas
        WHERE Fecha < @EndDate
    )
    INSERT INTO DIM_TIME_2024_G01(Fecha,dateKey, Dia, Mes, NombreMes, Año, Trimestre, Semestre, DiaSemana, NombreDiaSemana, Semana, DiaAño)
    SELECT Fecha, 
		   SUBSTRING(CAST([Fecha] AS VARCHAR(40)),1,4) + SUBSTRING(CAST([Fecha] AS VARCHAR(40)),6,2) + SUBSTRING(CAST([Fecha] AS VARCHAR(40)),9,2) as dateKey,
           DAY(Fecha) AS Dia,
           MONTH(Fecha) AS Mes, 
           DATENAME(MONTH, Fecha) AS NombreMes, 
           YEAR(Fecha) AS Año, 
           DATEPART(QUARTER, Fecha) AS Trimestre, 
           (DATEPART(QUARTER, Fecha) + 1) / 2 AS Semestre, 
           DATEPART(WEEKDAY, Fecha) AS DiaSemana, 
           DATENAME(WEEKDAY, Fecha) AS NombreDiaSemana, 
           DATEPART(WEEK, Fecha) AS Semana, 
           DATEPART(DAYOFYEAR, Fecha) AS DiaAño
    FROM Fechas
    OPTION (MAXRECURSION 0);
END;
GO
