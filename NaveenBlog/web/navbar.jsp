

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="Css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background">
          <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>  NaveenBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"> <span class="fa fa-book"></span> LearnCode with Durgesh<span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-circle-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Languages</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
       <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact</a>
      </li>
        <li class="nav-item active">
          <a class="nav-link" href="Login_page.jsp"><span class="fa fa-user-circle-o"></span> Login</a>
      </li>
         <li class="nav-item active">
          <a class="nav-link" href="Register_page.jsp"><span class="fa fa-user-plus"></span> Register</a>
      </li>
<!--      <li class="nav-item">
          <a class="nav-link " href="#"><span class="fa fa-sort-amount-asc"></span> More...</a>
      </li>-->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
    </body>
</html>
