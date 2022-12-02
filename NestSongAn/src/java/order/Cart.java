/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.util.HashMap;
import java.util.Map;
import product.ProductDTO;

/**
 *
 * @author Admin
 */
public class Cart {
    private Map<Integer, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<Integer, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<Integer, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, ProductDTO> cart) {
        this.cart = cart;
    }

    public boolean add(ProductDTO pro) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(pro.getProductId())) {
            int currentQuantity = this.cart.get(pro.getProductId()).getQuantity();
            pro.setQuantity(currentQuantity + pro.getQuantity());
        }
        this.cart.put(pro.getProductId(), pro);
        check = true;
        return check;
    }

    public boolean remove(int id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(int id, ProductDTO tea) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, tea);
                check = true;
            }
        }
        return check;
    }
    
   
}
