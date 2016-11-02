 INSERT INTO Users (user_id, user_password, first_name, last_name, address, city, state, zipcode,
					telephone, email, account_created, credit_card, purchase_rating)
                       VALUES
                       (1, "6ca9d2479e0081472bf07069274c3c06", "Bryan", "Koelbel", "123 South Dr", "Stony Brook",
                       "NY", "11790", "631-123-4567", "bryan.koelbel@stonybrook.edu", '2016-04-27 10:25:32', "1947234500008264", 1); # password = "sdfsdgf@23423" HD5 encoded

INSERT INTO Users VALUES
                       (2, "25f9e794323b453885f5181f1b624d0b", "Jeonghoon", "Kim", "131 Sunnyside Ave", "Stony Brook",
                       "NY", "11790", "516-244-9813", "jeonghoon.kim@stonybrook.edu", '2016-04-28 09:13:12', NULL, 0); # password = "123456789"
			
INSERT INTO Users VALUES
                       (3, "c44a471bd78cc6c2fea32b9fe028d30a", "Chaerin", "Kim", "24 Oakwood Rd", "Port Jefferson",
                       "NY", "11777", "631-343-2265", "chaerin.kim@stonybrook.edu", '2016-04-28 15:45:07', "9999444477772222", 2); # password = "asdfghjkl"
                                              
INSERT INTO Users VALUES
                       (4, "f8c0921e52fb066b4d69e8dbbe70d230", "Paul", "Fodor", "5 East Ave", "Smithtown",
                       "NY", "11787", "516-333-7635", "paul.fodor@stonybrook.edu", '2016-06-13 08:00:00', "1111111111111111", 4); # password = "mySQL"
                       
INSERT INTO Users VALUES
                       (5, "5c7523cad7e20bdfc86e5f1ed4e52ff3", "Jennifer", "Wong", "32 Creativename St", "Commack",
                       "NY", "11725", "631-130-2398", "jwong@cs.sunysb.edu", '2016-06-15 06:30:11', "2234983513786645", 5); # password = "s3@w0lf"
                       
INSERT INTO Users VALUES
                       (6, "bd06b11bc05c5e6efbe587e7df91e4b4", "Tim", "Cook", "1 Infinite Loop", "Cupertino",
                       "CA", "95014", "408-996-1010", "tcook@apple.com", '2016-07-01 09:25:33', NULL, 0); # password = "iambetterthanstevejobs"
                       
INSERT INTO Users VALUES
                       (7, "aaef13f2e58a39be28c7d86a2a2e6a1b", "Mark", "Zuckerberg", "1 Hacker Way", "Menlo Park",
                       "CA", "94025", "650-543-4800", "zuck@facebook.com", '2016-07-01 09:25:33', "4444999912345555", 250); # password = "wolfiebook"

INSERT INTO Users VALUES
                       (8, "5f4dcc3b5aa765d61d8327deb882cf99", "Ben", "Carson", "43 Main St", "West Palm Beach",
                       "FL", "33411", "231-456-8888", "benny1248@yahoo.com", '2016-07-30 22:15:01', "3511927539490047", 5001); # password = "password"

INSERT INTO Users VALUES
                       (9, "25f9e794323b453885f5181f1b624d0b", "Melissa", "Randomperson", "236 Lancaster St", "Bloomington",
                       "IN", "47401", "212-985-6439", "somerando636@gmail.com", '2016-08-04 19:55:59', "1234123412341234", 5); # password = "123456789"
                       
INSERT INTO Users VALUES
                       (10, "25f9e794323b453885f5181f1b624d0b", "Joe", "Randomperson", "236 Lancaster St", "Bloomington",
                       "IN", "47401", "212-985-6439", "someotherrando636@gmail.com", '2016-08-08 09:25:33', NULL, 0); # password = "123456789"
                       
                       
INSERT INTO Preferences (user_id, ad_type) VALUES
			(1, "cars");
                        
INSERT INTO Preferences VALUES
			(1, "clothing");

INSERT INTO Preferences VALUES
			(6, "computers");
                        
INSERT INTO Preferences VALUES
			(4, "food");
                        
INSERT INTO Preferences VALUES
			(5, "cars");
                        
INSERT INTO Preferences VALUES
			(9, "books");
                        
INSERT INTO Preferences VALUES
			(2, "movies");

INSERT INTO Preferences VALUES
			(9, "computers");
                        
INSERT INTO Preferences VALUES
			(7, "clothing");
                        
INSERT INTO Preferences VALUES
			(4, "cars");
                        
INSERT INTO Groups (group_id, group_name, type, owner_id) VALUES
			(1, "CSE305 Project", "team", 3);
                        
INSERT INTO Groups VALUES
			(2, "Stony Brook CS Department", "organization", 5);

INSERT INTO Groups VALUES
			(3, "Illuminati", "organization", 6);

INSERT INTO Groups VALUES
			(4, "Car Fans", "club", 5);

INSERT INTO Groups VALUES
			(5, "Volunteer Club", "club", 9);
                        
INSERT INTO Groups VALUES
			(6, "Stony Brook Swim Team", "team", 4);
                        
INSERT INTO Groups VALUES
			(7, "Pen Pals", "club", 9);

INSERT INTO Groups VALUES
			(8, "Republican National Committee", "organization", 8);

INSERT INTO Groups VALUES
			(9, "ABC Club", "club", 2);

INSERT INTO Groups VALUES
			(10, "123 Club", "club", 3);
                        
INSERT INTO Pages (page_id, owner_id, group_id, post_count) VALUES
			(1, 1, NULL, 1);
                        
INSERT INTO Pages VALUES
			(2, 2, NULL, 1);

INSERT INTO Pages VALUES
			(3, 3, NULL, 2);

INSERT INTO Pages VALUES
			(4, 4, NULL, 0);

INSERT INTO Pages VALUES
			(5, 5, NULL, 0);

INSERT INTO Pages VALUES
			(6, 6, NULL, 0);

INSERT INTO Pages VALUES
			(7, 7, NULL, 0);

INSERT INTO Pages VALUES
			(8, 8, NULL, 0);
                        
INSERT INTO Pages VALUES
			(9, 9, NULL, 0);

INSERT INTO Pages VALUES
			(10, 10, NULL, 0);
                        
INSERT INTO Pages VALUES
			(11, NULL, 1, 2);

INSERT INTO Pages VALUES
			(12, NULL, 2, 3);
                        
INSERT INTO Pages VALUES
			(13, NULL, 3, 1);
                        
INSERT INTO Pages VALUES
			(14, NULL, 4, 0);
                        
INSERT INTO Pages VALUES
			(15, NULL, 5, 0);
                        
INSERT INTO Pages VALUES
			(16, NULL, 6, 0);

INSERT INTO Pages VALUES
			(17, NULL, 7, 0);
                        
INSERT INTO Pages VALUES
			(18, NULL, 8, 0);
                        
INSERT INTO Pages VALUES
			(19, NULL, 9, 0);
                        
INSERT INTO Pages VALUES
			(20, NULL, 10, 0);
                        
INSERT INTO Posts (page_id, post_id, author_id, date_created, content, comment_count) VALUES
			(1, 1, 1, '2016-09-02 09:25:33', "Hello, World!", 2);
                        
INSERT INTO Posts VALUES
			(2, 2, 2, '2016-09-02 10:30:00', "This is my wall.", 1);
                        
INSERT INTO Posts VALUES
			(3, 3, 1, '2016-09-05 23:25:33', "Hello", 0);
                        
INSERT INTO Posts VALUES
			(3, 4, 2, '2016-09-07 22:05:00', "Hello 2", 0);
                        
INSERT INTO Posts VALUES
			(12, 5, 4, '2016-09-08 10:00:11', "I teach CSE305", 2);
                        
INSERT INTO Posts VALUES
			(12, 6, 5, '2016-09-10 04:00:01', "Computers are fun", 1);
                        
INSERT INTO Posts VALUES
			(12, 7, 4, '2016-09-10 04:33:22', "I also teach CSE114", 0);

INSERT INTO Posts VALUES
			(11, 8, 3, '2016-09-10 13:11:01', "I'm working on assignment 2", 2);
                        
INSERT INTO Posts VALUES
			(11, 9, 2, '2016-10-20 09:25:33', "I updated the sql file", 1);
                        
INSERT INTO Posts VALUES
			(13, 10, 7, '2016-10-21 09:25:33', "Yay!", 1);
                        
INSERT INTO Comments (post_id, comment_id, author_id, date_created, content) VALUES
			(1, 1, 2, '2016-09-02 09:35:33', "Hello 1!");
                        
INSERT INTO Comments VALUES
			(1, 2, 4, '2016-09-02 10:11:01', "Hello 2!");
                        
INSERT INTO Comments VALUES
			(2, 3, 2, '2016-10-02 10:30:00', "How are you?");
                        
INSERT INTO Comments VALUES
			(5, 4, 5, '2016-09-09 10:30:00', "I don't");
                        
INSERT INTO Comments VALUES
			(5, 5, 4, '2016-09-09 14:23:01', "I do");
                        
INSERT INTO Comments VALUES
			(6, 6, 4, '2016-09-11 10:30:00', "I agree");
                        
INSERT INTO Comments VALUES
			(8, 7, 1, '2016-09-17 08:33:13', "Cool");
                        
INSERT INTO Comments VALUES
			(8, 8, 2, '2016-09-18 16:14:01', "Me too");
                        
INSERT INTO Comments VALUES
			(9, 9, 3, '2016-10-20 10:30:00', "Thanks!");
                        
INSERT INTO Comments VALUES
			(10, 10, 6, '2016-10-22 13:02:17', "Woohoo!");
                        
INSERT INTO Messages (message_id, date_sent, subject, content, sender, receiver) VALUES
			(1, '2016-09-02 10:30:00', "Hello", "This is a sample message", 1, 2);
                        
INSERT INTO Messages VALUES
			(2, '2016-09-03 10:30:00', "Hello again", "This is another sample message", 1, 2);
                        
INSERT INTO Messages VALUES
			(3, '2016-09-04 11:33:00', "RE: Hello again", "This is a sample reply", 2, 1);
                        
INSERT INTO Messages VALUES
			(4, '2016-10-13 01:30:00', "Exam Grade", "Your grade is 96", 4, 3);
            
INSERT INTO Messages VALUES
			(5, '2016-10-14 18:13:56', "Good job", "Wolfiebook > Facebook", 7, 2);
            
INSERT INTO Messages VALUES
			(6, '2016-10-15 13:33:33', "hey there", "aefqeipjqfipjqw", 8, 9);
  
INSERT INTO Messages VALUES
			(7, '2016-10-15 14:30:00', "Shopping list", "Milk, eggs, juice", 9, 10);

INSERT INTO Messages VALUES
			(8, '2016-10-18 12:00:56', "Party", "Want to come over Friday?", 6, 7);
                        
INSERT INTO Messages VALUES
			(9, '2016-10-18 12:01:50', "RE: Party", "Sure :-)", 7, 6);
            
INSERT INTO Messages VALUES
			(10, '2016-10-25 10:30:00', "Classes", "What are you teaching next semester?", 5, 4);
            
INSERT INTO Friends (friend1, friend2) VALUES
			(1, 2);
            
INSERT INTO Friends VALUES
			(1, 3);
            
INSERT INTO Friends VALUES
			(2, 3);
            
INSERT INTO Friends VALUES
			(9, 10);
            
INSERT INTO Friends VALUES
			(6, 7);
            
INSERT INTO Friends VALUES
			(4, 5);
            
INSERT INTO Friends VALUES
			(3, 4);
            
INSERT INTO Friends VALUES
			(2, 4);
            
INSERT INTO Friends VALUES
			(7, 8);

INSERT INTO Friends VALUES
			(8, 9);
            
INSERT INTO Friends VALUES
			(2, 7);

INSERT INTO LikedPosts (user_id, post_id) VALUES
			(2, 1);
            
INSERT INTO LikedPosts VALUES
			(3, 1);
            
INSERT INTO LikedPosts VALUES
			(4, 2);
            
INSERT INTO LikedPosts VALUES
			(5, 5);
            
INSERT INTO LikedPosts VALUES
			(6, 10);
            
INSERT INTO LikedPosts VALUES
			(8, 10);
            
INSERT INTO LikedPosts VALUES
			(4, 6);
            
INSERT INTO LikedPosts VALUES
			(8, 1);
            
INSERT INTO LikedPosts VALUES
			(8, 2);
            
INSERT INTO LikedPosts VALUES
			(3, 2);

INSERT INTO LikedComments (user_id, comment_id) VALUES
			(1, 3);
		
INSERT INTO LikedComments VALUES
			(2, 3);

INSERT INTO LikedComments VALUES
			(4, 4);
            
INSERT INTO LikedComments VALUES
			(5, 5);
            
INSERT INTO LikedComments VALUES
			(4, 5);
            
INSERT INTO LikedComments VALUES
			(5, 4);
            
INSERT INTO LikedComments VALUES
			(7, 10);
            
INSERT INTO LikedComments VALUES
			(8, 10);
            
INSERT INTO LikedComments VALUES
			(1, 9);
            
INSERT INTO LikedComments VALUES
			(2, 7);

INSERT INTO GroupMembers (user_id, group_id) VALUES
			(1, 1);
            
INSERT INTO GroupMembers VALUES
			(2, 1);
            
INSERT INTO GroupMembers VALUES
			(3, 1);
            
INSERT INTO GroupMembers VALUES
			(4, 2);
            
INSERT INTO GroupMembers VALUES
			(5, 2);

INSERT INTO GroupMembers VALUES
			(6, 3);
            
INSERT INTO GroupMembers VALUES
			(7, 3);
            
INSERT INTO GroupMembers VALUES
			(8, 3);
            
INSERT INTO GroupMembers VALUES
			(5, 4);
            
INSERT INTO GroupMembers VALUES
			(4, 4);
            
INSERT INTO GroupMembers VALUES
			(1, 4);

INSERT INTO GroupMembers VALUES
			(10, 5);
            
INSERT INTO GroupMembers VALUES
			(9, 5);
            
INSERT INTO GroupMembers VALUES
			(4, 6);
            
INSERT INTO GroupMembers VALUES
			(9, 7);
            
INSERT INTO GroupMembers VALUES
			(8, 7);
            
INSERT INTO GroupMembers VALUES
			(6, 7);
            
INSERT INTO GroupMembers VALUES
			(8, 8);
            
INSERT INTO GroupMembers VALUES
			(2, 9);
            
INSERT INTO GroupMembers VALUES
			(3, 9);
            
INSERT INTO GroupMembers VALUES
			(5, 9);
            
INSERT INTO GroupMembers VALUES
			(10, 10);
            
INSERT INTO GroupMembers VALUES
			(6, 10);


INSERT INTO Employees (employee_id, employee_password, ssn, first_name, last_name, address,
						city, state, zipcode, telephone, date_started, hourly_rate,
                        is_manager) VALUES
			(1, "5f4dcc3b5aa765d61d8327deb882cf99", "123-45-6789", "John", "Doe", "7746 South Young St",
            "Halethorpe", "MD", "21227", "123-456-7890", "2012-06-14", 9.25, TRUE); # password is "password"
            
INSERT INTO Employees VALUES
			(2, "5f4dcc3b5aa765d61d8327deb882cf99", "246-83-6790", "Jane", "Doe", "7746 North Young St",
            "Halethorpe", "MD", "21227", "123-456-7890", "2012-06-18", 10.25, TRUE); # password is "password"
            
INSERT INTO Employees VALUES
			(3, "5f4dcc3b5aa765d61d8327deb882cf99", "111-34-2020", "Angus", "McDonald", "717 Lincoln St",
            "Dayton", "OH", "45420", "222-328-7712", "2016-08-03", 3.30, FALSE); # password is "password"
            
INSERT INTO Employees VALUES
			(4, "5f4dcc3b5aa765d61d8327deb882cf99", "222-45-3131", "Oliver", "Williams", "200 Lincoln St",
            "Dayton", "OH", "45420", "913-123-0924", "2016-03-23", 9.00, FALSE); # password is "password"

INSERT INTO Employees VALUES
			(5, "5f4dcc3b5aa765d61d8327deb882cf99", "123-54-9813", "Lisa", "Hollands", "81 Second Ave",
            "Matawan", "NJ", "07747", "346-912-8701", "1993-10-13", 45.00, TRUE); # password is "password"

INSERT INTO Employees VALUES
			(6, "5f4dcc3b5aa765d61d8327deb882cf99", "213-13-3568", "Marcus", "Smith", "401 Magnolia St",
            "Aliquippa", "PA", "15001", "121-984-3256", "2014-11-25", 12.00, FALSE); # password is "password"

INSERT INTO Employees VALUES
			(7, "5f4dcc3b5aa765d61d8327deb882cf99", "074-26-1348", "Joe", "Schmoe", "123 North St",
            "Aliquippa", "PA", "15001", "121-234-1349", "2014-11-25", 10.00, FALSE); # password is "password"

INSERT INTO Employees VALUES
			(8, "5f4dcc3b5aa765d61d8327deb882cf99", "213-13-3568", "Jenna", "Sanders", "38 Somewhere Dr",
            "Aliquippa", "PA", "15001", "121-434-2382", "2014-11-23", 10.15, FALSE); # password is "password"

INSERT INTO Employees VALUES
			(9, "5f4dcc3b5aa765d61d8327deb882cf99", "012-86-2016", "Sofia", "Stocio", "7114 Stonybrook Ct",
            "Central Islip", "NY", "11722", "631-983-3999", "2015-04-03", 11.50, FALSE); # password is "password"

INSERT INTO Employees VALUES
			(10, "5f4dcc3b5aa765d61d8327deb882cf99", "312-31-4311", "Kevin", "Nadeau", "880 Winchester Rd",
            "Concord", "NH", "03301", "121-872-0894", "2013-06-01", 11.00, FALSE); # password is "password"

INSERT INTO Advertisements (advertisement_id, employee_id, type, date_created,
			company, item_name, content, unit_price, available_units) VALUES
            (1, 1, "cars", '2016-06-14 10:30:00', "Ford", "2016 Ford Somethingorother", "A car with 4 wheel drive!",
            25000.00, 1000);
            
INSERT INTO Advertisements VALUES
            (2, 5, "cars", '2016-06-14 10:30:00', "Subaru", "2016 Subaru Outback", "The best car you'll ever drive.",
            22000.00, 2000);
            
INSERT INTO Advertisements VALUES
            (3, 5, "clothing", '2016-06-14 10:30:00', "Levi's", "Levi's Boot Cut Jeans", "Comfy jeans!",
             59.99, 135);
             
INSERT INTO Advertisements VALUES
            (4, 7, "food", '2016-07-03 10:30:00', "Subway", "Subway Sandwiches", "Eat fresh(tm).",
             5.00, 100000);
             
INSERT INTO Advertisements VALUES
            (5, 6, "computers", '2016-07-15 10:30:00', "Apple", "Apple Macbook Pro", "A fancy new computer.",
             999.99, 50000);
             
INSERT INTO Advertisements VALUES
            (6, 6, "computers", '2016-07-15 10:30:00', "Samsung", "Samsung Galaxy Note 7", "Hope it doesn't explode.",
             999.99, 50000);
             
INSERT INTO Advertisements VALUES
            (7, 4, "movies", '2016-09-05 10:30:00', "Disney", "Doctor Strange", "Buy tickets for the new Marvel movie!",
             9.99, 1000000);
             
INSERT INTO Advertisements VALUES
            (8, 3, "books", '2016-09-07 10:30:00', "Random House", "Database Systems for Dummies", "Learn MySQL with this new book.",
             29.99, 250000);
             
INSERT INTO Advertisements VALUES
            (9, 8, "toys", '2016-09-08 10:30:00', "Tiger Electronics", "Furby", "Own a weird robot pet!",
             59.99, 123000);
             
INSERT INTO Advertisements VALUES
            (10, 10, "cars", '2016-09-13 10:30:00', "Honda", "2017 Honda Accord", "A reliable car.",
             22355.00, 67000);
             
INSERT INTO Sales (transaction_id, buyer_id, card_number, date_sold, advertisement_id,
					number_of_units, overseer_id, charge_amount) VALUES
			(1, 1, "1947234500008264", '2016-07-14 10:30:00', 1, 1, 1, 25000.00);
            
INSERT INTO Sales VALUES
			(2, 7, "4444999912345555", '2016-07-18 10:30:00', 2, 250, 3, 5500000.00);
            
INSERT INTO Sales VALUES
			(3, 9, "1234123412341234", '2016-08-01 11:20:00', 5, 5, 6, 4999.95);
            
INSERT INTO Sales VALUES
			(4, 6, "9000900080006000", '2016-08-19 10:30:00', 5, 500, 6, 499995.00);
            
INSERT INTO Sales VALUES
			(5, 8, "3511927539490047", '2016-10-03 10:20:00', 9, 5000, 8, 299950.00);
            
INSERT INTO Sales VALUES
			(6, 8, "3511927539490047", '2016-10-04 04:31:00', 10, 1, 10, 22355.00);
            
INSERT INTO Sales VALUES
			(7, 4, "1111111111111111", '2016-10-20 10:30:00', 8, 1, 3, 29.99);
            
INSERT INTO Sales VALUES
			(8, 4, "1111111111111111", '2016-10-20 19:30:00', 8, 3, 3, 89.97);
            
INSERT INTO Sales VALUES
			(9, 3, "9999444477772222", '2016-10-22 10:30:00', 4, 2, 7, 10.00);

INSERT INTO Sales VALUES
			(10, 5, "2234983513786645", '2016-10-25 10:30:00', 6, 5, 6, 4999.95);