select sum(total) as Total, department, (SELECT TOP 1 Name FROM [Enterprise].dbo.Departments WHERE department = DepartmentID) as DeptName  
from(

(select sum(total) as total, department
from RegisterTransBackup202007
where (trans_type='D' or trans_type='I') and (item_fs = 'False')
group by department)

)

x 
where department != 0
group by department
order by department

--select sum(total) from RegisterHeaderBackUp202002
--select sum(total) from RegisterHeaderBackUp202003
--SELECT proc_date, StoreID, department, SUM(TOTAL) as Sales, count(distinct (Cast(register_no as varchar) + '-' + cast(trans_no as varchar))) as Customers, SUM(quantity) as items
--                 FROM RegisterTransBackup202004
--                WHERE (trans_type='D' or trans_type='I')
--                and proc_date >= @startDate and proc_date <= @endDate
--                GROUP BY department, StoreID, proc_date
--                ORDER BY proc_date, StoreID, department