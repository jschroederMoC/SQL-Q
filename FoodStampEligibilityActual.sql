DROP TABLE #temp

create Table #temp(
	total money,
	department smallint,
	trans_type nvarchar(max),
	item_fs bit
)

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202001

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202002

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202003

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202004

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202005

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202006

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202007

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202008

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202009

--INSERT INTO #Temp
--SELECT total, department, trans_type, item_fs
--FROM RegisterTransBackup202010

INSERT INTO #Temp
SELECT total, department, trans_type, item_fs
FROM RegisterTransBackup202011

INSERT INTO #Temp
SELECT total, department, trans_type, item_fs
FROM RegisterTransBackup202012

SELECT SUM(total) as Total, t1.department, (SELECT Description FROM [BRData].dbo.Departments t2 WHERE t1.department = t2.Department)
from  #temp t1
where (trans_type='D' or trans_type='I') and (item_fs = 'false')
GROUP BY t1.department
ORDER BY t1.department




--select sum(total) as Total, 
--department,
--(SELECT Description FROM [BRData].dbo.Departments WHERE department = Department)     
--from((select sum(total) as total, department
--from RegisterTransBackup202001
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202002
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202003
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202004
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202005
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202007
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202006
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202007
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)
--UNION
--(select sum(total) as total, department
--from RegisterTransBackup202007
--where (trans_type='D' or trans_type='I') and (item_fs = 'False')
--group by department)

--)



--x 
--where department != 0
--group by department
--order by department

----select sum(total) from RegisterHeaderBackUp202002
----select sum(total) from RegisterHeaderBackUp202003
----SELECT proc_date, StoreID, department, SUM(TOTAL) as Sales, count(distinct (Cast(register_no as varchar) + '-' + cast(trans_no as varchar))) as Customers, SUM(quantity) as items
----                 FROM RegisterTransBackup202004
----                WHERE (trans_type='D' or trans_type='I')
----                and proc_date >= @startDate and proc_date <= @endDate
----                GROUP BY department, StoreID, proc_date
----                ORDER BY proc_date, StoreID, department