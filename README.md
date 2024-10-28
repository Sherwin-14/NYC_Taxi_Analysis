# TLC Insights: Optimizing Taxi Services for a Better Ride Experience

## Background and Overview

### Project Overview:

The New York City Taxi and Limousine Commission (TLC) is facing challenges in optimizing its operations and improving its services due to the lack of insights from the vast amount of data it collects. This project aims to develop a solution that leverages the TLC's dataset of taxi rides in NYC to predict taxi fares and provide insights into the operations and business of TLC.

### Project Goals:

    1.Develop an automated machine learning (AutoML) model to predict taxi fares based on various factors such as pickup and dropoff locations, trip distance, time of day, etc.
    2.Create an infographic that visually represents the key insights and trends from the dataset.
    3.Answer various business questions using SQL queries on the dataset to provide specific insights into the operations and business of TLC.

### Deliverables:

    1. Fare Prediction Model: A trained AutoML model that can predict taxi fares based on input features such as pickup and dropoff locations, trip distance, time of day, etc.
    2. Infographic: A visually appealing infographic that represents the key insights and trends from the dataset, including:
        a. Most popular pickup and dropoff locations
        b. Average fare per trip
        c. Peak hours and days for taxi demand
        d. Distribution of trip distances and fare amounts
    3. SQL Queries: A set of SQL queries that answer various business questions, including:
        a. What are the most popular pickup and dropoff locations?
        b. What is the average fare per trip?
        c. What are the peak hours and days for taxi demand?
        d. How do trip distances and fare amounts vary by time of day and day of the week?

---> The SQL queries used to extract insights from the dataset can be found [here](https://github.com/Sherwin-14/NYC_Taxi_Analysis/blob/master/nyc_taxi_q%26a.sql)

---> Infographic created to present the key findings to stakeholders can be viewed [here](https://github.com/Sherwin-14/NYC_Taxi_Analysis/blob/master/nyc_taxi_report.pdf).

## Data Structure and Overview

The dataset used for this analysis is a large and comprehensive collection of taxi ride data in New York City, with a total size of over 5GB. The dataset contains a vast amount of information about each taxi ride, including pickup and dropoff locations, trip distances, fare amounts, and more.

![Infographic](https://github.com/Sherwin-14/NYC_Taxi_Analysis/blob/master/tripdata.png)

## Executive Summary

### Insight 1: Limited Reach and Passenger Preference

Our analysis reveals that Minneola, Newark, Morristown, and Hackensack have limited cab activity, indicating low demand for taxi services. These regions have relatively few cab pickups and dropoffs, suggesting that passengers may not prefer taking cabs to these areas.

Central New York is the largest share of our services, with a high demand for taxi services in regions like Syracuse, Utica, and Ithaca. To maximize business operations we need to keep tabs on these areas.

![Infographic](https://github.com/Sherwin-14/NYC_Taxi_Analysis/blob/master/Model/insight.png)

### Insight 2: Payment Method and Dispute Analysis

Our analysis reveals that:

    1. 70.8% of the total amount was paid through credit card payment method.
    2. 21% of the total amount is in dispute, indicating a significant number of passengers are contesting their fares.


![Infographic](https://github.com/Sherwin-14/NYC_Taxi_Analysis/blob/master/Model/insight-2.png)
    

This suggests that a substantial portion of the total amount is being disputed, which may be due to various reasons such as:

    1. Incorrect fare calculations: Passengers may be disputing the fare amounts due to incorrect calculations or misunderstandings about the fare structure.
    2. Service issues: Passengers may be disputing the fare amounts due to issues with the service, such as delays, route changes, or poor customer service.
    3. Payment errors: Technical errors or issues with the payment processing system may have resulted in incorrect or incomplete payments.
    4. Fraudulent activity: In some cases, passengers may have intentionally attempted to avoid paying the full fare or made fraudulent payments.

## Recommendations 

Based on our analysis, we recommend the following:

**1. Establish easy-to-use channels to raise customer concerns**: Create a simple and accessible process for customers to report issues or concerns, such as a dedicated phone number, email address, or online form.

**2. Specific team to handle disputes**: Designate a specialized team to handle disputes and resolve customer complaints in a fair and timely manner.

**3. Offer discounted fares or loyalty points for rides to Newark and Minneola**: Provide incentives to customers who take rides to these regions, such as discounted fares or loyalty points, to increase demand and revenue.

**4. Review our pricing strategy**: Conduct a thorough review of our pricing strategy to ensure that it is fair, competitive, and aligned with customer expectations.

**5. Ensure a good ride experience**: Focus on providing a high-quality ride experience, including clean and well-maintained vehicles, courteous and professional drivers, and a safe and comfortable ride.

By implementing these recommendations, we can improve customer satisfaction, increase revenue, and maintain our position as a leading provider of taxi services in the region.

    



