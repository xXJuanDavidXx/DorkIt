-- MySQL dump 9.11
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	4.0.24_Debian-10-log




--
-- 
-- Base de datos: `jara`
-- 
CREATE DATABASE `jara` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `jara`;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `acciones`
-- 

CREATE TABLE `acciones` (
  `id_accion` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_accion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- -- Volcar la base de datos para la tabla `acciones`
-- 

INSERT INTO `acciones` VALUES (1, 'Tarea técnica', '');
INSERT INTO `acciones` VALUES (2, 'Tarea administrativa', NULL);
INSERT INTO `acciones` VALUES (3, 'Otros', NULL);
INSERT INTO `acciones` VALUES (4, 'Cerrar', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaran_entrada`
-- 

CREATE TABLE `albaran_entrada` (
  `id` int(5) NOT NULL auto_increment,
  `fecha_entrada` datetime default NULL,
  `id_tercero` int(11) default NULL,
  `personal_recepcion` int(11) default NULL,
  `num_alb` varchar(100) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=182 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaran_salida`
-- 

CREATE TABLE `albaran_salida` (
  `id` int(5) NOT NULL auto_increment,
  `id_tercero` int(11) default NULL,
  `fecha_expedido` datetime default NULL,
  `nota_expedido` varchar(50) collate latin1_general_ci default NULL,
  `personal_expedido` int(11) default NULL,
  `pedido` varchar(50) collate latin1_general_ci default NULL,
  `factura` varchar(50) collate latin1_general_ci default NULL,
  `fecha_entregado` datetime default NULL,
  `nota_entregado` varchar(50) collate latin1_general_ci default NULL,
  `personal_entregado` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=260 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

CREATE TABLE `clientes` (
  `id_cliente` int(10) NOT NULL auto_increment,
  `nombre` varchar(50) collate latin1_general_ci NOT NULL default '',
  `localizacion` varchar(80) collate latin1_general_ci default NULL,
  `telefono` int(15) default NULL,
  `correo_electronico` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_cliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=74 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas_recibidas`
-- 

CREATE TABLE `facturas_recibidas` (
  `id_fact_rx` int(5) NOT NULL auto_increment,
  `id_tercero` int(5) default NULL,
  `num_factura` varchar(100) collate latin1_general_ci default NULL,
  `fecha_factura` date default NULL,
  `base` double default NULL,
  `cuota_iva` double default NULL,
  `fecha_vencimiento` date default NULL,
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  `num_reg` varchar(50) collate latin1_general_ci default NULL,
  `tecnico` int(11) default '0',
  `fecha_insercion` date default '0000-00-00',
  `recargo` double default '0',
  `retencion` double default '0',
  `verificado` int(11) default NULL,
  `personal_verificado` int(11) default NULL,
  `fecha_verificado` date default NULL,
  `correcto` int(11) default '0',
  `a_credito` int(11) default '0',
  `con_anticipo` int(11) default '0',
  `pago_previo` int(11) default '0',
  `pago_contado` int(11) default '0',
  `obs_pago` varchar(100) collate latin1_general_ci default '',
  PRIMARY KEY  (`id_fact_rx`),
  UNIQUE KEY `num_reg_rx` (`num_reg`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=565 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `lineas_otros`
-- 

CREATE TABLE `lineas_otros` (
  `id_lineas_otros` int(5) NOT NULL auto_increment,
  `descripcion` varchar(100) collate latin1_general_ci default NULL,
  `destino_analitico` varchar(100) collate latin1_general_ci default NULL,
  `base` double default NULL,
  `num_reg_fact` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_lineas_otros`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=385 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `material`
-- 

CREATE TABLE `material` (
  `id_material` int(5) NOT NULL auto_increment,
  `id_alb_in` int(11) default NULL,
  `id_alb_out` int(11) default NULL,
  `uds` double default NULL,
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  `num_serie` varchar(50) collate latin1_general_ci default NULL,
  `destino` varchar(50) collate latin1_general_ci default NULL,
  `base` double default NULL,
  `num_reg_fact` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_material`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=466 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `material_compu`
-- 

CREATE TABLE `material_compu` (
  `ID` int(11) default NULL,
  `codigo` text collate latin1_general_ci,
  `descripcion` text collate latin1_general_ci,
  `precio` double default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `material_compu_p`
-- 

CREATE TABLE `material_compu_p` (
  `ID` int(11) default NULL,
  `codigo` text collate latin1_general_ci,
  `descripcion` text collate latin1_general_ci,
  `pvp_e` text collate latin1_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `menu_principal`
-- 

CREATE TABLE `menu_principal` (
  `id` int(5) NOT NULL auto_increment,
  `nombre` varchar(100) collate latin1_general_ci default NULL,
  `url` varchar(100) collate latin1_general_ci default NULL,
  `descripcion` varchar(100) collate latin1_general_ci default NULL,
  `grupo` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=11 ;

-- 
-- Volcar la base de datos para la tabla `menu_principal`
-- 

INSERT INTO `menu_principal` VALUES (2, 'Pedidos', NULL, 'pedidos', 1);
INSERT INTO `menu_principal` VALUES (1, 'Notas', NULL, 'Notas', 2);
INSERT INTO `menu_principal` VALUES (4, 'Logistica', NULL, 'logistico', 4);
INSERT INTO `menu_principal` VALUES (5, 'Administración', NULL, 'administracion', 5);
INSERT INTO `menu_principal` VALUES (6, 'Herramientas', NULL, 'herramientas', 6);
INSERT INTO `menu_principal` VALUES (7, 'Información', NULL, 'informacion de procesos', 7);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `menus`
-- 

CREATE TABLE `menus` (
  `id_menu` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `url` varchar(50) collate latin1_general_ci NOT NULL default '',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  `orden` int(10) default '0',
  `grupo` int(11) default NULL,
  `tipo_accion` varchar(100) collate latin1_general_ci default '',
  PRIMARY KEY  (`id_menu`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=52 ;

-- -- Volcar la base de datos para la tabla `menus`
-- 

INSERT INTO `menus` VALUES (1, 'Mis notas', 'ListadoNotas.php?mis_notas=1', 'Listado de notas asignadas al usuario', 1, 2, '');
INSERT INTO `menus` VALUES (2, 'Nueva nota', 'NuevaNota2.php', 'Crear una nueva nota', 1, 2, '');
INSERT INTO `menus` VALUES (33, 'Expedir', 'AlbaranSalida.php', 'administracion de albaranes salida', 2, 4, '');
INSERT INTO `menus` VALUES (4, 'Notas por cerrar', 'NotasPorCerrar.php', '', 1, 2, '');
INSERT INTO `menus` VALUES (7, 'Filtrado de notas', 'FiltroNotas.php', '', 1, 2, '');
INSERT INTO `menus` VALUES (11, 'Nueva Fra Recibida', 'FacturaNueva.php', '', 2, 5, '');
INSERT INTO `menus` VALUES (31, 'Recepcionar', 'AlbaranEntrada.php', 'administracion de albaranes entrada', 2, 4, '');
INSERT INTO `menus` VALUES (34, 'Mis entregas', 'ListadoAlbOut.php?entregar=1', 'Albaranes de salida pendientes de entregar', 2, 4, '');
INSERT INTO `menus` VALUES (32, 'Alb pend fact', 'ListadoAlbOut.php?facturar=1', 'Albaranes de salida entregados pendientes de factu', 2, NULL, '');
INSERT INTO `menus` VALUES (14, 'Fact pend verificar', 'FacturaSelec.php?env=1&verificar=1', 'Facturas recibidas pendientes de verificar', 2, 5, '');
INSERT INTO `menus` VALUES (21, 'Abrir Pedido', 'Pedidos.php', 'inserta nuevo pedido o lo modifica', 2, 1, '');
INSERT INTO `menus` VALUES (22, 'Lista Pedido', 'ListaPedidos.php', 'lista pedidos', 2, 6, '');
INSERT INTO `menus` VALUES (13, 'Lista Fras', 'FacturaSelec.php?env=1&actualizar=1', 'Modifica una factura', 2, 6, '');
INSERT INTO `menus` VALUES (37, 'Lista Material', 'ListadoMaterial.php', 'Lista material', 2, 4, '');
INSERT INTO `menus` VALUES (12, 'Consulta fra', 'FacturaSelec.php', '', 2, 5, '');
INSERT INTO `menus` VALUES (35, 'Lista Alb entrada', 'ListaAlbIn.php', 'lista y modificacion de albaranes entrada', 2, 6, '');
INSERT INTO `menus` VALUES (36, 'Lista Alb Salida', 'ListadoAlbOut.php?actualizar=1', 'Lista y modif de albaranes salida', 2, 6, '');
INSERT INTO `menus` VALUES (23, 'Mis pedidos', 'ListaPedidos.php?mis_pedidos=1', 'Lista pedidos abiertos y asignados a mi', 2, 1, '');
INSERT INTO `menus` VALUES (24, 'Mis facturaciones', 'ListaPedidos.php?pend_frar=1', 'pedidos cerrado pend de facturar', 2, 1, '');
INSERT INTO `menus` VALUES (42, 'Datos Terceros', 'DatosTercero.php', 'Informacion de los terceros', 2, 6, 'Filtrado de objeto');
INSERT INTO `menus` VALUES (5, 'Notas Pospuestas', 'ListadoNotas.php?nevera=1', 'Notas pospuestas hasta una fecha indicada', 1, 2, 'Mis objetos notas pospuestas');
INSERT INTO `menus` VALUES (50, 'Notas Retrasadas', 'NotasRetrasadas.php', 'Notas con f.compromiso vencidas y retrasadas', 1, 7, '');
INSERT INTO `menus` VALUES (51, 'Pedidos ICT', 'PedidosICT.php', 'Lista los pedidos ICT abiertos', 2, 7, 'Filtrado de objeto');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `nota`
-- 

CREATE TABLE `nota` (
  `id_nota` int(10) NOT NULL auto_increment,
  `usuario_cliente` int(10) NOT NULL default '0',
  `fecha_solicitud` datetime NOT NULL default '0000-00-00 00:00:00',
  `resumen` varchar(40) collate latin1_general_ci default NULL,
  `descripcion` text collate latin1_general_ci,
  `fecha_solicitada` date default '0000-00-00',
  `prioridad_cliente` int(10) default NULL,
  `personal_recepcion` int(10) NOT NULL default '0',
  `fecha_compromiso` date default '0000-00-00',
  `prioridad_asignada` int(10) NOT NULL default '0',
  `tipo_nota_inicial` int(10) NOT NULL default '0',
  `tipo_averia_inicial` int(10) NOT NULL default '0',
  `tipo_nota_final` int(10) default NULL,
  `tipo_averia_final` int(10) default NULL,
  `fecha_aviso_usuario` date default NULL,
  `tipo_cierre` int(10) NOT NULL default '0',
  `facturacion` tinyint(1) NOT NULL default '0',
  `fec_pospuesta` date default NULL,
  PRIMARY KEY  (`id_nota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1199 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos`
-- 

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL auto_increment,
  `cod_pedido` text collate latin1_general_ci,
  `ofertas_ID_inicio` int(11) default NULL,
  `denominacion` text collate latin1_general_ci,
  `descripcion` text collate latin1_general_ci,
  `cliente` int(11) default NULL,
  `responsable` int(11) default NULL,
  `fecha_compromiso` datetime default NULL,
  `clase_id` int(11) default NULL,
  `tipo_id` int(11) default NULL,
  `observaciones` text collate latin1_general_ci,
  `importe_aprox` double default NULL,
  `margen_estandar` double default NULL,
  `financiacion` text collate latin1_general_ci,
  `fecha_inicio_estim` datetime default NULL,
  `horas_estimada` int(11) default NULL,
  `fecha_encargo` datetime default NULL,
  `tipo_pedido_id` int(11) default NULL,
  `estado` int(11) default NULL,
  `meses_estim` int(11) default '0',
  `factura` varchar(100) collate latin1_general_ci default '[NULL]',
  `destino_a` varchar(100) collate latin1_general_ci default '',
  `destino_b` varchar(100) collate latin1_general_ci default '',
  `destino_c` varchar(100) collate latin1_general_ci default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=602 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos_clase`
-- 

CREATE TABLE `pedidos_clase` (
  `id` int(5) NOT NULL auto_increment,
  `denominacion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

-- -- Volcar la base de datos para la tabla `pedidos_clase`
-- 

INSERT INTO `pedidos_clase` VALUES (1, 'Proyecto');
INSERT INTO `pedidos_clase` VALUES (2, 'Iguala');
INSERT INTO `pedidos_clase` VALUES (3, 'Accion puntual');
INSERT INTO `pedidos_clase` VALUES (4, 'Compra de material');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos_estado`
-- 

CREATE TABLE `pedidos_estado` (
  `id` int(5) NOT NULL auto_increment,
  `nombre` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

---- Volcar la base de datos para la tabla `pedidos_estado`
-- 

INSERT INTO `pedidos_estado` VALUES (1, 'Pendiente de abrir');
INSERT INTO `pedidos_estado` VALUES (2, 'Abierto');
INSERT INTO `pedidos_estado` VALUES (3, 'Terminado,pendiente de facturar');
INSERT INTO `pedidos_estado` VALUES (4, 'Facturarado sin cerrar');
INSERT INTO `pedidos_estado` VALUES (5, 'Cerrado y facturado');
INSERT INTO `pedidos_estado` VALUES (6, 'Cancelado');
INSERT INTO `pedidos_estado` VALUES (7, 'Especiales');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos_soporte`
-- 

CREATE TABLE `pedidos_soporte` (
  `id` int(5) NOT NULL auto_increment,
  `denominacion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `pedidos_soporte`
-- 

INSERT INTO `pedidos_soporte` VALUES (1, 'Verbal');
INSERT INTO `pedidos_soporte` VALUES (2, 'Presupuesto sellado');
INSERT INTO `pedidos_soporte` VALUES (3, 'Hoja de encargo');
INSERT INTO `pedidos_soporte` VALUES (4, 'Hoja pedido cliente');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pedidos_tipo`
-- 

CREATE TABLE `pedidos_tipo` (
  `id` int(5) NOT NULL auto_increment,
  `denominacion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=23 ;

--
-- Volcar la base de datos para la tabla `pedidos_tipo`
-- 

INSERT INTO `pedidos_tipo` VALUES (1, 'Accion puntual');
INSERT INTO `pedidos_tipo` VALUES (5, 'Proyecto ICT');
INSERT INTO `pedidos_tipo` VALUES (6, 'Accion puntual');
INSERT INTO `pedidos_tipo` VALUES (7, 'Venta equipos informatico');
INSERT INTO `pedidos_tipo` VALUES (8, 'Pagina Web');
INSERT INTO `pedidos_tipo` VALUES (9, 'Hosting');
INSERT INTO `pedidos_tipo` VALUES (10, 'Infraestructura');
INSERT INTO `pedidos_tipo` VALUES (11, 'Portal de internet');
INSERT INTO `pedidos_tipo` VALUES (12, 'Reparaciones');
INSERT INTO `pedidos_tipo` VALUES (13, 'Consumibles');
INSERT INTO `pedidos_tipo` VALUES (14, 'Aplicaciones');
INSERT INTO `pedidos_tipo` VALUES (15, 'Redes');
INSERT INTO `pedidos_tipo` VALUES (16, 'comunicaciones');
INSERT INTO `pedidos_tipo` VALUES (17, 'Igualas');
INSERT INTO `pedidos_tipo` VALUES (18, 'formacion');
INSERT INTO `pedidos_tipo` VALUES (19, 'otros');
INSERT INTO `pedidos_tipo` VALUES (20, 'Proyecto ing. industrial');
INSERT INTO `pedidos_tipo` VALUES (21, 'Alquiler');
INSERT INTO `pedidos_tipo` VALUES (22, 'Solucion informatica comp');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `perfil_accion`
-- 

CREATE TABLE `perfil_accion` (
  `perfil` int(10) NOT NULL default '0',
  `accion` int(10) NOT NULL default '0',
  PRIMARY KEY  (`perfil`,`accion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `perfil_menu`
-- 

CREATE TABLE `perfil_menu` (
  `accion_menu` int(10) NOT NULL default '0',
  `perfil` int(10) NOT NULL default '0',
  PRIMARY KEY  (`accion_menu`,`perfil`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `perfil_personal`
-- 

CREATE TABLE `perfil_personal` (
  `id_perf_personal` int(11) NOT NULL auto_increment,
  `personal_id` int(11) default NULL,
  `perf_id` int(11) default NULL,
  PRIMARY KEY  (`id_perf_personal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=147 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `perfiles`
-- 

CREATE TABLE `perfiles` (
  `id_perfil` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '0',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_perfil`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=31 ;

-- INSERT INTO `perfiles` VALUES (1, 'administrador', '');--  --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `personal`
-- 

CREATE TABLE `personal` (
  `id_personal` tinyint(4) NOT NULL auto_increment,
  `login` varchar(10) collate latin1_general_ci NOT NULL default '',
  `password` varchar(40) collate latin1_general_ci NOT NULL default '',
  `nombre` varchar(30) collate latin1_general_ci default NULL,
  `perfil` varchar(20) collate latin1_general_ci NOT NULL default '',
  `telefono` int(11) default NULL,
  `correo_electronico` varchar(50) collate latin1_general_ci default NULL,
  `iniciales_nom` varchar(100) collate latin1_general_ci default '',
  PRIMARY KEY  (`id_personal`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=76 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `prioridad`
-- 

CREATE TABLE `prioridad` (
  `id_prioridad` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '0',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_prioridad`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

-- -- Volcar la base de datos para la tabla `prioridad`
-- 

INSERT INTO `prioridad` VALUES (1, 'Maxima', NULL);
INSERT INTO `prioridad` VALUES (2, 'Media', NULL);
INSERT INTO `prioridad` VALUES (3, 'Minima', NULL);

--  --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `resolucion`
-- 

CREATE TABLE `resolucion` (
  `id_resolucion` int(10) NOT NULL auto_increment,
  `nota` int(10) NOT NULL default '0',
  `fecha_asignada` datetime NOT NULL default '0000-00-00 00:00:00',
  `persona_asignada` int(10) NOT NULL default '0',
  `proxima_accion` int(10) NOT NULL default '0',
  `observaciones` text collate latin1_general_ci,
  `tareas_realizadas` text collate latin1_general_ci,
  `instrucciones` text collate latin1_general_ci NOT NULL,
  `minutos` int(10) default NULL,
  `asignado` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id_resolucion`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3888 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `terceros`
-- 

CREATE TABLE `terceros` (
  `ID_tercero` int(11) NOT NULL auto_increment,
  `numero_tercero` int(11) default NULL,
  `denominacion_tercero` text collate latin1_general_ci,
  `nombre_razon` text collate latin1_general_ci,
  `nif_cif` text collate latin1_general_ci,
  `dir_facturacion` text collate latin1_general_ci,
  `poblacion_fact` text collate latin1_general_ci,
  `cp_fact` text collate latin1_general_ci,
  `provincia_fact` text collate latin1_general_ci,
  `dir_envio` text collate latin1_general_ci,
  `poblacion_envio` text collate latin1_general_ci,
  `cp_envio` text collate latin1_general_ci,
  `provincia_envio` text collate latin1_general_ci,
  `telefono` text collate latin1_general_ci,
  `fax` text collate latin1_general_ci,
  `correo_electronico` text collate latin1_general_ci,
  `contacto` text collate latin1_general_ci,
  `cargo_contacto` text collate latin1_general_ci,
  `telefono_contacto` text collate latin1_general_ci,
  `condiciones_pago` text collate latin1_general_ci,
  `condiciones_cobro` text collate latin1_general_ci,
  `notas` mediumtext collate latin1_general_ci,
  `web` mediumtext collate latin1_general_ci,
  `revisado` tinyint(1) default NULL,
  `tipo_ppal_3` text collate latin1_general_ci,
  `sector` text collate latin1_general_ci,
  `comercial` text collate latin1_general_ci,
  `cliente` tinyint(1) default NULL,
  `proveedor` tinyint(1) default NULL,
  `empleado` tinyint(1) default NULL,
  PRIMARY KEY  (`ID_tercero`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=453 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipo_averia`
-- 

CREATE TABLE `tipo_averia` (
  `id_tipo_averia` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_tipo_averia`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

---- Volcar la base de datos para la tabla `tipo_averia`
-- 

INSERT INTO `tipo_averia` VALUES (1, 'Aplicaciones', NULL);
INSERT INTO `tipo_averia` VALUES (2, 'Equipo consumidor', NULL);
INSERT INTO `tipo_averia` VALUES (3, 'Comunicaciones', NULL);
INSERT INTO `tipo_averia` VALUES (4, 'Explot. Admon', NULL);
INSERT INTO `tipo_averia` VALUES (5, 'Igualas', 'Igualas');

--  --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipo_cierre`
-- 

CREATE TABLE `tipo_cierre` (
  `id_tipo_cierre` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_tipo_cierre`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipo_nota`
-- 

CREATE TABLE `tipo_nota` (
  `id_tipo_nota` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `descripcion` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_tipo_nota`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

---- Volcar la base de datos para la tabla `tipo_nota`
-- 

INSERT INTO `tipo_nota` VALUES (1, 'Proyecto', NULL);
INSERT INTO `tipo_nota` VALUES (2, 'AT-Incidencia', NULL);
INSERT INTO `tipo_nota` VALUES (3, 'AT-consulta', NULL);
INSERT INTO `tipo_nota` VALUES (4, 'AT-Petición', NULL);
INSERT INTO `tipo_nota` VALUES (5, 'Iguala', 'Iguala');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuarios`
-- 

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL auto_increment,
  `nombre` varchar(20) collate latin1_general_ci NOT NULL default '',
  `cliente` int(10) NOT NULL default '0',
  `telefono` int(15) NOT NULL default '0',
  `correo_electronico` varchar(50) collate latin1_general_ci default NULL,
  `equipo` varchar(50) collate latin1_general_ci default NULL,
  `tipo_equipo` varchar(50) collate latin1_general_ci default NULL,
  `sistema_equipo` varchar(50) collate latin1_general_ci default NULL,
  PRIMARY KEY  (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=141 ;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es">
	<head>
            <title>e-REdING. Biblioteca de la Escuela Superior de Ingenieros de Sevilla.</title>

                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="description" content="Buscador de proyectos ETSI" />
<meta name="author" content="Daniel Callejo"/>
<meta name="author" content="Federico L&oacute;pez"/>
<meta name="author" content="Juli&aacute;n P&eacute;rez"/>
<meta name="author" content="Jos&eacute; Mar&iacute;a Vidal Vidal"/>
<base href="https://biblus.us.es/bibing/proyectos/" /><link rel="shortcut icon" href="./favicon.ico" />
<link rel="stylesheet" href="./publico/css/estructura.css" type="text/css" />
<link rel="stylesheet" href="./publico/css/bootstrap.css" type="text/css" media="screen"/>
<link rel="stylesheet" href="./publico/css/enlaces-capas.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/pestanas.css" type="text/css"  /> 
<link rel="stylesheet" href="./publico/css/formularios.css" type="text/css" />
<link rel="stylesheet" href="./publico/css/lightbox.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/autocompleter.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/resultados.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/milista.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/explorador.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/ultimos.css" type="text/css"  />
<link rel="stylesheet" href="./publico/css/contactar.css" type="text/css"  />
<!-- <link rel="stylesheet" href="./css/print.css" type="text/css" media="print" /> -->
<script src="./publico/javascript/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="./publico/javascript/bootstrap.js" type="text/javascript"></script>

<script src="./publico/javascript/mootools-1.2.4-core.js" type="text/javascript"></script>
<script src="./publico/javascript/mootools-1-1.2.4.2-more.js" type="text/javascript"></script>
<script src="./publico/javascript/targetbl.js" type="text/javascript"></script>
<script src="./publico/javascript/mensajes.js" type="text/javascript"></script>
<script src="./publico/javascript/form.js" type="text/javascript"></script>
<script src="./publico/javascript/autocompleter/Observer.js" type="text/javascript"></script>
<script src="./publico/javascript/autocompleter/Autocompleter.js" type="text/javascript"></script>
<script src="./publico/javascript/autocompleter/Autocompleter.Request.js" type="text/javascript"></script>
<script src="./publico/javascript/domready.js" type="text/javascript"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-2HP38G406P"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-2HP38G406P');
</script>



<script type="text/javascript">
function seleccionar_todo(){
   for (i=0;i<document.formulario_marcados.elements.length;i++)
      if(document.formulario_marcados.elements[i].type == "checkbox")
         document.formulario_marcados.elements[i].checked=1
}
function deseleccionar_todo(){
   for (i=0;i<document.formulario_marcados.elements.length;i++)
      if(document.formulario_marcados.elements[i].type == "checkbox")
         document.formulario_marcados.elements[i].checked=0
} 
</script>
	</head>
    <body style="min-width: 960px; background-color: #e2e2e2; height: 100%">	
		<a name="arriba"></a>
<div>
<div id="header">
    <table id="Tabla_01" height="105" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td>
            <img src="./publico/imagenes/cabecera/banner_new2_01.jpg" width="3" height="105" alt="">
        </td>
        <td>
            <img src="./publico/imagenes/cabecera/banner_new2_02.jpg" width="100" height="105" alt="">
        </td>
        <td width="100%" align="right"  style="min-width: 613px; background-repeat: no-repeat; background-position: top right; font-size: medium; font-weight: bold; color: white;">
            <table width="100%" height="105" border="0">
                <tr>
                    <td style=" vertical-align: top; width: 547px">
                        <!-- <a style="text-decoration: none" href="./"><img src="./publico/imagenes/cabecera/banner_new2_03.jpg"alt=""></a> -->
                        <a style="text-decoration: none" href="https://biblus.us.es/bibing/proyectos/"><img src="./publico/imagenes/cabecera/banner_new2_03.jpg"alt=""></a>
                     </td>
                     <td  background="./publico/imagenes/cabecera/banner_new2_04.jpg" style="background-repeat: no-repeat; background-color: #c6d4e8;"><br><br><br>
                         &nbsp;
                        </td>
                    </tr>
             </table>
        </td>
    </tr>
    <tr style="border-top: 1px solid #ffffff;">
        <td colspan="3" id="menu_sup" style="font-size: small; text-align: right; background-color: #9c1f2f; vertical-align: bottom">
                                     

                                <a href="https://biblus.us.es/bibing/proyectos/" class="enlace " style=" color: #ffffff">Inicio&nbsp;&nbsp;|</a>
                                <a href="https://biblus.us.es/bibing/proyectos/acerca/" style=" color: #ffffff" class="enlace ">&nbsp;&nbsp;Acerca de&nbsp;&nbsp;|</a>
                                
                                <a href="https://biblus.us.es/bibing/proyectos/contactar/" style=" color: #ffffff" class="enlace ">&nbsp;&nbsp;Contactar&nbsp;&nbsp;</a>
                         <!--       <a href="https://biblus.us.es/bibing/proyectos/ayuda/" style=" color: #ffffff" class="enlace  ">&nbsp;&nbsp;Ayuda&nbsp;&nbsp;|</a> -->
                                <!-- <form id="idioma" class=""  method="post" action="">
                                <div class="inline" style="color: white">
                                <input type="submit" class="tipo_letra " style=" color: #ffffff"name="idioma" value="Castellanossss" />&nbsp;&nbsp;
                                </div>	
                                </form> -->

                                </td>

    </tr>
    </table>
</div>
<br><br>
<div class="colmask rightmenu">
<div class="panel panel-default" style="margin:20px">
            <div class="panel-heading"><h4>SISTEMA DE GESTIÓN DE INCIDENCIAS Y VENTAS</h4><h5 style="color:grey"><span class="glyphicon glyphicon-user""></span> : <b>Gómez Muñoz, Marta</b><br><span class="glyphicon glyphicon-book""></span>  :<b> Ingenier&iacute;a Telecomunicación</b></h5></div><div class="panel-body"><div class="contenido_proyecto"><div class="titulo2_explorador">Contenido del proyecto:</div><div class="ruta"><a href="abreproy/12091">Directorio ra&iacute;z</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="abreproy/12091/direccion/base+de+datos%252F">base de datos</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="abreproy/12091/direccion/base+de+datos%252Fbbddjara%252F">bbddjara</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="abreproy/12091/direccion/base+de+datos%252Fbbddjara%252FbbddJARA_MyISAM.sql%252F">bbddJARA_MyISAM.sql</a></div><div class="listing"></div></div></div></div>
</div>
</div>

        
	</body>
 
 
<!-- Inicio Google Analytics -->
<!--
	<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	
	<script type="text/javascript">
		try {
		var pageTracker = _gat._getTracker("UA-7789620-1");
		pageTracker._trackPageview();
	} 
		catch(err) {}
	</script>
-->
<!-- Fin Google Analytics -->

</html>

