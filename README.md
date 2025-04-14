# Parameterized ADF Framework for Multi-Source Data Integration

## 📌 Project Overview

This project showcases an end-to-end data ingestion framework using **Azure Data Factory (ADF)** to extract data from **multiple structured sources**, transform it into **JSON format**, and store it securely in **Azure Data Lake Storage Gen2 (ADLS Gen2)**. 

The sources include:

- 💾 **Microsoft SQL Server**
- 🧮 **Azure SQL Database**
- 📁 **Azure Blob Storage (CSV files)**

A control table drives the selection of source systems, enabling flexible and scalable orchestration through a master pipeline. Audit logging is handled via stored procedures in SQL Server, and lifecycle management rules are applied to archive files after 30 days of modification, ensuring efficient storage governance.

Designed to eliminate the need for hardcoded or duplicated pipelines, this project showcases best practices in modern data engineering — with reusability, automation, and observability at its core.

## 📋 Business Requirement

Assume an organization receives data from multiple upstream systems, including:

- **Relational databases**: MS SQL Server and Azure SQL Database  
- **Flat files**: Structured CSV files delivered to Azure Blob Storage

Each relational database source system contains multiple databases, schemas, and tables. Each CSV file is placed in the designated folder. The **downstream analytics team** requested that all data be delivered to **Azure Data Lake Storage Gen2 (ADLS Gen2)** in a **flexible and unified format — JSON**, instead of its native format (CSV or relational structure).  

The goals are to:

- **Enable a consistent and schema-flexible data model**   
- **Avoid pipeline duplication** and manual hardcoding for every new source or table  
- Ensure auditability, traceability, and compliance by logging pipeline runs and metadata

The primary reason for converting to JSON was to support downstream systems that prefer or require data in a semi-structured format, such as data lakes, reporting tools, or NoSQL platforms. Additionally, JSON makes the data portable and suitable for long-term storage or archiving, especially for regulatory or compliance requirements.

## 🧾 Technologies Used

- **Azure Data Factory (ADF)**
- **Azure Data Lake Storage Gen2 (ADLS Gen2)**
- **Azure Blob Storage**
- **Azure SQL Database**
- **Microsoft SQL Server**
- **T-SQL Stored Procedures**
- **Self-Hosted Integration Runtime**
- **JSON File Format**
- **Lifecycle Management Rules**
- **Azure Linked Service**
- **Azure Key Vault**

## 🛠️ Solution Architecture

### ✅ Key Components
- **Parameterized Ingestion Pipelines**: Generic pipelines for each source type (SQL Server, Azure SQL DB, Blob Storage) that dynamically pull data using metadata.
- **Master Pipeline**: Triggers the appropriate source pipeline in a control table based on metadata.
- **Control Table**: This table stores source system metadata such as table name, schema, folder paths, and active status.
- **Audit Logging**: A stored procedure logs metadata like record counts, execution duration, pipeline name, status, etc. into an audit table.
- **Lifecycle Management**: Automatically archives files older than 30 days in ADLS using a lifecycle policy.
- **Self-hosted IR**: Used to access on-premises SQL Server database securely from ADF.

  ![Normalizer Flow](images/Date_Split_Normalizer_Mapping.png)

## 🔄 Pipeline Flow

1. **Master Pipeline** queries the `src_control_table` and filters by active sources.
2. Based on the source system, triggers corresponding source pipeline:
   - SQL Server
   - Azure SQL DB
   - Blob Storage
3. Each pipeline:
   - Fetches data
   - Converts to JSON
   - Loads to `downstream` container and `Archive` folder in ADLS Gen2
4. Data is available for 30 days, post which lifecycle rules move it to the `archive` tier.
5. Execution metadata is logged into the audit tables.

Data Flow Diagram

## 🗂️ Control & Audit Tables

### 🔧 `src_control_table`
Stores metadata about the source system:
- Source type, database, schema, table, folder paths, and active status.

### 🧾 `Audit_Table` & `Azure_Audit_Table`
Stores logs of execution, including:
- Run ID, records read/written, execution status, timestamps, errors, etc.


## 📂 Folder Structure

```
/pipelines
  └── pipeline_sql_server.json
  └── pipeline_azure_sql_db.json
  └── pipeline_blob_csv.json
  └── master_pipeline.json

/sql
  └── src_control_table.sql
  └── audit_table.sql
  └── azure_audit_table.sql
  └── sp_insert_audit_log.sql

/assets
  └── data_flow_diagram.png
  └── pipeline_architecture.png

/docs
  └── README.md
```



---

## 🔍 What Makes This Project Valuable

✅ **Dynamic**: Ingestion logic is metadata-driven, making it easy to onboard new sources.  
✅ **Maintainable**: No duplication of pipelines for each source.  
✅ **Auditable**: Track pipeline runs, record counts, errors.  
✅ **Scalable**: Easy to extend with new source types or transformations.  
✅ **Enterprise-Ready**: Built-in archival, monitoring, and logging mechanisms.

---

## 📌 Future Improvements

- Integrate with Azure Data Catalog or Purview for data governance
- Implement email/Teams alerting for pipeline failures
- Add support for semi-structured sources (JSON, XML)
- Visualize audit logs using Power BI or Azure Monitor

---

## 📣 Contact

Feel free to connect with me on [`LinkedIn`](https://www.linkedin.com/) or message if you’d like to know more or discuss how I built this project.

---

## 📷 Project Visuals

👉 [Insert pipeline architecture diagram here]  
👉 [Insert data flow diagram here]

---
