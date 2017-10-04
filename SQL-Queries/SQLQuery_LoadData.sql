USE FAERS
GO

-- Load Demographic Data

BULK INSERT FAERS.dbo.Demographic 
FROM 'C:\Users\TiHam\Documents\FAERS\DEMO16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);

-- Load Drug Data

BULK INSERT FAERS.dbo.Drug 
FROM 'C:\Users\TiHam\Documents\FAERS\DRUG16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2 
);

-- Load Indication Data

BULK INSERT FAERS.dbo.Indication 
FROM 'C:\Users\TiHam\Documents\FAERS\INDI16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);

-- Load Outcome Data

BULK INSERT FAERS.dbo.Outcome 
FROM 'C:\Users\TiHam\Documents\FAERS\OUTC16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);

-- Load Reaction Data

BULK INSERT FAERS.dbo.Reaction 
FROM 'C:\Users\TiHam\Documents\FAERS\REAC16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);

-- Load Report_Sources Data

BULK INSERT FAERS.dbo.Report_Sources 
FROM 'C:\Users\TiHam\Documents\FAERS\RPSR16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);

-- Load Therapy Data

BULK INSERT FAERS.dbo.Therapy 
FROM 'C:\Users\TiHam\Documents\FAERS\THER16Q4.txt'
WITH (  
	FIELDTERMINATOR = '$', 
	ROWTERMINATOR = '0x0a',
	FIRSTROW = 2
);