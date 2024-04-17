-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- DROP SCHEMA IF EXISTS `northwind` ;
-- CREATE SCHEMA IF NOT EXISTS `northwind` DEFAULT CHARACTER SET latin1 ;
-- USE `northwind` ;

-- -- -----------------------------------------------------
-- -- Table `northwind`.`customers`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`customers` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `company` VARCHAR(50) NULL DEFAULT NULL,
--   `last_name` VARCHAR(50) NULL DEFAULT NULL,
--   `first_name` VARCHAR(50) NULL DEFAULT NULL,
--   `email_address` VARCHAR(50) NULL DEFAULT NULL,
--   `job_title` VARCHAR(50) NULL DEFAULT NULL,
--   `business_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `home_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `fax_number` VARCHAR(25) NULL DEFAULT NULL,
--   `address` LONGTEXT NULL DEFAULT NULL,
--   `city` VARCHAR(50) NULL DEFAULT NULL,
--   `state_province` VARCHAR(50) NULL DEFAULT NULL,
--   `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
--   `country_region` VARCHAR(50) NULL DEFAULT NULL,
--   `web_page` LONGTEXT NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `attachments` LONGBLOB NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `city` (`city` ASC),
--   INDEX `company` (`company` ASC),
--   INDEX `first_name` (`first_name` ASC),
--   INDEX `last_name` (`last_name` ASC),
--   INDEX `zip_postal_code` (`zip_postal_code` ASC),
--   INDEX `state_province` (`state_province` ASC))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`employees`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`employees` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `company` VARCHAR(50) NULL DEFAULT NULL,
--   `last_name` VARCHAR(50) NULL DEFAULT NULL,
--   `first_name` VARCHAR(50) NULL DEFAULT NULL,
--   `email_address` VARCHAR(50) NULL DEFAULT NULL,
--   `job_title` VARCHAR(50) NULL DEFAULT NULL,
--   `business_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `home_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `fax_number` VARCHAR(25) NULL DEFAULT NULL,
--   `address` LONGTEXT NULL DEFAULT NULL,
--   `city` VARCHAR(50) NULL DEFAULT NULL,
--   `state_province` VARCHAR(50) NULL DEFAULT NULL,
--   `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
--   `country_region` VARCHAR(50) NULL DEFAULT NULL,
--   `web_page` LONGTEXT NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `attachments` LONGBLOB NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `city` (`city` ASC),
--   INDEX `company` (`company` ASC),
--   INDEX `first_name` (`first_name` ASC),
--   INDEX `last_name` (`last_name` ASC),
--   INDEX `zip_postal_code` (`zip_postal_code` ASC),
--   INDEX `state_province` (`state_province` ASC))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`privileges`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`privileges` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `privilege_name` VARCHAR(50) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`employee_privileges`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`employee_privileges` (
--   `employee_id` INT(11) NOT NULL,
--   `privilege_id` INT(11) NOT NULL,
--   PRIMARY KEY (`employee_id`, `privilege_id`),
--   INDEX `employee_id` (`employee_id` ASC),
--   INDEX `privilege_id` (`privilege_id` ASC),
--   INDEX `privilege_id_2` (`privilege_id` ASC),
--   CONSTRAINT `fk_employee_privileges_employees1`
--     FOREIGN KEY (`employee_id`)
--     REFERENCES `northwind`.`employees` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_employee_privileges_privileges1`
--     FOREIGN KEY (`privilege_id`)
--     REFERENCES `northwind`.`privileges` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`inventory_transaction_types`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`inventory_transaction_types` (
--   `id` TINYINT(4) NOT NULL,
--   `type_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`shippers`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`shippers` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `company` VARCHAR(50) NULL DEFAULT NULL,
--   `last_name` VARCHAR(50) NULL DEFAULT NULL,
--   `first_name` VARCHAR(50) NULL DEFAULT NULL,
--   `email_address` VARCHAR(50) NULL DEFAULT NULL,
--   `job_title` VARCHAR(50) NULL DEFAULT NULL,
--   `business_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `home_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `fax_number` VARCHAR(25) NULL DEFAULT NULL,
--   `address` LONGTEXT NULL DEFAULT NULL,
--   `city` VARCHAR(50) NULL DEFAULT NULL,
--   `state_province` VARCHAR(50) NULL DEFAULT NULL,
--   `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
--   `country_region` VARCHAR(50) NULL DEFAULT NULL,
--   `web_page` LONGTEXT NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `attachments` LONGBLOB NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `city` (`city` ASC),
--   INDEX `company` (`company` ASC),
--   INDEX `first_name` (`first_name` ASC),
--   INDEX `last_name` (`last_name` ASC),
--   INDEX `zip_postal_code` (`zip_postal_code` ASC),
--   INDEX `state_province` (`state_province` ASC))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`orders_tax_status`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`orders_tax_status` (
--   `id` TINYINT(4) NOT NULL,
--   `tax_status_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`orders_status`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`orders_status` (
--   `id` TINYINT(4) NOT NULL,
--   `status_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`orders`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`orders` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `employee_id` INT(11) NULL DEFAULT NULL,
--   `customer_id` INT(11) NULL DEFAULT NULL,
--   `order_date` DATETIME NULL DEFAULT NULL,
--   `shipped_date` DATETIME NULL DEFAULT NULL,
--   `shipper_id` INT(11) NULL DEFAULT NULL,
--   `ship_name` VARCHAR(50) NULL DEFAULT NULL,
--   `ship_address` LONGTEXT NULL DEFAULT NULL,
--   `ship_city` VARCHAR(50) NULL DEFAULT NULL,
--   `ship_state_province` VARCHAR(50) NULL DEFAULT NULL,
--   `ship_zip_postal_code` VARCHAR(50) NULL DEFAULT NULL,
--   `ship_country_region` VARCHAR(50) NULL DEFAULT NULL,
--   `shipping_fee` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `taxes` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `payment_type` VARCHAR(50) NULL DEFAULT NULL,
--   `paid_date` DATETIME NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `tax_rate` DOUBLE NULL DEFAULT '0',
--   `tax_status_id` TINYINT(4) NULL DEFAULT NULL,
--   `status_id` TINYINT(4) NULL DEFAULT '0',
--   PRIMARY KEY (`id`),
--   INDEX `customer_id` (`customer_id` ASC),
--   INDEX `customer_id_2` (`customer_id` ASC),
--   INDEX `employee_id` (`employee_id` ASC),
--   INDEX `employee_id_2` (`employee_id` ASC),
--   INDEX `id` (`id` ASC),
--   INDEX `id_2` (`id` ASC),
--   INDEX `shipper_id` (`shipper_id` ASC),
--   INDEX `shipper_id_2` (`shipper_id` ASC),
--   INDEX `id_3` (`id` ASC),
--   INDEX `tax_status` (`tax_status_id` ASC),
--   INDEX `ship_zip_postal_code` (`ship_zip_postal_code` ASC),
--   CONSTRAINT `fk_orders_customers`
--     FOREIGN KEY (`customer_id`)
--     REFERENCES `northwind`.`customers` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_orders_employees1`
--     FOREIGN KEY (`employee_id`)
--     REFERENCES `northwind`.`employees` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_orders_shippers1`
--     FOREIGN KEY (`shipper_id`)
--     REFERENCES `northwind`.`shippers` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_orders_orders_tax_status1`
--     FOREIGN KEY (`tax_status_id`)
--     REFERENCES `northwind`.`orders_tax_status` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_orders_orders_status1`
--     FOREIGN KEY (`status_id`)
--     REFERENCES `northwind`.`orders_status` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`products`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`products` (
--   `supplier_ids` LONGTEXT NULL DEFAULT NULL,
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `product_code` VARCHAR(25) NULL DEFAULT NULL,
--   `product_name` VARCHAR(50) NULL DEFAULT NULL,
--   `description` LONGTEXT NULL DEFAULT NULL,
--   `standard_cost` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `list_price` DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
--   `reorder_level` INT(11) NULL DEFAULT NULL,
--   `target_level` INT(11) NULL DEFAULT NULL,
--   `quantity_per_unit` VARCHAR(50) NULL DEFAULT NULL,
--   `discontinued` TINYINT(1) NOT NULL DEFAULT '0',
--   `minimum_reorder_quantity` INT(11) NULL DEFAULT NULL,
--   `category` VARCHAR(50) NULL DEFAULT NULL,
--   `attachments` LONGBLOB NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `product_code` (`product_code` ASC))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`purchase_order_status`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`purchase_order_status` (
--   `id` INT(11) NOT NULL,
--   `status` VARCHAR(50) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`suppliers`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`suppliers` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `company` VARCHAR(50) NULL DEFAULT NULL,
--   `last_name` VARCHAR(50) NULL DEFAULT NULL,
--   `first_name` VARCHAR(50) NULL DEFAULT NULL,
--   `email_address` VARCHAR(50) NULL DEFAULT NULL,
--   `job_title` VARCHAR(50) NULL DEFAULT NULL,
--   `business_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `home_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `mobile_phone` VARCHAR(25) NULL DEFAULT NULL,
--   `fax_number` VARCHAR(25) NULL DEFAULT NULL,
--   `address` LONGTEXT NULL DEFAULT NULL,
--   `city` VARCHAR(50) NULL DEFAULT NULL,
--   `state_province` VARCHAR(50) NULL DEFAULT NULL,
--   `zip_postal_code` VARCHAR(15) NULL DEFAULT NULL,
--   `country_region` VARCHAR(50) NULL DEFAULT NULL,
--   `web_page` LONGTEXT NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `attachments` LONGBLOB NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `city` (`city` ASC),
--   INDEX `company` (`company` ASC),
--   INDEX `first_name` (`first_name` ASC),
--   INDEX `last_name` (`last_name` ASC),
--   INDEX `zip_postal_code` (`zip_postal_code` ASC),
--   INDEX `state_province` (`state_province` ASC))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`purchase_orders`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`purchase_orders` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `supplier_id` INT(11) NULL DEFAULT NULL,
--   `created_by` INT(11) NULL DEFAULT NULL,
--   `submitted_date` DATETIME NULL DEFAULT NULL,
--   `creation_date` DATETIME NULL DEFAULT NULL,
--   `status_id` INT(11) NULL DEFAULT '0',
--   `expected_date` DATETIME NULL DEFAULT NULL,
--   `shipping_fee` DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
--   `taxes` DECIMAL(19,4) NOT NULL DEFAULT '0.0000',
--   `payment_date` DATETIME NULL DEFAULT NULL,
--   `payment_amount` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `payment_method` VARCHAR(50) NULL DEFAULT NULL,
--   `notes` LONGTEXT NULL DEFAULT NULL,
--   `approved_by` INT(11) NULL DEFAULT NULL,
--   `approved_date` DATETIME NULL DEFAULT NULL,
--   `submitted_by` INT(11) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   UNIQUE INDEX `id` (`id` ASC),
--   INDEX `created_by` (`created_by` ASC),
--   INDEX `status_id` (`status_id` ASC),
--   INDEX `id_2` (`id` ASC),
--   INDEX `supplier_id` (`supplier_id` ASC),
--   INDEX `supplier_id_2` (`supplier_id` ASC),
--   CONSTRAINT `fk_purchase_orders_employees1`
--     FOREIGN KEY (`created_by`)
--     REFERENCES `northwind`.`employees` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_purchase_orders_purchase_order_status1`
--     FOREIGN KEY (`status_id`)
--     REFERENCES `northwind`.`purchase_order_status` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_purchase_orders_suppliers1`
--     FOREIGN KEY (`supplier_id`)
--     REFERENCES `northwind`.`suppliers` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`inventory_transactions`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`inventory_transactions` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `transaction_type` TINYINT(4) NOT NULL,
--   `transaction_created_date` DATETIME NULL DEFAULT NULL,
--   `transaction_modified_date` DATETIME NULL DEFAULT NULL,
--   `product_id` INT(11) NOT NULL,
--   `quantity` INT(11) NOT NULL,
--   `purchase_order_id` INT(11) NULL DEFAULT NULL,
--   `customer_order_id` INT(11) NULL DEFAULT NULL,
--   `comments` VARCHAR(255) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `customer_order_id` (`customer_order_id` ASC),
--   INDEX `customer_order_id_2` (`customer_order_id` ASC),
--   INDEX `product_id` (`product_id` ASC),
--   INDEX `product_id_2` (`product_id` ASC),
--   INDEX `purchase_order_id` (`purchase_order_id` ASC),
--   INDEX `purchase_order_id_2` (`purchase_order_id` ASC),
--   INDEX `transaction_type` (`transaction_type` ASC),
--   CONSTRAINT `fk_inventory_transactions_orders1`
--     FOREIGN KEY (`customer_order_id`)
--     REFERENCES `northwind`.`orders` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_inventory_transactions_products1`
--     FOREIGN KEY (`product_id`)
--     REFERENCES `northwind`.`products` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_inventory_transactions_purchase_orders1`
--     FOREIGN KEY (`purchase_order_id`)
--     REFERENCES `northwind`.`purchase_orders` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_inventory_transactions_inventory_transaction_types1`
--     FOREIGN KEY (`transaction_type`)
--     REFERENCES `northwind`.`inventory_transaction_types` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`invoices`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`invoices` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `order_id` INT(11) NULL DEFAULT NULL,
--   `invoice_date` DATETIME NULL DEFAULT NULL,
--   `due_date` DATETIME NULL DEFAULT NULL,
--   `tax` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `shipping` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `amount_due` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   PRIMARY KEY (`id`),
--   INDEX `id` (`id` ASC),
--   INDEX `id_2` (`id` ASC),
--   INDEX `fk_invoices_orders1_idx` (`order_id` ASC),
--   CONSTRAINT `fk_invoices_orders1`
--     FOREIGN KEY (`order_id`)
--     REFERENCES `northwind`.`orders` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`order_details_status`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`order_details_status` (
--   `id` INT(11) NOT NULL,
--   `status_name` VARCHAR(50) NOT NULL,
--   PRIMARY KEY (`id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`order_details`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`order_details` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `order_id` INT(11) NOT NULL,
--   `product_id` INT(11) NULL DEFAULT NULL,
--   `quantity` DECIMAL(18,4) NOT NULL DEFAULT '0.0000',
--   `unit_price` DECIMAL(19,4) NULL DEFAULT '0.0000',
--   `discount` DOUBLE NOT NULL DEFAULT '0',
--   `status_id` INT(11) NULL DEFAULT NULL,
--   `date_allocated` DATETIME NULL DEFAULT NULL,
--   `purchase_order_id` INT(11) NULL DEFAULT NULL,
--   `inventory_id` INT(11) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `id` (`id` ASC),
--   INDEX `inventory_id` (`inventory_id` ASC),
--   INDEX `id_2` (`id` ASC),
--   INDEX `id_3` (`id` ASC),
--   INDEX `id_4` (`id` ASC),
--   INDEX `product_id` (`product_id` ASC),
--   INDEX `product_id_2` (`product_id` ASC),
--   INDEX `purchase_order_id` (`purchase_order_id` ASC),
--   INDEX `id_5` (`id` ASC),
--   INDEX `fk_order_details_orders1_idx` (`order_id` ASC),
--   INDEX `fk_order_details_order_details_status1_idx` (`status_id` ASC),
--   CONSTRAINT `fk_order_details_orders1`
--     FOREIGN KEY (`order_id`)
--     REFERENCES `northwind`.`orders` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_order_details_products1`
--     FOREIGN KEY (`product_id`)
--     REFERENCES `northwind`.`products` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_order_details_order_details_status1`
--     FOREIGN KEY (`status_id`)
--     REFERENCES `northwind`.`order_details_status` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`purchase_order_details`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`purchase_order_details` (
--   `id` INT(11) NOT NULL AUTO_INCREMENT,
--   `purchase_order_id` INT(11) NOT NULL,
--   `product_id` INT(11) NULL DEFAULT NULL,
--   `quantity` DECIMAL(18,4) NOT NULL,
--   `unit_cost` DECIMAL(19,4) NOT NULL,
--   `date_received` DATETIME NULL DEFAULT NULL,
--   `posted_to_inventory` TINYINT(1) NOT NULL DEFAULT '0',
--   `inventory_id` INT(11) NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   INDEX `id` (`id` ASC),
--   INDEX `inventory_id` (`inventory_id` ASC),
--   INDEX `inventory_id_2` (`inventory_id` ASC),
--   INDEX `purchase_order_id` (`purchase_order_id` ASC),
--   INDEX `product_id` (`product_id` ASC),
--   INDEX `product_id_2` (`product_id` ASC),
--   INDEX `purchase_order_id_2` (`purchase_order_id` ASC),
--   CONSTRAINT `fk_purchase_order_details_inventory_transactions1`
--     FOREIGN KEY (`inventory_id`)
--     REFERENCES `northwind`.`inventory_transactions` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_purchase_order_details_products1`
--     FOREIGN KEY (`product_id`)
--     REFERENCES `northwind`.`products` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
--   CONSTRAINT `fk_purchase_order_details_purchase_orders1`
--     FOREIGN KEY (`purchase_order_id`)
--     REFERENCES `northwind`.`purchase_orders` (`id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`sales_reports`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`sales_reports` (
--   `group_by` VARCHAR(50) NOT NULL,
--   `display` VARCHAR(50) NULL DEFAULT NULL,
--   `title` VARCHAR(50) NULL DEFAULT NULL,
--   `filter_row_source` LONGTEXT NULL DEFAULT NULL,
--   `default` TINYINT(1) NOT NULL DEFAULT '0',
--   PRIMARY KEY (`group_by`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- -- -----------------------------------------------------
-- -- Table `northwind`.`strings`
-- -- -----------------------------------------------------
-- CREATE TABLE IF NOT EXISTS `northwind`.`strings` (
--   `string_id` INT(11) NOT NULL AUTO_INCREMENT,
--   `string_data` VARCHAR(255) NULL DEFAULT NULL,
--   PRIMARY KEY (`string_id`))
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


CREATE DATABASE IF NOT EXISTS CoopConnect;

USE CoopConnect;


CREATE TABLE IF NOT EXISTS User (
    User_ID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    User_Type VARCHAR(50),
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
    NUID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255),
    Grad_Date DATE,
    Current_Role VARCHAR(255),
    Current_Company VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_1
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Incoming_Student (
    NUID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255),
    Grad_Date DATE,
    User_ID INT,
    CONSTRAINT fk_2
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Alumni (
    Alumni_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Major VARCHAR(255) NOT NULL,
    Grad_Date DATE,
    Current_Company VARCHAR(255),
    Current_Role VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_3
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Department VARCHAR(255),
    User_ID INT,
    CONSTRAINT fk_4
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS Company (
    Company_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    Industry VARCHAR(255),
    Size INT,
    Reputation VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS CoopCycle (
    CycleID INT PRIMARY KEY,
    Year INT NOT NULL,
    PlacementRate FLOAT,
    Type VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS CoopPosition (
    Position_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Industry VARCHAR(255),
    Location VARCHAR(255),
    Role_Description TEXT,
    Company_Size INT,
    Work_Hours INT,
    Responsibilities TEXT,
    Company_ID INT,
    CycleID INT,
    CONSTRAINT fk_5
        FOREIGN KEY (Company_ID)
            REFERENCES Company (Company_ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_6
        FOREIGN KEY (CycleID)
            REFERENCES CoopCycle (CycleID)
            ON UPDATE CASCADE ON DELETE CASCADE
);




CREATE TABLE IF NOT EXISTS Review (
    Review_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Rating INT,
    Content TEXT,
    User_ID INT,
    Position_ID INT,
    SkillsUsed VARCHAR(255),
    CONSTRAINT fk_7
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_8
        FOREIGN KEY (Position_ID)
            REFERENCES CoopPosition (Position_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS CompensationPackage (
    CPID INT PRIMARY KEY,
    Perks VARCHAR(255),
    Hourly FLOAT,
    BonusTotal FLOAT,
    HousingTotal FLOAT,
    RelocationTotal FLOAT,
    Position_ID INT,
    CONSTRAINT fk_9
        FOREIGN KEY (Position_ID)
            REFERENCES CoopPosition (Position_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Question (
    Question_ID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Date DATE NOT NULL,
    Status VARCHAR(50),
    Content TEXT,
    User_ID INT,
    CONSTRAINT fk_10
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Answer (
    Answer_ID INT PRIMARY KEY,
    Content TEXT NOT NULL,
    Date DATE NOT NULL,
    User_ID INT,
    Question_ID INT,
    CONSTRAINT fk_11
        FOREIGN KEY (User_ID)
            REFERENCES User (User_ID)
            ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO User (User_ID, Username, User_Type, Password, Email) VALUES
(1, 'john_doe', 'Student', 'password123', 'john.doe@example.com'),
(2, 'jane_smith', 'Student', 'securepass456', 'jane.smith@example.com'),
(3, 'alice_johnson', 'Incomer', 'alicepass123', 'alice.johnson@example.com'),
(4, 'bob_williams', 'Incomer', 'bobpass456', 'bob.williams@example.com'),
(5, 'emily_brown', 'Alumni', 'emilypass123', 'emily.brown@example.com'),
(6, 'michael_johnson', 'Alumni', 'michaelpass456', 'michael.johnson@example.com'),
(7, 'emily_white', 'Professor', 'emilypass12345', 'emily.white@example.com'),
(8, 'michael_white', 'Advisor', 'michaelpass456', 'michael.white@example.com');

INSERT INTO Student (NUID, Name, Major, Grad_Date, Current_Role, Current_Company, User_ID) VALUES
(123456789, 'John Doe', 'Computer Science', '2024-05-15', null, null, 1),
(987654321, 'Jane Smith', 'Mechanical Engineering', '2023-12-20', null, null, 2);

INSERT INTO Incoming_Student (NUID, Name, Major, Grad_Date, User_ID) VALUES
(111111111, 'Alice Johnson', 'Electrical Engineering', '2025-05-15', 3),
(222222222, 'Bob Williams', 'Civil Engineering', '2025-05-20', 4);

INSERT INTO Alumni (Alumni_ID, Name, Major, Grad_Date, Current_Company, Current_Role, User_ID) VALUES
(100, 'Emily Brown', 'Chemical Engineering', '2020-05-15', 'Pharmaceuticals Inc.', 'Chemical Engineer', 5),
(101, 'Michael Johnson', 'Finance', '2018-12-20', 'Finance Corporation', 'Financial Analyst', 6);

INSERT INTO Faculty (Faculty_ID, Name, Department, User_ID) VALUES
(1001, 'Professor White', 'Computer Science', 7),
(1002, 'Advisor White', 'Electrical Engineering', 8);

INSERT INTO Company (Company_ID, Name, Location, Industry, Size, Reputation)
VALUES
    (10001, 'ABC Corp', 'New York', 'Software', 500, 'Highly rated by industry experts for innovative solutions'),
    (10002, 'XYZ Inc', 'San Francisco', 'Tech', 1000, 'Recipient of multiple awards for technological advancements'),
    (10003, 'Tech Solutions Ltd', 'London', 'IT Services', 300, 'Recognized for exceptional customer satisfaction and service quality');

INSERT INTO CoopCycle (CycleID, Year, PlacementRate, Type)
VALUES (100001, 2023, 0.85, 'Spring'),
       (100002, 2023, 0.75, 'Fall'),
       (100003, 2024, 0.90, 'Spring');

INSERT INTO CoopPosition (Position_ID, Title, Industry, Location, Role_Description, Company_Size, Work_Hours, Responsibilities, Company_ID, CycleID)
VALUES
    (1000001, 'Software Developer Intern', 'Software', 'New York', 'Assist in software development projects', 500, 40, 'Coding, testing, and documentation', 10001, 100001),
    (1000002, 'Marketing Intern', 'Tech', 'San Francisco', 'Assist in marketing campaigns and strategies', 1000, 35, 'Market research, social media management', 10002, 100002),
    (1000003, 'Data Analyst Intern', 'IT Services', 'London', 'Analyze data and generate insights', 300, 40, 'Data cleaning, statistical analysis', 10003, 100003);

INSERT INTO Review (Review_ID, Title, Date, Rating, Content, User_ID, Position_ID, SkillsUsed) VALUES
(10000001, 'Great Internship Experience', '2024-03-20', 5, 'I had an amazing experience working as a Software Developer Intern at ABC Corp. The team was supportive, and I learned a lot during my time there.', 1, 1000001, 'Java, Git, Agile Methodology'),
(10000002, 'Valuable Insights from Data Analysis Internship', '2023-11-10', 4, 'As a Data Analyst Intern at Tech Solutions Ltd, I gained valuable insights into data analysis techniques. The projects were challenging, and I developed my skills significantly.', 2, 1000003, 'SQL, Python, Data Visualization');

INSERT INTO CompensationPackage (CPID, Perks, Hourly, BonusTotal, HousingTotal, RelocationTotal, Position_ID) VALUES
(100000001, 'Health insurance, gym membership', 20.5, 1000.00, NULL, 2000.00, 1000001),
(100000002, 'Flexible work hours, company stock options', 18.75, 800.00, NULL, 1500.00, 1000002);

INSERT INTO Question (Question_ID, Title, Date, Status, Content, User_ID) VALUES
(200000001, 'Need advice on choosing a major', '2024-03-10', 'Open', 'I''m having trouble deciding on a major. Any advice or suggestions?', 1),
(200000002, 'Internship opportunities in finance', '2023-11-25', 'Open', 'What are some internship opportunities in finance for undergraduate students?', 2);

INSERT INTO Answer (Answer_ID, Content, Date, User_ID, Question_ID) VALUES
(300000001, 'Consider your interests, strengths, and career goals when choosing a major. Explore different fields through internships and speak with advisors for guidance.', '2024-03-12', 7, 200000001),
(300000002, 'Research internship opportunities in finance fields like investment banking, corporate finance, and asset management. Network and use career services to find suitable positions.', '2023-11-28', 8, 200000001);


