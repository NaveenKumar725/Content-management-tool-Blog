
package com.NaveenBlog.Dao;
import com.NaveenBlog.Entities.Category;
import com.NaveenBlog.Entities.Post;
import com.mysql.cj.protocol.Resultset;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategory(){
        ArrayList<Category> list=new ArrayList<>();
        
        try {
            
            String q="select * from categories ";
            Statement st=this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            
            while(set . next() ){
                
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String description=set.getString("description");
                
                Category c=new Category(cid, name, description);
                list.add(c);
                
                
            }
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f=false;
        
         try {
             
             String q="insert into posts (pTitle, pContent, pCode, pPic, catId, userId) values(?, ?, ?, ?, ?, ?) ";
             PreparedStatement pstmt=con.prepareStatement(q);
             pstmt.setString(1, p.getpTitle());
             pstmt.setString(2, p.getpContent());
             pstmt.setString(3, p.getpCode());
             pstmt.setString(4, p.getpPic());
             pstmt.setInt(5, p.getCatId());
             pstmt.setInt(6, p.getUserId());
             
             pstmt.executeUpdate();
             f=true;
             
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        return f;
    }
    
    
    //Get all the Posts
    public List<Post> getAllPosts(){
        List<Post>list=new ArrayList<>();
        
        //Fetch all the Posts
        try {
            PreparedStatement p= con.prepareStatement("select  *  from  posts order by pid desc ");
            ResultSet set=p.executeQuery();
            
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
               int catId=set.getInt("catId");
               int userId=set.getInt("userId");
                java.security.Timestamp pDate = null;
               Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
               list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
    
     //Get all the Posts by id or Category id
    public List<Post>getPostByCatId(int catId){
        List<Post>list=new ArrayList<>();
        
        //fetch all the the by id or category
      try {
            PreparedStatement p= con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set=p.executeQuery();
            
            while(set.next()){
                int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
              
               int userId=set.getInt("userId");
                java.security.Timestamp pDate = null;
               Post post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
               list.add(post);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    
    public Post getPostByPostId(int postId){
         Post post=null;
          String q="select * from posts where pid=?";
        try {
           
     
        PreparedStatement p=this.con.prepareStatement(q);
        p.setInt(1, postId);
        ResultSet set=p.executeQuery();
        
        if(set.next()){
            
           
            
              int pid=set.getInt("pid");
                String pTitle=set.getString("pTitle");
                String pContent=set.getString("pContent");
                String pCode=set.getString("pCode");
                String pPic=set.getString("pPic");
               Timestamp date=set.getTimestamp("pDate");
              
               int userId=set.getInt("userId");
                java.security.Timestamp pDate = null;
            int catId = set.getInt("catId");
              post=new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
            
        }
        
         } catch (Exception e) {
             e.printStackTrace();
        }
        return post;
    }
}
