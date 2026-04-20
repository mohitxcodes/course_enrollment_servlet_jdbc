<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Enrollment System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; color: white; margin: 0; }
        .hero-card { background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(15px); padding: 4rem 3rem; border-radius: 20px; text-align: center; box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); border: 1px solid rgba(255, 255, 255, 0.18); }
        .btn-custom { border-radius: 50px; padding: 12px 35px; font-weight: 600; transition: all 0.3s ease; text-decoration: none; }
        .btn-login { background-color: #fff; color: #764ba2; border: none; }
        .btn-login:hover { background-color: #f8f9fa; transform: translateY(-3px); box-shadow: 0 8px 20px rgba(0,0,0,0.2); color: #764ba2; }
        .btn-register { background-color: transparent; color: #fff; border: 2px solid #fff; }
        .btn-register:hover { background-color: rgba(255,255,255,0.2); transform: translateY(-3px); color: #fff; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-7">
                <div class="hero-card">
                    <h1 class="display-4 fw-bold mb-3">🔥 CourseUp!</h1>
                    <p class="lead mb-5">Empower your future with our beautiful, cutting-edge Course Enrollment System.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="login.jsp" class="btn-custom btn-login fs-5">Login</a>
                        <a href="register.jsp" class="btn-custom btn-register fs-5">Register</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>