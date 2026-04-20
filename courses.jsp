<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Integer userId=(Integer) session.getAttribute("userId"); if (userId==null) { response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Courses - CourseUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fa; }
        .navbar-custom { background: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-weight: 700; color: #764ba2 !important; font-size: 1.5rem; }
        .course-card { border: none; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.04); transition: transform 0.3s ease, box-shadow 0.3s ease; height: 100%; display: flex; flex-direction: column; overflow: hidden; }
        .course-card:hover { transform: translateY(-5px); box-shadow: 0 12px 25px rgba(0,0,0,0.1); }
        .card-header-img { height: 140px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem; }
        .badge-price { background-color: #e8f5e9; color: #2e7d32; font-weight: 600; padding: 6px 12px; border-radius: 20px; font-size: 0.9rem; }
        .badge-rating { background-color: #fff8e1; color: #ff8f00; font-weight: 600; padding: 4px 8px; border-radius: 6px; }
        .btn-enroll { background-color: #764ba2; color: white; font-weight: 600; border-radius: 8px; padding: 12px 0; transition: background-color 0.2s; border: none; }
        .btn-enroll:hover { background-color: #5c3981; color: white; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom py-3 mb-5">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-mortarboard-fill me-2"></i>CourseUp</a>
            <div class="d-flex align-items-center gap-4">
                <a href="dashboard.jsp" class="nav-link text-muted fw-medium d-none d-sm-block">Dashboard</a>
                <a href="mycourses" class="nav-link text-muted fw-medium d-none d-sm-block">My Courses</a>
                <a href="login.jsp" class="btn btn-outline-danger btn-sm rounded-pill px-4 fw-semibold">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container pb-5">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h2 class="fw-bold mb-1">📚 Available Courses</h2>
                <p class="text-muted mb-0 fs-5">Discover and enroll in top-rated courses.</p>
            </div>
            <a href="dashboard.jsp" class="btn btn-light border shadow-sm btn-sm px-3 rounded-pill d-none d-md-block"><i class="bi bi-arrow-left me-1"></i> Back</a>
        </div>

        <div class="row g-4">
            <% List<Map<String, String>> courses = (List<Map<String, String>>) request.getAttribute("courses");
               if (courses != null && !courses.isEmpty()) {
                   for (Map<String, String> c : courses) { 
            %>
            <div class="col-md-6 col-lg-4">
                <div class="card course-card">
                    <div class="card-header-img">
                        <i class="bi bi-journal-code"></i>
                    </div>
                    <div class="card-body d-flex flex-column p-4">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <h5 class="card-title fw-bold text-truncate mb-0" title="<%= c.get("name") %>"><%= c.get("name") %></h5>
                            <span class="badge-price">₹<%= c.get("price") %></span>
                        </div>
                        <p class="card-text text-muted small mb-4 flex-grow-1" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;"><%= c.get("desc") %></p>
                        
                        <div class="d-flex flex-column gap-2 text-sm text-secondary mb-4 small">
                            <div class="d-flex align-items-center"><i class="bi bi-person me-2 fs-6"></i> <strong>Instructor:</strong> <span class="ms-2 text-dark"><%= c.get("instructor") %></span></div>
                            <div class="d-flex align-items-center"><i class="bi bi-clock me-2 fs-6"></i> <strong>Duration:</strong> <span class="ms-2 text-dark"><%= c.get("duration") %></span></div>
                            <div class="d-flex align-items-center"><i class="bi bi-star-fill text-warning me-2 fs-6"></i> <strong>Rating:</strong> <span class="badge-rating ms-2"><%= c.get("rating") %> / 5.0</span></div>
                        </div>

                        <!-- DEBUG (hidden) -->
                        <div style="display:none;" class="small text-success mb-2 text-center">Course ID: <%= c.get("id") %></div>

                        <form action="enroll" method="post" class="mt-auto">
                            <input type="hidden" name="courseId" value='<%= c.get("id") %>' />
                            <button type="submit" class="btn btn-enroll w-100 shadow-sm">Enroll Now</button>
                        </form>
                    </div>
                </div>
            </div>
            <% } } else { %>
            <div class="col-12 py-5 text-center">
                <div class="p-5 bg-white rounded-4 shadow-sm border">
                    <i class="bi bi-emoji-frown text-muted" style="font-size: 4rem;"></i>
                    <h4 class="mt-3 fw-bold">No courses available</h4>
                    <p class="text-muted fs-5">Check back later for new programs!</p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>