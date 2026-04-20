<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Integer userId=(Integer) session.getAttribute("userId"); if (userId==null) { response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - CourseUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fa; }
        .navbar-custom { background: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-weight: 700; color: #764ba2 !important; font-size: 1.5rem; }
        .dashboard-card { border: none; border-radius: 15px; transition: all 0.3s ease; box-shadow: 0 4px 15px rgba(0,0,0,0.03); background: #fff; overflow: hidden; cursor: pointer; }
        .dashboard-card:hover { transform: translateY(-5px); box-shadow: 0 10px 25px rgba(0,0,0,0.1); }
        .card-icon-wrapper { height: 100px; display: flex; align-items: center; justify-content: center; font-size: 3rem; color: white; }
        .bg-gradient-primary { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
        .bg-gradient-success { background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); }
        .card-body h5 { font-weight: 600; margin-bottom: 0; }
        .text-decoration-none { text-decoration: none !important; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom py-3">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-mortarboard-fill me-2"></i>CourseUp</a>
            <div class="d-flex">
                <a href="login.jsp" class="btn btn-outline-danger rounded-pill px-4 btn-sm fw-semibold">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row mb-5">
            <div class="col-12">
                <h2 class="fw-bold">Welcome to Dashboard 🎉</h2>
                <p class="text-muted fs-5">What would you like to do today?</p>
            </div>
        </div>

        <div class="row g-4 justify-content-center">
            <div class="col-md-5">
                <a href="courses" class="text-decoration-none text-dark d-block">
                    <div class="card dashboard-card">
                        <div class="card-icon-wrapper bg-gradient-primary">
                            <i class="bi bi-book"></i>
                        </div>
                        <div class="card-body text-center py-4">
                            <h5 class="card-title">View All Courses</h5>
                            <p class="card-text text-muted mt-2">Explore our wide range of available courses.</p>
                        </div>
                    </div>
                </a>
            </div>
            
            <div class="col-md-5">
                <a href="mycourses" class="text-decoration-none text-dark d-block">
                    <div class="card dashboard-card">
                        <div class="card-icon-wrapper bg-gradient-success">
                            <i class="bi bi-person-video3"></i>
                        </div>
                        <div class="card-body text-center py-4">
                            <h5 class="card-title">My Courses</h5>
                            <p class="card-text text-muted mt-2">Access the courses you are enrolled in.</p>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>