# **Project 2A: Database Normalization & Execution**

## **Objective**
Design, normalize, and fully implement a **relational database** that optimizes data integrity, reduces redundancy, and prepares for advanced SQL querying.  

## **Overview**
This project transitions **reconstructed flat-file financial transaction data (Project 1)** into a **fully normalized PostgreSQL database schema**. The focus was on **database normalization, schema optimization, and relational table design** to ensure **efficient querying and storage**.

The end goal was to:
- **Apply database normalization principles** to **eliminate redundancy and improve query efficiency**.
- **Design a well-structured relational schema** to support financial tracking across **Projects, Campaigns, and Employee Roles**.
- **Execute schema creation, data migrations, and indexing** to optimize SQL querying for future analysis.

## **Data Description**
The structured **budget database** consists of **six** core tables:  

1. **pmo** – Stores **financial transactions**, including payments, contracts, and project details.  
2. **campaigns** – Houses **campaign metadata**, including budget allocations and timelines.  
3. **campaign_mapping** – Acts as a **bridge table**, linking **Projects and Campaigns**.  
4. **campaign_projects** – Maps **Projects to Campaigns** for financial tracking.  
5. **org_structure** – Stores **employee assignments and management hierarchy**.  
6. **agency_contracts** – Manages **contractual agreements between agencies and campaigns**.  

Each table follows **normalization best practices**, ensuring **clear relationships between entities** while supporting **complex SQL joins and aggregations**.

## **Key Steps & Technologies**
### **Step 1: Database Design & Normalization**
- **Designed a fully normalized relational schema**, applying **1NF, 2NF, and 3NF** principles.  
- **Optimized entity relationships**, reducing redundancy while maintaining financial tracking granularity.  
- Created an **Entity Relationship Diagram (ERD)** to **visualize table relationships** and **normalize dependencies**.  

### **Step 2: Schema Implementation & Indexing**
- **Developed the schema in PostgreSQL**, defining **primary keys, foreign keys, constraints, and indexes**.  
- **Implemented indexing strategies** for **performance optimization**, including:  
  - **Primary Keys for uniqueness enforcement**  
  - **Foreign Keys for referential integrity**  
  - **Indexes on frequently queried columns** (e.g., `campaign_id`, `project_no`, `payment_no`)  

### **Step 3: Data Migration & Transformation**
- **Cleansed and transformed data** to align with the normalized schema.  
- **Migrated data from flat files (`pmo_backup`) into relational tables**, applying:  
  - **Foreign key lookups** to replace denormalized fields  
  - **CASE statements** to dynamically update descriptions  
  - **Window Functions** to assign unique sequence numbers to transactional records  
- **Automated batch data inserts**, ensuring transaction safety with **PostgreSQL’s `BEGIN; COMMIT;` structure**.  

### **Step 4: Version Control & Documentation**
- **Implemented Git versioning** for:  
  - **Schema updates** (`schema_migrations/`)  
  - **Data insertions & transformations** (`scripts/sql/data_inserts/`)  
  - **Backups & archives** (`backups/full_schema/`)  
- **Stored schema versions**, maintaining a structured **change log** to track modifications.  

### **Step 5: Final Database Execution & Testing**
- **Executed full schema deployment** (`finalize_budget_schema_v3.0.sql`), successfully migrating **255,000+ records**.  
- **Verified database integrity** using sanity checks, including:  
  - **Column alignment verification** before data insertion  
  - **Duplicate checks** on `payment_no` to ensure uniqueness  
  - **Foreign key constraints validation** to maintain referential integrity  

---

### **Entity Relationship Diagram (ERD)**
Below is the **ERD** representing the fully normalized database structure.

![ERD - Budget Database](media/erd.budget.png)

---

## **Repository Structure**


---

## **Key Insights & Takeaways**
✅ **Database normalization significantly reduces redundancy**, improving **query efficiency**.  
✅ **Foreign key constraints enforce referential integrity**, preventing orphaned records.  
✅ **Indexing high-frequency lookup columns enhances performance** for complex SQL queries.  
✅ **Pre-insert sanity checks** (e.g., verifying duplicates, ensuring column alignment) prevent migration failures.  
✅ **Window Functions** are a powerful tool for assigning unique identifiers in **data migration scenarios**.  
✅ **Git versioning is essential** for maintaining **schema history and tracking database modifications**.  

---

## **Next Steps**
This project **(Project 2A: Database Normalization & Execution)** serves as a foundation for the next phase:  

🚀 **Project 2B: Advanced SQL Querying**  
- Writing **complex SQL queries**, including **Joins, Common Table Expressions (CTEs), and Window Functions**.  
- **Performance tuning**, leveraging **EXPLAIN ANALYZE** for query optimization.  
- **Financial reporting and trend analysis**, creating queries for **budget tracking, spend patterns, and forecasting**.  

🚀 **Project 3: Automating ETL & Cloud Integration**  
- **Rebuilding the entire database schema**, transitioning from local PostgreSQL to **cloud-based storage (BigQuery, Snowflake, AWS RDS)**.  
- **Implementing dbt and Apache Airflow**, modularizing SQL transformations for **ETL pipeline automation**.  
- **Integrating Python automation**, extracting and transforming financial data using **Pandas, NumPy, and API connectors**.  
- **Deploying Git-based data workflows**, leveraging structured **schema versioning and CI/CD integration**.