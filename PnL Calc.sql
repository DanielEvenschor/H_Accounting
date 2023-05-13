DELIMITER $$
DROP PROCEDURE IF EXISTS h_accounting.godsavemepp;
CREATE PROCEDURE h_accounting.godsavemepp(varYear SMALLINT)
BEGIN
DROP TABLE H_accounting.devenschor_tmp;
CREATE TABLE H_accounting.devenschor_tmp
(label VARCHAR(50), TotalYear2020 INT, TotalYear2019 INT, percent_change INT);

INSERT INTO h_accounting.devenschor_tmp
(label)
VALUES('PROFIT AND LOSS STATEMENT');

-- INSERT REVENUE = 68

INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 68
		OR ac.profit_loss_section_id = 68
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 68
        OR ac.profit_loss_section_id = 68
        GROUP BY ss.statement_section;
        
-- INSERT COGS = 74

        INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 74
		OR ac.profit_loss_section_id = 74
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 74
        OR ac.profit_loss_section_id = 74
        GROUP BY ss.statement_section;
        
-- INSERT ADMIN EXPENSE = 75

INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 75
		OR ac.profit_loss_section_id = 75
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 75
        OR ac.profit_loss_section_id = 75
        GROUP BY ss.statement_section;
        
-- INSERT SELLING EXPENSE = 76

INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 76
		OR ac.profit_loss_section_id = 76
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 76
        OR ac.profit_loss_section_id = 76
        GROUP BY ss.statement_section;
        
-- INSERT OTHER EXPENSES = 77

INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 77
		OR ac.profit_loss_section_id = 77
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 77
        OR ac.profit_loss_section_id = 77
        GROUP BY ss.statement_section;
        
-- INSERT OTHER INCOME = 78

INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 78
		OR ac.profit_loss_section_id = 78
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 78
        OR ac.profit_loss_section_id = 78
        GROUP BY ss.statement_section;

-- INSERT INCOME TAX = 79
        
        INSERT INTO h_accounting.devenschor_tmp
(label, TotalYear2020, TotalYear2019, percent_change)
SELECT 
	ss.statement_section,
	ROUND(SUM(jeli.debit),2), 
    (SELECT ROUND(SUM(jeli.credit),2) 
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
		WHERE YEAR(je.entry_date) = varYear -1 
		AND ac.company_id = 1
		AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 79
		OR ac.profit_loss_section_id = 79
    GROUP BY ss.statement_section),
    0
    FROM
	h_accounting.`account` AS ac
        INNER JOIN
    h_accounting.statement_section AS ss ON profit_loss_section_id = ss.statement_section_id
        INNER JOIN
    h_accounting.journal_entry_line_item AS jeli ON ac.account_id = jeli.account_id
        INNER JOIN
    h_accounting.journal_entry AS je ON je.journal_entry_id = jeli.journal_entry_id
WHERE
        YEAR(je.entry_date) = varYear 
		AND ac.company_id = 1
        AND ss.is_balance_sheet_section = 0
        AND je.cancelled = 0
        AND je.debit_credit_balanced = 1
        AND je.closing_type = 0
        AND ac.postable = 1
        AND ac.visible_for_posting = 1
		AND ss.statement_section_id = 79
        OR ac.profit_loss_section_id = 79
        GROUP BY ss.statement_section;
        
# Final remarks: Didn't include % change due to time limit. 
# My idea how to make it work would be to divide two subqueries that sum the amounts and finally turn it into % 
# Same goes for the Net PROFIT at the end, several subqueries that pull the unique values and then subtract them for the final result
# This is the only way i can come up with brainstorming but it would also mean significant computing power and make the procedure extremely slow. 
# Most likely there is a way to do it querying the temporary table fetching the individual values and perform calculations, but we had to move on to the BalanceSheet
# The output of this procedure will allow for the data to be exported into an excel where those calculations can be done way easier. 

END $$
Delimiter ;

CALL H_accounting.godsavemepp(2020);

SELECT * FROM h_accounting.devenschor_tmp;