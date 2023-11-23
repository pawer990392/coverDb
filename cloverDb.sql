/*
 Created By: I.S.C Martin Cruz Medinilla
Database: cloverDb
Creation Date: November 2023
Modifications:

Date: November 23, 2023
Changes: Additional tables are add
*/

CREATE TABLE Client(
        ClientId INTEGER NOT NULL AUTO_INCREMENT,
        CreatedBy INTEGER NOT NULL,
        UpdatedBy INTEGER NOT NULL,
        Name VARCHAR(50) NOT NULL,
        LastName VARCHAR(50) NOT NULL,
        Cell VARCHAR(10) NULL,
        Email VARCHAR(50) NULL,
        Observations VARCHAR(300),
        Active BIT DEFAULT 1,
        CreatedDate DATETIME,
        UpdatedDate DATETIME,
        CONSTRAINT PK_Client PRIMARY KEY (ClientId),
        CONSTRAINT UC_Client UNIQUE (Cell)
);

CREATE TABLE UserUC(
        UserUCId INTEGER NOT NULL AUTO_INCREMENT,
        CreatedBY INTEGER NOT NULL,
        UpdatedBy INTEGER NOT NULL,
        UserName VARCHAR(100) NOT NULL,
        Password VARCHAR(100) NOT NULL,
        LastAccess DATETIME,
        Active BIT DEFAULT 1,
        CreatedDate DATETIME,
        UpdatedDate DATETIME,
        CONSTRAINT PK_UserUC PRIMARY KEY (UserUCId)
);

CREATE TABLE Raffle(
    RaffleId INTEGER NOT NULL AUTO_INCREMENT,
    CreatedBy INTEGER NOT NULL,
    UpdatedBy INTEGER NOT NULL,
    Description VARCHAR(300),
    StartDate DATETIME,
    RaffleDate DATETIME,
    Active BIT DEFAULT 1,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    CONSTRAINT PK_Raffle PRIMARY KEY (RaffleId)
);

CREATE TABLE Ticket(
    TicketId INTEGER NOT NULL AUTO_INCREMENT,
    RaffleId INTEGER NOT NULL,
    ClientId INTEGER NOT NULL,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BIT DEFAULT 1,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    CONSTRAINT PK_Ticket PRIMARY KEY (TicketId),
    CONSTRAINT FK_RaffleTicket FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId),
    CONSTRAINT FK_ClientTicket FOREIGN KEY (ClientId) REFERENCES Client(ClientId)
);

CREATE TABLE Prize(
    PrizeId INTEGER NOT NULL AUTO_INCREMENT,
    RaffleId INTEGER NOT NULL,
    CreatedBy INTEGER NOT NULL,
    UpdatedBy INTEGER NOT NULL,
    Product VARCHAR(100) NOT NULL,
    Active BIT DEFAULT 1,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    CONSTRAINT PK_Prize PRIMARY KEY (PrizeId),
    CONSTRAINT FK_RafflePrize FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId)
);

CREATE TABLE Winner(
    WinnerId INTEGER NOT NULL AUTO_INCREMENT,
    TicketId INTEGER NOT NULL,
    PrizeId INTEGER NOT NULL,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BIT DEFAULT 1,
    CreatedDate DATETIME,
    UpdatedDate DATETIME,
    CONSTRAINT PK_Winner PRIMARY KEY (WinnerId),
    CONSTRAINT FK_WinnerTicket FOREIGN KEY (TicketId) REFERENCES Ticket(TicketId),
    CONSTRAINT FK_PrizeTicket FOREIGN KEY (PrizeId) REFERENCES Prize(PrizeId),

);
   
