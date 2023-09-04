package com.NaveenBlog.Dao;

import java.sql.*;

public class LikeDao {

    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    //insert like function
    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into liked (pid, uid) values(?, ?)";
            PreparedStatement p = this.con.prepareStatement(q);
            //values set....
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //count like
  
    public int countLikeOnPost(int pid) {
        int count = 0;

       
 String q = "select count(*)  from liked where pid=?";
        try {
            
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
         
              ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    //checking user is liked the post or not
    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {

            String q = "select * from liked where pid=? and uid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();

            if (set.next()) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //post will dislike when user will again click on like button
    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            String q = "delete from liked where pid=? and uid=?";
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
