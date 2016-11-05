CREATE TABLE IF NOT EXISTS Users (
	user_id int(11) NOT NULL AUTO_INCREMENT,
    user_password CHAR(64) NOT NULL,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	address varchar(95) NOT NULL,
	city varchar(35) NOT NULL,
	state char(2) NOT NULL,
	zipcode varchar(10) NOT NULL, 
	telephone char(12) NOT NULL,
	email varchar(255) NOT NULL,
	account_created datetime DEFAULT CURRENT_TIMESTAMP,
	credit_card char(16), # keep account history
	purchase_rating int(1) NOT NULL, # active status in terms of making purchases
	PRIMARY KEY (user_id),
	FULLTEXT(first_name, last_name)
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
	owner_id int(11),
	group_id int(11),
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

CREATE TABLE IF NOT EXISTS Friends (
	friend1 int(11) NOT NULL,
    friend2 int(11) NOT NULL,
    PRIMARY KEY (friend1, friend2),
    FOREIGN KEY (friend1) REFERENCES Users(user_id),
    FOREIGN KEY (friend2) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS LikedPosts (
	user_id int(11) NOT NULL,
    post_id int(11) NOT NULL,
    PRIMARY KEY (user_id, post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE IF NOT EXISTS LikedComments (
	user_id int(11) NOT NULL,
    comment_id int(11) NOT NULL,
    PRIMARY KEY (user_id, comment_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (comment_id) REFERENCES Comments(comment_id)
);

CREATE TABLE IF NOT EXISTS GroupMembers (
	user_id int(11) NOT NULL,
    group_id int(11) NOT NULL,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (group_id) REFERENCES Groups(group_id)
);

CREATE TABLE IF NOT EXISTS Employees (
	employee_id int(11) NOT NULL AUTO_INCREMENT,
    employee_password CHAR(64) NOT NULL,
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
    is_manager BOOLEAN NOT NULL,
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
	buyer_id int(11) NOT NULL,
    card_number char(16) NOT NULL,
	date_sold datetime DEFAULT CURRENT_TIMESTAMP,
	advertisement_id int(11) NOT NULL,
	number_of_units int NOT NULL,
	overseer_id int(11),
    charge_amount decimal(10,2) NOT NULL,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (advertisement_id) REFERENCES Advertisements(advertisement_id),
	FOREIGN KEY (buyer_id) REFERENCES Users (user_id),
	FOREIGN KEY (overseer_id) REFERENCES Employees (employee_id)
);
