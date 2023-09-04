
<%@page import="com.NaveenBlog.Entities.User"%>
<%@page import="com.NaveenBlog.Dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.NaveenBlog.Entities.Post"%>
<%@page import="com.NaveenBlog.Dao.PostDao"%>
<%@page import="com.NaveenBlog.Helper.ConnectionProvider"%>

<div class="row">
    <%
        User user = (User) session.getAttribute("currentUser");
//        Thread.sleep(300);
        PostDao d = new PostDao(ConnectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Post> posts = null;
        if (cid == 0) {
            posts = d.getAllPosts();
        } else {
            posts = d.getPostByCatId(cid);
        }
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center ' >No Posts in this category !!.......</h3>");
            return;
        }
        for (Post p : posts) {
    %>
    <div class="col-md-6 mt-2  ">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap" >

            <div class="card-body">
                <b> <%=  p.getpTitle()%></b>
                <p><%= p.getpContent()%> </p>


            </div>
            <div class="card-footer bg-primary ">
                <%
                    LikeDao id = new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="#" onclick="doLike(<%= p.getPid() %>, <%= user.getId()%>)"  class="btn btn-outline-light btn-sm    " ><i class="fa fa-thumbs-o-up " ><span class="like-counter"><%=  id.countLikeOnPost(p.getPid())  %></span></i></a>
                <a href="#!" class="btn btn-outline-light btn-sm    " ><i class="fa fa-commenting-o " ><span>20 </span></i></a>

                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm   mr-right " >Read More...</a>

            </div>
        </div>
    </div>
    <%
        }


    %>

</div>
<!--     <script>
            function doLike(pid, uid) {
    alert(pid + "," + uid);

                const d = {
                    pid: pid,
                    uid: uid,
                    operation: 'like'
                };
                $.ajax({
                    url:"Likeservlet",
                    data:d ,
                    success: function(data, textStatus , jqXHR){
                        console.log(data);
                        if($.trim(data) !== 'true'){
                            let c=$(".like-counter").html();
                            c++;
                            $('.like-counter').html(c);
                        }
                    },
                     error: function( jqXHR, textStatus , errorThrown){
                        console.log(data);
                    }
                });
            }
        </script>-->

