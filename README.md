# Database-Systems-Comprehensive-SQL-Schema-Design-Portfolio

This repository contains the complete implementation for the Database Systems (CS2005) assignment at the National University of Computer and Emerging Sciences (FAST-NUCES). The project demonstrates advanced skills in Data Definition Language (DDL), constraint management, and complex SQL querying.

🎯 Learning Objectives

- Database Architecting: Designing complex schemas for healthcare and inventory systems.
- Data Integrity: Implementing Primary Keys, Composite Keys, Foreign Keys, and CHECK constraints.
- Advanced Querying: Authoring queries for data retrieval, filtering, and set operations (UNION/EXCEPT).

  🛠️ Project Modules
  
  1. National Health & Research Institute (NHRI) Management

- Scenario: Designing a database for a National Health Institute to manage patients, doctors, and medical procedures.
- Schema Design: Implementation of five core tables: PATIENTS, DOCTORS, DEPARTMENTS, PROCEDURES, and APPOINTMENTS.
- Data Integrity: * Enforced mandatory fields (NOT NULL) for critical data like DateOfBirth and HireDate.
- Implemented CHECK constraints for gender validation ('M'/'F'), blood types, and appointment status.
- Business logic: Ensures a doctor’s DateOfBirth is not later than their HireDate.
- Schema Evolution: Demonstrated proficiency in ALTER TABLE operations, including modifying column lengths and dropping attributes/tables.

  2. Library Management System (Advanced Constraints)

Scenario: Handling relationships between books, authors, and countries with specific referential integrity rules

Referential Integrity Rules:
- RESTRICT: Prevent deletion of books currently borrowed.
- CASCADE: Automatically update book records when an author's ID is changed.
- SET NULL: Automatically nullify countryId for authors if their country record is deleted.

3. Order Management System & Data Analytics
Scenario: Designing an inventory system based on an ER diagram and performing data analysis.
- Composite Keys: Implemented a composite primary key on (OrderNo, ItemNo) in the OrderDetails table to handle many-to-many relationships.
- Data Analysis Tasks: Pattern Matching: Filtering items using the LIKE operator.Computed Columns: Calculating discounted prices ($15\%$ reduction) on the fly.Set
- Theory: Using EXCEPT or NOT IN logic to find items that have never been ordered.
- Time-Series Filtering: Extracting orders placed in the current year.

💻 Tech Stack & Tools
Database Engine: Microsoft SQL Server.
Language: (-SQL).
Modeling: Relational Algebra & ER Diagramming.

🚀 Key SQL Snippets
The implementation includes advanced logic such as:
Alphabetical Ordering: ORDER BY for clean data presentation.
Top-N Analysis: Utilizing the TOP 5 to identify primary customers.
Entity Merging: Combining distinct lists (Customers and Items) into a single unified view

