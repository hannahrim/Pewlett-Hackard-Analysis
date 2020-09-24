  The purpose of this challenge was to explore the changes within a company when employees reach retirement age. Pewlett-Hackard must prepare for the anticipated retirements and be ready to fill the roles of those who will have to leave. To create a retirement strategy for the company, I used SQL to determine the total number of employees per title who will be retiring, and identified those employees who are eligible to participate in a mentorship program. The deliverable is two csv files that contained tables that identified retired employees and those who would be eligible for mentorship program. The first step in the analysis was to make an entity-relational diagram to determine primary and foreign keys. 
  
  After creating the tables, I imported the data directly from the original csv files. Once the files were imported, I could manipulate the data to show only information that I needed to analyze. I struggled with importing the csv files becuase Macs require a different line of code. I put the data files in my computer's Public file and copied their indivoual file path to import them individually. This is an example: COPY departments FROM '/Users/hannahrim/Public/departments.csv' DELIMITER ',' CSV HEADER;

 The EmployeeDB.png file shows the relationship between various tables and how they keys were used to join tables. After oganizing the data by employee number, first name, last name, salary, and title, we only included those people born between 1952 and 1955. The duplicates were removed if workers' titles changed when they received promototions. This method was also applied to the mentor program as well.
 
Titles and Retirees:
 ![Alt text](https://github.com/hannahrim/Pewlett-Hackard-Analysis/blob/master/title_totals.png)
 
 Titles and Mentors:
 ![Alt text](https://github.com/hannahrim/Pewlett-Hackard-Analysis/blob/master/mentor_totals.png)
 
 By using SQL, I gathered the data for the client. I delivered a list of names of people who would be good candidates for the mentorship program. This helps Pewlett-Hackard by standardizing the process for the hiring department since 30% of its workforce are at retirement age. Pewlett-Hackard needs to rapidly begin hiring new employees and restructure the company.
