<%--
  Created by IntelliJ IDEA.
  User: LunaTK
  Date: 28/11/2018
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ResourceBundle" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>시간표</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" media="screen" href="css/timetable.css" />

<body>
    <%

      class Timestamp {
          public Integer hour  = 0, minute = 0;

          public Timestamp() {};

          public Timestamp(Integer hour, Integer minute) {
              this.hour = hour;
              this.minute = minute;
          }

          public Timestamp(Integer fullTime) {
              this.hour = fullTime / 100;
              this.minute = fullTime % 100;
          }

          @Override
          public String toString() {
              return String.format("{\"hour\": %d, \"minute\": %d}", hour, minute);
          }
      }

      class LectureTime {
          public Integer day = 0;
          public Timestamp start = new Timestamp(9, 0), finish = new Timestamp(10, 15);

          @Override
          public String toString() {
              return String.format("{ \"start\": %s, \"finish\": %s, \"day\": %d }", start.toString(), finish.toString(), day);
          }
      }

      class Lecture {


          public String name = "", room = "", color = "", professor = "";
          public List<LectureTime> lectureTimes = new ArrayList<>();

          @Override
          public String toString() {
              return String.format("{\"name\": \"%s\", \"room\":\"%s\", \"professor\": \"%s\", \"color\": \"%s\", \"lectureTimes\": %s}", name, room, professor, color, lectureTimes);
          }
      }

    ArrayList<Lecture> lectureList = new ArrayList<>();
    Connection conn = null;                                        // null로 초기화 한다.

    try{
        ResourceBundle resource = ResourceBundle.getBundle("sw4/dbconfig");
        String url=resource.getString("url");
        String id=resource.getString("id");
        String pw=resource.getString("pw");
      Class.forName("com.mysql.jdbc.Driver");                       // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.

      conn=DriverManager.getConnection(url,id,pw);              // DriverManager 객체로부터 Connection 객체를 얻어온다.
      //out.println("연결됨");
      //out.println("제대로 연결되었습니다.");                            // 커넥션이 제대로 연결되면 수행된다.
      Statement statement = conn.createStatement();
        //int형으로 return값을 받는다. insert, update, delete, create를 수행
        //결과를 ResultSet으로 받는다.
      ResultSet resultSet = statement.executeQuery("select * from class;");
      while (resultSet.next()) {
          Statement lectureTimeQuery = conn.createStatement();
          int lecture_id = resultSet.getInt("class_id");
          ResultSet lectureTimes = lectureTimeQuery.executeQuery("select * from class_time where class_id = " + lecture_id + ";");

          Lecture lecture = new Lecture();
          lecture.name = resultSet.getString("class_name");
          lecture.professor = resultSet.getString("class_professor");
          lecture.room = resultSet.getString("class_room");

          while (lectureTimes.next()) {
              LectureTime lectureTime = new LectureTime();
              lectureTime.day = lectureTimes.getInt("day_of_class");
              lectureTime.start = new Timestamp(lectureTimes.getInt("start_time"));
              lectureTime.finish = new Timestamp(lectureTimes.getInt("end_time"));
              lecture.lectureTimes.add(lectureTime);
          }

          lectureList.add(lecture);

      }
    }catch(Exception e){                                                    // 예외가 발생하면 예외 상황을 처리한다.
      out.println(e.getMessage());
      e.printStackTrace();

    }
  %>
    <%
    StringBuilder sb = new StringBuilder();
    sb.append("<script> var lectures = [");
    for (int i = 0 ; i < lectureList.size() ; i++) {
      if (i != 0) sb.append(",");
      sb.append(lectureList.get(i).toString());
      System.out.println(lectureList.get(i).toString());
    }
    sb.append("];</script>");
    out.println(sb.toString());
  %>
    <table id="time-table">

    </table>
    <script src="js/timetable.js"></script>
</body>

</html>