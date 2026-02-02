# ✈️ SFO Flights – End-to-End ELT Analytics Pipeline

## 📌 Project Overview

This project demonstrates a **production-style ELT data pipeline** for flight analytics using modern cloud and analytics tools.  
Flight data is ingested, transformed, modeled, tested, and visualized to generate operational insights for **San Francisco International Airport (SFO)**.

The focus is on:
- Scalable ELT architecture
- Analytics engineering best practices
- Data quality testing
- BI-ready dimensional modeling

---

## 🏗️ Architecture

**Data Flow:**

```
Azure Blob Storage  
→ Airbyte (Docker)  
→ Snowflake (Raw + Analytics)  
→ dbt (Transform, Test, Model)  
→ Power BI (Insights & Dashboard)
```

---

## 🛠️ Tech Stack

| Layer | Tool |
|-------|------|
| Cloud Storage | Azure Blob Storage |
| Data Ingestion | Airbyte (Dockerized) |
| Data Warehouse | Snowflake |
| Transformation | dbt |
| Data Modeling | Star Schema (Facts & Dimensions) |
| Data Quality | dbt tests |
| Visualization | Power BI |
| Language | SQL, Python |

---

## 📂 Repository Structure

```text
├── azure_files/              # Azure resource & data load notebooks
│   ├── create_resource_group.ipynb
│   ├── create_storage_account.ipynb
│   ├── data_load.ipynb
│   └── delete_resource_group.ipynb
│
├── elt_dbt_project/          # dbt project
│   ├── models/
│   │   ├── staging/
│   │   │   └── stg_flights_sfo.sql
│   │   └── marts/
│   │       ├── dim_airline.sql
│   │       ├── dim_airport.sql
│   │       ├── dim_date.sql
│   │       └── fact_flight.sql
│   ├── schema.yml
│   ├── dbt_project.yml
│   └── README.md
│
├── flights_sample_3m.csv     # Sample dataset
├── requirements.txt
└── README.md
```

---

## 📊 Data Model

### Star Schema Design

**Fact Table:**
- `fact_flight`
  - Flight delays
  - Flight volume
  - Foreign keys to dimensions

**Dimension Tables:**
- `dim_airline`
- `dim_airport`
- `dim_date`

This model is optimized for:
- BI performance
- Simple aggregations
- Time-series analysis

---

## ✅ Data Quality & Testing

Implemented dbt tests:
- `not_null`
- `unique`
- `relationships`

Ensures:
- Referential integrity
- Clean joins
- BI-safe datasets

---

## 📈 Dashboard Insights (Power BI)

Key metrics visualized:
- Total flights
- Average departure & arrival delay
- % delayed flights
- Airline on-time performance
- Delay trends over time
- Route-level delay analysis

---

## 🚀 How to Run

### 1️⃣ Ingest Data
- Upload flight data to Azure Blob Storage
- Use Airbyte (Docker) to sync data into Snowflake

### 2️⃣ Transform & Model
```bash
cd elt_dbt_project
dbt run
dbt test
```

### 3️⃣ Visualize
- Connect Power BI to Snowflake
- Build dashboard on analytics schema

---

## 🎯 Key Learnings

- Implemented ELT using modern data stack
- Designed BI-optimized dimensional models
- Enforced data quality with dbt tests
- Built an end-to-end analytics product

---

## 🔮 Future Improvements

- Incremental dbt models
- Snapshots for historical tracking
- CI/CD for dbt
- Role-based access in Snowflake
- Cost optimization monitoring

---

## 👤 Author

**Vishnu Alla**  
Data Engineering & Analytics Enthusiast

---

## 🧠 Project Strengths

This repository demonstrates:
- ✅ Real ELT architecture  
- ✅ Analytics engineering mindset  
- ✅ Snowflake + dbt credibility  
- ✅ BI consumption  
- ✅ Clean repository hygiene  

This is a **production-ready analytics pipeline**, not a beginner project.
