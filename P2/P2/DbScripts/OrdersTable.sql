create table Orders
(
	Ord_No int(5) not null auto_increment,
    Purch_Amt decimal(8, 2),
    Ord_Date date,
    Customer_Id int(5),
    Salesman_Id int(5),
    constraint pk_orders primary key (Ord_No),
    constraint fk_orders_customer foreign key (Customer_Id) references Customer (Customer_Id),
    constraint fk_orders_salesman foreign key (Salesman_Id) references Salesman (Salesman_Id)
)