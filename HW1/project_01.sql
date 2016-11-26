CREATE TABLE IF NOT EXISTS Users (
	userId int(11) NOT NULL AUTO_INCREMENT,
    userPassword CHAR(64) NOT NULL,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	address varchar(95) NOT NULL,
	city varchar(35) NOT NULL,
	state char(2) NOT NULL,
	zipcode varchar(10) NOT NULL, 
	telephone char(12) NOT NULL,
	email varchar(255) NOT NULL,
	accountCreated datetime DEFAULT CURRENT_TIMESTAMP,
	creditCard char(16), # keep account history
	purchaseRating int(1), # active status in terms of making purchases
	PRIMARY KEY (userId),
	FULLTEXT(firstName, lastName)
);

CREATE TABLE IF NOT EXISTS Preferences (
	userId int(11) NOT NULL,
	adType varchar(50) NOT NULL,
	FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE IF NOT EXISTS Groups (
	groupId int(11) NOT NULL AUTO_INCREMENT,
	groupName varchar(50) NOT NULL,
	type varchar(50) NOT NULL,
	ownerId int(11) NOT NULL,
	PRIMARY KEY (groupId),
	FOREIGN KEY (ownerId) REFERENCES Users(userId)
);

CREATE TABLE IF NOT EXISTS Pages (
	pageId int(11) NOT NULL AUTO_INCREMENT,
	ownerId int(11),
	groupId int(11),
	postCount int DEFAULT 0,
	PRIMARY KEY (pageId),
	FOREIGN KEY (ownerId) REFERENCES Users(userId),
	FOREIGN KEY (groupId) REFERENCES Groups(groupId)
);

CREATE TABLE IF NOT EXISTS Posts (
	pageId int(11) NOT NULL,
	postId int(11) NOT NULL AUTO_INCREMENT,
	authorId int(11) NOT NULL,
	dateCreated datetime DEFAULT CURRENT_TIMESTAMP,
	content text,
	commentCount int DEFAULT 0,
	PRIMARY KEY (postId),
	FOREIGN KEY (pageId) REFERENCES Pages (pageId),
	FOREIGN KEY (authorId) REFERENCES Users (userId)
);

CREATE TABLE IF NOT EXISTS Comments (
	postId int(11) NOT NULL,
	commentId int(11) NOT NULL AUTO_INCREMENT,
	authorId int(11) NOT NULL,
	dateCreated datetime DEFAULT CURRENT_TIMESTAMP,
	content text NOT NULL,
	PRIMARY KEY (commentId),
	FOREIGN KEY (authorId) REFERENCES Users(userId),
	FOREIGN KEY (postId) REFERENCES Posts (postId)
);

CREATE TABLE IF NOT EXISTS Messages (
	messageId int(11) NOT NULL AUTO_INCREMENT,
	dateSent datetime DEFAULT CURRENT_TIMESTAMP,
	subject varchar(50) DEFAULT '(No Subject)',
	content text,
	sender int(11) NOT NULL,
	receiver int(11) NOT NULL,
	PRIMARY KEY (messageId),
	FOREIGN KEY (sender) REFERENCES Users(userId),
	FOREIGN KEY (receiver) REFERENCES Users(userId)
);

CREATE TABLE IF NOT EXISTS Friends (
	friend1 int(11) NOT NULL,
    friend2 int(11) NOT NULL,
    PRIMARY KEY (friend1, friend2),
    FOREIGN KEY (friend1) REFERENCES Users(userId),
    FOREIGN KEY (friend2) REFERENCES Users(userId)
);

CREATE TABLE IF NOT EXISTS LikedPosts (
	userId int(11) NOT NULL,
    postId int(11) NOT NULL,
    PRIMARY KEY (userId, postId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (postId) REFERENCES Posts(postId)
);

CREATE TABLE IF NOT EXISTS LikedComments (
	userId int(11) NOT NULL,
    commentId int(11) NOT NULL,
    PRIMARY KEY (userId, commentId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (commentId) REFERENCES Comments(commentId)
);

CREATE TABLE IF NOT EXISTS GroupMembers (
	userId int(11) NOT NULL,
    groupId int(11) NOT NULL,
    PRIMARY KEY (userId, groupId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (groupId) REFERENCES Groups(groupId)
);

CREATE TABLE IF NOT EXISTS Employees (
	employeeId int(11) NOT NULL AUTO_INCREMENT,
    employeePassword CHAR(64) NOT NULL,
	ssn char(11) NOT NULL,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	address varchar(95) NOT NULL,
	city varchar(35) NOT NULL,
	state char(2) NOT NULL,
	zipcode varchar(10) NOT NULL, 
	telephone char(12) NOT NULL,
	dateStarted date NOT NULL, # no default exists for date in mysql
	hourlyRate decimal(7,2) NOT NULL,
    isManager BOOLEAN NOT NULL,
	PRIMARY KEY (employeeId)
);

CREATE TABLE IF NOT EXISTS Advertisements (
	advertisementId int(11) NOT NULL AUTO_INCREMENT,
	employeeId int(11) NOT NULL,
	type varchar(50) NOT NULL, #(e.g. clothing, computers)
	dateCreated datetime DEFAULT CURRENT_TIMESTAMP,
	company varchar(50) NOT NULL, #(e.g. Ford, Gap, Google)
	itemName varchar(50) NOT NULL, #(e.g. particular car, article of clothing, smartphone)
	content text NOT NULL,
	unitPrice decimal(7,2) NOT NULL,
	availableUnits int NOT NULL,
	PRIMARY KEY (advertisementId),
	FOREIGN KEY (employeeId) REFERENCES Employees(employeeId)
);


CREATE TABLE IF NOT EXISTS Sales (
	transactionId int(11) NOT NULL AUTO_INCREMENT,
	buyerId int(11) NOT NULL,
    cardNumber char(16) NOT NULL,
	dateSold datetime DEFAULT CURRENT_TIMESTAMP,
	advertisementId int(11) NOT NULL,
	numberOfUnits int NOT NULL,
	overseerId int(11),
    chargeAmount decimal(10,2) NOT NULL,
	PRIMARY KEY (transactionId),
	FOREIGN KEY (advertisementId) REFERENCES Advertisements(advertisementId),
	FOREIGN KEY (buyerId) REFERENCES Users(userId),
	FOREIGN KEY (overseerId) REFERENCES Employees(employeeId)
);
