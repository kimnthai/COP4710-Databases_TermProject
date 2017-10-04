-- =============================================
-- STEP 1: Specify database 
-- =============================================

USE FAERS
GO

-- =============================================
-- STEP 2: Create tables and relations 
-- =============================================
-- 1. Create Users Table

IF OBJECT_ID('Users', 'U') IS NOT NULL
  DROP TABLE Users
GO

CREATE TABLE Users
(
	userId INT primary key identity(1,1), --increment of 1 
	firstname VARCHAR (100),
	lastname VARCHAR (100),
	email VARCHAR(100)
)

-- 2. Create UserRoles Table
IF OBJECT_ID('UserRoles', 'U') IS NOT NULL
  DROP TABLE Users
GO

CREATE TABLE UserRoles 
(
	role_id INT  primary key,
	r_name VARCHAR(100),
	r_description VARCHAR(100)
)

-- 3. Create Drug Table
IF OBJECT_ID('Drug', 'U') IS NOT NULL
  DROP TABLE Drug
GO

CREATE TABLE Drug(
	primaryid BIGINT PRIMARY KEY,
	caseid INT,
	drug_seq INT,
	role_cod CHAR(22),
	drugname VARCHAR(500),
	prod_ai VARCHAR(500),
	val_vbm INT,
	route VARCHAR(500),
	dose_vbm VARCHAR(300),
	cum_dose_chr CHAR(15),
	cum_dose_unit CHAR(50),
	dechal CHAR(20),
	rechal CHAR(20),
	lot_num VARCHAR(1000),
	exp_dt VARCHAR(1000),
	nda_num VARCHAR(100),
	dose_amt CHAR(15),
	dose_unit CHAR(50),
	dose_form CHAR(50),
	dose_freq CHAR(50)
)

-- 4. Create Demographic Table
IF OBJECT_ID('Demographic', 'U') IS NOT NULL
  DROP TABLE Demographic
GO

CREATE TABLE Demographic(
	primaryid BIGINT PRIMARY KEY,
	caseid INT,
	caseversion INT,
	i_f_code CHAR(1),
	event_dt CHAR(8),
	mfr_dt CHAR(8),
	init_fda_dt CHAR(8),
	fda_dt CHAR(8),
	rept_cod CHAR(9),
	auth_num VARCHAR(500),

	
	mfr_num VARCHAR(500),
	mfr_sndr VARCHAR(300),
	lit_ref VARCHAR(1000),
	age NUMERIC(12,2),
	age_cod CHAR(7),
	age_grp CHAR(15),
	sex CHAR(5),
	e_sub CHAR(1),
	wt NUMERIC(14,5),
	wt_cod CHAR(20),
	rept_dt CHAR(8),
	to_mfr VARCHAR(100),
	occp_cod VARCHAR(300),
	reporter_country VARCHAR(500),
	occr_country CHAR(2)
	CONSTRAINT FK_primaryid1 FOREIGN KEY (primaryid)
    REFERENCES Drug(primaryid)
)


-- 5. Create Reaction Table
IF OBJECT_ID('Reaction', 'U') IS NOT NULL
  DROP TABLE Reaction
GO

CREATE TABLE Reaction(
	primaryid BIGINT, 
	caseid INT, 
	pt VARCHAR(500), -- "Preferred Term"-level medical terminology describing the event - MedDRA
	drug_rec_act VARCHAR(500) -- Drug Recur Action data
	CONSTRAINT FK_Reaction_ID FOREIGN KEY (primaryid)
	REFERENCES Demographic(primaryid)
)

-- 6. Create Outcome Table
IF OBJECT_ID('Outcome', 'U') IS NOT NULL
  DROP TABLE Outcome
GO

CREATE TABLE Outcome(
	primaryid BIGINT, 
	caseid INT, 
	outc_cod VARCHAR(4000) -- Code for a patient outcome
	CONSTRAINT FK_Outcome_ID FOREIGN KEY (primaryid) 
	REFERENCES Demographic(primaryid)
)


-- 7. Create Resport_Sources Table
IF OBJECT_ID('Report_Sources', 'U') IS NOT NULL
  DROP TABLE Report_Sources
GO

CREATE TABLE Report_Sources(
	primaryid BIGINT, 
	caseid INT, 
	rpsr_cod VARCHAR(32) -- Code for the source of the report
	CONSTRAINT FK_Report_ID FOREIGN KEY (primaryid) 
	REFERENCES Demographic(primaryid)
)

-- 8. Create Therapy Table
IF OBJECT_ID('Therapy', 'U') IS NOT NULL
  DROP TABLE Therapy
GO

CREATE TABLE Therapy(
	primaryid BIGINT, 
	caseid INT, 
	dsg_drug_seq INT, -- Drug sequence number for identifying a drug for a Case
	start_dt CHAR(8), -- Date the therapy was started (or re-started) for this drug
	end_dt CHAR(8), -- A date therapy was stopped for this drug
	dur NUMERIC, -- Numeric value of the duration (length) of therapy
	dur_cod VARCHAR(500) -- Unit abbreviation for duration of therapy
)

-- 9. Create Indication Table
IF OBJECT_ID('Indication', 'U') IS NOT NULL
  DROP TABLE Indication
GO

CREATE TABLE Indication(
	primaryid BIGINT, 
	caseid INT,
	indi_drug_seq INT, -- Drug sequence number for identifying a drug for a Case
	indi_pt VARCHAR(1000) -- "Preferred Term" level medical terminology describing the Indication for use
)