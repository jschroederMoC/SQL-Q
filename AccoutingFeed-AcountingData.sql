-- Departments are good as long as setting 0 when subtype is 0
--SELECT t2.dept_name, sum(Case when trans_subtype = 'CP' Then 0 else total end)
--FROM POSHist.dbo.dbo_Register_Trans t1 
--JOIN POSBdat.dbo.Departments t2 
--ON t1.department = t2.dept_no 
--WHERE proc_date = '8-3-2020'
--and (t2.dept_name = 'Bottle Return'
--or t2.dept_name = 'Groc-NF'
--or t2.dept_name = 'Frozen Food'
--or t2.dept_name = 'Juice Bar'
--or t2.dept_name = 'Floral'
--or t2.dept_name = 'Gift Card'
--or t2.dept_name = 'Espresso'
--or t2.dept_name = 'Deposit'
--or t2.dept_name = 'Soft Drink'
--or t2.dept_name = 'Grocery'
--or t2.dept_name = 'Whole Health'
--or t2.dept_name = 'Produce'
--or t2.dept_name = 'Grocery Deli'
--or t2.dept_name = 'Organic Produce'
--or t2.dept_name = 'Dairy'
--or t2.dept_name = 'Service Bakery'
--or t2.dept_name = 'Home & Gift'
--or t2.dept_name = 'Retail Bakery'
--or t2.dept_name = 'Srv Kitchen Hot'
--or t2.dept_name = 'Srv Kitchen Cold'
--or t2.dept_name = 'Beer'
--or t2.dept_name = 'Gourmet Coffee'
--or t2.dept_name = 'Meat'
--or t2.dept_name = 'Seafood'
--or t2.dept_name = 'Bulk Food'
--or t2.dept_name = 'Specialty Cheese'
--or t2.dept_name = 'Full Srv Meat'
--or t2.dept_name = 'Wine'
--or t2.dept_name = 'Sushi'
--or t2.dept_name = 'Postage Stamps'
--or t2.dept_name = 'Food Bank'
--)
--group by dept_name

--Select *   --TenderCode as Name, SUM(CountDownAmount) -887.00 as CDAmount, sum(TillAmount) -887.00 as TillAmount
--from POSBdat.dbo.CheckerDetail
--where ProcDate = '2020-08-03'
--and TenderCode = 'CA'

--Select distinct tenderCode
--from POSBdat.dbo.CheckerDetail
SELECT AdjustmentAmt FROM POSBdat.dbo.SafeStatisticsAdjDetail WHERE ProcDate = '8-3-2020'

Select TenderCode as Name, sum(CountDownAmount) as Amount
from POSBdat.dbo.CheckerDetail
where ProcDate = '2020-08-03'
group by  TenderCode

--OverShort looks good
SELECT (SUM(CountDownAmount) - SUM(TillAmount)) as overShort FROM POSBdat.dbo.CheckerDetail WHERE ProcDate = '8-3-2020' AND TillAmount != CountDownAmount
-- Below is good for CC 
--select upc, trans_subtype, sum(total) as amount
--from POSHist.dbo.dbo_Register_Trans t1 where proc_date = '8-3-2020'
--AND(upc = 'Amex Card' OR upc = 'Discover Card' OR upc = 'Visa Card' OR upc = 'Master Card')
--and trans_subtype = 'CC'
--group by upc, trans_subtype

Select sum(total) from POSHist.dbo.dbo_Register_Trans
where proc_date = '8-3-2020'
and trans_subtype = 'CA'


--            TENDER CODES - CA, CC, CK, CP, DC, EC, EF, EG  ------- CP REQUIRES COUNDOWNAMOUNT I THINK
--Select TenderCode as Name, sum(CountDownAmount) as Amount
--from POSBdat.dbo.CheckerDetail
--where ProcDate = '2020-08-03'
--group by  TenderCode

-- Use CountDownAmount gives correct value for store 1 and 2 on 8-3-2020
--Select sum(CountDownAmount)
--from POSBdat.dbo.CheckerDetail
--where ProcDate = '2020-08-03'
--and  TenderCode = 'CP'