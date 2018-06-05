package com.shadat.database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.shadat.admin.model.*;
import com.shadat.main.model.Cart;
import com.shadat.main.model.CartItem;
import com.shadat.main.model.Order;
import com.shadat.main.model.OrderUserDetail;
import com.sun.org.apache.xpath.internal.operations.Or;

public class Database {

    private Connection connection;
    private String orderNumber = "";

    public void createConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/volume360",
                    "root", "root");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void closeConnection() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getProducts() {
        System.out.println("Hello");
        Statement statement = null;
        List<Product> products = new ArrayList<Product>();
        try {
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from product");
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String title = resultSet.getString(2), description = resultSet.getString(3);
                double price = resultSet.getDouble(4);
                boolean isAvailable = resultSet.getBoolean(5);
                double discount = resultSet.getDouble(6);
                String thumbnail = resultSet.getString(7);
                int stock = resultSet.getInt(8);
                Product product = new Product(id, title, description, thumbnail, price, discount, isAvailable, stock);
                products.add(product);
            }
            return products;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public Product getProduct(int id) {
        Statement statement = null;
        Product product = null;
        try {

//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from product where id='" + id + "'");
            while (resultSet.next()) {
                String title = resultSet.getString(2), description = resultSet.getString(3);
                double price = resultSet.getDouble(4);
                boolean isAvailable = resultSet.getBoolean(5);
                double discount = resultSet.getDouble(6);
                String thumbnail = resultSet.getString(7);
                int stock = resultSet.getInt(8);
                product = new Product(id, title, description, thumbnail, price, discount, isAvailable, stock);
            }
            closeConnection();
            return product;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        closeConnection();
        return product;
    }

    public boolean addProduct(Product product) {
        try {
            Statement statement = connection.createStatement();
            String title = product.getTitle();
            String description = product.getDescription();
            double price = product.getPrice();
            int isAvailable = product.isAvailable() ? 1 : 0;
            int stock = product.getStock();
            double discount = product.getDiscount();
            String thumbnail = product.getThumbnail();


            String sql = "insert into product (title,description,price,isAvailable,discount,thumbnail,stock) values " +
                    "('" + title + "','" + description + "'," + "'" + price + "','" + isAvailable + "','" + discount + "','" + thumbnail + "','" + stock + "')";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of insertion " + result);
                return true;
            }
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }


    public boolean updateProduct(Product product) {
        try {
            int id = product.getId();
            Statement statement = connection.createStatement();
            String title = product.getTitle();
            String description = product.getDescription();
            double price = product.getPrice();
            int isAvailable = product.isAvailable() ? 1 : 0;
            double discount = product.getDiscount();
            String thumbnail = product.getThumbnail();
            int stock = product.getStock();
            System.out.println("Product Det " + product.toString());

            String sql = "update product set title='" + title + "', "
                    + "description='" + description + "' , price='" + price + "', "
                    + "isAvailable='" + isAvailable + "', discount='" + discount + "', stock='" + stock + "'"
                    + " where id = '" + id + "'";

            //String sql = "update product set (title,description,price,isAvailable,discount,thumbnail) values " +
//                    "('"+title+"','"+description+"'," + "'"+price+"','"+isAvailable+"','"+discount+"','"+thumbnail+j"')";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of Update " + result);
                return true;
            }
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    public List<DeliveryMethod> getDeliveryMethods() {
        Statement statement = null;
        List<DeliveryMethod> deliveryMethods = new ArrayList<DeliveryMethod>();
        try {
            if (connection == null)
                createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from delivery_method");
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String title = resultSet.getString(2);
                String time = resultSet.getString(3);
                DeliveryMethod deliveryMethod = new DeliveryMethod(id, title, time);
                deliveryMethods.add(deliveryMethod);
            }
            closeConnection();
            return deliveryMethods;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return deliveryMethods;

    }

    public DeliveryMethod getDeliveryMethod(int id) {
        Statement statement = null;
        DeliveryMethod deliveryMethod = null;
        try {
//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from delivery_method where id='" + id + "'");
            while (resultSet.next()) {
                String title = resultSet.getString(2);
                String time = resultSet.getString(3);
                deliveryMethod = new DeliveryMethod(id, title, time);
            }
            closeConnection();
            return deliveryMethod;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return deliveryMethod;

    }

    public List<PaymentMethod> getPaymentMethods() {
        Statement statement = null;
        List<PaymentMethod> paymentMethods = new ArrayList<PaymentMethod>();
        try {
            if (connection == null)
                createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from payment_method;");
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String title = resultSet.getString(2);
                String phone_no = resultSet.getString(3);
                PaymentMethod paymentMethod = new PaymentMethod(id, title, phone_no);
                paymentMethods.add(paymentMethod);
            }
            closeConnection();
            return paymentMethods;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return paymentMethods;

    }


    public PaymentMethod getPaymentMethod(int id) {
        Statement statement = null;
        PaymentMethod paymentMethod = null;
        try {
//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("select * from payment_method where id='" + id + "'");
            while (resultSet.next()) {
                String title = resultSet.getString(2);
                String phone_no = resultSet.getString(3);
                paymentMethod = new PaymentMethod(id, title, phone_no);
            }
            closeConnection();
            return paymentMethod;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return paymentMethod;

    }

    public String addOrderToDB(Order order) {
        OrderUserDetail orderUserDetail = order.getOrderUserDetail();
        long result = addUserDetailToDB(orderUserDetail);
        orderUserDetail.setId(result);
        result = addOrderToDB(result, order);
        order.setOrderId((result));
        Cart cart = order.getCart();
        addCartItemToDB(cart, result);
        return this.orderNumber;
    }

    public long addUserDetailToDB(OrderUserDetail orderUserDetail) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String firstName = orderUserDetail.getFirstName();
            String lastName = orderUserDetail.getLastName();
            String detailAddress = orderUserDetail.getDetailAddress();
            String email = orderUserDetail.getEmail();
            String phone = orderUserDetail.getPhone();
            String sql = "insert into user_detail (first_name,last_name,detail_address,phone_no,email) values " +
                    "('" + firstName + "','" + lastName + "'," + "'" + detailAddress + "','" + phone + "','" + email + "')";
            long result = statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            if (result > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        result = generatedKeys.getLong(1);
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
                System.out.println("Result of insertion of UserDetail " + result);
                closeConnection();
                return result;
            }
            closeConnection();
            return -1;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return -1;
    }

    public long addOrderToDB(long userId, Order order) {
        Calendar calendar = Calendar.getInstance();
        long timeStamps = calendar.getTimeInMillis();
        int deliveryMethod = order.getDeliveryMethodId();
        int paymentMethod = order.getPaymentMethodId();
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        int month = calendar.get(Calendar.MONTH);
        int year = calendar.get(Calendar.YEAR);
        int hour = calendar.get(Calendar.HOUR_OF_DAY);
        int minute = calendar.get(Calendar.MINUTE);
        int random = (int) Math.ceil(Math.random() * 10000);
        String orderNumber = day + "" + month + "" + year + "" + hour + "" + minute + "" + random;
        order.setOrderTime(timeStamps);
        order.setOrderNumber(orderNumber);

        try {
            createConnection();
            Statement statement = connection.createStatement();
            String sql = "insert into user_order (user_id,order_time,order_number,delivery_method,payment_method) values "
                    + "('" + userId + "','" + timeStamps + "'," + "'" + orderNumber + "','" + deliveryMethod + "','" + paymentMethod + "')";
            long result = statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            if (result > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        result = generatedKeys.getLong(1);
                        this.orderNumber = orderNumber;
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
                System.out.println("Result of insertion of Order " + result);
                return result;
            }
            return -1;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return -1;

    }

    public void addCartItemToDB(Cart cart, long orderId) {
        List<CartItem> cartItems = cart.getCartItems();
        for (CartItem cartItem : cartItems) {
            String productId = cartItem.getProductId();
            String productAmount = cartItem.getAmount();
            try {
                createConnection();
                Statement statement = connection.createStatement();
                String sql = "insert into ordered_product (product_id,order_id,product_amount) values " +
                        "('" + productId + "','" + orderId + "'," + "'" + productAmount + "')";
                int result = statement.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
                if (result > 0) {
                    System.out.println("Result of insertion of OrderedProduct " + result);
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public List<OrderUserDetail> getOrderUsers() {
        List<OrderUserDetail> orderUserDetails = new ArrayList<>();

        Statement statement = null;
        try {
//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user_detail;");
            while (resultSet.next()) {
                long id = resultSet.getLong(1);
                String firstName = resultSet.getString(2);
                String lastName = resultSet.getString(3);
                String detailAddress = resultSet.getString(4);
                String phone_no = resultSet.getString(5);
                String email = resultSet.getString(6);
                OrderUserDetail orderUserDetail = new OrderUserDetail(firstName, lastName, phone_no, email, detailAddress);
                orderUserDetail.setId(id);
                orderUserDetails.add(orderUserDetail);
            }
            closeConnection();
            return orderUserDetails;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderUserDetails;
    }


    public OrderUserDetail getOrderUser(int id) {
        OrderUserDetail orderUserDetail = null;
        Statement statement = null;
        try {
//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user_detail where id='" + id + "'");
            while (resultSet.next()) {
                String firstName = resultSet.getString(2);
                String lastName = resultSet.getString(3);
                String detailAddress = resultSet.getString(4);
                String phone_no = resultSet.getString(5);
                String email = resultSet.getString(6);
                orderUserDetail = new OrderUserDetail(firstName, lastName, phone_no, email, detailAddress);
                orderUserDetail.setId(id);
                System.out.println(orderUserDetail.toString());
            }
            closeConnection();
            return orderUserDetail;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderUserDetail;
    }

    public List<Order> getPendingOrders(String status) {

        List<Order> pendingOrders = new ArrayList<>();
        Statement statement = null;
        try {
//            if(connection==null)
            createConnection();
            statement = connection.createStatement();
//            String query = "select * from product";
            ResultSet resultSet = statement.executeQuery("SELECT * FROM volume360.user_order where order_status='" + status + "'");
            while (resultSet.next()) {
                long id = resultSet.getLong(1);
                int userId = resultSet.getInt(2);
                long orderTime = resultSet.getLong(3);
                String orderNumber = resultSet.getString(4);
                int deliveryMethod = resultSet.getInt(5);
                int paymentMethod = resultSet.getInt(6);
                String orderStatus = resultSet.getString(7);
                OrderUserDetail orderUserDetail = getOrderUser(userId);
                Cart cart = Cart.getInstance();
                List<CartItem> cartItems = new ArrayList<>();
                createConnection();
                Statement productIdStatement = connection.createStatement();
                ResultSet productIdResultSet = productIdStatement.executeQuery("SELECT * FROM volume360.ordered_product where order_id='" + id + "'");
                while (productIdResultSet.next()) {
                    int productId = productIdResultSet.getInt(2);
                    int productAmount = productIdResultSet.getInt(4);
                    CartItem cartItem = new CartItem(String.valueOf(productId), String.valueOf(productAmount));
                    cartItems.add(cartItem);
                }
                cart.setCartItems(cartItems);
                Order order = new Order(orderUserDetail, deliveryMethod, paymentMethod, cart);
                order.setOrderId(id);
                order.setOrderTime(orderTime);
                order.setOrderNumber(orderNumber);
                order.setStatus(orderStatus);
                pendingOrders.add(order);
            }
            closeConnection();
            return pendingOrders;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return pendingOrders;

    }

    public Cart getOrderedProductCart(String id) {
        Cart cart = Cart.getInstance();
        List<CartItem> cartItems = new ArrayList<>();
        createConnection();
        Statement productIdStatement = null;
        try {
            productIdStatement = connection.createStatement();
            ResultSet resultSet = productIdStatement.executeQuery("SELECT * FROM volume360.ordered_product where order_id='" + id + "'");
            while (resultSet.next()) {
                int productId = resultSet.getInt(2);
                int productAmount = resultSet.getInt(4);
                CartItem cartItem = new CartItem(String.valueOf(productId), String.valueOf(productAmount));
                cartItems.add(cartItem);
            }
            cart.setCartItems(cartItems);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart;
    }

    public boolean updateOrderStatus(String orderId, String newStatus) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String sql = "update user_order set order_status='" + newStatus + "' where id = '" + orderId + "'";


            //String sql = "update product set (title,description,price,isAvailable,discount,thumbnail) values " +
//                    "('"+title+"','"+description+"'," + "'"+price+"','"+isAvailable+"','"+discount+"','"+thumbnail+j"')";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of Update " + result);
                closeConnection();
                return true;
            }
            closeConnection();
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return false;

    }


    public boolean addDeliveryMethod(DeliveryMethod deliveryMethod) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String title = deliveryMethod.getDeliveryMethodTitle();
            String time = deliveryMethod.getDeliveryTime();
            String sql = "insert into delivery_method (delivery_method_title,delivery_time) values " +
                    "('" + title + "','" + time + "')";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of insertion " + result);
                closeConnection();
                return true;
            }
            createConnection();
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return false;
    }


    public boolean deleteDeliveryMethod(String id) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String sql = "delete from delivery_method where id='" + id + "'";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of insertion " + result);
                closeConnection();
                return true;
            }
            closeConnection();
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return false;
    }


    public boolean updateDeliveryMethod(DeliveryMethod deliveryMethod) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String sql = "update delivery_method set delivery_method_title='" + deliveryMethod.getDeliveryMethodTitle() + "', "
                    + "delivery_time='" + deliveryMethod.getDeliveryTime() + "' where id = '" + deliveryMethod.getId() + "'";
            //String sql = "update product set (title,description,price,isAvailable,discount,thumbnail) values " +
//                    "('"+title+"','"+description+"'," + "'"+price+"','"+isAvailable+"','"+discount+"','"+thumbnail+j"')";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of Update " + result);
                closeConnection();
                return true;
            }
            closeConnection();
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return false;

    }

    public int getAdminToLogin(String userName, String password) {

        createConnection();
        Statement statement = null;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM volume360.admin where user_name='" + userName + "' and " +
                    "password='" + password + "'");
            while (resultSet.next()) {
                int adminId = resultSet.getInt(1);
                String adminUserName = resultSet.getString(2);
                String adminPassword = resultSet.getString(3);
                if (adminUserName.equals(userName) && adminPassword.equals(password)) {
                    return adminId;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int getTotalStock() {
        createConnection();
        Statement statement = null;
        int totalStock = 0;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT sum(stock) FROM volume360.product;");
            while (resultSet.next()) {
                totalStock = resultSet.getInt(1);
            }
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return totalStock;
    }

    public int getTotalCategory() {
        createConnection();
        Statement statement = null;
        int totalCategory = 0;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT count(stock) FROM volume360.product;");
            while (resultSet.next()) {
                totalCategory = resultSet.getInt(1);
            }
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return totalCategory;
    }

    public int getTotalOrderOf(String status) {
        createConnection();
        Statement statement = null;
        int totalOnStatus = 0;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT count(order_status) FROM volume360.user_order where order_status='" + status + "';");
            while (resultSet.next()) {
                totalOnStatus = resultSet.getInt(1);
            }
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return totalOnStatus;
    }

    public int getTotalCustomer() {
        createConnection();
        Statement statement = null;
        int totalCustomer = 0;
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT count(id) FROM volume360.user_detail;");
            while (resultSet.next()) {
                totalCustomer = resultSet.getInt(1);
            }
            closeConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        closeConnection();
        return totalCustomer;
    }

    public void addImagesToProduct(String productId, ArrayList<String> images) {
        boolean deleted = deleteProductImage(productId);
        createConnection();
        for (String image : images) {
            try {
                Statement statement = connection.createStatement();
                String sql = "insert into product_images (image_title,product_id) values " +
                        "('" + image + "','" + productId + "')";
                int result = statement.executeUpdate(sql);
                if (result > 0) {
                    System.out.println("Result of insertion " + result);
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        closeConnection();


    }

    public void addThumbnailToProduct(String productId, String image) {

        createConnection();
        try {
            Statement statement = connection.createStatement();
            String sql = "update product set thumbnail='" + image + "'where id = '" + productId + "'";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of insertion " + result);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        closeConnection();


    }

    public boolean deleteProductImage(String id) {
        try {
            createConnection();
            Statement statement = connection.createStatement();
            String sql = "delete from product_images where id='" + id + "'";
            int result = statement.executeUpdate(sql);
            if (result > 0) {
                System.out.println("Result of deletion " + result);
                closeConnection();
                return true;
            }
            closeConnection();
            return false;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        closeConnection();
        return false;

    }
}
