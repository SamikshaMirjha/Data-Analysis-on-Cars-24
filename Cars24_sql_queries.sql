-- INSIGHT NO. 1 
-- Reading the entire table 
select * from cars24_dataset; 

-- INSIGHT N0.2 
-- Total numbers of cars available in the dataset/company/cars24 inventory 
select count(*) as Total_cars from cars24_dataset; 

-- INSIGHT NO. 3 
-- Number of cars with respect to their manufacturing year. 
select year, count(*) as count_of_cars from cars24_dataset 
group by year 
order by count_of_cars desc;  

-- INSIGHT NO. 4 
-- Total number of cars with respect to the transmission (Automatic and Manual). 
select transmission, count(*) as total_cars from cars24_dataset 
group by transmission 
order by total_cars desc; 

-- INSIGHT No. 5 
-- Total number of cars with respect to the fuel used (Petrol, Diesel,CNG,LPG). 
select fuel, count(*) as total_cars from cars24_dataset 
group by fuel 
order by total_cars desc; 

-- INSIGHT NO. 6 
-- Which type of seller (individual,dealer,or trustmark dealer) contributes the most to the inventory ? 
select seller_type, round((count(*) * 100/(select count(*) from cars24_dataset)),2) as 
Percentage_of_contribution 
from cars24_dataset 
group by seller_type; 

-- INSIGHT NO. 7 
-- Top 10 cars which have been most frequently purchased by the company . 
select name,count(*) as Count_of_car from cars24_dataset 
group by name 
order by Count_of_car desc 
limit 10; 

-- INSIGHT NO. 8 
-- Top 10 most affordable five seater petrol cars with mileage>20. 
select name,selling_price from cars24_dataset 
where seats = 5 and fuel = "Petrol" and mileage>20 
order by selling_price 
limit 10; 

-- INSIGHT NO. 9 
-- Count of budget friendly cars in different price ranges (upto 5 lakhs) under each fuel category. 
select fuel,count(*) as count_of_cars ,'30 thousand -80 thousand' as Price_range from 
cars24_dataset 
where selling_price between 30000 and 80000 
group by fuel 
UNION 
select fuel,count(*) as count_of_cars ,'80 Thousand -1.5 lakhs' as Price_range from 
cars24_dataset 
where selling_price between 80000 and 150000 
group by fuel 
UNION 
select fuel,count(*) as count_of_cars ,'1.5 lakhs-3 lakhs' as Price_range from 
cars24_dataset 
where selling_price between 150000 and 300000 
group by fuel 
UNION 
select fuel,count(*) as count_of_cars ,'3 lakhs-5 lakhs' as Price_range from 
cars24_dataset 
where selling_price between 300000 and 500000 
group by fuel 
order by fuel ; 

-- INSIGHT NO. 10 
-- Count of cars with respect to number of seats for the following car companies(Maruti,Hyundai,Honda,Tata,Toyota) 
select seats,count(*) as count_of_cars ,'Maruti' as car_company from cars24_dataset 
where name like "%maruti%" 
group by seats 
UNION 
select seats,count(*) as count_of_cars ,'Honda' as Price_range from cars24_dataset 
where name like "%honda%" 
group by seats 
UNION 
select seats,count(*) as count_of_cars ,'Hyundai' as Price_range from cars24_dataset 
where name like "%hyndai%" 
group by seats 
UNION 
select seats,count(*) as count_of_cars ,'Tata' as Price_range from cars24_dataset 
where name like "%Tata%" 
group by seats 
UNION 
select seats,count(*) as count_of_cars ,'Toyota' as Price_range from cars24_dataset 
where name like "%Toyota%" 
group by seats 
order by seats; 
