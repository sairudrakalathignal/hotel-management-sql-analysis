
# Hotel Management SQL Analysis

## Overview
A PostgreSQL practice project for exploring hotel bookings,
branch performance and payment records using relational data.

## Objectives
- Design a relational database with primary and foreign keys.
- Connect bookings to guests, rooms, branches and payments.
- Use JOIN, GROUP BY, aggregate functions and HAVING.
- Compare paid revenue and completed bookings across branches.

## Database Schema
- branches: hotel branch details
- rooms: room types and nightly rates
- guests: guest records
- bookings: guest reservations and booking status
- payments: payment amounts and payment status

## Tools
- PostgreSQL
- pgAdmin

## How to Run
1. Create or select a PostgreSQL database.
2. Run schema.sql to create tables and insert sample records.
3. Run analysis_queries.sql to execute the analysis.
4. Inspect the results in the SQL query tool.

## Key Questions
- Which branch has the highest recorded paid revenue?
- How many completed bookings does each branch have?
- Which guests have multiple bookings?

## Limitations
The dataset is fictional and small. Paid revenue is not the same
as profit because operating costs are not included.

## Learning Outcomes
Document the SQL concepts and business insights you verified
after running the queries.
