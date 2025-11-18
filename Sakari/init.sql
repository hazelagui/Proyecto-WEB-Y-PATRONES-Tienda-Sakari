-- ===================================
-- Script de Inicialización de Base de Datos
-- Sakari - Sublimados Personalizados
-- ===================================

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS sakari_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sakari_db;

-- Nota: Las tablas se crean automáticamente con JPA/Hibernate
-- Este script es para insertar datos de ejemplo

-- ===================================
-- Insertar Categorías de Sublimados
-- ===================================
INSERT INTO categorias (nombre, descripcion, activo) VALUES
('Camisas', 'Camisas sublimadas con diseños personalizados en poliéster de alta calidad', true),
('Tazas', 'Tazas sublimables con tus diseños favoritos, resistentes al lavado', true),
('Gorras', 'Gorras personalizadas con sublimación de alta definición', true),
('Uniformes', 'Uniformes deportivos completos con sublimación profesional', true),
('Suéter', 'Suéteres cómodos con diseños sublimados personalizados', true);

-- ===================================
-- Insertar Productos Sublimados de Ejemplo
-- ===================================
INSERT INTO productos (nombre, descripcion, precio, stock, activo, personalizable, categoria_id, imagen_url, fecha_creacion) VALUES
-- Camisas Sublimadas
('Camisa Poliéster Blanca', 'Camisa 100% poliéster ideal para sublimación de diseños personalizados', 8500.00, 50, true, true, 1, '/images/products/camisa-blanca.jpg', NOW()),
('Camisa Deportiva Negra', 'Camisa deportiva con tecnología de sublimación, tela transpirable', 9500.00, 40, true, true, 1, '/images/products/camisa-negra.jpg', NOW()),
('Camisa Premium Azul', 'Camisa premium con acabado sublimado profesional', 12000.00, 30, true, true, 1, '/images/products/camisa-azul.jpg', NOW()),
('Camisa Casual Gris', 'Camisa casual perfecta para personalización con tu logo o diseño', 8000.00, 45, true, true, 1, '/images/products/camisa-gris.jpg', NOW()),

-- Tazas Sublimadas
('Taza Blanca 11oz', 'Taza de cerámica blanca de 11oz, ideal para sublimación', 4500.00, 100, true, true, 2, '/images/products/taza-blanca.jpg', NOW()),
('Taza Mágica Negra', 'Taza mágica que cambia de color, efecto especial al agregar líquido caliente', 6500.00, 60, true, true, 2, '/images/products/taza-magica.jpg', NOW()),
('Taza Star Wars', 'Taza con diseños de Star Wars sublimados en alta calidad', 5500.00, 80, true, false, 2, '/images/products/taza-starwars.jpg', NOW()),
('Taza Personalizada 15oz', 'Taza grande de 15oz con tu diseño personalizado', 5000.00, 70, true, true, 2, '/images/products/taza-15oz.jpg', NOW()),

-- Gorras Sublimadas
('Gorra Trucker Blanca', 'Gorra tipo trucker con panel frontal sublimable', 6500.00, 60, true, true, 3, '/images/products/gorra-trucker.jpg', NOW()),
('Gorra Plana Negra', 'Gorra plana con panel completo para sublimación', 7000.00, 50, true, true, 3, '/images/products/gorra-plana.jpg', NOW()),
('Gorra Deportiva', 'Gorra deportiva con tecnología de sublimación total', 7500.00, 45, true, true, 3, '/images/products/gorra-deportiva.jpg', NOW()),

-- Uniformes Deportivos Sublimados
('Uniforme Milan Emirates', 'Uniforme completo estilo AC Milan con sublimación profesional (camisa + short + medias)', 25000.00, 20, true, true, 4, '/images/products/uniforme-milan.jpg', NOW()),
('Uniforme Deportivo Personalizado', 'Set completo de uniforme con tu diseño sublimado (camisa + short)', 22000.00, 25, true, true, 4, '/images/products/uniforme-personalizado.jpg', NOW()),
('Jersey Deportivo', 'Jersey deportivo con sublimación de alta calidad', 12000.00, 35, true, true, 4, '/images/products/jersey-deportivo.jpg', NOW()),

-- Suéteres Sublimados
('Suéter con Capucha Negro', 'Suéter con capucha en poliéster, ideal para sublimación', 15000.00, 30, true, true, 5, '/images/products/sueter-capucha.jpg', NOW()),
('Suéter Deportivo Gris', 'Suéter deportivo cómodo con panel frontal sublimable', 14000.00, 35, true, true, 5, '/images/products/sueter-gris.jpg', NOW()),
('Suéter Personalizado', 'Suéter de alta calidad con tu diseño sublimado', 16000.00, 28, true, true, 5, '/images/products/sueter-personalizado.jpg', NOW());

-- ===================================
-- Insertar Usuario Administrador
-- ===================================
-- Password: admin123 (encriptada con BCrypt)
INSERT INTO usuarios (nombre, apellido, email, password, telefono, direccion, rol, activo, fecha_registro) VALUES
('Administrador', 'Sakari', 'admin@sakari.com', '$2a$10$rN8qGUpNqLFNvJlh6QqJKO7VxXXqNQp7a.x6zp1LwKdYQqOqWqNJa', '8873-5743', 'La Aurora de Heredia, Costa Rica', 'ADMIN', true, NOW()),
('Cliente', 'Demo', 'cliente@ejemplo.com', '$2a$10$rN8qGUpNqLFNvJlh6QqJKO7VxXXqNQp7a.x6zp1LwKdYQqOqWqNJa', '8888-9999', 'Heredia, Costa Rica', 'USER', true, NOW());

-- ===================================
-- Crear Carritos para los usuarios
-- ===================================
INSERT INTO carritos (usuario_id, fecha_actualizacion) VALUES
(1, NOW()),
(2, NOW());

-- ===================================
-- Verificación de datos insertados
-- ===================================
SELECT 'Datos de sublimados insertados correctamente' as Mensaje;
SELECT COUNT(*) as TotalCategorias FROM categorias;
SELECT COUNT(*) as TotalProductos FROM productos;
SELECT COUNT(*) as TotalUsuarios FROM usuarios;

-- ===================================
-- Consultas útiles para desarrollo
-- ===================================

-- Ver todos los productos con sus categorías
-- SELECT p.*, c.nombre as categoria_nombre 
-- FROM productos p 
-- LEFT JOIN categorias c ON p.categoria_id = c.id;

-- Ver productos personalizables
-- SELECT nombre, descripcion, precio FROM productos WHERE personalizable = true AND activo = true;

-- Ver stock disponible por categoría
-- SELECT c.nombre as Categoria, COUNT(p.id) as TotalProductos, SUM(p.stock) as StockTotal
-- FROM categorias c
-- LEFT JOIN productos p ON c.id = p.categoria_id
-- GROUP BY c.nombre;
