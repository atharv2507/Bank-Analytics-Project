CREATE DATABASE bank_analytics;

select * from finance_1;
select * from finance_2;

# 1.Year wise loan amount stats

Select Year(issue_d) as year, sum(loan_amnt) AS total_loan_amount
from finance_1
group by year
order by year asc;


# 2. Grade and sub grade wise revol_bal

select grade, sub_grade, SUM(revol_bal) AS total_revol_bal
from finance_1 join finance_2 using(id)
group by grade, sub_grade
order by grade, sub_grade;

# 3.Total Payment for Verified Status Vs Total Payment for Non Verified Status

select verification_status, sum(total_pymnt) as total_payment
from finance_1 join finance_2 using(id)
group by verification_status;


# 4.State wise and month wise loan status

select addr_state, monthname(issue_d) as month, loan_status
from finance_1
order by addr_state, month;


#5.Home ownership Vs last payment date stats

select home_ownership, count(last_pymnt_d) 
from finance_1 join finance_2 using(id)
group by home_ownership
order by count(last_pymnt_d);

