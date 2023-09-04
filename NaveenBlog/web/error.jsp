

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
          <!--        Css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="Css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 70% 90%, 21% 93%, 0 100%, 0 0);

            }
            .primary-background{
                background: #2196f3 ! important  ;

            }
        </style>

    </head>
    <body>
        
        <div class="container text-center ">
            <img src="img/404-error.jpg"  class="img-fluid" alt="alt"/>
            <h3 class="display-3" >Sorry! something went wrong</h3>
            <%= exception %>
            <a href="index.jsp" class="btn primary-background btn-lg  mt-3 " >Home</a>
        </div>
        
    </body>
</html>
