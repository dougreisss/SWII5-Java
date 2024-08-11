create table Customer
(
	Customer_Id int(5) not null auto_increment,
    Cust_Name varchar(30), 
    City varchar(15),
    Grade int(3),
    Salesman_Id int(5),
    constraint pk_customer primary key (Customer_Id),
    constraint fk_salesman foreign key (Salesman_Id) references Salesman (Salesman_Id)
)