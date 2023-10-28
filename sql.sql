Create database foodshop;
use foodshop;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,productsproducts
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `regular` decimal(10,2) DEFAULT NULL,
  `overview` text,
  `stock` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
)
