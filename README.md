# SQL-Challenge

# Data Modeling

In my Entity Relationship Diagram, I created each table to represent each CSV file we had.  Within each table I created all the spcific variables that were also in each CSV so they would directly mirror each other.  Once everything was created I mapped out the relationship of each variable to otehr tables and labeled the primary and forgien keys.

# Data Engineering 

In my query on PostgreSQL the first thing I did was create each table that related to the CSV files.  Essentially the same thing I did in my ERD, but I am using the query to pull the actual data and connect it through different data analysis.  I also had to set up which variables I wanted to use for my primary and forgien keys so that they would be unique to their own table. I also made each variable "not null" so that way it would not pull data in my analysis if it was missing any data point that I was searching for.

# Data Analysis
For each analysis used select to pick with variables I wanted to pull from each created table and then joined on specific variables that were connected through each table.  When I wanted the have only the employees that were hired for the year 1986 I hard coded it to only look for names of people with the hire date in that year.  I did that by using a "between" and used Jan 1st and dec 31st as my dates with each year.  When I was looking for specific people with the name Hercules and a last name that starts with B, I had first name equal Herucles and last name like B and put a percentage sign after so it would pull anything with last name that starts with B and whatever letters were after that.  To look for people in the Sales Department only I had dept_no = doo7 only so it would only pull the people with that as their department number in their empolyment.  Last specific thing I had to do was to count the last names of the employees and then have them count them, the using those counts and grouping them all together.  I then order them by decending order so then you can quickly see the amount of people with the same last name the most to the least.
