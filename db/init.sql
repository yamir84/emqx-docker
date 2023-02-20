/* CREAR LA BASE DE DATOS SI NO EXISTE */
CREATE DATABASE IF NOT EXISTS `emqx` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `emqx`;

/* CREAR LA TABLA MQTT USER */
CREATE TABLE `mqtt_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mqtt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/* INSERTAR USUARIOS */
INSERT INTO `mqtt_user` ( `username`, `password`, `salt`, `is_superuser`) VALUES
('emqx', 'efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL, 1),
('yamir84', 'efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL, 0);

/* crear tabla mqtt acl */
CREATE TABLE `mqtt_acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allow` int(1) DEFAULT 1 COMMENT '0: deny, 1: allow',
  `ipaddr` varchar(60) DEFAULT NULL COMMENT 'IpAddress',
  `username` varchar(100) DEFAULT NULL COMMENT 'Username',
  `clientid` varchar(100) DEFAULT NULL COMMENT 'ClientId',
  `access` int(2) NOT NULL COMMENT '1: subscribe, 2: publish, 3: pubsub',
  `topic` varchar(100) NOT NULL DEFAULT '' COMMENT 'Topic Filter',
  PRIMARY KEY (`id`),
  INDEX (ipaddr),
  INDEX (username),
  INDEX (clientid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/* Insertar reglas por defecto en mqtt_acl */
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) 
VALUES 
    (0, NULL, '$all', NULL, 1, '$SYS/#'),
    (1, '10.59.1.100', NULL, NULL, 1, '$SYS/#'),
    (0, NULL, '$all', NULL, 1, '/smarthome/+/temperature'),
    (1, NULL, '$all', NULL, 1, '/smarthome/%c/temperature');
/*INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) VALUES (1, '10.59.1.100', NULL, NULL, 1, '$SYS/#');
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) VALUES (0, NULL, '$all', NULL, 1, '/smarthome/+/temperature');
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) VALUES (1, NULL, '$all', NULL, 1, '/smarthome/%c/temperature');*/
/* Bloquear todos los Usuarios */
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) VALUES (0, NULL, '$all', NULL, 3, '+/#');
/* Crear nuestras propias Reglas */ 
INSERT INTO mqtt_acl (allow, ipaddr, username, clientid, access, topic) VALUES (1, NULL, '$all', NULL, 3, '%u/%c/#');