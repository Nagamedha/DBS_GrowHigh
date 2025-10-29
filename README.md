```markdown
# Grow High – Stock Order Management System (SOMS)

Grow High is a **database-driven full-stack web application** for managing and automating stock trading operations between custodians and their clients.  
It demonstrates complete integration between a **Spring Boot** backend, an **Angular** frontend, and a **MariaDB** database.


## Features

### Core Functionalities
- **Custodian Login** – Secure authentication with credential validation.  
- **Portfolio Management** – View and manage clients’ stock holdings.  
- **Buy/Sell Operations** – Place and execute stock trade requests.  
- **Transaction History** – View complete trade details (buyer, seller, price, quantity, total).  
- **Real-Time Updates** – Reflect changes instantly on trade execution.

### Advanced Features
- **Stored Procedures** for transaction handling:
  - `InsertBuyClient`
  - `InsertSellClient`
  - `UpdateBuyerRecord`
  - `UpdateSellerRecord`
- **Automated Email Notifications** on successful transactions.
- **BCNF-Normalized Database Schema** with indexing for optimized query performance.


## Tech Stack

| Layer | Technology |
|--------|-------------|
| Frontend | Angular 15 |
| Backend | Spring Boot 3 (Java 17) |
| Database | MariaDB 10.x |
| ORM | Spring Data JPA (Hibernate) |
| Tools | IntelliJ IDEA, DBeaver, Postman |


## Project Structure

DBS_GrowHigh/
│
├── SpringBootWebOMS/           # Backend (Spring Boot)
│   ├── src/main/java/...       # Controllers, Services, Entities
│   ├── src/main/resources/     # application.properties
│   └── pom.xml                 # Maven configuration
│
├── AngularOMS/                 # Frontend (Angular)
│   ├── src/                    # Components, Services, Templates
│   ├── angular.json
│   └── package.json
│
└── docs/                       # Optional documentation
├── Grow_High_Project_Report.pdf
├── ER_Diagram.png
└── DB_Schema.sql

````


## Prerequisites

Before you begin, make sure you have the following installed:

- [Java 17+](https://adoptium.net/)  
- [Node.js 18+](https://nodejs.org/) and npm  
- [Angular CLI](https://angular.io/cli)  
- [MariaDB 10+](https://mariadb.org/)  
- [Maven](https://maven.apache.org/) (optional, included via `mvnw` wrapper)  
- [IntelliJ IDEA](https://www.jetbrains.com/idea/) or VS Code  


## Database Setup (MariaDB)

1. Start MariaDB and create a new database:
   sql
   CREATE DATABASE dbs;
   USE dbs;

2. Import the SQL schema from:

   docs/DB_Schema.sql
   or manually run the SQL scripts provided in the backend.

3. (Optional) Verify connection using DBeaver or MySQL client:

   bash
   SHOW TABLES;
````

## Backend Setup (Spring Boot)

1. Open the project folder `SpringBootWebOMS` in IntelliJ or terminal.

2. Configure your database credentials in:

   ```
   src/main/resources/application.properties
   ```

   Example:

   ```properties
   spring.datasource.url=jdbc:mariadb://localhost:3306/dbs
   spring.datasource.username=root
   spring.datasource.password=your_password
   spring.jpa.hibernate.ddl-auto=update
   spring.jpa.show-sql=true
   spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MariaDBDialect
   server.port=8080
   ```

3. Run the backend:

   ```bash
   ./mvnw spring-boot:run
   ```

   or directly from IntelliJ by running `GrowHighApplication.java`.

   The backend will be available at:

   ```
   http://localhost:8080
   ```


## Frontend Setup (Angular)

1. Navigate to the frontend folder:

   ```bash
   cd AngularOMS
   ```
2. Install dependencies:

   ```bash
   npm install
   ```
3. Start the Angular app:

   ```bash
   npm start
   ```

   or

   ```bash
   ng serve --open
   ```
4. The frontend will open automatically in your browser at:

   ```
   http://localhost:4200
   ```


## Verify End-to-End Integration

1. **Backend Running:** Confirm Spring Boot console shows:

   ```
   Tomcat started on port 8080
   HikariPool-1 - Start completed
   ```
2. **Frontend Running:** Visit `http://localhost:4200`
3. **Database Connected:** Check `transactions` or `client` tables in DBeaver.
4. **Perform Actions:**

   * Log in as a custodian
   * Execute Buy/Sell request
   * Verify:

     * Transaction recorded in DB
     * Email notification sent (if configured)


## Key Stored Procedures (MariaDB)

Example:

```sql
DELIMITER //
CREATE PROCEDURE InsertBuyClient(
    IN client_id INT,
    IN instrument_id INT,
    IN qty INT,
    IN price DECIMAL(10,2)
)
BEGIN
    INSERT INTO BuyStocks (clientid, instrumentid, quantity, price, buy_date)
    VALUES (client_id, instrument_id, qty, price, NOW());
END //
DELIMITER ;
```

Additional procedures include:

* `InsertSellClient`
* `UpdateBuyerRecord`
* `UpdateSellerRecord`



## Common Issues & Fixes

| Issue                                       | Cause                    | Solution                                                                    |
| ------------------------------------------- | ------------------------ | --------------------------------------------------------------------------- |
| `Access denied for user 'root'@'localhost'` | Incorrect DB password    | Update `application.properties`                                             |
| `Unknown database 'dbs'`                    | DB not created           | Run `CREATE DATABASE dbs;`                                                  |
| CORS error                                  | Frontend blocked         | Add `@CrossOrigin(origins = "http://localhost:4200")` in controllers        |
| `Cannot load driver class`                  | Missing dependency       | Ensure `mariadb-java-client` is in `pom.xml`                                |
| Angular not loading styles                  | Missing Bootstrap config | Add in `angular.json` `"node_modules/bootstrap/dist/css/bootstrap.min.css"` |



## Testing the Application

1. **Run Backend + Frontend + DB**
2. Open `http://localhost:4200`
3. Log in as a custodian (use valid IDs from DB)
4. Perform Buy/Sell operations
5. Validate results via DBeaver:

   ```sql
   SELECT * FROM transactions ORDER BY transactionid DESC;
   ```


## Example Demo Flow

1. **Login →** Custodian authenticates
2. **Dashboard →** View all clients
3. **Portfolio →** View stock holdings
4. **Buy/Sell →** Place a trade request
5. **Transaction →** Check trade history
6. **Email →** Verify automated confirmation (if mail enabled)


## Architecture Diagram

```
Angular (Frontend)  <-->  Spring Boot (Backend)  <-->  MariaDB (Database)
       |                        |                       |
       |----> REST API Calls --->|----> JPA Queries ---->|
```


## Future Enhancements

* Real-time dashboards using Chart.js
* Predictive stock recommendation engine
* Integration with live market APIs
* Deployment on AWS / Docker containers


## Author

**Nagamedha Sakhamuri**
Graduate Teaching Assistant | MS CS – Georgia State University
 [LinkedIn](https://www.linkedin.com/in/medhasakhamuri) • [GitHub](https://github.com/Nagamedha)


## License

This project is open-source - Feel free to fork, improve, and contribute!


### Quick Start Summary

```bash
# Clone the repository
git clone https://github.com/Nagamedha/DBS_GrowHigh.git
cd DBS_GrowHigh

# Start MariaDB and create database
CREATE DATABASE dbs;

# Run backend
cd SpringBootWebOMS
./mvnw spring-boot:run

# Run frontend
cd ../AngularOMS
npm install
npm start

# Open application
http://localhost:4200

``` ##You now have the full Grow High application running locally.


Simple steps:
node_modules needs to be added before you run AngularOMS in front end.
Just clone this DBS_growHigh Repository.
and you connect mariadb from dbeaver - db.sql script you can use
Add db to your backend, intellij - springboot
run main SpringBootWebOmsApplication.java to start backened then
you run your front end, ensure node_modules is there, use npm install command in your angular terminal to start frontend
localhost url will be generated , you can click on it to visit your application.
Make sure all connections and APi's are working else debug, test.


Inshort execution:
> in your bash start mariadb first - brew services start mariadb
> dbs database should be there and all tables and stored procedures and data in tables should be there
> run your main - resources - application.properties file in springboot
> then Angualr terminal do "npm start"
> click on localhost url and login page will be shown.
> Make sure all configurations ,emails, properties, connections are intact for this to work
