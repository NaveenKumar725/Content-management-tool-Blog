

<%@page import="java.util.List"%>
<%@page import="com.NaveenBlog.Entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.NaveenBlog.Entities.Category"%>
<%@page import="com.NaveenBlog.Helper.ConnectionProvider"%>
<%@page import="com.NaveenBlog.Dao.PostDao"%>
<%@page import="com.NaveenBlog.Entities.Message"%>
<%@page import="com.NaveenBlog.Entities.User"%>
<%@page  errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("Login_page.jsp");

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
              body{
                background: url(img/bggg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--        //navbar-->

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

                    <li class="nav-item dropdown ">
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
                    <li class="nav-item ">
                        <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact</a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#"  data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-asterisk"></span> Do Post</a>
                    </li>


                    <!--      <li class="nav-item">
                              <a class="nav-link " href="#"><span class="fa fa-sort-amount-asc"></span> More...</a>
                          </li>-->
                </ul>
                <ul class="navbar-nav mr-right" >
                    <li class="nav-item active">
                        <a class="nav-link" href="#!"  data-toggle="modal"  data-target="#profile-modal" ><span class="fa fa-user-circle-o "></span><%=  user.getName()%></a>
                    </li>
                </ul>

                <ul class="navbar-nav mr-right" >
                    <li class="nav-item active">
                        <a class="nav-link" href="Logoutservlet"><span class=""></span>Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--        end navbar-->

        <%
            Message m = (Message) session.getAttribute("msg");

            if (m != null) {
        %>
        <div class="alert  <%=  m.getCssClass()%> "  role="alert" >
            <%=  m.getContent()%>

        </div>

        <%
                session.removeAttribute("msg");
            }

        %>

        <!--//main body of the Page-->

        <main>
            <div class="container">
                <div class="row mt-4 ">
                    <!--First column-->
                    <div class="col-md-4">
                        <!--Categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0 , this )"  class=" c-link  list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--Categories-->
                            <%                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategory();

                                for (Category cc : list1) {
                            %>
                            <a href="#"  onclick="getPosts(<%= cc.getCid()%>, this )"  class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>
                            <%
                                }
                            %>


                        </div>
                    </div>
                    <!--Second Column-->
                    <div class="col-md-8" >
                        <!--Posts-->
                        <div class="container text-center " id="loader">

                            <i class="fa fa-refresh fa-3x fa-spin "></i>
                            <h3 class="mt-2" >Loading.....</h3>


                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>





        <!--//End body of the Page-->        


        <!--profile modal-->

        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#profile-modal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header  primary-background text-white text-center ">
                        <h5 class="modal-title" id="exampleModalLabel">Naveen-Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container  text-center ">
                            <img src="pics/<%=  user.getProfile()%>"   class="img-fluid"  style=" max-width: 140px; border-radius: 60%; " >
                            <h5 class="modal-title" id="exampleModalLabel"><%=  user.getName()%></h5>
                            <!--//details-->

                            <div id="profiledetails">
                                <table class="table">
                                    <!--                                <thead>
                                                                        <tr>
                                                                            <th scope="col">#</th>
                                                                            <th scope="col">First</th>
                                                                            <th scope="col">Last</th>
                                                                            <th scope="col">Handle</th>
                                                                        </tr>
                                                                    </thead>-->
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td> <%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td> <%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--//Profile Edit-->
                            <div id="profile-edit" style=" display: none; " >
                                <h4 class="mt-2" > Please edit carefully </h4>
                                <form action="Editservlet" method="post"  enctype="multipart/form-data" >
                                    <table class="table" >
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Name :  </td>
                                            <td>  <input type="text" class="form-control"  name="user_name2" value=" <%=  user.getName()%> "   /> </td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control"  name="user_email2" value=" <%=  user.getEmail()%> "   /></td>
                                        </tr>
                                        <tr>
                                            <td>Password :  </td>
                                            <td>  <input type="text" class="form-control"  name="user_password2" value=" <%=  user.getPassword()%> "   /> </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :  </td>
                                            <td><%= user.getGender()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About :</td>
                                            <td> <textarea  class="form-control" name="user_about2" >
                                                    <%= user.getAbout()%>
                                                </textarea> </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile Pic:</td>
                                            <td>
                                                <input type="file" name="user_pic" class="form-control" />
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary" >Save </button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end profile modal-->

        <!--Do Post Modal-->

        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide post details...</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form  id="addpostform" action="AddPostservlet"  method="POST" >
                            <div class="form-group">
                                <select class="form-control"  name="post_category" >
                                    <option selected disabled >---Select category</option>

                                    <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategory();

                                        for (Category c : list) {

                                    %>

                                    <option value="<%=  c.getCid()%>" ><%= c.getName()%></option>

                                    <%   }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" placeholder="Enter your title" class="form-control" name="post_title" />
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter your content" class="form-control" name="post_content" style=" height: 150px; " ></textarea>
                            </div>
                            <div class="form-group">
                                <textarea placeholder="Enter your program (if any)" class="form-control" name="post_code" style=" height: 150px; " ></textarea>
                            </div>
                            <div class="form-group">
                                Select your pic:<input type="file"  class="form-control" name="post_pic" />
                            </div>

                            <div class="container  text-center ">

                                <button type="submit" class="btn btn-primary">Post</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>


        <!--End Do Post Modal-->

        <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="myJs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-btn').click(function () {
//                       alert ("button clicked");
                                        if (editStatus == false) {
                                            $("#profiledetails").hide();
                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back");
                                        } else {
                                            $("#profiledetails").show();
                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                        }

                                    });
                                });

        </script>

        <!--now add post javascript and jquery-->

        <script>

            $(document).ready(function (e) {

                $("#addpostform").on("submit", function (event) {
                    //this code get called when form will submitted...
                    event.preventDefault();
                    console.log("submitted...");
                    let form = new FormData(this);
                    //now requesting to server
                    $.ajax({
                        url: "AddPostservlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success..
                            console.log(data);


//                          if(data.trim() == 'done')
//                          {
                            swal("Good job!", "saved successfully", "success")
                                    .then((value) => {
                                        window.location = "profile.jsp";
                                    });
//                          }else{
//                              swal("Error!!", "something went wrong please try again...!", "error");
//                          }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error...
                            swal("Error!!", "something went wrong please try again...!", "error");


                        },
                        processData: false,
                        contentType: false
                    });

                });

            });

        </script>

        <!--Loading posts by using ajax-->
        <script>

            function getPosts(catId , temp ) {
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active');

                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data);
                        $(temp).addClass('active');
                    }
                });
            }

            $(document).ready(function (e) {
                
                let allPostRef=$('.c-link  ') [0];
                getPosts(0, allPostRef);
            });

        </script>
        

    </body>
</html>
