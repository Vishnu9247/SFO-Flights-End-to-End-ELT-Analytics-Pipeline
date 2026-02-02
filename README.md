# ✈️ SFO Flights – End-to-End ELT Analytics Pipeline
![Project Architecture]('architecture.png')
## 📌 Project Overview

This project demonstrates a **production-style ELT data pipeline** for flight analytics using modern cloud and analytics tools.  
Flight data is ingested, transformed, modeled, tested, and visualized to generate operational insights for **San Francisco International Airport (SFO)**.

The focus is on:
- Scalable ELT architecture
- Analytics engineering best practices
- Data quality testing
- BI-ready dimensional modeling
- Actionable insights through advanced analytics

---

## 🏗️ Architecture

**Data Flow:**

```
Azure Blob Storage
→ Azure Blob Storage (Raw Data)    
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
├── Delay_Analysis.pdf        # Power BI Dashboard export
├── flights.csv               # Sample dataset
├── requirements.txt
└── README.md
```

---

## 📊 Data Model

### Star Schema Design

**Fact Table:**
- `fact_flight`
  - Flight delays (departure, arrival, carrier, NAS, weather, late aircraft)
  - Flight volume and metrics
  - Cancellations and diversions
  - Foreign keys to dimensions

**Dimension Tables:**
- `dim_airline` - Airline details and metadata
- `dim_airport` - Airport information and locations
- `dim_date` - Time hierarchy (year, month, week, day)

This model is optimized for:
- BI performance and fast aggregations
- Multi-dimensional analysis
- Time-series trend analysis
- Root cause delay investigations

---

## ✅ Data Quality & Testing

Implemented dbt tests:
- `not_null` - Ensures critical fields are populated
- `unique` - Validates primary key integrity
- `relationships` - Enforces foreign key constraints

Ensures:
- Referential integrity across fact and dimension tables
- Clean joins for BI queries
- BI-safe datasets with no data anomalies
- Trusted analytics layer

---

## 📈 Power BI Dashboard & Key Insights

**Dashboard File:** `Delay_Analysis.pdf`

### **Overview Metrics**
- **Total Flights Analyzed:** 1,320
- **Cancelled Flights:** 113 (8.5% cancellation rate)
- **Overall Delay Rate:** 33.83% of flights experience delays
- **Average Total Delay:** 15.52 minutes per flight

---

### **1. Airline Performance Analysis**

**Top Airlines by Total Delay Volume:**

| Rank | Airline |
|------|---------|
| 1 | United Airlines | 
| 2 | SkyWest Airlines |
| 3 | American Airlines | 
| 4 | Southwest Airlines |
| 5 | Alaska Airlines | 

**Key Finding:** United Airlines handles the highest volume at SFO, resulting in the most aggregate delays, though this correlates with their market share.

---

### **2. Root Cause Analysis – What Drives Delays?**

Using **Power BI Key Influencers** analysis, delays are attributed to:

| Delay Factor | Impact on Total Delay | Insight |
|--------------|----------------------|---------|
| **NAS Delays** (National Airspace System) | +111.6 minutes | External airspace congestion is the #1 delay driver |
| **Departure Delays** | +48.22 minutes (83.28% correlation) | Departure punctuality is critical |
| **Carrier Delays** | +28.90 minutes | Airline operational issues contribute moderately |
| **Late Aircraft** | +27.96 minutes | Cascading delays from previous flights |

**Strategic Insight:** External factors (NAS) cause more delays than airline operations, suggesting the need for better air traffic coordination.

---

### **3. Time-Based Delay Patterns**

**Weekly Trends:**
- Flight volumes remain stable (1,000-1,400 flights/week)
- Delay spikes occur in weeks 20-40 (likely summer travel season)
- Seasonal patterns suggest capacity constraints during peak periods

**Day of Week Analysis:**

| Day | Average Delay (minutes) | Insight |
|-----|------------------------|---------|
| **Thursday** | ~20 | Highest delays - mid-week congestion |
| **Monday** | ~15 | Post-weekend operational ramp-up |
| **Sunday** | ~15 | Weekend travel peak |
| **Friday** | ~12 | Pre-weekend volume surge |
| **Saturday** | ~10 | Moderate delays |
| **Wednesday** | ~8 | Mid-week efficiency |
| **Tuesday** | ~5 | **Lowest delays - operational best practice day** |

**Operational Recommendation:** Analyze Tuesday operations to identify best practices for other weekdays.

---

### **4. Route & Destination Insights**

**Busiest Routes (by flight count):**
1. Los Angeles (6,000+ flights)
2. Seattle
3. New York
4. San Diego
5. Las Vegas

**Highest Delay Routes (by average delay per flight):**
1. **Twin Falls** - 200+ minutes average delay
2. **South Bend** - 180+ minutes
3. **Aspen** - 150+ minutes
4. **Anchorage** - 140+ minutes
5. **Hartford** - 130+ minutes

**Key Insight:** Smaller regional airports experience disproportionately higher delays despite lower flight volumes, likely due to:
- Limited infrastructure
- Weather sensitivity (Aspen, Anchorage)
- Fewer alternative routing options
- Single runway operations

---

### **5. Geographic Delay Distribution**

**Distance vs. Delay Analysis:**
- Longer routes correlate with higher total delay minutes
- Cities like Albuquerque, Anchorage, and Atlanta show higher delay-to-distance ratios
- Short-haul routes (Los Angeles, San Diego) maintain better on-time performance

---

## 🎯 Strategic Recommendations

Based on the analytics findings:

### **Operational Improvements**
1. **Enhance NAS Coordination** - Work with FAA and air traffic control to reduce airspace delays during peak weeks (20-40)
2. **Optimize Thursday Operations** - Add buffer time, gate capacity, or crew resources mid-week
3. **Review Small Airport Routes** - Investigate Twin Falls, Aspen, and South Bend for operational challenges
4. **Tuesday Best Practices** - Document and replicate Tuesday's operational efficiency across other weekdays

### **Airline-Specific Actions**
5. **United Airlines** - Despite high volume, explore operational optimization opportunities
6. **Carrier Delay Reduction** - Focus on maintenance scheduling and crew management to reduce carrier-attributed delays

### **Strategic Planning**
7. **Seasonal Capacity Planning** - Increase resources during weeks 20-40 to handle summer travel surge
8. **Route Optimization** - Consider frequency adjustments for high-delay regional routes
9. **Predictive Analytics** - Build forecasting models for proactive delay management

---

## 🚀 How to Run

### 1️⃣ Ingest Data
- Upload flight data to Azure Blob Storage using provided notebooks
- Configure Airbyte (Docker) connection to Snowflake
- Run incremental sync to load raw data

### 2️⃣ Transform & Model
```bash
cd elt_dbt_project
dbt deps                    # Install dependencies
dbt run                     # Execute transformations
dbt test                    # Run data quality tests
dbt docs generate           # Generate documentation
```

### 3️⃣ Visualize
- Connect Power BI to Snowflake analytics schema
- Load pre-built dashboard template
- Refresh data connection
- View `Delay_Analysis.pdf` for sample insights

---

## 🧪 Data Pipeline Capabilities

This pipeline demonstrates:
- ✅ **Batch ELT Processing** - Airbyte → Snowflake → dbt
- ✅ **Data Quality Gates** - Automated dbt testing
- ✅ **Dimensional Modeling** - Star schema for BI
- ✅ **Advanced Analytics** - Key influencers, trend analysis, segmentation
- ✅ **Self-Service BI** - Power BI dashboards for stakeholders
- ✅ **Scalable Architecture** - Cloud-native, modular design

---

## 📚 Key Learnings

- Implemented end-to-end ELT pipeline using modern data stack
- Designed BI-optimized dimensional models following Kimball methodology
- Enforced data quality with automated dbt tests
- Built actionable analytics product delivering business insights
- Applied root cause analysis to identify operational improvement areas
- Demonstrated analytics engineering best practices

---

## 🔮 Future Improvements

**Pipeline Enhancements:**
- Incremental dbt models for large fact tables
- Type 2 SCD (Slowly Changing Dimensions) for historical tracking
- CI/CD pipeline for automated dbt deployment
- Data observability with dbt artifacts and Snowflake monitoring

**Analytics Extensions:**
- Predictive delay modeling using machine learning
- Real-time streaming analytics with Kafka/Snowpipe
- Cost optimization monitoring for Snowflake usage
- Alert system for anomaly detection

**Governance & Security:**
- Role-based access control (RBAC) in Snowflake
- Data masking for sensitive information
- Audit logging and lineage tracking
- Data retention policies

---

## 👤 Author

**Vishnu Alla**  
Data Analyst

**Connect:** [LinkedIn](https://www.linkedin.com/in/vishnu-alla) 

---

## 🧠 Project Strengths

This repository demonstrates:
- ✅ **Production-grade ELT architecture** using industry-standard tools
- ✅ **Analytics engineering mindset** with dimensional modeling and testing
- ✅ **Snowflake + dbt credibility** for modern data warehousing
- ✅ **Advanced BI consumption** with actionable insights
- ✅ **Root cause analysis** using statistical techniques
- ✅ **Clean repository hygiene** with documentation and structure

This is a **production-ready analytics pipeline**, not a tutorial project.

---

## 🙏 Acknowledgments

- **Dataset:** Flight data from public aviation databases
- **Tools:** Airbyte, Snowflake, dbt, Power BI, Azure Blob Storage
- **Inspiration:** Modern data stack community and analytics engineering principles