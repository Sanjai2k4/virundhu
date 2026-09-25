package com.tap.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    // ADD ITEM
    public void addItem(CartItem item) {

        for (CartItem existingItem : items) {

            if (existingItem.getMenuId() == item.getMenuId()) {

                existingItem.setQuantity(
                    existingItem.getQuantity() + 1
                );

                return;
            }
        }

        items.add(item);
    }

    // REMOVE ITEM
    public void removeItem(int menuId) {

        items.removeIf(
            item -> item.getMenuId() == menuId
        );
    }

    // INCREASE
    public void increaseQuantity(int menuId) {

        for (CartItem item : items) {

            if (item.getMenuId() == menuId) {

                item.setQuantity(
                    item.getQuantity() + 1
                );

                return;
            }
        }
    }

    // DECREASE
    public void decreaseQuantity(int menuId) {

        for (CartItem item : items) {

            if (item.getMenuId() == menuId) {

                if (item.getQuantity() > 1) {

                    item.setQuantity(
                        item.getQuantity() - 1
                    );

                } else {

                    removeItem(menuId);
                }

                return;
            }
        }
    }

    // GET ITEMS
    public List<CartItem> getItems() {

        return items;
    }

    // GET TOTAL PRICE
    public double getTotal() {

        double total = 0;

        for (CartItem item : items) {

            total +=
                item.getPrice()
                * item.getQuantity();
        }

        return total;
    }

    // GET NUMBER OF DIFFERENT ITEMS
    public int getItemCount() {

        return items.size();
    }

    // GET TOTAL QUANTITY
    public int getTotalQuantity() {

        int count = 0;

        for (CartItem item : items) {

            count += item.getQuantity();
        }

        return count;
    }

    // GET QUANTITY OF PARTICULAR MENU ITEM
    public int getItemQuantity(int menuId) {

        for (CartItem item : items) {

            if (item.getMenuId() == menuId) {

                return item.getQuantity();
            }
        }

        return 0;
    }

    // CLEAR CART
    public void clearCart() {

        items.clear();
    }
}