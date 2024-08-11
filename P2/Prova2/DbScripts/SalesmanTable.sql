create table Salesman 
(
	Salesman_Id int(5) not null auto_increment,
    Name varchar(30),
    City varchar(15),
    Commission decimal(5, 2),
    constraint pk_salesman primary key (Salesman_Id)
)