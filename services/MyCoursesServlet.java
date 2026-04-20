import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/mycourses")
public class MyCoursesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int userId = (int) req.getSession().getAttribute("userId");

        List<Map<String, String>> courses = new ArrayList<>();

        try {
            Connection conn = DBUtil.getConnection();

            String sql = "SELECT c.* FROM courses c " +
                    "JOIN enrollments e ON c.id = e.course_id " +
                    "WHERE e.user_id = ?";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> c = new HashMap<>();
                c.put("name", rs.getString("course_name"));
                c.put("desc", rs.getString("description"));
                c.put("instructor", rs.getString("instructor"));
                c.put("duration", rs.getString("duration"));
                courses.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("courses", courses);
        req.getRequestDispatcher("mycourses.jsp").forward(req, res);
    }
}