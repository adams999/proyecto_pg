--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.6
-- Dumped by pg_dump version 9.6.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: func_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION func_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN 

    INSERT INTO LOGS

    (id_usu, 

    ip_usu, 

    id_pre_log, 

    tab_log, 

    acc_log, 

    log_sql,

    date_log,

    inf_usu,

    url_sql,

    val_mod_log,

    mac_usu) 

    VALUES 

    ((SELECT ID_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1), 

    (SELECT IP_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),  

    (SELECT ID_PRE_LOG FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    TG_TABLE_NAME, 

    TG_OP, 

    (SELECT SQL_EXE FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT DATE_TIME FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT INF_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT URL_SQL FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    CONCAT('DATA NUEVA: ', 

          NEW),

    (SELECT MAC_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1)

    );

    RETURN NEW;

    END$$;


ALTER FUNCTION public.func_insert() OWNER TO postgres;

--
-- Name: func_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION func_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$    BEGIN 

    INSERT INTO LOGS

    (id_usu, 

    ip_usu, 

    id_pre_log, 

    tab_log, 

    acc_log, 

    log_sql,

    date_log,

    inf_usu,

    url_sql,

    val_mod_log,

    mac_usu) 

    VALUES 

    ((SELECT ID_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1), 

    (SELECT IP_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),  

    (SELECT ID_PRE_LOG FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    TG_TABLE_NAME, 

    TG_OP, 

    (SELECT SQL_EXE FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT DATE_TIME FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT INF_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    (SELECT URL_SQL FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1),

    CONCAT('DATA ANTIGUA: ', 

          OLD, 

         'DATA NUEVA: ', 

          NEW),

    (SELECT MAC_USU FROM PRE_LOGS ORDER BY id_pre_log DESC LIMIT 1)

    );

    RETURN NEW;

    END

$$;


ALTER FUNCTION public.func_update() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: apartado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE apartado (
    id_apartado_usuario integer NOT NULL,
    id_usuario integer,
    fecha_hora_apartado character varying(20),
    estatus integer,
    precio_unidad character varying(200)
);


ALTER TABLE apartado OWNER TO postgres;

--
-- Name: apartados_usuario_id_apartado_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE apartados_usuario_id_apartado_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE apartados_usuario_id_apartado_usuario_seq OWNER TO postgres;

--
-- Name: apartados_usuario_id_apartado_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE apartados_usuario_id_apartado_usuario_seq OWNED BY apartado.id_apartado_usuario;


--
-- Name: bancos_empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bancos_empresa (
    id_banco_empresa integer NOT NULL,
    nomb_banc_empr character varying(50),
    tipo_cuen_empr character varying(20),
    num_cuen_empr character varying(20),
    titu_cuen_empr character varying(100),
    cedula_titular_cuenta character varying(13),
    cedu_cuen_empr character varying(15),
    estatus integer
);


ALTER TABLE bancos_empresa OWNER TO postgres;

--
-- Name: bancos_empresa_id_banco_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_empresa_id_banco_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_empresa_id_banco_empresa_seq OWNER TO postgres;

--
-- Name: bancos_empresa_id_banco_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_empresa_id_banco_empresa_seq OWNED BY bancos_empresa.id_banco_empresa;


--
-- Name: bancos_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bancos_usuario (
    id_banco_usuario integer NOT NULL,
    nomb_banc_usua character varying(100) NOT NULL,
    tipo_cuen_usua character varying(10) NOT NULL,
    num_cuen_usua character varying(20) NOT NULL,
    titu_cuen_usua character varying(50) NOT NULL,
    cedu_cuen_usua character varying(15) NOT NULL,
    estatus integer NOT NULL,
    id_usuario integer NOT NULL
);


ALTER TABLE bancos_usuario OWNER TO postgres;

--
-- Name: bancos_usuarios_cedu_cuen_usua_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_cedu_cuen_usua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_cedu_cuen_usua_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_cedu_cuen_usua_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_cedu_cuen_usua_seq OWNED BY bancos_usuario.cedu_cuen_usua;


--
-- Name: bancos_usuarios_estatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_estatus_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_estatus_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_estatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_estatus_seq OWNED BY bancos_usuario.estatus;


--
-- Name: bancos_usuarios_id_banco_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_id_banco_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_id_banco_usuario_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_id_banco_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_id_banco_usuario_seq OWNED BY bancos_usuario.id_banco_usuario;


--
-- Name: bancos_usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_id_usuario_seq OWNED BY bancos_usuario.id_usuario;


--
-- Name: bancos_usuarios_nomb_banc_usua_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_nomb_banc_usua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_nomb_banc_usua_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_nomb_banc_usua_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_nomb_banc_usua_seq OWNED BY bancos_usuario.nomb_banc_usua;


--
-- Name: bancos_usuarios_num_cuen_usua_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_num_cuen_usua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_num_cuen_usua_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_num_cuen_usua_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_num_cuen_usua_seq OWNED BY bancos_usuario.num_cuen_usua;


--
-- Name: bancos_usuarios_tipo_cuen_usua_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_tipo_cuen_usua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_tipo_cuen_usua_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_tipo_cuen_usua_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_tipo_cuen_usua_seq OWNED BY bancos_usuario.tipo_cuen_usua;


--
-- Name: bancos_usuarios_titu_cuen_usua_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bancos_usuarios_titu_cuen_usua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bancos_usuarios_titu_cuen_usua_seq OWNER TO postgres;

--
-- Name: bancos_usuarios_titu_cuen_usua_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bancos_usuarios_titu_cuen_usua_seq OWNED BY bancos_usuario.titu_cuen_usua;


--
-- Name: catalogo_venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE catalogo_venta (
    id_producto_venta integer NOT NULL,
    codigo_producto_v character varying(30),
    nombre_producto_v character varying(32),
    id_usuario_a character varying(10),
    categoria character varying(40),
    marca character varying(30),
    descripcion character varying(250),
    imagen character varying(250),
    tipo_unidad character varying(15),
    productos_vendidos character varying(10),
    precio_base character varying(30),
    iva_producto character varying(30),
    pvp character varying(30),
    numero_pedido character varying(25),
    estatus integer,
    productos_disponibles integer,
    numero_comentario integer,
    precio_costo character varying(100)
);


ALTER TABLE catalogo_venta OWNER TO postgres;

--
-- Name: catalogo_venta_id_producto_venta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE catalogo_venta_id_producto_venta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogo_venta_id_producto_venta_seq OWNER TO postgres;

--
-- Name: catalogo_venta_id_producto_venta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE catalogo_venta_id_producto_venta_seq OWNED BY catalogo_venta.id_producto_venta;


--
-- Name: detalle_apartado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detalle_apartado (
    id_detalle_apartado integer NOT NULL,
    id_producto_venta integer,
    cantidad_apartada integer,
    fecha_hora character varying(25),
    estatus integer,
    id_usuario integer,
    id_apartado integer,
    precio_unidad character varying(100),
    precio_base character varying(20),
    iva character varying(5),
    ganancia character varying(5)
);


ALTER TABLE detalle_apartado OWNER TO postgres;

--
-- Name: detalle_apartado_id_detalle_apartado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalle_apartado_id_detalle_apartado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE detalle_apartado_id_detalle_apartado_seq OWNER TO postgres;

--
-- Name: detalle_apartado_id_detalle_apartado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalle_apartado_id_detalle_apartado_seq OWNED BY detalle_apartado.id_detalle_apartado;


--
-- Name: empresa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE empresa (
    id_empresa integer NOT NULL,
    rif_empresa character varying(12),
    nombre_empresa character varying(100),
    direccion_empresa character varying(250),
    telefono_empresa character varying(12),
    correo_empresa character varying(50)
);


ALTER TABLE empresa OWNER TO postgres;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empresa_id_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresa_id_empresa_seq OWNER TO postgres;

--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empresa_id_empresa_seq OWNED BY empresa.id_empresa;


--
-- Name: ganancia_iva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ganancia_iva (
    ganancia character varying(10),
    iva character varying(10)
);


ALTER TABLE ganancia_iva OWNER TO postgres;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE logs (
    id_log integer NOT NULL,
    id_usu integer,
    ip_usu character varying(25),
    id_pre_log character varying,
    tab_log text,
    acc_log text,
    log_sql text,
    date_log timestamp without time zone,
    inf_usu text,
    url_sql text,
    val_mod_log text,
    mac_usu macaddr
);


ALTER TABLE logs OWNER TO postgres;

--
-- Name: logs_acc_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_acc_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_acc_log_seq OWNER TO postgres;

--
-- Name: logs_acc_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_acc_log_seq OWNED BY logs.acc_log;


--
-- Name: logs_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_id_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_id_log_seq OWNER TO postgres;

--
-- Name: logs_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_id_log_seq OWNED BY logs.id_log;


--
-- Name: logs_mac_usu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logs_mac_usu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logs_mac_usu_seq OWNER TO postgres;

--
-- Name: logs_mac_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logs_mac_usu_seq OWNED BY logs.id_pre_log;


--
-- Name: opiniones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE opiniones (
    id_opinion integer NOT NULL,
    opinion_usuario character varying(255),
    id_usuario integer,
    id_venta_producto integer,
    estatus integer,
    id_producto_venta integer,
    fecha_hora_opinion timestamp without time zone
);


ALTER TABLE opiniones OWNER TO postgres;

--
-- Name: opiniones_id_opinion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opiniones_id_opinion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE opiniones_id_opinion_seq OWNER TO postgres;

--
-- Name: opiniones_id_opinion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opiniones_id_opinion_seq OWNED BY opiniones.id_opinion;


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pedidos (
    id_pedido integer NOT NULL,
    numero_pedido character varying(20),
    id_usuario_a character varying(10),
    id_proveedor character varying(10),
    codigo_producto character varying(30),
    nombre_producto character varying(32),
    cantidad_producto character varying(10),
    precio_costo character varying(20),
    fecha_pedido character varying(30)
);


ALTER TABLE pedidos OWNER TO postgres;

--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedidos_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pedidos_id_pedido_seq OWNER TO postgres;

--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedidos_id_pedido_seq OWNED BY pedidos.id_pedido;


--
-- Name: pre_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE pre_logs (
    id_pre_log integer NOT NULL,
    id_usu integer,
    ip_usu character varying(20),
    sql_exe text,
    date_time timestamp without time zone,
    inf_usu text,
    url_sql text,
    mac_usu macaddr
);


ALTER TABLE pre_logs OWNER TO postgres;

--
-- Name: pre_logs_id_pre_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pre_logs_id_pre_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_logs_id_pre_log_seq OWNER TO postgres;

--
-- Name: pre_logs_id_pre_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pre_logs_id_pre_log_seq OWNED BY pre_logs.id_pre_log;


--
-- Name: pre_logs_id_usu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pre_logs_id_usu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_logs_id_usu_seq OWNER TO postgres;

--
-- Name: pre_logs_id_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pre_logs_id_usu_seq OWNED BY pre_logs.id_usu;


--
-- Name: pre_logs_ip_usu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pre_logs_ip_usu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_logs_ip_usu_seq OWNER TO postgres;

--
-- Name: pre_logs_ip_usu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pre_logs_ip_usu_seq OWNED BY pre_logs.ip_usu;


--
-- Name: pre_logs_sql_exe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pre_logs_sql_exe_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pre_logs_sql_exe_seq OWNER TO postgres;

--
-- Name: pre_logs_sql_exe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pre_logs_sql_exe_seq OWNED BY pre_logs.sql_exe;


--
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proveedores (
    id_proveedor integer NOT NULL,
    id_usuario_a character varying(10) NOT NULL,
    nombre_proveedor character varying(100) NOT NULL,
    razon_social_proveedor character varying(200) NOT NULL,
    direccion_proveedor character varying(250) NOT NULL,
    telef_proveedor character varying(13) NOT NULL,
    tipo_producto character varying(35) NOT NULL,
    correo_proveedor character varying(100) NOT NULL,
    estatus integer
);


ALTER TABLE proveedores OWNER TO postgres;

--
-- Name: proveedores_correo_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_correo_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_correo_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_correo_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_correo_proveedor_seq OWNED BY proveedores.correo_proveedor;


--
-- Name: proveedores_direccion_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_direccion_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_direccion_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_direccion_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_direccion_proveedor_seq OWNED BY proveedores.direccion_proveedor;


--
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_id_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_id_proveedor_seq OWNED BY proveedores.id_proveedor;


--
-- Name: proveedores_id_usuario_a_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_id_usuario_a_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_id_usuario_a_seq OWNER TO postgres;

--
-- Name: proveedores_id_usuario_a_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_id_usuario_a_seq OWNED BY proveedores.id_usuario_a;


--
-- Name: proveedores_nombre_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_nombre_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_nombre_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_nombre_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_nombre_proveedor_seq OWNED BY proveedores.nombre_proveedor;


--
-- Name: proveedores_razon_social_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_razon_social_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_razon_social_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_razon_social_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_razon_social_proveedor_seq OWNED BY proveedores.razon_social_proveedor;


--
-- Name: proveedores_telef_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_telef_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_telef_proveedor_seq OWNER TO postgres;

--
-- Name: proveedores_telef_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_telef_proveedor_seq OWNED BY proveedores.telef_proveedor;


--
-- Name: proveedores_tipo_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proveedores_tipo_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proveedores_tipo_producto_seq OWNER TO postgres;

--
-- Name: proveedores_tipo_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proveedores_tipo_producto_seq OWNED BY proveedores.tipo_producto;


--
-- Name: session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE session (
    id_session integer NOT NULL,
    id_usuario character varying(10) NOT NULL,
    fecha_hora_session character varying(200) NOT NULL,
    ip_session character varying(50) NOT NULL,
    permiso_session integer NOT NULL,
    mac_usu macaddr
);


ALTER TABLE session OWNER TO postgres;

--
-- Name: session_fecha_hora_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_fecha_hora_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_fecha_hora_session_seq OWNER TO postgres;

--
-- Name: session_fecha_hora_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_fecha_hora_session_seq OWNED BY session.fecha_hora_session;


--
-- Name: session_id_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_id_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_id_session_seq OWNER TO postgres;

--
-- Name: session_id_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_id_session_seq OWNED BY session.id_session;


--
-- Name: session_ip_session_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_ip_session_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_ip_session_seq OWNER TO postgres;

--
-- Name: session_ip_session_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_ip_session_seq OWNED BY session.ip_session;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    cedula_usuario character varying(13) NOT NULL,
    nombre_usuario character varying(50),
    apellido_usuario character varying(50),
    correo_usuario character varying(50),
    contra_usuario character varying(35),
    estado character varying(20),
    ciudad character varying(200),
    direccion character varying(250),
    cod_telef_pers character varying(4),
    telef_personal character varying(7),
    cod_telef_hog character varying(4),
    telef_hog character varying(7),
    pregunta_seguridad character varying(50),
    respuesta_seguridad character varying(100),
    bandera character varying(2),
    estatus integer NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO postgres;

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- Name: ventas_productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ventas_productos (
    id_venta_producto integer NOT NULL,
    id_apartado integer,
    id_banco_usuario integer,
    id_banco_empresa integer,
    monto_cancelado character varying,
    estatus integer,
    numero_referencia character varying(20),
    id_usuario integer,
    fecha_hora_venta timestamp without time zone,
    iva character varying(5),
    ganancia character varying(5),
    precio_base character varying(20)
);


ALTER TABLE ventas_productos OWNER TO postgres;

--
-- Name: ventas_productos_id_venta_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ventas_productos_id_venta_producto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ventas_productos_id_venta_producto_seq OWNER TO postgres;

--
-- Name: ventas_productos_id_venta_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ventas_productos_id_venta_producto_seq OWNED BY ventas_productos.id_venta_producto;


--
-- Name: apartado id_apartado_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado ALTER COLUMN id_apartado_usuario SET DEFAULT nextval('apartados_usuario_id_apartado_usuario_seq'::regclass);


--
-- Name: bancos_empresa id_banco_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_empresa ALTER COLUMN id_banco_empresa SET DEFAULT nextval('bancos_empresa_id_banco_empresa_seq'::regclass);


--
-- Name: bancos_usuario id_banco_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN id_banco_usuario SET DEFAULT nextval('bancos_usuarios_id_banco_usuario_seq'::regclass);


--
-- Name: bancos_usuario nomb_banc_usua; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN nomb_banc_usua SET DEFAULT nextval('bancos_usuarios_nomb_banc_usua_seq'::regclass);


--
-- Name: bancos_usuario tipo_cuen_usua; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN tipo_cuen_usua SET DEFAULT nextval('bancos_usuarios_tipo_cuen_usua_seq'::regclass);


--
-- Name: bancos_usuario num_cuen_usua; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN num_cuen_usua SET DEFAULT nextval('bancos_usuarios_num_cuen_usua_seq'::regclass);


--
-- Name: bancos_usuario titu_cuen_usua; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN titu_cuen_usua SET DEFAULT nextval('bancos_usuarios_titu_cuen_usua_seq'::regclass);


--
-- Name: bancos_usuario cedu_cuen_usua; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN cedu_cuen_usua SET DEFAULT nextval('bancos_usuarios_cedu_cuen_usua_seq'::regclass);


--
-- Name: bancos_usuario estatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN estatus SET DEFAULT nextval('bancos_usuarios_estatus_seq'::regclass);


--
-- Name: bancos_usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario ALTER COLUMN id_usuario SET DEFAULT nextval('bancos_usuarios_id_usuario_seq'::regclass);


--
-- Name: catalogo_venta id_producto_venta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY catalogo_venta ALTER COLUMN id_producto_venta SET DEFAULT nextval('catalogo_venta_id_producto_venta_seq'::regclass);


--
-- Name: detalle_apartado id_detalle_apartado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_apartado ALTER COLUMN id_detalle_apartado SET DEFAULT nextval('detalle_apartado_id_detalle_apartado_seq'::regclass);


--
-- Name: empresa id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa ALTER COLUMN id_empresa SET DEFAULT nextval('empresa_id_empresa_seq'::regclass);


--
-- Name: logs id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs ALTER COLUMN id_log SET DEFAULT nextval('logs_id_log_seq'::regclass);


--
-- Name: opiniones id_opinion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opiniones ALTER COLUMN id_opinion SET DEFAULT nextval('opiniones_id_opinion_seq'::regclass);


--
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('pedidos_id_pedido_seq'::regclass);


--
-- Name: pre_logs id_pre_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pre_logs ALTER COLUMN id_pre_log SET DEFAULT nextval('pre_logs_id_pre_log_seq'::regclass);


--
-- Name: proveedores id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN id_proveedor SET DEFAULT nextval('proveedores_id_proveedor_seq'::regclass);


--
-- Name: proveedores id_usuario_a; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN id_usuario_a SET DEFAULT nextval('proveedores_id_usuario_a_seq'::regclass);


--
-- Name: proveedores nombre_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN nombre_proveedor SET DEFAULT nextval('proveedores_nombre_proveedor_seq'::regclass);


--
-- Name: proveedores razon_social_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN razon_social_proveedor SET DEFAULT nextval('proveedores_razon_social_proveedor_seq'::regclass);


--
-- Name: proveedores direccion_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN direccion_proveedor SET DEFAULT nextval('proveedores_direccion_proveedor_seq'::regclass);


--
-- Name: proveedores telef_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN telef_proveedor SET DEFAULT nextval('proveedores_telef_proveedor_seq'::regclass);


--
-- Name: proveedores tipo_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN tipo_producto SET DEFAULT nextval('proveedores_tipo_producto_seq'::regclass);


--
-- Name: proveedores correo_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores ALTER COLUMN correo_proveedor SET DEFAULT nextval('proveedores_correo_proveedor_seq'::regclass);


--
-- Name: session id_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session ALTER COLUMN id_session SET DEFAULT nextval('session_id_session_seq'::regclass);


--
-- Name: session fecha_hora_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session ALTER COLUMN fecha_hora_session SET DEFAULT nextval('session_fecha_hora_session_seq'::regclass);


--
-- Name: session ip_session; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session ALTER COLUMN ip_session SET DEFAULT nextval('session_ip_session_seq'::regclass);


--
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- Name: ventas_productos id_venta_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_productos ALTER COLUMN id_venta_producto SET DEFAULT nextval('ventas_productos_id_venta_producto_seq'::regclass);


--
-- Name: apartado apartados_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY apartado
    ADD CONSTRAINT apartados_usuario_pkey PRIMARY KEY (id_apartado_usuario);


--
-- Name: bancos_empresa bancos_empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_empresa
    ADD CONSTRAINT bancos_empresa_pkey PRIMARY KEY (id_banco_empresa);


--
-- Name: bancos_usuario bancos_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bancos_usuario
    ADD CONSTRAINT bancos_usuarios_pkey PRIMARY KEY (id_banco_usuario);


--
-- Name: catalogo_venta catalogo_venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY catalogo_venta
    ADD CONSTRAINT catalogo_venta_pkey PRIMARY KEY (id_producto_venta);


--
-- Name: detalle_apartado detalle_apartado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalle_apartado
    ADD CONSTRAINT detalle_apartado_pkey PRIMARY KEY (id_detalle_apartado);


--
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id_log);


--
-- Name: opiniones opiniones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opiniones
    ADD CONSTRAINT opiniones_pkey PRIMARY KEY (id_opinion);


--
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- Name: pre_logs pre_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pre_logs
    ADD CONSTRAINT pre_logs_pkey PRIMARY KEY (id_pre_log);


--
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id_session);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: ventas_productos ventas_productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas_productos
    ADD CONSTRAINT ventas_productos_pkey PRIMARY KEY (id_venta_producto);


--
-- Name: apartado insert_apartado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_apartado BEFORE INSERT ON apartado FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: bancos_empresa insert_bancos_empresa; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_bancos_empresa BEFORE INSERT ON bancos_empresa FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: bancos_usuario insert_bancos_usuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_bancos_usuario BEFORE INSERT ON bancos_usuario FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: catalogo_venta insert_catalogo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_catalogo BEFORE INSERT ON catalogo_venta FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: detalle_apartado insert_detalle_apartado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_detalle_apartado BEFORE INSERT ON detalle_apartado FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: empresa insert_empresa; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_empresa BEFORE INSERT ON empresa FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: ganancia_iva insert_ganancia_iva; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_ganancia_iva BEFORE INSERT ON ganancia_iva FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: opiniones insert_opiniones; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_opiniones BEFORE INSERT ON opiniones FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: pedidos insert_pedidos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_pedidos BEFORE INSERT ON pedidos FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: proveedores insert_proveedores; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_proveedores BEFORE INSERT ON proveedores FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: usuario insert_usuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_usuario BEFORE INSERT ON usuario FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: ventas_productos insert_ventas; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insert_ventas BEFORE INSERT ON ventas_productos FOR EACH ROW EXECUTE PROCEDURE func_insert();


--
-- Name: apartado update_apartado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_apartado BEFORE UPDATE ON apartado FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: bancos_empresa update_bancos_empresa; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_bancos_empresa BEFORE UPDATE ON bancos_empresa FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: bancos_usuario update_bancos_usuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_bancos_usuario BEFORE UPDATE ON bancos_usuario FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: catalogo_venta update_catagolo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_catagolo BEFORE UPDATE ON catalogo_venta FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: detalle_apartado update_detalle_apartado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_detalle_apartado BEFORE UPDATE ON detalle_apartado FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: empresa update_empresa; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_empresa BEFORE UPDATE ON empresa FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: ganancia_iva update_ganancia_iva; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_ganancia_iva BEFORE UPDATE ON ganancia_iva FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: opiniones update_opiniones; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_opiniones BEFORE UPDATE ON opiniones FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: pedidos update_pedidos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_pedidos BEFORE UPDATE ON pedidos FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: proveedores update_proveedores; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_proveedores BEFORE UPDATE ON proveedores FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: usuario update_usuario; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_usuario BEFORE UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: ventas_productos update_venta; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_venta BEFORE UPDATE ON ventas_productos FOR EACH ROW EXECUTE PROCEDURE func_update();


--
-- Name: apartado.id_apartado_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_apartado_usuario) ON TABLE apartado TO PUBLIC;


--
-- Name: bancos_empresa.id_banco_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_banco_empresa) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: bancos_empresa.nomb_banc_empr; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(nomb_banc_empr) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: bancos_empresa.tipo_cuen_empr; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(tipo_cuen_empr) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: bancos_empresa.num_cuen_empr; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(num_cuen_empr) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: bancos_empresa.titu_cuen_empr; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(titu_cuen_empr) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: bancos_empresa.cedula_titular_cuenta; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(cedula_titular_cuenta) ON TABLE bancos_empresa TO PUBLIC;


--
-- Name: empresa.id_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: empresa.rif_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(rif_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: empresa.nombre_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(nombre_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: empresa.direccion_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(direccion_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: empresa.telefono_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(telefono_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: empresa.correo_empresa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(correo_empresa) ON TABLE empresa TO PUBLIC;


--
-- Name: proveedores.id_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.id_usuario_a; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_usuario_a) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.nombre_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(nombre_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.razon_social_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(razon_social_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.direccion_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(direccion_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.telef_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(telef_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.tipo_producto; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(tipo_producto) ON TABLE proveedores TO PUBLIC;


--
-- Name: proveedores.correo_proveedor; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(correo_proveedor) ON TABLE proveedores TO PUBLIC;


--
-- Name: usuario.id_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(id_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.cedula_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(cedula_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.nombre_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(nombre_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.apellido_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(apellido_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.correo_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(correo_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.contra_usuario; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(contra_usuario) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.estado; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(estado) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.ciudad; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(ciudad) ON TABLE usuario TO PUBLIC;


--
-- Name: usuario.direccion; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL(direccion) ON TABLE usuario TO PUBLIC;


--
-- PostgreSQL database dump complete
--

