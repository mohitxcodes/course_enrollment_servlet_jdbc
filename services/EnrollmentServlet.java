import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/enroll")
public class EnrollmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int userId = (int) req.getSession().getAttribute("userId");
        System.out.println("courseId: " + req.getParameter("courseId"));
        int courseId = Integer.parseInt(req.getParameter("courseId"));

        try {
            Connection conn = DBUtil.getConnection();

            // 🔥 Prevent duplicate enroll
            String checkSql = "SELECT * FROM enrollments WHERE user_id=? AND course_id=?";
            PreparedStatement checkPs = conn.prepareStatement(checkSql);
            checkPs.setInt(1, userId);
            checkPs.setInt(2, courseId);

            ResultSet rs = checkPs.executeQuery();

            if (!rs.next()) {
                String sql = "INSERT INTO enrollments(user_id, course_id) VALUES(?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                ps.setInt(2, courseId);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        res.sendRedirect("courses");
    }
}