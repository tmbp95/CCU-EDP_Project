CREATE TABLE `clients` (
  `client_id` int(11) DEFAULT NULL,
  `consumption` text CHARACTER SET utf8,
  KEY `client_id` (`client_id`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` tinytext CHARACTER SET utf8,
  `password` tinytext CHARACTER SET utf8,
  `email` tinytext CHARACTER SET utf8,
  `customer_name` text CHARACTER SET utf8,
  `customer_address` text CHARACTER SET utf8,
  `creditcard` tinytext CHARACTER SET utf8,
  `lastlogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `energy` (
  `energy_id` int(11) NOT NULL AUTO_INCREMENT,
  `producer_id` int(11) DEFAULT NULL,
  `quantity` text CHARACTER SET utf8,
  `packName` text CHARACTER SET utf8,
  `packDescript` text CHARACTER SET utf8,
  `posted_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`energy_id`),
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `energy_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_info` text CHARACTER SET utf8,
  `payment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `producers` (
  `producer_id` int(11) DEFAULT NULL,
  `production` text CHARACTER SET utf8,
  KEY `producer_id` (`producer_id`),
  CONSTRAINT `producers_ibfk_1` FOREIGN KEY (`producer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ratings` (
  `client_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `rating` text CHARACTER SET utf8,
  `when_rated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `client_id` (`client_id`),
  KEY `producer_id` (`producer_id`),
  KEY `transaction_id` (`transaction_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`producer_id`) REFERENCES `producers` (`producer_id`),
  CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `energy_id` int(11) DEFAULT NULL,
  `production` text CHARACTER SET utf8,
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_id`),
  KEY `client_id` (`client_id`),
  KEY `energy_id` (`energy_id`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`energy_id`) REFERENCES `energy` (`energy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
