DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_segment VARCHAR(50),
    segment_category VARCHAR(50),
    age INT,
    age_group VARCHAR(20),
    gender VARCHAR(20),
    country VARCHAR(100),
    city VARCHAR(100),
    income_bracket VARCHAR(20),
    education_level VARCHAR(50),
    employment_type VARCHAR(50),
    marital_status VARCHAR(20),
    tenure_months INT,
    total_purchases INT,
    avg_order_value_usd DECIMAL(10,2),
    total_spent_usd DECIMAL(12,2),
    purchase_frequency VARCHAR(20),
    days_since_last_purchase INT,
    preferred_category_1 VARCHAR(50),
    preferred_category_2 VARCHAR(50),
    preferred_category_3 VARCHAR(50),
    shopping_channel VARCHAR(50),
    device_used VARCHAR(50),
    payment_method VARCHAR(50),
    return_count INT,
    complaint_count INT,
    satisfaction_score INT,
    satisfaction_level VARCHAR(50),
    loyalty_tier VARCHAR(20),
    email_open_rate DECIMAL(5,4),
    click_through_rate DECIMAL(5,4),
    conversion_rate DECIMAL(5,4),
    social_media_presence VARCHAR(255),
    customer_lifetime_value_usd DECIMAL(12,2),
    customer_acquisition_cost_usd DECIMAL(10,2),
    customer_profitability_usd DECIMAL(12,2),
    recency_score INT,
    frequency_score INT,
    monetary_score INT,
    rfm_score INT,
    churn_risk_score INT,
    customer_health_score INT,
    dataset_year INT,
    customer_value_category VARCHAR(50),
    activity_status VARCHAR(50),
    health_status VARCHAR(50),
    churn_risk_category VARCHAR(50),
    rfm_category VARCHAR(50),
    profitability_category VARCHAR(50),
    engagement_level VARCHAR(50),
    behavior_segment VARCHAR(50),
    device_preference VARCHAR(50),
    clv_category VARCHAR(50)
);
BULK INSERT customers
FROM 'C:\Users\shann\Downloads\archive (2)\SQL Projects\E-commerce_Customer_Segmentation_2026.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDQUOTE = '"',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

SELECT 
    customer_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN activity_status = 'Dormant' THEN 1 ELSE 0 END) AS churned_customers,
    CAST(
        100.0 * SUM(CASE WHEN activity_status = 'Dormant' THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(5,2) 
    
    ) AS churn_rate_percentage
FROM 
    customers
GROUP BY 
    customer_segment
ORDER BY 
    churn_rate_percentage DESC;

SELECT * FROM customers;
