use day2;
create table WebsiteVisits(
     visitor_id int ,
     visitor_name varchar(25) ,
	 visited_page varchar(25),
	 visit_time datetime
);

insert into WebsiteVisits values( 1 ,'John Doe' , 'Homepage' , now());
insert into WebsiteVisits values( 2 ,'Jane Smith' , 'Products Page' , now());
insert into WebsiteVisits values( 3 ,'Michael Johnson' , 'About Us' , now());
insert into WebsiteVisits values( 4 ,'Emily Brown' , 'Contact Page' , now());
insert into WebsiteVisits values( 5 ,'David Wilson' , 'Blog Post' , now());
select * from websitevisits;


 /* Table: WebsiteVisits          Data:
					+------------+-----------------+---------------------+---------------------+
					| visitor_id | visitor_name    | visited_page        | visit_time          |
					+------------+-----------------+---------------------+---------------------+
					| 1          | John Doe        | Homepage            | 2023-05-01 09:15:00 |
					| 2          | Jane Smith      | Products Page       | 2023-05-02 14:30:00 |
					| 3          | Michael Johnson | About Us            | 2023-05-03 11:45:00 |
					| 4          | Emily Brown     | Contact Page        | 2023-05-04 16:20:00 |
					| 5          | David Wilson    | Blog Post           | 2023-05-05 10:00:00 |
					+-----------+-----------------+---------------------+----------------------+
*/