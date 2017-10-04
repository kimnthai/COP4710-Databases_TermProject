-- =============================================
-- Function/Query : Search Query
-- =============================================

-- 1. look up name of drug, return reaction

	SELECT D.drugname, R.pt as Reaction
	FROM Drug D INNER JOIN Reaction R ON D.primaryid = R.primaryid AND D.caseid = R.caseid
	WHERE D.drugname LIKE '%<SearchString>%' --name of drug here
	order by R.pt;

-- 2. look up reaction, return name of drug

	SELECT  R.pt, D.drugname
	FROM Drug D INNER JOIN Reaction R ON D.primaryid = R.primaryid AND D.caseid = R.caseid
	WHERE P.pt LIKE '%<SearchString>%' --what is this
	ORDER BY D.drugname;


-- 3. look up name of drug, return patient's demographic 
--	age, sex, occr country, & return reaction

	SELECT TOP 100 D.drugname, DG.age, DG.sex, DG.occr_country, R.pt
	FROM Drug D 
		INNER JOIN Demographic DG ON D.primaryid = DG.primaryid AND D.caseid = DG.casei
		INNER JOIN Reaction R ON DG.primaryid = R.primaryid AND DG.caseid = R.caseid
	WHERE D.drugname LIKE '%<SearchString>%' --insert drug name here

-- 4. look up drug reaction,return patient demographic

	SELECT R.pt, DG.age, DG.sex, DG.occr_country
	FROM Reaction R INNER JOIN Demographic DG ON D.primaryid = DG.primaryid AND D.caseid = DG.caseid
	WHERE R.pt LIKE '%<SearchString>%' --what is this
	ORDER BY DG.occr_country;


-- =============================================
-- Function/Query : Delete/Insert Files
-- =============================================	

-- code here
-- http://www.php-mysql-tutorial.com/wikis/mysql-tutorials/uploading-files-to-mysql-database.aspx
-- http://stackoverflow.com/questions/19827944/inserting-a-txt-file-into-database

-- =============================================
-- Function/Query : Delete/Insert Users
-- =============================================	

-- code here



