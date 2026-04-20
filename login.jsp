<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - CourseUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f6; min-height: 100vh; display: flex; align-items: center; justify-content: center; margin: 0; }
        .auth-card { background: #fff; padding: 2.5rem; border-radius: 15px; box-shadow: 0 10px 30px rgba(0,0,0,0.08); width: 100%; max-width: 420px; }
        .form-control { border-radius: 8px; padding: 12px 15px; border: 1px solid #e0e0e0; font-size: 1rem; }
        .form-control:focus { box-shadow: 0 0 0 4px rgba(118, 75, 162, 0.15); border-color: #764ba2; }
        .btn-primary { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border: none; border-radius: 8px; padding: 12px; font-size: 1.05rem; font-weight: 600; width: 100%; transition: all 0.3s ease; }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 15px rgba(118, 75, 162, 0.3); background: linear-gradient(135deg, #764ba2 0%, #667eea 100%); }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <div class="auth-card">
                <div class="text-center mb-4">
                    <h2 class="fw-bold text-dark mb-1">Welcome Back 👋</h2>
                    <p class="text-muted">Sign in to your account</p>
                </div>
                <form action="login" method="post">
                    <div class="mb-3">
                        <label class="form-label text-muted small fw-semibold">EMAIL ADDRESS</label>
                        <input type="email" class="form-control" name="email" placeholder="you@example.com" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label text-muted small fw-semibold">PASSWORD</label>
                        <input type="password" class="form-control" name="password" placeholder="••••••••" required>
                    </div>
                    <button type="submit" class="btn btn-primary mb-3">Login</button>
                    <div class="text-center small mt-3">
                        <span class="text-muted">Don't have an account?</span> <a href="register.jsp" class="text-decoration-none fw-semibold" style="color: #764ba2;">Register here</a>
                    </div>
                    <div class="text-center mt-3">
                         <a href="index.jsp" class="text-muted text-decoration-none small">Back to Home</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>