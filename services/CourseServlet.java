import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/courses")
public class CourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Map<String, String>> courses = new ArrayList<>();

        try {
            Connection conn = DBUtil.getConnection();

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM courses");

            while (rs.next()) {
                Map<String, String> course = new HashMap<>();

                String id = rs.getString("id");
                System.out.println("Fetched ID: " + id); // 🔥 debug

                course.put("id", id);
                course.put("name", rs.getString("course_name"));
                course.put("desc", rs.getString("description"));
                course.put("instructor", rs.getString("instructor"));
                course.put("duration", rs.getString("duration"));
                course.put("price", rs.getString("price"));
                course.put("rating", rs.getString("rating"));

                courses.add(course);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("courses", courses);
        req.getRequestDispatcher("courses.jsp").forward(req, res);
    }
}