# Course Enrollment System 🎓

A modern, responsive Course Enrollment web application built using **Java Servlets**, **JSP**, **JDBC**, and **MySQL**. The frontend features a beautiful, premium design utilizing **Bootstrap 5**, vibrant gradients, and clean card-based layouts.

## ✨ Features
- **User Authentication**: Secure user registration and login functionality.
- **Beautiful UI**: Glassmorphism effects, responsive grids, and modern typography (Google 'Inter' font).
- **Course Catalog**: Users can browse a list of available courses complete with details like instructor, duration, rating, and price.
- **Enrollment System**: Seamlessly enroll in available courses with a simple click.
- **My Courses Dashboard**: A dedicated dashboard for users to view the courses they are enrolled in and track learning.
- **Secure Configuration**: Database connections are managed via a centralized utility class reading from a secure `db.properties` file.

## 🚀 Tech Stack
- **Backend:** Java 17+, Servlets, JSP
- **Database:** MySQL (JDBC)
- **Frontend:** HTML5, CSS3, Bootstrap 5, Bootstrap Icons
- **Server:** Apache Tomcat

## 📁 Project Structure
- `services/`: Contains all Java Servlets (`LoginServlet`, `RegisterServlet`, `CourseServlet`, `EnrollmentServlet`, `MyCoursesServlet`) and the `DBUtil` class.
- `WEB-INF/`: Contains `web.xml` for servlet mapping and the `classes/` directory for compiled bytecode and database properties.
- `*.jsp`: The view layer, including `index.jsp` (Home), `login.jsp`, `register.jsp`, `dashboard.jsp`, `courses.jsp`, and `mycourses.jsp`.

## 🛠️ Setup & Installation

1. **Clone the Repository**
   ```bash
   git clone git@github.com:mohitxcodes/course_enrollment_servlet_jdbc.git
   cd course_enrollment_servlet_jdbc
   ```

2. **Database Setup**
   - Ensure MySQL is running on your machine.
   - Create a database named `course_db`.
   - Ensure you have the `users`, `courses`, and `enrollments` tables created.
   - **Crucial step:** Create a `db.properties` file inside the `WEB-INF/classes/` directory and add your MySQL credentials:
     ```properties
     db.url=jdbc:mysql://localhost:3306/course_db
     db.user=your_database_username
     db.password=your_database_password
     db.driver=com.mysql.cj.jdbc.Driver
     ```

3. **Deployment**
   - Place this project folder into your Apache Tomcat `webapps/` directory.
   - Start the Tomcat server.
   - Open your browser and navigate to `http://localhost:8080/CourseEnrollment/`.

## 🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page.
