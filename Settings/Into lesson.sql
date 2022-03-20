select * from bank.account where account_id>=10
order by account_id DESC;

select *, amount-payments as 'balance in euros' from bank.loan
select * from loan
where status NOT IN('B','b')

select distinct status from loan

SELECT distinct A2 FROM bank.district
WHERE A2 IN ('Benesov','Beroun') OR A4 <75000

SELECT distinct A2,A4 FROM bank.district
WHERE A2 IN ('Benesov','Beroun') OR A4 <75000

SELECT * FROM bank.loan
-- to find the max amount from the loan table 
SELECT max(amount) FROM loan 

-- floor and ceiling

select ceiling(avg(amount)), floor(avg(amount)) from loan

-- 
SELECT SUBSTRING_INDEX('www.google.com', '.',2)

-- % allows me to find the values in A3 that contain north.
-- if I use it without the % it won't retun any values since it would only search for north and nothing after.
SELECT * FROM bank.district
WHERE A3 LIKE 'north%'

SELECT * FROM bank.district
WHERE A3 LIKE 'north_M%'

