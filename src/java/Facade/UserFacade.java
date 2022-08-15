/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Facade;

import entities.Category;
import entities.Product;
import entities.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class UserFacade {

    public UserFacade() {
        DBUtils.loadDriver();
    }

    public List<Product> getAll() {
        List<Product> list = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            String sql = " SELECT * FROM Product";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list      
            list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                list.add(product);
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return list;
    }
    
    //get a product by id
    public Product getProduct(int id) {
        Product product = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            //Executing the stm
            //Creating and executing sql statements            
            String sql = "select * from Product where id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list                  
            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            ex.printStackTrace();
        }
        return product;
    }
    
    //get list product by rangge
    public List<Product> findRange(int[] id) {
        List<Product> list = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            String sql = " SELECT p.* FROM Product p WHERE p.id BETWEEN ? AND ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id[0]);
            stm.setInt(2, id[1] - id[0] +1);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list      
            list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                list.add(product);
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return list;
    }
    
    public int count(){
        int num = 0;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            //Executing the stm
            //Creating and executing sql statements            
            String sql = "select count(p.id) as count_product From Product p";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list                  
            if (rs.next()) {
                num = rs.getInt("count_product");
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            ex.printStackTrace();
        }
        return num;
    }
    
    //get product by category ID
    public List<Product> getProductByCategoryId(int category_id) {
        List<Product> list = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            String sql = " SELECT * FROM Product WHERE category_id=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, category_id);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list      
            list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                list.add(product);
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return list;
    }
    
    //get all category
    public List<Category> getAllCategory() {
        List<Category> list = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            String sql = " SELECT * FROM Category";
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list      
            list = new ArrayList<>();
            while (rs.next()) {
                Category category = new Category();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                list.add(category);
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return list;
    }
    
    
    //get product by name
    //get product by category ID
    public List<Product> getProductByName(String name) {
        List<Product> list = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            String sql = " SELECT * FROM Product WHERE description like ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, "%"+name+"%");
            ResultSet rs = stm.executeQuery();
            //Loading data into the list      
            list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getDouble("price"));
                product.setDiscount(rs.getDouble("discount"));
                list.add(product);
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
        }
        return list;
    }
    
    //Check Login
    public User checkLogin(String gmail, String password){
        User user = null;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            //Executing the stm
            //Creating and executing sql statements            
            String sql = "SELECT * FROM Users WHERE gmail=? AND password=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, gmail);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            //Loading data into the list                  
            if (rs.next()) {
                user = new User();
                user.setGmail(rs.getString("gmail"));
                user.setFullName(rs.getString("fullName"));
                user.setRoleID(rs.getString("roleID"));
                user.setPassword(rs.getString("password"));
            }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            ex.printStackTrace();
        }
        return user;
    }
    public void createUser(User user){
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            //Executing the stm
            //Creating and executing sql statements            
            String sql = "insert into Users values(?,?,?,?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, user.getGmail());
            stm.setString(2, user.getFullName());
            stm.setString(3, user.getRoleID());
            stm.setString(4, user.getPassword());
            stm.executeUpdate();
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    public boolean checkDuplicate(String gmail){
        boolean check = false;
        try {
            //Connecting to a database
            Connection con = DriverManager.getConnection(DBUtils.URL);
            //Executing the stm
            //Creating and executing sql statements            
            String sql = "SELECT fullname FROM Users WHERE gmail=?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, gmail);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                    check = true;
                }
            //Closing the connection
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex.getMessage());
            ex.printStackTrace();
        }
        return check;
    }
    
    
     public static void main(String[] args) {
        UserFacade dao = new UserFacade();
        List<Product> list = dao.getAll();
        List<Product> listC = dao.getAll();

        for (Product o : list) {
            System.out.println(o);
        }
    }
}
