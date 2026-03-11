# Netflix Content Data Analysis using SQL

## Project Overview

This project analyzes the Netflix Movies and TV Shows dataset using SQL.
The goal is to explore trends in Netflix content such as movie vs TV show distribution, content production by country, yearly release trends, and genre popularity.

The analysis was performed using PostgreSQL and includes SQL queries involving aggregations, filtering, ranking, and window functions to generate meaningful insights from the dataset.

---

## Dataset

Dataset: Netflix Movies and TV Shows

The dataset contains information about Netflix content including:

* Title
* Type (Movie / TV Show)
* Director
* Country
* Release Year
* Rating
* Duration
* Genre
* Description

Total records: **8800+ titles**

---

## Tools & Technologies

* SQL
* PostgreSQL
* pgAdmin

---

## Key SQL Concepts Used

* SELECT statements
* GROUP BY and Aggregations
* ORDER BY and LIMIT
* Window Functions (RANK, DENSE_RANK, LAG, LEAD)
* Data Filtering (WHERE clause)
* Running totals and rankings

---

## Analysis Performed

The project answers several analytical questions such as:

1. Count of Movies vs TV Shows
2. Top countries producing Netflix content
3. Number of titles released each year
4. Most common content ratings
5. Directors with the highest number of titles
6. Ranking countries by total content production
7. Identifying years with highest content release
8. Calculating running totals of content over time
9. Comparing previous and next year releases using window functions
10. Identifying the most popular genres on Netflix

---

## Project Structure

```
Netflix-SQL-Analysis
│
├── dataset
│   └── netflix_titles.csv
│
├── queries
│   └── netflix_analysis.sql
│
└── README.md
```

---

## Sample Insight

* Movies make up a larger portion of Netflix content compared to TV Shows.
* The United States produces the highest number of titles on Netflix.
* Content production increased significantly after 2015.
* Drama and International Movies are among the most common genres.

---

## Author

Praveen Kumar Reddy
Data Science & Analytics Graduate
