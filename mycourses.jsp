<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Integer userId=(Integer) session.getAttribute("userId"); if (userId==null) { response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Courses - CourseUp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fa; }
        .navbar-custom { background: #fff; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .navbar-brand { font-weight: 700; color: #764ba2 !important; font-size: 1.5rem; }
        .course-card { border: none; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.04); transition: transform 0.3s ease; height: 100%; display: flex; flex-direction: column; overflow: hidden;}
        .course-card:hover { transform: translateY(-4px); box-shadow: 0 10px 20px rgba(0,0,0,0.08); }
        .card-header-gradient { height: 100px; background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); }
        .progress-bar-custom { background-color: #11998e; border-radius: 10px; }
        .progress-bg { height: 8px; border-radius: 10px; background-color: #e9ecef; }
        .play-icon-wrapper { width: 55px; height: 55px; background: #fff; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom py-3 mb-5">
        <div class="container">
            <a class="navbar-brand" href="dashboard.jsp"><i class="bi bi-mortarboard-fill me-2"></i>CourseUp</a>
            <div class="d-flex align-items-center gap-4">
                <a href="dashboard.jsp" class="nav-link text-muted fw-medium d-none d-sm-block">Dashboard</a>
                <a href="courses" class="nav-link text-muted fw-medium d-none d-sm-block">All Courses</a>
                <a href="login.jsp" class="btn btn-outline-danger btn-sm rounded-pill px-4 fw-semibold">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container pb-5">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h2 class="fw-bold mb-1">🎓 My Learning</h2>
                <p class="text-muted mb-0 fs-5">Continue where you left off.</p>
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
                    <div class="card-header-gradient position-relative">
                        <div class="position-absolute" style="bottom: -27px; right: 25px;">
                            <div class="play-icon-wrapper">
                                <i class="bi bi-play-fill text-success" style="font-size: 2rem; margin-left: 4px;"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-4 p-4 d-flex flex-column">
                        <h5 class="card-title fw-bold mt-2 text-truncate" title="<%= c.get("name") %>"><%= c.get("name") %></h5>
                        <p class="card-text text-muted small mb-4 flex-grow-1" style="display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden;"><%= c.get("desc") %></p>
                        
                        <div class="d-flex flex-column gap-2 text-sm text-secondary mb-4 small">
                            <div class="d-flex align-items-center"><i class="bi bi-person me-2 fs-6"></i> <strong>Instructor:</strong> <span class="ms-2 text-dark"><%= c.get("instructor") %></span></div>
                            <div class="d-flex align-items-center"><i class="bi bi-clock me-2 fs-6"></i> <strong>Duration:</strong> <span class="ms-2 text-dark"><%= c.get("duration") %></span></div>
                        </div>

                        <div class="mt-auto">
                            <div class="d-flex justify-content-between small fw-medium text-muted mb-2">
                                <span>Course Progress</span>
                                <span>0%</span>
                            </div>
                            <div class="progress progress-bg mb-3">
                                <div class="progress-bar progress-bar-custom" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <button class="btn btn-outline-success w-100 fw-semibold py-2">Continue Learning</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } } else { %>
             <div class="col-12 py-5 text-center">
                <div class="p-5 bg-white rounded-4 shadow-sm border">
                    <i class="bi bi-journal-x text-muted" style="font-size: 4rem;"></i>
                    <h4 class="mt-3 fw-bold">No enrolled courses yet</h4>
                    <p class="text-muted fs-5 mb-4">You haven't enrolled in any courses. Explore our catalog!</p>
                    <a href="courses" class="btn btn-primary px-5 py-2 fw-semibold rounded-pill">Browse Courses</a>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>