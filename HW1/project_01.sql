/*
General Transaction
-Backing up the database
-Help menu
*/
/*
General Restrictions
-Access control
-Employee can keep record of order from a user
-Group information should be kept private to that group
-Group owner's approval is needed to join a group
-User's consent is needed to be joined to a group
*/


/*
User-level Transactions
-Register
-Sign in and out
-Post message in personal pages
-Send/Receive/Delete message

-Create/Delete/Rename group
-Search/Add/Remove user to group
-Create/Remove/Like/Unlike/Modify post
-Create/Like/Remove/Unlike/Modify comment

-Join/Unjoin group
-Create/Remove/Like/Unlike/Modify post on group page
-Create/Remove/Like/Unlike/Modify comment on group page

-Purchase one or more copies of an advertised item

-Retrieve customer's current groups
-Customer's account history
-Best-seller list of items
-Personalized item suggestion list
*/

CREATE TABLE IF NOT EXISTS Users (
	user_id int(11) NOT NULL AUTO_INCREMENT,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address varchar(95) NOT NULL,
	city varchar(35) NOT NULL,
	state char(2) NOT NULL,
	zipcode varchar(10) NOT NULL, 
	telephone char(12) NOT NULL,
	email varchar(255) NOT NULL,
	account_created datetime DEFAULT CURRENT_TIMESTAMP,
	credit_card char(16) NOT NULL, # keep account history
	purchase_rating int(1) NOT NULL, # active status in terms of making purchases
	PRIMARY KEY (user_id)
	#Can connect with other users
	#Can post message on page
	#Can follow up on Wall
	#Can like or comment on post
	#Can create group
	#Can make purchase
);

CREATE TABLE IF NOT EXISTS Preferences (
	user_id int(11) NOT NULL,
	ad_type varchar(50) NOT NULL,
	FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Groups (
	group_id int(11) NOT NULL AUTO_INCREMENT,
	group_name varchar(50) NOT NULL,
	type varchar(50) NOT NULL,
	owner_id int(11) NOT NULL,
	PRIMARY KEY (group_id),
	FOREIGN KEY (owner_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Pages (
	page_id int(11) NOT NULL AUTO_INCREMENT,
	owner_id int(11) NOT NULL,
	group_id int(11) NOT NULL,
	post_count int DEFAULT 0,
	PRIMARY KEY (page_id),
	FOREIGN KEY (owner_id) REFERENCES Users(user_id),
	FOREIGN KEY (group_id) REFERENCES Groups(group_id)
);

CREATE TABLE IF NOT EXISTS Posts (
	page_id int(11) NOT NULL,
	post_id int(11) NOT NULL AUTO_INCREMENT,
	author_id int(11) NOT NULL,
	date_created datetime DEFAULT CURRENT_TIMESTAMP,
	content text,
	comment_count int DEFAULT 0,
	PRIMARY KEY (post_id),
	FOREIGN KEY (page_id) REFERENCES Pages (page_id),
	FOREIGN KEY (author_id) REFERENCES Users (user_id)
);

CREATE TABLE IF NOT EXISTS Comments (
	post_id int(11) NOT NULL,
	comment_id int(11) NOT NULL AUTO_INCREMENT,
	author_id int(11) NOT NULL,
	date_created datetime DEFAULT CURRENT_TIMESTAMP,
	content text NOT NULL,
	PRIMARY KEY (comment_id),
	FOREIGN KEY (author_id) REFERENCES Users(user_id),
	FOREIGN KEY (post_id) REFERENCES Posts (post_id)
);

CREATE TABLE IF NOT EXISTS Messages (
	message_id int(11) NOT NULL AUTO_INCREMENT,
	date_sent datetime DEFAULT CURRENT_TIMESTAMP,
	subject varchar(50) NOT NULL,
	content text NOT NULL,
	sender int(11) NOT NULL,
	receiver int(11) NOT NULL,
	PRIMARY KEY (message_id),
	FOREIGN KEY (sender) REFERENCES Users(user_id),
	FOREIGN KEY (receiver) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS Employees (
	employee_id int(11) NOT NULL,
	ssn char(11) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address varchar(95) NOT NULL,
	city varchar(35) NOT NULL,
	state char(2) NOT NULL,
	zipcode varchar(10) NOT NULL, 
	telephone char(12) NOT NULL,
	date_started date NOT NULL, # no default exists for date in mysql
	hourly_rate decimal(7,2) NOT NULL,
	PRIMARY KEY (employee_id)
);

CREATE TABLE IF NOT EXISTS Advertisements (
	advertisement_id int(11) NOT NULL AUTO_INCREMENT,
	employee_id int(11) NOT NULL,
	type varchar(50) NOT NULL, #(e.g. clothing, computers)
	date_created datetime DEFAULT CURRENT_TIMESTAMP,
	company varchar(50) NOT NULL, #(e.g. Ford, Gap, Google)
	item_name varchar(50) NOT NULL, #(e.g. particular car, article of clothing, smartphone)
	content text NOT NULL,
	unit_price decimal(7,2) NOT NULL,
	available_units int NOT NULL,
	PRIMARY KEY (advertisement_id),
	FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


CREATE TABLE IF NOT EXISTS Sales (
	transaction_id int(11) NOT NULL AUTO_INCREMENT,
	buyer_id int(11),
	date_sold datetime DEFAULT CURRENT_TIMESTAMP,
	advertisement_id int(11) NOT NULL,
	number_of_units int NOT NULL,
	overseer_id int(11),
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (advertisement_id) REFERENCES Advertisements(advertisement_id),
	FOREIGN KEY (buyer_id) REFERENCES Users (user_id),
	FOREIGN KEY (overseer_id) REFERENCES Employees (employee_id)
);
/*
Manager-Level Transactions
-Add/Edit/Delete employee information
-Sales report for a particular month
-Listing of all items advertised on the site
-Listing of transactions by item name or user name
-Listing of revenue generated by item, item type, customer
-Determine which employee generated most revenue
-Determine which customer generated most revenue
-Listing of most active items
-Listing of customer who purchased a particular item
-Listing of all items for a given company

-Add/Delete users
*/
/*
Customer-Representative Transaction
-Create/Delete advertisement
-Record a transaction
-Add/Edit/Delete information for a customer
-Produce customer mailing list
-Produce a list of item suggestion for a given customer
*/
