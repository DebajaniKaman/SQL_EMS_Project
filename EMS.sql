create database if not exists EMS;

use EMS;

create table Employee
(
EmpId integer not null primary key,
EmpName varchar(100),
DeptId integer,
JoiningDate date not null,
EmailId varchar(100) not null,
Address varchar(100)
);

create table Department
(
DeptID integer not null primary key,
DeptName varchar(200)
);

alter table Employee add column EmpStatus varchar(100);
alter table Employee add column Salary integer;


insert into Employee values (10235,"Mark Ranson",102,'2021-12-31',"mark.r@services.com","1234 Elm Street, Springfield, IL, 62701","Permanent",53200);
insert into Employee values (30491,"Alan Turing",789,'2022-01-14',"alan.t45@emailservices.com","890 Pine Street, San Francisco, CA, 94108","Permanent",42900);
insert into Employee values (81562,"Tony Robbins",231,'2022-01-14',"tony67@company.com","432 Oak Lane, Austin, TX, 78701","Contractual",65750);
insert into Employee values (23984,"Agatha Robbins",450,'2022-01-02',"a.robbins@xyz.com","789 Maple Avenue, Seattle, WA, 98101","Permanent",91300);
insert into Employee values (67325,"Lana Hopkins",602,'2022-01-02',"hopkins.l87@bingo.com","345 Birch Road, Denver, CO, 80202","Permanent",37600);
insert into Employee values (41875,"Heather Gray",602,'2022-08-04',"h.gray67@emailservices.com","901 Cedar Street, Orlando, FL, 32801","",84200);
insert into Employee values (53028,"Caitlyn Jenner",231,'2022-03-01',"caitlyn.j@example.com","567 Cherry Lane, Chicago, IL, 60601","Permanent",72900);
insert into Employee values (14789,"Gibbs Duhem",231,'2022-03-01',"duhem.gibbs@company.com","789 Magnolia Boulevard, Miami, FL, 33101","Permanent",59400);
insert into Employee values (76293,"Anderson Cooper",450,'2022-03-01',"anderson.cooper@emailhosting.biz","123 Sycamore Street, Boston, MA, 02108","Contractual",81000);
insert into Employee values (31507,"Michael Douglas",231,'2022-03-01',"michael.d@provider.net","456 Cedar Avenue, Phoenix, AZ, 85001","Contractual",46800);
insert into Employee values (64823,"Sophia Anderson",450,'2022-03-15',"sophia.a56@company.com","789 Birch Lane, Atlanta, GA, 30301","",69250);
insert into Employee values (89016,"Benjamin Martinez",875,'2022-03-15',"benjamin.m@example.com","234 Oak Street, Dallas, TX, 75201","",56700);
insert into Employee values (42756,"Harper Johnson",333,'2022-04-01',"harper.j99@bingo.com","567 Elm Avenue, Los Angeles, CA, 90001","",88600);
insert into Employee values (86532,"Mason Thompson",333,'2022-06-01',"m.thompson@emailservices.net","456 Pinecrest Road, Philadelphia, PA, 19101","",43500);
insert into Employee values (29104,"Ava Nguyen",789,'2022-07-02',"ava.n23@company.com","789 Birch Avenue, Nashville, TN, 37201","",62150);


insert into Employee values (102,"Olivia Ramirez",21984,'2022-04-17',"123 Maple Lane, Houston, TX, 77001",'olivia.r@emailhosting.biz',"",null);
insert into Employee values (450,"Brian Griffin",58746,'2021-12-31',"567 Willow Avenue, Pleasantville, NY, 10570","brian.g012@emailprovider.org","Permanent",78500);

insert into Employee values (92614,"Ben Affleck",450,'2022-08-04',"","234 Pinecrest Drive, Portland, OR, 97201","",50150);
insert into Employee values (57389,"Elijah Brown",333,'2022-04-01',"","","",49300);

insert into Employee values (73659,"Logan Patel",null,'2022-07-15',"logan.p@xyz.com","234 Magnolia Street, Las Vegas, NV, 89101","",96400);
insert into Employee values (60238,"Mia Garcia",null,'2022-01-03',"mia.g77@services.com","567 Cedar Drive, Minneapolis, MN, 55401","Permanent",40000);

commit;

insert into Department values (102,"Human Resources");
insert into Department values (450,"Sales");
insert into Department values (789,"Legal");
insert into Department values (231,"Retail");
insert into Department values (602,"Accounting");
insert into Department values (875,"Support");
insert into Department values (333,"Business Development");

update Employee set Empid = 21984, DeptId = 102, EmailId = 'olivia.r@emailhosting.biz', Address = '123 Maple Lane, Houston, TX, 77001', Salary=74900
where EmpName ='Olivia Ramirez';
update Employee set Empid = 58746, DeptId = 450, EmailId = 'brian.g012@emailprovider.org', Address = '567 Willow Avenue, Pleasantville, NY, 10570'
where EmpName ='Brian Griffin';

update Employee set EmailId = 'e.brown55@xyz.com' , Address = '890 Willow Drive, San Diego, CA, 92101' where EmpName = 'Elijah Brown';
update Employee set EmailId = 'affleck78@mailprovider.org' where EmpName = 'Ben Affleck';

update Employee set DeptId = 333 where EmpName = 'Logan Patel';
update Employee set DeptId = 875 where EmpName = 'Mia Garcia';

select * from Department; 

select * from Employee where EmpStatus = 'Permanent';

select * from Employee where EmpStatus in ('Permanent', 'Contractual');

select * from Employee where EmpStatus = '';

select * from Employee order by Salary desc;

select * from Employee where salary <= 50000;

select distinct salary from Employee order by salary desc limit 5;

select sum(salary) from employee where DeptId = 450;

select avg(salary) from employee where DeptId = 333;

select min(salary) , max(salary) from employee where DeptId = 875;

select min(e.salary) as min_salary , max(e.salary) as max_salary, d.deptname from employee e, department d where d.DeptId = 875 and d.deptid = e.deptid;

select count(1), empstatus from employee where empstatus = 'Permanent';

select e.*, d.deptname from employee e, department d where d.deptId = e.deptId and d.deptname = 'Accounting';

select * from department;

delete from department where deptid = 231;
delete from department where deptid = 450;

insert into department values (249, 'Engineer');
insert into department values (902, 'Developer');

select e.empid, e.empname, e.empstatus, d.deptname from employee e inner join department d on e.deptid = d.deptid order by e.deptid;

select e.empid, e.empname, e.empstatus, d.deptname from employee e left join department d on e.deptid = d.deptid order by e.empid;

select e.empid, e.empname, d.deptname from employee e right join department d on e.deptid = d.deptid order by e.empid;

SELECT e.empid, e.empName, e.empstatus, d.deptname from Employee e cross join department d order by e.empid;

alter table employee add ManagerId integer;

alter table employee add constraint fk_em foreign key (ManagerId) references employee(empid);

update employee set managerid = 21984 where empid = 10235;
update employee set managerid = 31507 where empid in (53028,81562);
update employee set managerid = 14789 where empid = 31507;
update employee set managerid = 42756 where empid = 57389;
update employee set managerid = 57389 where empid = 73659;
update employee set managerid = 73659 where empid = 86532;
update employee set managerid = 23984 where empid = 58746;
update employee set managerid = 58746 where empid in (64823,76293,92614);
update employee set managerid = 41875 where empid = 67325;
update employee set managerid = 30491 where empid = 29104;
update employee set managerid = 89016 where empid = 60238;

select e1.empname, e2.empname as manager_name, e1.empstatus from employee e1 join employee e2 on e1.empid = e2.managerid;

create table Employee_add(
empid int not null primary key,
empname varchar(100) not null,
deptid int,
ISD_Code varchar(10),
PHONENO varchar(10),
BONUS int
);

alter table Employee_add modify column PHONENO varchar(20);

insert into employee_add values(10014,"Emily Johnson",102,"+1 217","555-123-4567",2500);
insert into employee_add values(21561,"Benjamin Carter",249,"+1 305","987-654-3210",3000);
insert into employee_add values(37896,"Samantha Adams",875,"+1 713","123-456-7890",8521);
insert into employee_add values(45217,"Lucas Thompson",789,"+1 206","555-789-123",4576);
insert into employee_add values(56323,"Natalie Walker",102,"+1 615","321-555-9876",6275);
insert into employee_add values(62109,"Elijah Parker",902,"+1 415","999-888-7777",3735);
insert into employee_add values(78902,"Olivia Rodriguez",875,"+1 480","444-333-2222",7052);
insert into employee_add values(83454,"Ethan Campbell",789,"+1 407","777-666-5555",5587);
insert into employee_add values(91235,"Sophia Mitchell",249,"+1 213","234-567-8901",1497);
insert into employee_add values(10221,"Jacob Wright",102,"+1 312","876-543-2109",4429);
insert into employee_add values(13456,"Ava Anderson",901,"+1 619","111-222-3333",5198);
insert into employee_add values(14568,"Matthew Turner",875,"+1 914","555-444-3333",3379);
insert into employee_add values(17891,"Grace Flores",901,"+1 612","888-777-6666",2879);
insert into employee_add values(18907,"William King",789,"+1 404","666-555-4444",4355);
insert into employee_add values(20013,"Harper Cooper",249,"+1 303","987-654-3210",1987);
insert into employee_add values(22346,"Alexander Hill",102,"+1 702","123-456-7890",7364);
insert into employee_add values(23560,"Chloe Brooks",789,"+1 617","222-333-4444",9073);
insert into employee_add values(24572,"James Bennett",875,"+1 512","777-888-9999",8647);
insert into employee_add values(25671,"Lily Rivera",902,"+1 215","555-222-3333",6790);
insert into employee_add values(28907,"Michael Gray",249,"+1 214","444-555-6666",7891);
insert into employee_add values(29873,"Charlotte Reed",902,"+1 503","987-654-3210",6687);

insert into employee_client values(10235,"Mark Ranson",102,"+1 217","555-649-888",6510);
insert into employee_client values(14789,"Gibbs Duhem",231,"+1 305","649-888-214",5107);
insert into employee_client values(23984,"Agatha Robbins",450,"+1 206","888-214-987",7510);
insert into employee_client values(29104,"Ava Nguyen",789,"+1 615","214-789-259",8543);
insert into employee_client values(30491,"Alan Turing",789,"+1 415","789-259-864",4387);

alter table employee_add rename employee_client;
alter table employee rename employee_parent_company;

select empid, empname, deptid from employee_parent_company
union
select empid, empname, deptid from employee_client
order by deptid;

select empid,empname,deptid from employee_parent_company
union all
select empid,empname,deptid from employee_client
order by empname;

select d.deptname, epc.deptid, count(1) from employee_client epc, department d
where epc.deptid = d.deptid
group by d.deptname, epc.deptid;

select d.deptid, d.deptname, sum(epc.salary) 
from employee_parent_company epc, department d
where d.deptid = epc.deptid
group by d.deptid order by sum(epc.salary);

select d.deptid, d.deptname, sum(epc.salary) 
from employee_parent_company epc, department d
where d.deptid = epc.deptid
group by d.deptid 
having sum(epc.salary) > 120000;

select epc.empid, epc.empname, epc.deptid, d.deptname, epc.salary
from employee_parent_company epc, department d
where epc.deptid = d.deptid
order by epc.salary desc
limit 5;

select * from employee_client where empname like 'A%';

alter table employee_client add age integer;

update employee_client set age =25 where empname="Emily Johnson";
update employee_client set age =38 where empname="Jacob Wright";
update employee_client set age =46 where empname="Mark Ranson";
update employee_client set age =25 where empname="Ava Anderson";
update employee_client set age =28 where empname="Matthew Turner";
update employee_client set age =29 where empname="Gibbs Duhem";
update employee_client set age =59 where empname="Grace Flores";
update employee_client set age =59 where empname="William King";
update employee_client set age =46 where empname="Harper Cooper";
update employee_client set age =48 where empname="Benjamin Carter";
update employee_client set age =39 where empname="Alexander Hill";
update employee_client set age =39 where empname="Chloe Brooks";
update employee_client set age =55 where empname="Agatha Robbins";
update employee_client set age =45 where empname="James Bennett";
update employee_client set age =46 where empname="Lily Rivera";
update employee_client set age =46 where empname="Michael Gray";
update employee_client set age =44 where empname="Ava Nguyen";
update employee_client set age =42 where empname="Charlotte Reed";
update employee_client set age =26 where empname="Alan Turing";
update employee_client set age =26 where empname="Samantha Adams";
update employee_client set age =27 where empname="Lucas Thompson";
update employee_client set age =28 where empname="Natalie Walker";
update employee_client set age =29 where empname="Elijah Parker";
update employee_client set age =28 where empname="Olivia Rodriguez";
update employee_client set age =55 where empname="Ethan Campbell";
update employee_client set age =44 where empname="Sophia Mitchell";

select * from employee_client where empname not like 'Ma%';

select * from employee_client where age between 25 and 35; 

select empid, empname, deptid, concat(ISD_Code,' ', PHONENO) as mobile_no from employee_client;

select e.* from employee_parent_company e where exists
(select 1 from department d where d.deptid = e.deptid and deptname = 'Accounting');

select *, row_number() over(order by empid) as row_num from employee_client where bonus > 5000;

select *, row_number() over(order by empid) as row_num from employee_parent_company
where empid = any
(select empid from employee_client where bonus > 5000);

select *, row_number() over(order by empid) as row_num from employee_parent_company
where deptid = all
(select deptid from employee_client where deptid = '102');

select Empid, empname, age,
case
	when age >= 55 then "About to retire in the next 5 years"
    when age >=40 then "About to retire in the next 10 years"
    when age >=30 then "About to retire in the next 20 years"
    else "Have a long way to go"
end as retirement
from employee_client;

select empid, empname, deptid, coalesce(empstatus, "Notice Period") as empstatus, 
ifnull(managerid, "Designation: Manager") as Reporting_to from employee_parent_company;

call select_based_on_bonus(6000, @cnt);

select @cnt as count;

select deptid, count(deptid)
from employee_parent_company
group by deptid;

with parent_cmp_dpt_emp as (select empid, empname, bonus, age from employee_client where deptid=102)
select row_number() over(order by empname) as Sl_no, empname, bonus from parent_cmp_dpt_emp 
where bonus > 5000 
order by empname; 

with emp_2022 as (select empid, empname, deptid, salary 
from employee_parent_company where joiningdate like '%2022%'),
emp as (select c.empid, c.empname, c.deptid 
from employee_client c inner join emp_2022 e on c.empname = e.empname)
select * from emp
order by empname;

alter table department add column sl_no int auto_increment primary key;

create temporary table emp_2021 as (select * from employee_parent_company where joiningdate like '%2021%');

select * from emp_2021;

drop table emp_2021;

create table customer (
row_id int auto_increment primary key,
first_name varchar(50),
mid_name varchar(50),
last_name varchar(50),
full_name varchar(100) generated always as (concat(first_name,' ',mid_name,' ',last_name))
);

insert into customer(first_name, mid_name, last_name) values ('Jenny','Mariam','Geller');
insert into customer(first_name, last_name) values ('Danny','Geller');
insert into customer(first_name, mid_name, last_name) values ('Blair','Marry','Waldrof');
insert into customer(first_name, last_name) values ('Shreya','Sharma');

select * from customer;


create table categories(
category_id int auto_increment primary key,
category_name varchar(50) not null unique
);

create table products (
product_id int auto_increment primary key,
product_name varchar(50),
price int not null check (price > 0),
category_id int,
GST float default 15.3,
constraint fk_category foreign key (category_id) references categories(category_id)
);

insert into categories(category_name) values ('Office Supplies');
insert into categories(category_name) values ('Communication');
insert into categories(category_name) values ('Electricity');
insert into categories(category_name) values ('Clothing');
insert into categories(category_name) values ('Clothing');

select * from categories;

insert into products (product_name, price, category_id) values ('Pens and Pencils',500, 100);
insert into products (product_name, price, category_id) values ('Pens and Pencils',500, 1);
insert into products (product_name, price, category_id) values ('Staplers',100 , 1);
insert into products (product_name, price, category_id) values ('Routers', 900, 2);
insert into products (product_name, price, category_id) values ('Switch Boards',300 , 3);
insert into products (product_name, price, category_id) values ('Shirts',1500, 4);
insert into products (product_name, price, category_id) values ('Trousers',2000, 4);
insert into products (product_name, price, category_id) values ('Jeans',5000, 4);

commit;

update products set product_name = 'Jeans', price = 5000, category_id = 4, gst = default where product_id = 8;

select * from products;

insert into products (product_name, price, category_id) values ('Jackets',-5000, 4);

insert into products (product_id, product_name, price, category_id, gst) 
values (8, 'Modem', 3500, 2, default)
as new
on duplicate key update
product_name = new.product_name,
price = new.price,
category_id = new.category_id,
gst = new.gst * 1.7;

select * from products;