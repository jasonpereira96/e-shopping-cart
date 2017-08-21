/*

no mention of InnoDb
Please check

*/
CREATE DATABASE IF NOT EXISTS `supermarketdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `supermarketdb`;

CREATE TABLE Items (
    Id int NOT NULL AUTO_INCREMENT,
    IName varchar(255) NOT NULL,
    Des varchar(255),
    Cost int not null,
    Barcode varchar(255) not null unique,
    PRIMARY KEY (Id)
); 

CREATE Table Trolleys (
    TrolleyNo int PRIMARY KEY,
    Tid int not null default 1
);

CREATE TABLE Transactions (
    Id int PRIMARY KEY AUTO_INCREMENT,
    Tid int,
    Iid int,
    qty int DEFAULT 1,
    TrolleyNo int ,
    Paid int DEFAULT 0,
    
    UNIQUE KEY (Tid,Iid),
    FOREIGN KEY (Iid) REFERENCES Items(Id),
    FOREIGN KEY (TrolleyNo) REFERENCES Trolleys(TrolleyNo)
);



INSERT INTO `items` (`Id`, `IName`, `Des`, `Cost`, `Barcode`) VALUES (NULL, 'Soap', 'Lux Soap', '100', 'k001');
INSERT INTO `items` (`Id`, `IName`, `Des`, `Cost`, `Barcode`) VALUES (NULL, 'Maggi', 'Noodles', '20', 'k002');
insert into trolleys values (1,100);
INSERT INTO `transactions` (`Id`, `Tid`, `Iid`, `qty`, `TrolleyNo`, `Paid`) VALUES
(1, 100, 1, 1, 1, 0);