SELECT t2.dept_name, sum(Case when trans_subtype = 'CP' Then 0 else total end)
FROM POSHist.dbo.dbo_Register_Trans t1 
JOIN POSBdat.dbo.Departments t2 
ON t1.department = t2.dept_no 
WHERE proc_date = '8-3-2020'
and (t2.dept_name = 'Bottle Return'
or t2.dept_name = 'Groc-NF'
or t2.dept_name = 'Frozen Food'
or t2.dept_name = 'Juice Bar'
or t2.dept_name = 'Floral'
or t2.dept_name = 'Gift Card'
or t2.dept_name = 'Espresso'
or t2.dept_name = 'Deposit'
or t2.dept_name = 'Soft Drink'
or t2.dept_name = 'Grocery'
or t2.dept_name = 'Whole Health'
or t2.dept_name = 'Produce'
or t2.dept_name = 'Grocery Deli'
or t2.dept_name = 'Organic Produce'
or t2.dept_name = 'Dairy'
or t2.dept_name = 'Service Bakery'
or t2.dept_name = 'Home & Gift'
or t2.dept_name = 'Retail Bakery'
or t2.dept_name = 'Srv Kitchen Hot'
or t2.dept_name = 'Srv Kitchen Cold'
or t2.dept_name = 'Beer'
or t2.dept_name = 'Gourmet Coffee'
or t2.dept_name = 'Meat'
or t2.dept_name = 'Seafood'
or t2.dept_name = 'Bulk Food'
or t2.dept_name = 'Specialty Cheese'
or t2.dept_name = 'Full Srv Meat'
or t2.dept_name = 'Wine'
or t2.dept_name = 'Sushi'
or t2.dept_name = 'Postage Stamps'
or t2.dept_name = 'Food Bank'
)
group by dept_name

--Select * --TenderCode as Name, SUM(CountDownAmount) -887.00 as CDAmount, sum(TillAmount) -887.00 as TillAmount
--from POSBdat.dbo.CheckerDetail
--where ProcDate = '2020-08-03'
--and CountDownAmount <> 0
--and TenderCode = 'CA'
--group by TenderCode

--Select TenderCode as Name, CountDownAmount as Amount
--from POSBdat.dbo.CheckerDetail
--where ProcDate = '2020-08-03'
--And TenderCode = 'CP'

--select upc, trans_subtype, sum(total) as amount
--from POSHist.dbo.dbo_Register_Trans t1 where proc_date = '8-3-2020'
--AND(upc = 'Amex Card' OR upc = 'Discover Card' OR upc = 'Visa Card' OR upc = 'Master Card')
--and trans_subtype = 'CC'
--group by upc, trans_subtype


--SELECT sum(total) as total
--FROM POSHist.dbo.dbo_Register_Trans t1 
--JOIN POSBdat.dbo.Departments t2 
--ON t1.department = t2.dept_no 
--WHERE proc_date = '8-3-2020'
--and (
-- t2.dept_name = 'Whole Health'
--)

SELECT sum(Case when trans_subtype = 'CP' Then 0 else total end)
FROM POSHist.dbo.dbo_Register_Trans t1 
JOIN POSBdat.dbo.Departments t2 
ON t1.department = t2.dept_no 
WHERE proc_date = '8-3-2020'
and t2.dept_name = 'Whole Health'






