#  Data Quality Monitoring  

This project implements a Real-Time Data Quality Monitoring pipeline using Apache Kafka, Apache Spark, MySQL, and Grafana, with Docker orchestrating the entire system. It continuously fetches stock market data via the Financial Modeling Prep API, processes it using Apache Spark, stores the refined data in MySQL, and visualizes insights through Grafana dashboards.  

## Project Goals  

- Establish a Real-Time data ingestion system using Apache Kafka.  
- Implement streaming data processing via Apache Spark.  
- Store structured, processed data in a MySQL database.  
- Create interactive dashboards for data visualization using Grafana.  
- Use Docker to containerize and orchestrate all components.  

## System Architecture  

This project consists of the following key modules:  

- Kafka Producer – A Python-based service that fetches stock data from the Financial Modeling Prep API and publishes it to a Kafka topic.  
- Apache Kafka – Acts as a distributed streaming platform, enabling seamless real-time data flow.  
- Apache Spark – Consumes streaming data from Kafka, processes it, and loads the refined information into MySQL.  
- MySQL Database – Stores the processed stock data for analytical queries and reporting.  
- Grafana – Provides an intuitive dashboard for data visualization and monitoring.  

Python dependencies are managed via `requirements.txt`, ensuring proper installation within Docker containers.  

## Prerequisites  

- Python 3.12  
- Docker & Docker Compose (Ensure both are installed on your machine)  
- Financial Modeling Prep API Key (Sign up [here](https://site.financialmodelingprep.com/))  

## Setup Instructions  

1. Clone the repository:  
   ```bash
   git clone https://github.com/SatwikaKadiyala/Data-Quality-Monitoring.git
   ```  
2. Navigate to the project directory:  
   ```bash
   cd Data-Quality-Monitoring
   ```  
3. Set up the environment:  

   - Make the setup script executable (if needed):  
     ```bash
     chmod +x setup_environment.sh
     ```  
   - Run the script to create a virtual environment and install dependencies:  
     ```bash
     ./setup_environment.sh
     ```  
4. Configure environment variables:  
   - Copy the `.env_template` file and rename it to `.env`.  
   - Modify the variables as needed.  

## Running the Project  

1. Start all services using Docker:  
   ```bash
   docker-compose up --build
   ```  
   This command builds and starts Kafka, Spark, MySQL, and Grafana containers.  

2. Running Kafka and Spark scripts manually (optional):  
   If you prefer not to use Docker, activate the virtual environment and run the scripts manually:  

   - Start Kafka Producer:  
     ```bash
     python kafka/kafka_producer.py
     ```  
   - Run Spark Processing Script:  
     ```bash
     python spark/process_data.py
     ```  

3. Access the Grafana Dashboard:  
   - Open a web browser and visit: [http://localhost:3000](http://localhost:3000/)  
   - Log in using the admin credentials from the `.env` file.  
   - The MySQL data source and default stock data dashboard should be pre-configured.  

## Additional Customization

- Modify the `.env` file to update MySQL database credentials if necessary.  
- Customize the Grafana dashboard (`stock_data_dashboard.json`) under the `grafana/` directory.  

## License

This project is distributed under the MIT License – refer to [LICENSE.txt](LICENSE.txt) for details.  

