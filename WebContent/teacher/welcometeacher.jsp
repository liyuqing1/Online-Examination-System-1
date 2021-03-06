<%@page import="java.sql.*" %>
<%
String ses=(String)session.getAttribute("tid");
if(ses==null)
	response.sendRedirect("teacherpanel.jsp");

String sesname=(String)session.getAttribute("tname");

%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/png" href="../images/favicon-32x32.png" sizes="32x32" />
<link rel="icon" type="image/png" href="../images/favicon-16x16.png" sizes="16x16" />
  <title>Welcome</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="../css/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="../css/bootstrap.min.js"></script>
 
  <style type="text/css">
  p{
  color:blue;
  font-size:25px;
  }
  body{
    top:0;
    left:0;
    height:100%;
    width:100%;
    min-height:640px;
    margin:0px auto;
  background-image:url('../images/bg3.jpg');
  background-repeat: no-repeat;
    background-attachment:fixed;
    background-size:cover;
  }
  .dropdown-menu{
  background-color: transparent;
        background: transparent;
        border-color: transparent;
  }
  
  
  .container{
	position:relative;
  width:70%;
 	top:100px;
 	
  }
  .para{
  padding:10px;
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  background-color:rgba(0,0,0,0.7);
	color:white;
  position:absolute;
  height:200px;
  top:200px;
  border-radius:10px;}
  .para p{
    font-weight:normal;
  font-size:30px;
  height:200px;
  align:right;
  color:white;
  font-family: 'Open Sans', Arial, Helvetica, sans-serif;
  
  }
  .navbar li a{
  color:black;}
  .nav{
 background-color: transparent;
   background: transparent;
   border-color: transparent;}
   .nav ul li:hover{
   background-color: transparent;
   background: transparent;
   border-color: transparent;}
   ul.nav >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}
ul.dropdown-menu >li >a:hover{
   background-color: #000000;
	color: #FFFFFF;
}

  </style>
</head>
<body>
<nav class="navbar navbar-light navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    </div>
     <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav nav-tabs">
      <li ><a href="welcometeacher.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <span class="glyphicon glyphicon-user"></span> Profile <span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="profile.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Profile</a></li>
      <li><a href="checkprofile.jsp"><span class="glyphicon glyphicon-wrench"></span>  Edit Profile</a></li>
      </ul>
      </li>
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="menu" aria-haspopup="true" aria-expanded="false">
         Exams<span class="caret"></span></a>
      <ul class="dropdown-menu">
      <li><a href="addquestion.jsp"><span class="glyphicon glyphicon-edit"></span> Add Question</a></li>
      <li><a href="viewquestion.jsp"><span class="glyphicon glyphicon-list-alt"></span> View Question</a></li>
      <li><a href="editquestion.jsp"><span class="glyphicon glyphicon-pencil"></span> Edit Question</a></li>
      <li><a href="deletequestion.jsp"><span class="glyphicon glyphicon-trash"></span> Delete Question</a></li>
      <li><a href="exam.jsp"><span class="glyphicon glyphicon-flash"></span> Start/Stop Exam</a></li>
      </ul>
      </li>
      <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
         <span class="glyphicon glyphicon-cog"></span> <%out.print(sesname); %></a>
      <ul class="dropdown-menu">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-off"></span> Logout</a></li>
      </ul>
      </li>
      
    </ul>
    
  </div>
  </div>
   <script>
  $('ul.nav li.dropdown').hover(function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideDown(250);
	}, function() {
	  $(this).find('.dropdown-menu').stop(true, true).slideUp(250);
	});
  </script>
</nav>
<div align="center" class="container">
<% 
ServletContext ob=getServletContext();
String duser=ob.getInitParameter("duser");
String dpass=ob.getInitParameter("dpass");
String cpath=ob.getInitParameter("cpath");
String connect=ob.getInitParameter("connect");
try{
	Class.forName(cpath);
	Connection con=DriverManager.getConnection(connect,duser,dpass);
	PreparedStatement ps=con.prepareStatement("select * from teacher where tid=?");
	ps.setString(1,ses);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		%>
		<h2>Welcome, <% out.print(rs.getString(1)); %></h2> 
		<div class="para">
		<p>
		<span style="font-size:40px;">W</span>elcome to the online Examination Portal created by subham verma.
		Here you can Add Questions,Edit Questions,View Questions,Delete Questions
		and can Start/Stop Examination.
		</p>
		</div>
		<%
	}
	con.close();
}
catch(Exception e)
{
	out.print(e);
}
%>
</div>
</body>
</html>