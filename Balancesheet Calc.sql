DELIMITER $$
DROP PROCEDURE IF EXISTS h_accounting.bscalcu;
CREATE PROCEDURE h_accounting.bscalcu(varYear SMALLINT)
BEGIN
DROP TABLE H_accounting.devenschor_tmp;
CREATE TABLE H_accounting.devenschor_tmp
(line_number INT, label VARCHAR(50), TotalYear2020 INT, TotalYear2019 INT, percent_change INT);
-- added a line_number in contrast to p&L so maybe i can query the table in the end using that as unique id 
-- that could allow me to perform calculations without need for subqueries

-- INSERT Current assets = 61

INSERT INTO h_accounting.devenschor_tmp
(line_number, label)
VALUES(1, 'BALANCE SHEET');

INSERT INTO h_accounting.devenschor_tmp
(line_number, label)
VALUES(2, 'ASSETS'); 

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	3,
	ss.statement_section,
	ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2),  
    (SELECT ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 61
		OR ac.balance_sheet_section_id = 61
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 61
        OR ac.balance_sheet_section_id = 61
        GROUP BY ss.statement_section;
        
-- INSERT Fixed Assets = 62

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	4,
	ss.statement_section,
	ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2),  
    (SELECT ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 62
		OR ac.balance_sheet_section_id = 62
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 62
        OR ac.balance_sheet_section_id = 62
        GROUP BY ss.statement_section;
        
-- INSERT Deferred Assets = 63

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	5,
	ss.statement_section,
	ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2),  
    (SELECT ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 63
		OR ac.balance_sheet_section_id = 63
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 63
        OR ac.balance_sheet_section_id = 63
        GROUP BY ss.statement_section;
        
        -- Liabilities Start
        
		INSERT INTO h_accounting.devenschor_tmp
		(line_number, label)
		VALUES(6, 'Liabilities'); 
        
-- INSERT Current Liabilities = 64

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	7,
	ss.statement_section,
	ROUND((SUM(jeli.credit))-(SUM(jeli.debit)),2),  
    (SELECT ROUND((SUM(jeli.credit))-(SUM(jeli.debit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 64
		OR ac.balance_sheet_section_id = 64
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 64
        OR ac.balance_sheet_section_id = 64
        GROUP BY ss.statement_section;
        
-- INSERT Long-Term Liabilities = 65

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	8,
	ss.statement_section,
	ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2),  
    (SELECT ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 65
		OR ac.balance_sheet_section_id = 65
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 65
        OR ac.balance_sheet_section_id = 65
        GROUP BY ss.statement_section;
        
-- INSERT Deferred Liabilities = 66
        
        INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	9,
	ss.statement_section,
	ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2),  
    (SELECT ROUND((SUM(jeli.debit))-(SUM(jeli.credit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 66
		OR ac.balance_sheet_section_id = 66
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 66
        OR ac.balance_sheet_section_id = 66
        GROUP BY ss.statement_section;
        
--  Equity starts

INSERT INTO h_accounting.devenschor_tmp
		(line_number, label)
		VALUES(10, 'Equity'); 

-- INSERT Equity = 67

INSERT INTO h_accounting.devenschor_tmp
(line_number, label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	11,
	ss.statement_section,
	ROUND((SUM(jeli.credit))-(SUM(jeli.debit)),2),  
    (SELECT ROUND((SUM(jeli.credit))-(SUM(jeli.debit)),2)  
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 67
		OR ac.balance_sheet_section_id = 67
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON ac.balance_sheet_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 1
        AND je.cancelled = 0
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 67
        OR ac.balance_sheet_section_id = 67
        GROUP BY ss.statement_section;
END $$
Delimiter ;

CALL h_accounting.bscalcu(2020);

SELECT * FROM h_accounting.devenschor_tmp;
