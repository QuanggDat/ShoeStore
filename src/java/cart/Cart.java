/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import Facade.UserFacade;
import entities.Product;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class Cart {

    UserFacade uf = new UserFacade();

    Map<Integer,Item> map = null;

    public Cart() {
        map = new HashMap<>();
    }

    public void add(int id, int quantity) {
        //Tim item trong cart
        Item item = map.get(id);
        //Neu item chua co trong cart thi tao moi item va them vao cart
        if (item == null) {
            Product product = uf.getProduct(id);
            item = new Item(product.getId(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getDiscount(),
                    quantity);
            map.put(id,item);
        }else{//Neu da co item trong cart thi chi cap nhat quantity
            item.setQuantity(item.getQuantity() + quantity);
        }
    }


    public void delete(int id) {
        map.remove(id);
    }

    public void update(int id, int quantity) {
        Item item = map.get(id);
        item.setQuantity(quantity);
    }

    public void empty() {
        map.clear();
    }

    public Collection<Item> getItems() {
        return map.values();
    }

    public double getTotal() {
        double total = 0;
        for (Item item : map.values()) {
            total += item.getCost();
        }
        return total;
    }

    public int getNumOfProducts() {
        return map.size();
    }

    
}
