				
              
                +------+---------+------------+--------+		
				| year | country | product    | profit |		
				+------+---------+------------+--------+		
				| 2000 | Finland | Computer   |   1500 | 		
				| 2000 | Finland | Phone      |    100 | 				
				| 2000 | India   | Calculator |     75 | 		
				| 2000 | India   | Calculator |     75 | 			
				| 2000 | India   | Computer   |   1200 | 		
				| 2000 | USA     | Calculator |     75 |		
				| 2000 | USA     | Computer   |   1500 |				
				| 2001 | USA     | Calculator |     50 |		
				| 2001 | USA     | Computer   |   1500 |		
				| 2001 | USA     | Computer   |   1200 |		
				| 2001 | USA     | TV         |    150 |
				| 2001 | Finland | Phone      |     10 |
				+------+---------+------------+--------+


				SELECT year, MAX(profit)
				FROM table
				GROUP BY year;



				+------+---------+------------+--------+		
				| year | country | product    | profit |		SELECT year, MAX(profit), MIN(PROFIT)
				+------+---------+------------+--------+		FROM table
				| 2000 | Finland | Computer   |   1500 | 		GROUP BY year;
				| 2000 | Finland | Phone      |    100 | 				
				| 2000 | India   | Calculator |     75 | 		+------+--------+-------------+
				| 2000 | India   | Calculator |     75 | 		| year | profit | MIN(profit) |		
				| 2000 | India   | Computer   |   1200 | 		+------+--------+-------------+
				| 2000 | USA     | Calculator |     75 |		| 2000 | 1500   | 75
				| 2000 | USA     | Computer   |   1500 |		| 2001 | 1500   | 10
				+------+---------+------------+--------+		+------+--------+-------------+
				| 2001 | USA     | Calculator |     50 |		
				| 2001 | USA     | Computer   |   1500 |		
				| 2001 | USA     | Computer   |   1200 |		
				| 2001 | USA     | TV         |    150 |
				| 2001 | Finland | Phone      |     10 |
				+------+---------+------------+--------+
 
 				
                
                +------+---------+------------+--------+		
				| year | country | product    | profit |		
				+------+---------+------------+--------+		
				| 2000 | Finland | Computer   |   1500 | 		
				| 2000 | Finland | Phone      |    100 | 				
				| 2000 | India   | Calculator |     75 | 		
				| 2000 | India   | Calculator |     75 | 			
				| 2000 | India   | Computer   |   1200 | 		
				| 2000 | USA     | Calculator |     75 |		
				| 2000 | USA     | Computer   |   1500 |				
				| 2001 | USA     | Calculator |     50 |		
				| 2001 | USA     | Computer   |   1500 |		
				| 2001 | USA     | Computer   |   1200 |		
				| 2001 | USA     | TV         |    150 |
				| 2001 | Finland | Phone      |     10 |
				+------+---------+------------+--------+

				SELECT country, MAX(profit)
				FROM table
				GROUP BY country;




				+------+---------+------------+--------+		
				| year | country | product    | profit |		
				+------+---------+------------+--------+		SELECT country, MAX(profit)	
				| 2000 | Finland | Computer   |   1500 |		FROM table			
				| 2000 | Finland | Phone      |    100 |		GROUP BY country;			
				| 2001 | Finland | Phone      |     10 |		
				+------+---------+------------+--------+					
				| 2000 | India   | Calculator |     75 |		+---------+-------------+	 
				| 2000 | India   | Calculator |     75 |		| country | MAX(profit)   |	 				
				| 2000 | India   | Computer   |   1200 |		+---------+-------------+	 
				+------+---------+------------+--------+		| Finland |  	   1500 |		
				| 2000 | USA     | Calculator |     75 |		| India   |        1500 |		
				| 2000 | USA     | Computer   |   1500 |		| USA     |        1500 |		
				| 2001 | USA     | Calculator |     50 |		+---------+-------------+	
				| 2001 | USA     | Computer   |   1500 |		 
				| 2001 | USA     | Computer   |   1200 |		
				| 2001 | USA     | TV         |    150 |
				| 2001 | USA     | TV         |    100 |
				+------+---------+------------+--------+



                +------+---------+------------+--------+		
				| year | country | product    | profit |		
				+------+---------+------------+--------+		
				| 2000 | Finland | Computer   |   1500 | 		
				| 2000 | Finland | Phone      |    100 | 				
				| 2000 | India   | Calculator |     75 | 		
				| 2000 | India   | Calculator |     75 | 			
				| 2000 | India   | Computer   |   1200 | 		
				| 2000 | USA     | Calculator |     75 |		
				| 2000 | USA     | Computer   |   1500 |				
				| 2001 | USA     | Calculator |     50 |		
				| 2001 | USA     | Computer   |   1500 |		
				| 2001 | USA     | Computer   |   1200 |		
				| 2001 | USA     | TV         |    150 |
				| 2001 | Finland | Phone      |     10 |
				+------+---------+------------+--------+

				SELECT `year`, country, MAX(profit)
				FROM table
				GROUP BY `year`, country;



                +------+---------+------------+--------+		
				| year | country | product    | profit |		
				+------+---------+------------+--------+			SELECT `year`, country, MAX(profit)
                | 2000 | Finland | Computer   |   1500 | 			FROM table
                | 2000 | Finland | Phone      |    100 |			GROUP BY `year`, country;
                +------+---------+------------+--------+
                | 2000 | India   | Calculator |     75 | 
                | 2000 | India   | Calculator |     75 | 			+------+------------+-------------+
                | 2000 | India   | Computer   |   1200 |			| year | country 	| MAX(profit) |
                +------+---------+------------+--------+			+------+------------+-------------+
                | 2000 | USA     | Calculator |     75 |			| 2000 | Finland    |  		 1500 |
                | 2000 | USA     | Computer   |   1500 |			| 2000 | India      |	     1200 |
                +------+---------+------------+--------+			| 2000 | USA        |        1500 |
                | 2001 | USA     | Calculator |     50 |			| 2001 | USA        | 	     1500 |
                | 2001 | USA     | Computer   |   1500 |			| 2001 | Finland    |          10 |		
				| 2001 | USA     | Computer   |   1200 |			+------+------------+-------------+		
				| 2001 | USA     | TV         |    150 |
                +------+---------+------------+--------+
                | 2001 | Finland | Phone      |     10 |
				+------+---------+------------+--------+


				+------+---------+------------+--------+	
				| year | country | product    | profit |		
				+------+---------+------------+--------+		SELECT product, MAX(profit)	
				| 2000 | USA     | Calculator |     75 |		FROM table			
				| 2000 | India   | Calculator |     75 |		GROUP BY product;			
				| 2000 | India   | Calculator |     75 |
				| 2001 | USA     | Calculator |     50 |		
				+------+---------+------------+--------+					
				| 2000 | India   | Computer   |   1200 |		+------------+-------------+	 
				| 2000 | Finland | Computer   |   1500 |		| product    | MAX(profit) |	 				
				| 2000 | USA     | Computer   |   1500 |		+------------+-------------+
				| 2001 | USA     | Computer   |   1500 |		| Calculator |          75 |
				| 2001 | USA     | Computer   |   1200 |		| Computer   |        1500 |				 
				+------+---------+------------+--------+		| Phone      |  	   100 |
				| 2000 | Finland | Phone      |    100 |		| TV         |         150 |
				| 2001 | Finland | Phone      |     10 |		+------------+-------------+
				+------+---------+------------+--------+						
				| 2001 | USA     | TV         |    150 |					
				| 2001 | USA     | TV         |    100 |				
				+------+---------+------------+--------+			
		 
		







