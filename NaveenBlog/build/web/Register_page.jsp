

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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

        <!--        navbar-->
        <%@include file="navbar.jsp" %>


        <main class=" primary-background  banner-background " style="padding-bottom: 90px " >
            <div class="container">

                <div class="col-md-6 offset-md-3 ">
                    <div class="card">

                        <div class="card-header primary-background text-center text-white "  >
                            <span class="fa fa-user-plus fa-3x"></span><br>
                            <p>Register</p>
                        </div>
                        <div class="card-body">

                            <form   id="regpage" action="Registerservlet" method="POST" >

                                <div class="form-group">
                                    <label for="exampleInputEmail1">User Name</label>
                                    <input type="text" class="form-control" id="user_name"  name="user_name" aria-describedby="emailHelp" placeholder="Enter name">

                                </div>




                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="user_email"  name="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>



                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password"  name="user_password" class="form-control" id="user_password"  placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select gender</label><br>
                                    <input type="radio"  id="gender"  name=user_gender value="Male" >Male
                                    <input type="radio"  id="gender"  name=user_gender value="Female" >Female
                                    <!--                                    <input type="radio"  id="gender"  name=gender>Others-->
                                </div>
                                <div class="form-group">

                                    <textarea  id="textarea"  name="user_textarea" class="form-control"  rows="5"  placeholder="Tell something about yourself" ></textarea>

                                </div>


                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center " id="loader" style=" display: none " >
                                    <spin class="fa fa-refresh fa-spin fa-2x" ></spin>
                                    <h5>please wait....</h5>
                                </div>

                                <button type="submit"  id="submit-btn" class="btn btn-primary mt-3 ">Submit</button>
                            </form>

                        </div>
                        <div class="card-footer">

                        </div>

                    </div>




                </div>

            </div>
        </main>












        <!--        Javascript-->
        <script
            src="https://code.jquery.com/jquery-3.7.0.min.js"
            integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="JavaScript/myJs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {

                console.log("Loaded......");

                $("#regpage").on('submit', function (event) {
                    event.preventDefault();

                    $('#submit-btn').hide();
                    $('#loader').show();

                    let form = new FormData(this);

                    //send on servlet
                    $.ajax({
                        url: 'Registerservlet',
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $('#submit-btn').show();
                            $('#loader').hide();

//                        alert("Registration successfull... redirecting on login page")
//                                        .then((value) => {
//                                          location.href = "Login_page.jsp";
//                                        });
//                         if(data.trim()==='done'){
//                            
                                swal("Registration successfull... redirecting on login page")
                                        .then((value) => {
                                          window.location = "Login_page.jsp";
                                        });
//                                    }else{
//                                        swal(data);
//                                    }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);

                            $('#submit-btn').show();
                            $('#loader').hide();

                            swal("Something went wrong.....");





                        },
                        processData: false,
                        contentType: false
                    });

                });



            });

        </script>

    </body>
</html>
