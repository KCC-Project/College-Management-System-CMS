<%@page import="Model.StudentModel"%>
<%@page import="java.util.List"%>
<%@page import="SERVICE.Impl.StudentServiceImpl"%>
<%@page import="SERVICE.StudentServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Student</title>
<link
	href="${pageContext.request.contextPath}/Resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
</head>
<body>
<div class= "container-fluid">
<div class="row">
<div class="col-md-12">


  <h2>All student </h2>       
  <table class="table table-hover">
    <thead>
      <tr>
      <th>S.No</th>
        <th>Firstname</th>
        <th>Middlename</th>
        <th>Lastname</th>
        <th>Email</th>
         <th>Edit || Delete</th>
         <th>Image</th>
      </tr>
    </thead>
    <tbody>
    <% StudentServiceInterface student= new StudentServiceImpl();
List<StudentModel> mo= student.getAllRecord();
int i=0;
for(StudentModel model:mo){
	i++;

%>
      <tr>
      <td><%=i %></td>
      
        <td><%= model.getFirstname()%></td>
        <td><%= model.getMiddlename()%></td>
        <td><%= model.getLastname()%></td>
        <td><%= model.getEmail()%></td>
           <td><a href="edit.jsp?id=<%= model.getStudentID()%>"><input type="button" class="btn btn-sucess" value="edit"></a>   
           <a href="delete.jsp?id=<%= model.getStudentID()%>"><input type="button" class="btn btn-sucess" value="delete"></a>
           </td>
        
          <td><img src="<%= model.getImage()%>" width="50" height="auto"></td> 
      </tr>
  <%} %>
    </tbody>
  </table>
</div>


</div>


</div>

</body>
</html>