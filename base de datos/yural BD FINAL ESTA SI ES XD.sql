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

         '   DATA NUEVA: ', 

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
-- Name: elementos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE elementos (
    id_ele integer NOT NULL,
    id_usu integer NOT NULL,
    cat_acc boolean,
    cat_car boolean,
    cat_cha boolean,
    cat_ele boolean,
    cat_fre boolean,
    cat_mot boolean,
    cat_sus boolean,
    cat_tra boolean,
    estatus integer,
    reg_adm boolean,
    mod_int boolean,
    mod_log boolean,
    mod_apa boolean
);


ALTER TABLE elementos OWNER TO postgres;

--
-- Name: elementos_id_ele_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE elementos_id_ele_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elementos_id_ele_seq OWNER TO postgres;

--
-- Name: elementos_id_ele_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE elementos_id_ele_seq OWNED BY elementos.id_ele;


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
-- Name: elementos id_ele; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elementos ALTER COLUMN id_ele SET DEFAULT nextval('elementos_id_ele_seq'::regclass);


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
-- Data for Name: apartado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY apartado (id_apartado_usuario, id_usuario, fecha_hora_apartado, estatus, precio_unidad) FROM stdin;
57	3	11/07/2019 09:52	10	\N
99	3	18/07/2019 00:55	0	\N
60	3	16/07/2019 22:14	0	\N
61	3	16/07/2019 22:18	0	\N
62	3	16/07/2019 22:20	0	\N
63	3	16/07/2019 22:21	0	\N
64	3	16/07/2019 22:29	0	\N
65	3	16/07/2019 22:30	0	\N
66	3	16/07/2019 22:31	0	\N
67	3	16/07/2019 22:34	0	\N
68	3	16/07/2019 22:36	0	\N
69	3	16/07/2019 22:42	0	\N
70	3	16/07/2019 22:47	0	\N
71	3	16/07/2019 22:48	0	\N
72	3	16/07/2019 22:53	0	\N
73	3	16/07/2019 22:55	0	\N
74	3	16/07/2019 22:59	0	\N
75	3	16/07/2019 23:00	0	\N
76	3	16/07/2019 23:03	0	\N
77	3	16/07/2019 23:05	0	\N
78	3	16/07/2019 23:05	0	\N
79	3	16/07/2019 23:09	0	\N
80	3	16/07/2019 23:22	0	\N
81	3	16/07/2019 23:23	0	\N
82	3	16/07/2019 23:26	0	\N
83	3	16/07/2019 23:26	0	\N
84	3	16/07/2019 23:28	0	\N
85	3	16/07/2019 23:30	0	\N
86	3	16/07/2019 23:40	0	\N
100	3	18/07/2019 00:56	0	\N
101	3	18/07/2019 00:57	0	\N
87	3	16/07/2019 23:43	0	\N
102	3	18/07/2019 01:13	2	\N
103	3	18/07/2019 01:40	2	\N
90	3	17/07/2019 00:00	0	\N
104	3	18/07/2019 01:41	2	\N
91	3	17/07/2019 00:02	10	\N
58	3	11/07/2019 10:33	10	\N
89	3	16/07/2019 23:55	10	\N
92	3	17/07/2019 00:08	0	\N
93	3	17/07/2019 00:09	10	\N
88	3	16/07/2019 23:54	10	\N
59	3	11/07/2019 10:46	0	\N
94	3	18/07/2019 00:03	0	\N
95	3	18/07/2019 00:48	0	\N
96	3	18/07/2019 00:49	0	\N
97	3	18/07/2019 00:51	0	\N
98	3	18/07/2019 00:53	0	\N
105	3	18/07/2019 01:41	3	\N
106	3	18/07/2019 01:43	0	\N
107	3	21/07/2019 16:11	0	\N
108	3	21/07/2019 16:11	0	\N
109	3	21/07/2019 16:14	0	\N
110	3	21/07/2019 16:14	0	\N
111	3	21/07/2019 16:15	0	\N
112	3	21/07/2019 16:15	0	\N
113	3	21/07/2019 16:17	0	\N
114	3	21/07/2019 18:42	1	\N
\.


--
-- Name: apartados_usuario_id_apartado_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('apartados_usuario_id_apartado_usuario_seq', 114, true);


--
-- Data for Name: bancos_empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bancos_empresa (id_banco_empresa, nomb_banc_empr, tipo_cuen_empr, num_cuen_empr, titu_cuen_empr, cedula_titular_cuenta, cedu_cuen_empr, estatus) FROM stdin;
4	100% BANCO	Corriente	01561231312312312312	adasdasdasd	\N	V-12312312	1
3	BanPlussss	Corriente	01234578983738939303	Leidy carvajala	\N	V-24882728	1
2	BANCO BANESCO	Corriente	01340924200000108889	yurley contreras	\N	V-24819181	1
\.


--
-- Name: bancos_empresa_id_banco_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_empresa_id_banco_empresa_seq', 4, true);


--
-- Data for Name: bancos_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bancos_usuario (id_banco_usuario, nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) FROM stdin;
1	BANCO DE VENEZUELA, S.A.I.C.A.	Corriente	01022189128734812398	Julian Contreras	V-24819181	1	2
2	BANCO CARONI, C.A. BANCO UNIVERSAL	Ahorro	04949483829292838474	adams contreras	V-24819181	1	2
4	BANCO ACTIVO BANCO COMERCIAL, C.A.	Corriente	01711312312312312312	prueba prueba	J-123123123	1	3
3	BANFANB	Corriente	01771231312312312312	vidermid sanchez	V-19121212	1	3
\.


--
-- Name: bancos_usuarios_cedu_cuen_usua_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_cedu_cuen_usua_seq', 1, false);


--
-- Name: bancos_usuarios_estatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_estatus_seq', 1, false);


--
-- Name: bancos_usuarios_id_banco_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_id_banco_usuario_seq', 4, true);


--
-- Name: bancos_usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_id_usuario_seq', 1, false);


--
-- Name: bancos_usuarios_nomb_banc_usua_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_nomb_banc_usua_seq', 1, false);


--
-- Name: bancos_usuarios_num_cuen_usua_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_num_cuen_usua_seq', 1, false);


--
-- Name: bancos_usuarios_tipo_cuen_usua_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_tipo_cuen_usua_seq', 1, false);


--
-- Name: bancos_usuarios_titu_cuen_usua_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bancos_usuarios_titu_cuen_usua_seq', 1, false);


--
-- Data for Name: catalogo_venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY catalogo_venta (id_producto_venta, codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, precio_base, iva_producto, pvp, numero_pedido, estatus, productos_disponibles, numero_comentario, precio_costo) FROM stdin;
1	ACC2528	prueba 	1	Accesorios para Motociclistas	KEEWAY	CASCO KEEWAY	1463849799021 - copia - copia.jpg	Unico	10	52.000,00	8.320,00	60.320,00	23123	1	5	\N	40.000,00
2	CAR6545	CARETA R1 BLANCAss	1	Carenaje	BERAS	CARETA BERA R1 BLANCA ORIGINAL	1469736508676 - copia.jpg	Unico	4	97.500,00	15.600,00	113.100,00	9955	1	1	\N	\N
5	ACC710	prueba	1	Accesorios para Motociclistas	keeway	adadasdad	../imagenesRepuestos/IMG_20160428_162828 - copia.jpg	Unidad	8	65.000,00	10.400,00	75.400,00	1231	1	4	\N	50.000,00
3	CHA342	chaleco	1	Chasis	Bera	chaleco para motociclistas	../imagenesRepuestos/1464034253956 - copia - copia.jpg	Unico	5	5.850.000,00	936.000,00	6.786.000,00	13123	1	12	\N	\N
6	ACC1497	embobinado magneto	1	Accesorios para Motociclistas	ckj	prueba prueba	../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg	Unidad	8	650.650,00	104.104,00	754.754,00	12	1	0	\N	500.500,00
4	ACC1012	prueba	1	Accesorios para Motociclistas	keeway	adadasdad	../imagenesRepuestos/IMG_20160428_162828 - copia.jpg	Unidad	7	65.000,00	10.400,00	75.400,00	12312	1	5	\N	\N
\.


--
-- Name: catalogo_venta_id_producto_venta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('catalogo_venta_id_producto_venta_seq', 6, true);


--
-- Data for Name: detalle_apartado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalle_apartado (id_detalle_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, id_apartado, precio_unidad, precio_base, iva, ganancia) FROM stdin;
34	5	2	11/07/2019 09:52	10	3	57	75.400,00	\N	\N	\N
37	6	2	16/07/2019 22:14	0	3	60	754.754,00	650.650,00	0.16	0.35
38	6	2	16/07/2019 22:18	0	3	61	754.754,00	650.650,00	0.16	0.35
39	6	2	16/07/2019 22:20	0	3	62	754.754,00	650.650,00	0.16	0.35
40	6	2	16/07/2019 22:21	0	3	63	754.754,00	650.650,00	0.16	0.35
41	6	2	16/07/2019 22:29	0	3	64	754.754,00	650.650,00	0.16	0.35
42	6	2	16/07/2019 22:30	0	3	65	754.754,00	650.650,00	0.16	0.35
43	6	2	16/07/2019 22:31	0	3	66	754.754,00	650.650,00	0.16	0.35
44	6	2	16/07/2019 22:34	0	3	67	754.754,00	650.650,00	0.16	0.35
45	6	2	16/07/2019 22:36	0	3	68	754.754,00	650.650,00	0.16	0.35
46	6	2	16/07/2019 22:42	0	3	69	754.754,00	650.650,00	0.16	0.35
47	6	2	16/07/2019 22:47	0	3	70	754.754,00	650.650,00	0.16	0.35
48	6	2	16/07/2019 22:48	0	3	71	754.754,00	650.650,00	0.16	0.35
49	6	2	16/07/2019 22:53	0	3	72	754.754,00	650.650,00	0.16	0.35
50	6	2	16/07/2019 22:55	0	3	73	754.754,00	650.650,00	0.16	0.35
51	6	2	16/07/2019 22:59	0	3	74	754.754,00	650.650,00	0.16	0.35
52	6	2	16/07/2019 23:00	0	3	75	754.754,00	650.650,00	0.16	0.35
53	6	3	16/07/2019 23:03	0	3	76	754.754,00	650.650,00	0.16	0.35
54	6	3	16/07/2019 23:05	0	3	77	754.754,00	650.650,00	0.16	0.35
55	6	2	16/07/2019 23:05	0	3	78	754.754,00	650.650,00	0.16	0.35
56	6	2	16/07/2019 23:09	0	3	79	754.754,00	650.650,00	0.16	0.35
57	6	2	16/07/2019 23:22	0	3	80	754.754,00	650.650,00	0.16	0.35
58	6	2	16/07/2019 23:23	0	3	81	754.754,00	650.650,00	0.16	0.35
59	6	2	16/07/2019 23:26	0	3	82	754.754,00	650.650,00	0.16	0.35
60	6	2	16/07/2019 23:26	0	3	83	754.754,00	650.650,00	0.16	0.35
61	6	3	16/07/2019 23:28	0	3	84	754.754,00	650.650,00	0.16	0.35
62	6	3	16/07/2019 23:30	0	3	85	754.754,00	650.650,00	0.16	0.35
63	6	3	16/07/2019 23:40	0	3	86	754.754,00	650.650,00	0.16	0.35
79	6	1	18/07/2019 00:50	0	3	96	754.754,00	\N	\N	\N
77	6	1	18/07/2019 00:50	0	3	96	754.754,00	\N	\N	\N
64	6	2	16/07/2019 23:43	0	3	87	754.754,00	650.650,00	0.16	0.35
80	6	1	18/07/2019 00:53	0	3	97	754.754,00	\N	\N	\N
81	6	1	18/07/2019 00:53	0	3	97	754.754,00	\N	\N	\N
82	6	1	18/07/2019 00:53	0	3	98	754.754,00	\N	\N	\N
68	6	2	17/07/2019 00:00	0	3	90	754.754,00	650.650,00	0.16	0.35
69	6	3	17/07/2019 00:02	10	3	91	754.754,00	650.650,00	0.16	0.35
35	4	2	11/07/2019 10:33	10	3	58	75.400,00	\N	\N	\N
67	3	2	16/07/2019 23:56	10	3	89	6.786.000,00	\N	\N	\N
66	2	2	16/07/2019 23:55	10	3	89	113.100,00	97.500,00	0.16	0.35
83	6	1	18/07/2019 00:55	0	3	99	754.754,00	\N	\N	\N
70	6	2	17/07/2019 00:08	0	3	92	754.754,00	650.650,00	0.16	0.35
84	6	1	18/07/2019 00:56	0	3	100	754.754,00	\N	\N	\N
71	3	3	17/07/2019 00:09	10	3	93	6.786.000,00	5.850.000,00	0.16	0.35
65	2	2	16/07/2019 23:54	10	3	88	113.100,00	97.500,00	0.16	0.35
36	4	2	11/07/2019 10:46	0	3	59	75.400,00	65.000,00	0.16	0.30
75	6	1	18/07/2019 00:29	0	3	94	754.754,00	\N	\N	\N
74	6	1	18/07/2019 00:28	0	3	94	754.754,00	\N	\N	\N
73	6	1	18/07/2019 00:28	0	3	94	754.754,00	\N	\N	\N
72	6	1	18/07/2019 00:03	0	3	94	754.754,00	650.650,00	0.16	0.35
76	6	1	18/07/2019 00:48	0	3	95	754.754,00	\N	\N	\N
78	6	1	18/07/2019 00:50	0	3	96	754.754,00	\N	\N	\N
85	6	1	18/07/2019 00:57	0	3	101	754.754,00	650.650,00	0.16	0.35
86	6	2	18/07/2019 01:13	2	3	102	754.754,00	650.650,00	0.16	0.35
87	6	1	18/07/2019 01:40	2	3	103	754.754,00	650.650,00	0.16	0.35
88	1	2	18/07/2019 01:41	2	3	104	60.320,00	52.000,00	0.16	0.35
90	1	2	18/07/2019 01:43	0	3	106	60.320,00	52.000,00	0.16	0.35
89	6	2	18/07/2019 01:41	3	3	105	754.754,00	650.650,00	0.16	0.35
91	1	2	21/07/2019 16:11	0	3	107	60.320,00	52.000,00	0.16	0.35
95	1	2	21/07/2019 16:15	0	3	111	60.320,00	52.000,00	0.16	0.35
92	1	2	21/07/2019 16:11	0	3	108	60.320,00	52.000,00	0.16	0.35
93	1	2	21/07/2019 16:14	0	3	109	60.320,00	52.000,00	0.16	0.35
94	1	2	21/07/2019 16:14	0	3	110	60.320,00	52.000,00	0.16	0.35
96	1	2	21/07/2019 16:15	0	3	112	60.320,00	52.000,00	0.16	0.35
97	1	2	21/07/2019 16:17	0	3	113	60.320,00	52.000,00	0.16	0.35
98	3	3	21/07/2019 18:42	1	3	114	6.786.000,00	5.850.000,00	0.16	0.35
\.


--
-- Name: detalle_apartado_id_detalle_apartado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalle_apartado_id_detalle_apartado_seq', 98, true);


--
-- Data for Name: elementos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY elementos (id_ele, id_usu, cat_acc, cat_car, cat_cha, cat_ele, cat_fre, cat_mot, cat_sus, cat_tra, estatus, reg_adm, mod_int, mod_log, mod_apa) FROM stdin;
6	5	t	t	t	t	t	t	t	t	1	t	t	t	t
7	6	t	t	t	t	t	t	t	t	1	t	t	t	t
8	7	t	t	t	t	t	t	t	t	1	t	t	t	t
9	8	t	t	t	t	t	t	t	t	1	t	t	t	t
11	2	t	t	t	t	t	t	t	t	1	t	t	t	t
5	4	t	t	t	t	t	t	t	t	1	t	t	t	t
2	11	t	t	t	f	t	t	t	t	1	t	t	t	t
10	9	t	t	t	t	t	t	t	t	1	t	t	t	t
1	10	t	f	f	t	t	t	t	f	1	t	t	t	t
3	1	t	t	t	t	t	t	t	t	1	t	t	t	t
4	3	t	t	t	f	t	t	t	t	1	t	t	t	t
\.


--
-- Name: elementos_id_ele_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('elementos_id_ele_seq', 11, true);


--
-- Data for Name: empresa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empresa (id_empresa, rif_empresa, nombre_empresa, direccion_empresa, telefono_empresa, correo_empresa) FROM stdin;
1	J-407404032	YURAL C.A.	Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  	0276-3489493	yuralrepuestos@gmail.com
\.


--
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empresa_id_empresa_seq', 10, true);


--
-- Data for Name: ganancia_iva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ganancia_iva (ganancia, iva) FROM stdin;
0.35	0.16
0.35	0.16
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY logs (id_log, id_usu, ip_usu, id_pre_log, tab_log, acc_log, log_sql, date_log, inf_usu, url_sql, val_mod_log, mac_usu) FROM stdin;
46	1	::1	23	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 16:41:00	\N	\N	\N	\N
47	1	::1	23	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 16:41:00	\N	\N	\N	\N
48	1	::1	23	empresa	Insert	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 16:41:00	\N	\N	\N	\N
49	1	::1	24	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.co	2019-07-13 17:24:00	\N	\N	\N	\N
50	1	::1	24	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.co	2019-07-13 17:24:00	\N	\N	\N	\N
51	1	::1	24	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.co	2019-07-13 17:24:00	\N	\N	\N	\N
52	1	::1	24	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.co	2019-07-13 17:24:00	\N	\N	\N	\N
53	1	::1	25	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
54	1	::1	25	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
55	1	::1	25	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
56	1	::1	25	empresa	Update	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
57	1	::1	25	empresa	Insert	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
58	1	::1	26	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
59	1	::1	26	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
61	1	::1	27	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:46:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
62	1	::1	27	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:46:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
63	1	::1	28	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
64	1	::1	28	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
68	1	::1	29	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
69	1	::1	29	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
70	1	::1	29	empresa	INSERT	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
267	1	::1	109	apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (89,3,"16/07/2019 23:55",2,)DATA NUEVA: (89,3,"16/07/2019 23:55",3,)	dc:a2:66:70:cc:27
72	1	::1	30	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
73	1	::1	30	empresa	INSERT	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
74	1	::1	31	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 17:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
75	1	::1	32	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N	\N
76	1	::1	33	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 18:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	(1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)	\N
77	1	::1	34	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 18:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	(1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)(1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)	\N
87	1	::1	54	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=86.515,00, iva_producto=13.842,40, pvp=100.357,40 WHERE id_producto_venta=4	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"78.650,00","12.584,00","91.234,00",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"86.515,00","13.842,40","100.357,40",12312,1,3,,)	\N
78	1	::1	35	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 18:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)DATA NUEVA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)	\N
80	1	::1	38	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 19:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)DATA NUEVA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)	\N
81	1	::1	39	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 19:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)DATA NUEVA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)	\N
82	1	::1	39	empresa	INSERT	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 19:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA NUEVA: (10,2222,2222,2222,2222,2222)	\N
83	1	::1	40	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 19:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)DATA NUEVA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)	\N
84	1	::1	51	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=69.212,00, iva_producto=11.073,92, pvp=80.285,92 WHERE id_producto_venta=1	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"62.920,00","10.067,20","72.987,20",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"69.212,00","11.073,92","80.285,92",23123,1,7,,"40.000,00")	\N
85	1	::1	52	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=129.772,50, iva_producto=20.763,60, pvp=150.536,10 WHERE id_producto_venta=2	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"117.975,00","18.876,00","136.851,00",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"129.772,50","20.763,60","150.536,10",9955,1,5,,)	\N
86	1	::1	53	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=7.786.350,00, iva_producto=1.245.816,00, pvp=9.032.166,00 WHERE id_producto_venta=3	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"7.078.500,00","1.132.560,00","8.211.060,00",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"7.786.350,00","1.245.816,00","9.032.166,00",13123,1,20,,)	\N
88	1	::1	55	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=86.515,00, iva_producto=13.842,40, pvp=100.357,40 WHERE id_producto_venta=5	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"78.650,00","12.584,00","91.234,00",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"86.515,00","13.842,40","100.357,40",1231,1,4,,"50.000,00")	\N
89	1		56	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=76.133,20, iva_producto=12.181,31, pvp=88.314,51 WHERE id_producto_venta=1	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"69.212,00","11.073,92","80.285,92",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"76.133,20","12.181,31","88.314,51",23123,1,7,,"40.000,00")	\N
90	1		57	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=142.749,20, iva_producto=22.839,87, pvp=165.589,07 WHERE id_producto_venta=2	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"129.772,50","20.763,60","150.536,10",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"142.749,20","22.839,87","165.589,07",9955,1,5,,)	\N
91	1		58	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=8.564.985,00, iva_producto=1.370.397,60, pvp=9.935.382,60 WHERE id_producto_venta=3	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"7.786.350,00","1.245.816,00","9.032.166,00",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"8.564.985,00","1.370.397,60","9.935.382,60",13123,1,20,,)	\N
92	1		59	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=4	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"86.515,00","13.842,40","100.357,40",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"95.166,50","15.226,64","110.393,14",12312,1,3,,)	\N
93	1		60	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=5	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"86.515,00","13.842,40","100.357,40",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"95.166,50","15.226,64","110.393,14",1231,1,4,,"50.000,00")	\N
94	1		60	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=5	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"76.133,20","12.181,31","88.314,51",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"83.746,30","13.399,41","97.145,71",23123,1,7,,"40.000,00")	\N
95	1		60	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=5	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"83.746,30","13.399,41","97.145,71",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"92.120,60","14.739,30","106.859,90",23123,1,7,,"40.000,00")	\N
96	1		60	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=5	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"92.120,60","14.739,30","106.859,90",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"101.332,00","16.213,12","117.545,12",23123,1,7,,"40.000,00")	\N
97	1	::1	61	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=111.465,20, iva_producto=17.834,43, pvp=129.299,63 WHERE id_producto_venta=1	2019-07-13 21:37:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"101.332,00","16.213,12","117.545,12",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"111.465,20","17.834,43","129.299,63",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
98	1	::1	62	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=122.611,50, iva_producto=19.617,84, pvp=142.229,34 WHERE id_producto_venta=1	2019-07-13 21:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"111.465,20","17.834,43","129.299,63",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"122.611,50","19.617,84","142.229,34",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
99	1	::1	63	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=134.872,10, iva_producto=21.579,54, pvp=156.451,64 WHERE id_producto_venta=1	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"122.611,50","19.617,84","142.229,34",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"134.872,10","21.579,54","156.451,64",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
100	1	::1	64	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=157.023,90, iva_producto=25.123,82, pvp=182.147,72 WHERE id_producto_venta=2	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"142.749,20","22.839,87","165.589,07",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"157.023,90","25.123,82","182.147,72",9955,1,5,,)	40:e2:30:20:75:cd
101	1	::1	65	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=9.421.483,50, iva_producto=1.507.437,36, pvp=10.928.920,86 WHERE id_producto_venta=3	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"8.564.985,00","1.370.397,60","9.935.382,60",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"9.421.483,50","1.507.437,36","10.928.920,86",13123,1,20,,)	40:e2:30:20:75:cd
102	1	::1	66	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=148.359,20, iva_producto=23.737,47, pvp=172.096,67 WHERE id_producto_venta=1	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"134.872,10","21.579,54","156.451,64",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"148.359,20","23.737,47","172.096,67",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
103	1	::1	67	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=172.725,30, iva_producto=27.636,05, pvp=200.361,35 WHERE id_producto_venta=2	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"157.023,90","25.123,82","182.147,72",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"172.725,30","27.636,05","200.361,35",9955,1,5,,)	40:e2:30:20:75:cd
104	1	::1	68	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=10.363.631,30, iva_producto=1.658.181,01, pvp=12.021.812,31 WHERE id_producto_venta=3	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"9.421.483,50","1.507.437,36","10.928.920,86",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"10.363.631,30","1.658.181,01","12.021.812,31",13123,1,20,,)	40:e2:30:20:75:cd
105	1	::1	69	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=4	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"95.166,50","15.226,64","110.393,14",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"104.682,60","16.749,22","121.431,82",12312,1,3,,)	40:e2:30:20:75:cd
106	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"95.166,50","15.226,64","110.393,14",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"104.682,60","16.749,22","121.431,82",1231,1,4,,"50.000,00")	40:e2:30:20:75:cd
107	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"148.359,20","23.737,47","172.096,67",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"163.194,90","26.111,18","189.306,08",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
108	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"172.725,30","27.636,05","200.361,35",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"189.997,50","30.399,60","220.397,10",9955,1,5,,)	40:e2:30:20:75:cd
109	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"10.363.631,30","1.658.181,01","12.021.812,31",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"11.399.994,10","1.823.999,06","13.223.993,16",13123,1,20,,)	40:e2:30:20:75:cd
110	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"104.682,60","16.749,22","121.431,82",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"115.150,20","18.424,03","133.574,23",12312,1,3,,)	40:e2:30:20:75:cd
111	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"104.682,60","16.749,22","121.431,82",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"115.150,20","18.424,03","133.574,23",1231,1,4,,"50.000,00")	40:e2:30:20:75:cd
112	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"163.194,90","26.111,18","189.306,08",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"163.194,00","26.111,04","189.305,04",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
113	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"189.997,50","30.399,60","220.397,10",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"189.997,00","30.399,52","220.396,52",9955,1,5,,)	40:e2:30:20:75:cd
114	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"11.399.994,10","1.823.999,06","13.223.993,16",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"11.399.994,00","1.823.999,04","13.223.993,04",13123,1,20,,)	40:e2:30:20:75:cd
115	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"115.150,20","18.424,03","133.574,23",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"115.150,00","18.424,00","133.574,00",12312,1,3,,)	40:e2:30:20:75:cd
116	1	::1	70	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"115.150,20","18.424,03","133.574,23",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"115.150,00","18.424,00","133.574,00",1231,1,4,,"50.000,00")	40:e2:30:20:75:cd
117	1	::1	70	ganancia_iva	UPDATE	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (0.30,0.16)DATA NUEVA: (0.30,0.16)	40:e2:30:20:75:cd
118	1	::1	71	empresa	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.com)DATA NUEVA: (1,J-407404032,"YURAL C.A.","Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  ",0276-3489493,yuralrepuestos@gmail.comsss)	40:e2:30:20:75:cd
119	1	::1	71	catalogo_venta	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"163.194,00","26.111,04","189.305,04",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"179.513,40","28.722,14","208.235,54",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
129	1	::1	78	proveedores	INSERT	INSERT INTO proveedores (id_usuario_a, nombre_proveedor, razon_social_proveedor, direccion_proveedor, telef_proveedor, tipo_producto, correo_proveedor, estatus)\r\n\r\n    \t \t\tVALUES\r\n\r\n    \t\t(1, joharita, V-24743017, en el centro calle 5 , 0276-55555555, Repuestos Varios, joharaamor@pabon.com, 1)	2019-07-16 21:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroProveedor.php	DATA NUEVA: (6,1,joharita,V-24743017,"en el centro calle 5 ",0276-55555555,"Repuestos Varios",joharaamor@pabon.com,1)	dc:a2:66:70:cc:27
120	1	::1	71	catalogo_venta	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"189.997,00","30.399,52","220.396,52",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"208.996,70","33.439,47","242.436,17",9955,1,5,,)	40:e2:30:20:75:cd
121	1	::1	71	catalogo_venta	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"11.399.994,00","1.823.999,04","13.223.993,04",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"12.539.993,40","2.006.398,94","14.546.392,34",13123,1,20,,)	40:e2:30:20:75:cd
122	1	::1	71	catalogo_venta	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"115.150,00","18.424,00","133.574,00",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"126.665,00","20.266,40","146.931,40",12312,1,3,,)	40:e2:30:20:75:cd
123	1	::1	71	catalogo_venta	UPDATE	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"115.150,00","18.424,00","133.574,00",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"126.665,00","20.266,40","146.931,40",1231,1,4,,"50.000,00")	40:e2:30:20:75:cd
124	1	::1	72	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=197.464,30, iva_producto=31.594,29, pvp=229.058,59 WHERE id_producto_venta=1	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"179.513,40","28.722,14","208.235,54",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"197.464,30","31.594,29","229.058,59",23123,1,7,,"40.000,00")	40:e2:30:20:75:cd
125	1	::1	73	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=229.895,60, iva_producto=36.783,30, pvp=266.678,90 WHERE id_producto_venta=2	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"208.996,70","33.439,47","242.436,17",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"229.895,60","36.783,30","266.678,90",9955,1,5,,)	40:e2:30:20:75:cd
126	1	::1	74	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=13.793.992,30, iva_producto=2.207.038,77, pvp=16.001.031,07 WHERE id_producto_venta=3	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"12.539.993,40","2.006.398,94","14.546.392,34",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"13.793.992,30","2.207.038,77","16.001.031,07",13123,1,20,,)	40:e2:30:20:75:cd
127	1	::1	75	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=139.331,50, iva_producto=22.293,04, pvp=161.624,54 WHERE id_producto_venta=4	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"126.665,00","20.266,40","146.931,40",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"139.331,50","22.293,04","161.624,54",12312,1,3,,)	40:e2:30:20:75:cd
128	1	::1	76	catalogo_venta	UPDATE	UPDATE catalogo_venta SET precio_base=139.331,50, iva_producto=22.293,04, pvp=161.624,54 WHERE id_producto_venta=5	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"126.665,00","20.266,40","146.931,40",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"139.331,50","22.293,04","161.624,54",1231,1,4,,"50.000,00")	40:e2:30:20:75:cd
130	1	::1	79	catalogo_venta	INSERT	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
131	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,7,,"40.000,00")	dc:a2:66:70:cc:27
132	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"97.500,00","15.600,00","113.100,00",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"97.500,00","15.600,00","113.100,00",9955,1,5,,)	dc:a2:66:70:cc:27
133	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"5.850.000,00","936.000,00","6.786.000,00",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"5.850.000,00","936.000,00","6.786.000,00",13123,1,20,,)	dc:a2:66:70:cc:27
134	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,1,3,,)	dc:a2:66:70:cc:27
135	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"65.000,00","10.400,00","75.400,00",1231,1,4,,"50.000,00")DATA NUEVA: (5,ACC710,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,8,"65.000,00","10.400,00","75.400,00",1231,1,4,,"50.000,00")	dc:a2:66:70:cc:27
145	1	::1	84	catalogo_venta	UPDATE	UPDATE proveedores SET estatus=1 where id_proveedor=2	2019-07-16 22:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProvAdmin.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,0,3,,)	dc:a2:66:70:cc:27
268	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (67,3,2,"16/07/2019 23:56",2,3,89,"6.786.000,00",,,)DATA NUEVA: (67,3,2,"16/07/2019 23:56",3,3,89,"6.786.000,00",,,)	dc:a2:66:70:cc:27
136	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
137	1	::1	79	ganancia_iva	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (0.30,0.16)DATA NUEVA: (0.35,0.16)	dc:a2:66:70:cc:27
138	1	::1	79	ganancia_iva	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (0.30,0.16)DATA NUEVA: (0.35,0.16)	dc:a2:66:70:cc:27
139	1	::1	79	catalogo_venta	UPDATE	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	DATA ANTIGUA: (1,ACC2528,"CASCO EK",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,7,,"40.000,00")	dc:a2:66:70:cc:27
140	1	::1	81	proveedores	UPDATE	UPDATE proveedores SET id_usuario_a=1, nombre_proveedor=adamsitossss, razon_social_proveedor=J-407404032, direccion_proveedor=tachira san cristoba                                        , telef_proveedor=0276-3489493, tipo_producto=Repuestos Varios, correo_proveedor=yuralrepuestos@gmail.com where id_proveedor=2	2019-07-16 22:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProveedor.php	DATA ANTIGUA: (2,1,adamsito,J-40740403-2,"tachira san cristoba                    ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)DATA NUEVA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)	dc:a2:66:70:cc:27
141	1	::1	82	proveedores	UPDATE	UPDATE proveedores SET estatus=0 where id_proveedor=2	2019-07-16 22:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarProveedor.php	DATA ANTIGUA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)DATA NUEVA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,0)	dc:a2:66:70:cc:27
142	1	::1	82	proveedores	UPDATE	UPDATE proveedores SET estatus=0 where id_proveedor=2	2019-07-16 22:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarProveedor.php	DATA ANTIGUA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,0)DATA NUEVA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)	dc:a2:66:70:cc:27
143	1	::1	83	proveedores	UPDATE	UPDATE proveedores SET estatus=0 where id_proveedor=2	2019-07-16 22:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarProveedor.php	DATA ANTIGUA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)DATA NUEVA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,0)	dc:a2:66:70:cc:27
144	1	::1	84	proveedores	UPDATE	UPDATE proveedores SET estatus=1 where id_proveedor=2	2019-07-16 22:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProvAdmin.php	DATA ANTIGUA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,0)DATA NUEVA: (2,1,adamsitossss,J-407404032,"tachira san cristoba                                        ",0276-3489493,"Repuestos Varios",yuralrepuestos@gmail.com,1)	dc:a2:66:70:cc:27
269	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (66,2,2,"16/07/2019 23:55",2,3,89,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (66,2,2,"16/07/2019 23:55",3,3,89,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
146	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,0,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,1,3,,)	dc:a2:66:70:cc:27
147	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
148	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
149	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
150	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
151	1	::1	85	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
152	1	::1	86	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE id_apartado_usuario = 62 and id_usuario =3 and estatus=1	2019-07-16 22:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
153	1	::1	86	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE id_apartado_usuario = 62 and id_usuario =3 and estatus=1	2019-07-16 22:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
154	1	::1	86	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE id_apartado_usuario = 62 and id_usuario =3 and estatus=1	2019-07-16 22:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
221	1	::1	105	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (85,3,"16/07/2019 23:30",1,)DATA NUEVA: (85,3,"16/07/2019 23:30",0,)	dc:a2:66:70:cc:27
155	1	::1	86	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE id_apartado_usuario = 62 and id_usuario =3 and estatus=1	2019-07-16 22:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
156	1	::1	87	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=64 and id_usuario=3 and estatus=1UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=41 and id_usuario=3 and id_producto_venta=6 and estatus=1UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
157	1	::1	87	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=64 and id_usuario=3 and estatus=1UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=41 and id_usuario=3 and id_producto_venta=6 and estatus=1UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
158	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
159	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
160	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
161	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
177	1	::1	95	catalogo_venta	UPDATE		2019-07-16 22:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
162	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
163	1	::1	88	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
164	1	::1	89	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=68 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=45 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
165	1	::1	89	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=68 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=45 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
166	1	::1	89	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=68 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=45 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
167	1	::1	90	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=69 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=46 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
168	1	::1	90	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=69 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=46 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
209	1	::1	104	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (60,6,2,"16/07/2019 23:26",1,3,83,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (60,6,2,"16/07/2019 23:26",0,3,83,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
169	1	::1	91	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=70 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=47 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
170	1	::1	91	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=70 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=47 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
171	1	::1	92	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=71 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=48 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
172	1	::1	92	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=71 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=48 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
173	1	::1	93	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=72 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=49 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
174	1	::1	93	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=72 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=49 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
175	1	::1	94	catalogo_venta	UPDATE		2019-07-16 22:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
176	1	::1	94	catalogo_venta	UPDATE		2019-07-16 22:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
178	1	::1	95	catalogo_venta	UPDATE		2019-07-16 22:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
179	1	::1	96	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=75 and id_usuario=3 and estatus=1	2019-07-16 23:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
180	1	::1	96	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=75 and id_usuario=3 and estatus=1	2019-07-16 23:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
181	1	::1	97	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=76 and id_usuario=3 and estatus=1	2019-07-16 23:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
182	1	::1	97	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=76 and id_usuario=3 and estatus=1	2019-07-16 23:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
183	1	::1	98	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=77 and id_usuario=3 and estatus=1	2019-07-16 23:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
184	1	::1	98	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=77 and id_usuario=3 and estatus=1	2019-07-16 23:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
185	1	::1	99	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=78	2019-07-16 23:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
186	1	::1	99	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=78	2019-07-16 23:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
187	1	::1	100	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (80,3,"16/07/2019 23:22",1,)	dc:a2:66:70:cc:27
188	1	::1	100	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
189	1	::1	100	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (57,6,2,"16/07/2019 23:22",1,3,80,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
190	1	::1	100	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (57,6,2,"16/07/2019 23:22",1,3,80,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (57,6,2,"16/07/2019 23:22",0,3,80,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
191	1	::1	100	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
192	1	::1	101	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (80,3,"16/07/2019 23:22",1,)DATA NUEVA: (80,3,"16/07/2019 23:22",0,)	dc:a2:66:70:cc:27
193	1	::1	101	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (81,3,"16/07/2019 23:23",1,)	dc:a2:66:70:cc:27
194	1	::1	101	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
195	1	::1	101	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (58,6,2,"16/07/2019 23:23",1,3,81,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
196	1	::1	101	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (58,6,2,"16/07/2019 23:23",1,3,81,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (58,6,2,"16/07/2019 23:23",0,3,81,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
197	1	::1	101	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
198	1	::1	102	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=81 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=58 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (81,3,"16/07/2019 23:23",1,)DATA NUEVA: (81,3,"16/07/2019 23:23",0,)	dc:a2:66:70:cc:27
199	1	::1	102	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=81 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=58 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (82,3,"16/07/2019 23:26",1,)	dc:a2:66:70:cc:27
210	1	::1	104	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (83,3,"16/07/2019 23:26",1,)DATA NUEVA: (83,3,"16/07/2019 23:26",0,)	dc:a2:66:70:cc:27
200	1	::1	102	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=81 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=58 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
201	1	::1	102	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=81 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=58 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (59,6,2,"16/07/2019 23:26",1,3,82,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
202	1	::1	103	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
203	1	::1	103	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (59,6,2,"16/07/2019 23:26",1,3,82,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (59,6,2,"16/07/2019 23:26",0,3,82,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
204	1	::1	103	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (82,3,"16/07/2019 23:26",1,)DATA NUEVA: (82,3,"16/07/2019 23:26",0,)	dc:a2:66:70:cc:27
205	1	::1	103	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (83,3,"16/07/2019 23:26",1,)	dc:a2:66:70:cc:27
206	1	::1	103	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
207	1	::1	103	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (60,6,2,"16/07/2019 23:26",1,3,83,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
208	1	::1	104	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
211	1	::1	104	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (84,3,"16/07/2019 23:28",1,)	dc:a2:66:70:cc:27
212	1	::1	104	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
213	1	::1	104	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (61,6,3,"16/07/2019 23:28",1,3,84,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
214	1	::1	105	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
215	1	::1	105	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (61,6,3,"16/07/2019 23:28",1,3,84,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (61,6,3,"16/07/2019 23:28",0,3,84,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
216	1	::1	105	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (84,3,"16/07/2019 23:28",1,)DATA NUEVA: (84,3,"16/07/2019 23:28",0,)	dc:a2:66:70:cc:27
217	1	::1	105	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (85,3,"16/07/2019 23:30",1,)	dc:a2:66:70:cc:27
218	1	::1	105	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
219	1	::1	105	detalle_apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA NUEVA: (62,6,3,"16/07/2019 23:30",1,3,85,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
220	1	::1	105	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
233	1	::1	107	apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (59,3,"11/07/2019 10:46",2,)DATA NUEVA: (59,3,"11/07/2019 10:46",3,)	dc:a2:66:70:cc:27
222	1	::1	105	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	DATA ANTIGUA: (62,6,3,"16/07/2019 23:30",1,3,85,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (62,6,3,"16/07/2019 23:30",0,3,85,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
223	1	::1	106	apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (86,3,"16/07/2019 23:40",1,)	dc:a2:66:70:cc:27
224	1	::1	106	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
225	1	::1	106	detalle_apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (63,6,3,"16/07/2019 23:40",1,3,86,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
226	1	::1	106	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
227	1	::1	106	apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (86,3,"16/07/2019 23:40",1,)DATA NUEVA: (86,3,"16/07/2019 23:40",0,)	dc:a2:66:70:cc:27
228	1	::1	106	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (63,6,3,"16/07/2019 23:40",1,3,86,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (63,6,3,"16/07/2019 23:40",0,3,86,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
229	1	::1	107	apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (87,3,"16/07/2019 23:43",1,)	dc:a2:66:70:cc:27
230	1	::1	107	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
231	1	::1	107	detalle_apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (64,6,2,"16/07/2019 23:43",1,3,87,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
232	1	::1	107	ventas_productos	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (5,59,3,2,"150.800,00",2,231231211,3,"2019-07-11 10:47:00",0.16,0.30,"65.000,00")DATA NUEVA: (5,59,3,2,"150.800,00",3,231231211,3,"2019-07-11 10:47:00",0.16,0.30,"65.000,00")	dc:a2:66:70:cc:27
266	1	::1	109	ventas_productos	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (8,89,3,2,"13.798.200,00",2,1231212,3,"2019-07-16 23:57:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
234	1	::1	107	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (36,4,2,"11/07/2019 10:46",2,3,59,"75.400,00","65.000,00",0.16,0.30)DATA NUEVA: (36,4,2,"11/07/2019 10:46",3,3,59,"75.400,00","65.000,00",0.16,0.30)	dc:a2:66:70:cc:27
235	1	::1	108	apartado	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (58,3,"11/07/2019 10:33",2,)DATA NUEVA: (58,3,"11/07/2019 10:33",3,)	dc:a2:66:70:cc:27
236	1	::1	108	detalle_apartado	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (35,4,2,"11/07/2019 10:33",2,3,58,"75.400,00",,,)DATA NUEVA: (35,4,2,"11/07/2019 10:33",3,3,58,"75.400,00",,,)	dc:a2:66:70:cc:27
237	1	::1	108	ventas_productos	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (4,58,3,2,"150.800,00",2,23123123,3,"2019-07-11 10:38:00",0.16,0.30,"65.000,00")DATA NUEVA: (4,58,3,2,"150.800,00",3,23123123,3,"2019-07-11 10:38:00",0.16,0.30,"65.000,00")	dc:a2:66:70:cc:27
238	1	::1	108	catalogo_venta	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,2,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
239	1	::1	108	apartado	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (87,3,"16/07/2019 23:43",1,)DATA NUEVA: (87,3,"16/07/2019 23:43",2,)	dc:a2:66:70:cc:27
240	1	::1	108	detalle_apartado	UPDATE	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (64,6,2,"16/07/2019 23:43",1,3,87,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (64,6,2,"16/07/2019 23:43",2,3,87,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
241	1	::1	108	ventas_productos	INSERT	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (6,87,3,2,"1.509.508,00",2,12312313231212121212,3,"2019-07-16 23:52:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
242	1	::1	109	apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (87,3,"16/07/2019 23:43",2,)DATA NUEVA: (87,3,"16/07/2019 23:43",3,)	dc:a2:66:70:cc:27
243	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (64,6,2,"16/07/2019 23:43",2,3,87,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (64,6,2,"16/07/2019 23:43",3,3,87,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
244	1	::1	109	ventas_productos	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,87,3,2,"1.509.508,00",2,12312313231212121212,3,"2019-07-16 23:52:00",0.16,0.35,"650.650,00")DATA NUEVA: (6,87,3,2,"1.509.508,00",3,12312313231212121212,3,"2019-07-16 23:52:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
245	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,2,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
246	1	::1	109	ventas_productos	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,87,3,2,"1.509.508,00",3,12312313231212121212,3,"2019-07-16 23:52:00",0.16,0.35,"650.650,00")DATA NUEVA: (6,87,3,2,"1.509.508,00",0,12312313231212121212,3,"2019-07-16 23:52:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
247	1	::1	109	apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (87,3,"16/07/2019 23:43",3,)DATA NUEVA: (87,3,"16/07/2019 23:43",0,)	dc:a2:66:70:cc:27
248	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (64,6,2,"16/07/2019 23:43",3,3,87,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (64,6,2,"16/07/2019 23:43",0,3,87,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
249	1	::1	109	apartado	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (88,3,"16/07/2019 23:54",1,)	dc:a2:66:70:cc:27
250	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"97.500,00","15.600,00","113.100,00",9955,1,5,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"97.500,00","15.600,00","113.100,00",9955,1,3,,)	dc:a2:66:70:cc:27
251	1	::1	109	detalle_apartado	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (65,2,2,"16/07/2019 23:54",1,3,88,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
252	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,0,"97.500,00","15.600,00","113.100,00",9955,1,3,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,2,"97.500,00","15.600,00","113.100,00",9955,1,3,,)	dc:a2:66:70:cc:27
253	1	::1	109	apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (88,3,"16/07/2019 23:54",1,)DATA NUEVA: (88,3,"16/07/2019 23:54",2,)	dc:a2:66:70:cc:27
254	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (65,2,2,"16/07/2019 23:54",1,3,88,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (65,2,2,"16/07/2019 23:54",2,3,88,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
255	1	::1	109	ventas_productos	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (7,88,3,2,"226.200,00",2,123123123,3,"2019-07-16 23:54:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
256	1	::1	109	apartado	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (89,3,"16/07/2019 23:55",1,)	dc:a2:66:70:cc:27
257	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,2,"97.500,00","15.600,00","113.100,00",9955,1,3,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,2,"97.500,00","15.600,00","113.100,00",9955,1,1,,)	dc:a2:66:70:cc:27
258	1	::1	109	detalle_apartado	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (66,2,2,"16/07/2019 23:55",1,3,89,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
259	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"5.850.000,00","936.000,00","6.786.000,00",13123,1,20,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"5.850.000,00","936.000,00","6.786.000,00",13123,1,18,,)	dc:a2:66:70:cc:27
260	1	::1	109	detalle_apartado	INSERT	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (67,3,2,"16/07/2019 23:56",1,3,89,"6.786.000,00",,,)	dc:a2:66:70:cc:27
261	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,0,"5.850.000,00","936.000,00","6.786.000,00",13123,1,18,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,2,"5.850.000,00","936.000,00","6.786.000,00",13123,1,18,,)	dc:a2:66:70:cc:27
262	1	::1	109	catalogo_venta	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,2,"97.500,00","15.600,00","113.100,00",9955,1,1,,)DATA NUEVA: (2,CAR6545,"CARETA R1 BLANCAss",1,Carenaje,BERAS,"CARETA BERA R1 BLANCA ORIGINAL","1469736508676 - copia.jpg",Unico,4,"97.500,00","15.600,00","113.100,00",9955,1,1,,)	dc:a2:66:70:cc:27
263	1	::1	109	apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (89,3,"16/07/2019 23:55",1,)DATA NUEVA: (89,3,"16/07/2019 23:55",2,)	dc:a2:66:70:cc:27
264	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (67,3,2,"16/07/2019 23:56",1,3,89,"6.786.000,00",,,)DATA NUEVA: (67,3,2,"16/07/2019 23:56",2,3,89,"6.786.000,00",,,)	dc:a2:66:70:cc:27
265	1	::1	109	detalle_apartado	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (66,2,2,"16/07/2019 23:55",1,3,89,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (66,2,2,"16/07/2019 23:55",2,3,89,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
270	1	::1	109	ventas_productos	UPDATE	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (8,89,3,2,"13.798.200,00",2,1231212,3,"2019-07-16 23:57:00",0.16,0.35,"97.500,00")DATA NUEVA: (8,89,3,2,"13.798.200,00",3,1231212,3,"2019-07-16 23:57:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
271	1	::1	111	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (88,3,"16/07/2019 23:54",2,)DATA NUEVA: (88,3,"16/07/2019 23:54",3,)	dc:a2:66:70:cc:27
272	1	::1	111	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (65,2,2,"16/07/2019 23:54",2,3,88,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (65,2,2,"16/07/2019 23:54",3,3,88,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
273	1	::1	111	ventas_productos	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (7,88,3,2,"226.200,00",2,123123123,3,"2019-07-16 23:54:00",0.16,0.35,"97.500,00")DATA NUEVA: (7,88,3,2,"226.200,00",3,123123123,3,"2019-07-16 23:54:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
274	1	::1	111	apartado	INSERT	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (90,3,"17/07/2019 00:00",1,)	dc:a2:66:70:cc:27
275	1	::1	111	catalogo_venta	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")	dc:a2:66:70:cc:27
276	1	::1	111	detalle_apartado	INSERT	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (68,6,2,"17/07/2019 00:00",1,3,90,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
277	1	::1	111	catalogo_venta	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,18,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")	dc:a2:66:70:cc:27
278	1	::1	111	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (90,3,"17/07/2019 00:00",1,)DATA NUEVA: (90,3,"17/07/2019 00:00",0,)	dc:a2:66:70:cc:27
279	1	::1	111	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (68,6,2,"17/07/2019 00:00",1,3,90,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (68,6,2,"17/07/2019 00:00",0,3,90,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
280	1	::1	112	apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (91,3,"17/07/2019 00:02",1,)	dc:a2:66:70:cc:27
281	1	::1	112	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,20,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
282	1	::1	112	detalle_apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (69,6,3,"17/07/2019 00:02",1,3,91,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
283	1	::1	112	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,0,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
284	1	::1	112	apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (91,3,"17/07/2019 00:02",1,)DATA NUEVA: (91,3,"17/07/2019 00:02",2,)	dc:a2:66:70:cc:27
285	1	::1	112	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (69,6,3,"17/07/2019 00:02",1,3,91,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (69,6,3,"17/07/2019 00:02",2,3,91,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
286	1	::1	112	ventas_productos	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (9,91,3,2,"2.264.262,00",2,12312313123,3,"2019-07-17 00:02:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
287	1	::1	112	ventas_productos	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (9,91,3,2,"2.264.262,00",2,12312313123,3,"2019-07-17 00:02:00",0.16,0.35,"650.650,00")DATA NUEVA: (9,91,3,2,"2.264.262,00",10,12312313123,3,"2019-07-17 00:02:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
288	1	::1	112	apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (91,3,"17/07/2019 00:02",2,)DATA NUEVA: (91,3,"17/07/2019 00:02",10,)	dc:a2:66:70:cc:27
289	1	::1	112	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (69,6,3,"17/07/2019 00:02",2,3,91,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (69,6,3,"17/07/2019 00:02",10,3,91,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
290	1	::1	113	ventas_productos	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=4	2019-07-17 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (4,58,3,2,"150.800,00",3,23123123,3,"2019-07-11 10:38:00",0.16,0.30,"65.000,00")DATA NUEVA: (4,58,3,2,"150.800,00",10,23123123,3,"2019-07-11 10:38:00",0.16,0.30,"65.000,00")	dc:a2:66:70:cc:27
291	1	::1	113	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=4	2019-07-17 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (58,3,"11/07/2019 10:33",3,)DATA NUEVA: (58,3,"11/07/2019 10:33",10,)	dc:a2:66:70:cc:27
292	1	::1	113	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=4	2019-07-17 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (35,4,2,"11/07/2019 10:33",3,3,58,"75.400,00",,,)DATA NUEVA: (35,4,2,"11/07/2019 10:33",10,3,58,"75.400,00",,,)	dc:a2:66:70:cc:27
293	1	::1	114	apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (89,3,"16/07/2019 23:55",3,)DATA NUEVA: (89,3,"16/07/2019 23:55",10,)	dc:a2:66:70:cc:27
294	1	::1	114	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (67,3,2,"16/07/2019 23:56",3,3,89,"6.786.000,00",,,)DATA NUEVA: (67,3,2,"16/07/2019 23:56",10,3,89,"6.786.000,00",,,)	dc:a2:66:70:cc:27
295	1	::1	114	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (66,2,2,"16/07/2019 23:55",3,3,89,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (66,2,2,"16/07/2019 23:55",10,3,89,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
296	1	::1	114	ventas_productos	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (8,89,3,2,"13.798.200,00",3,1231212,3,"2019-07-16 23:57:00",0.16,0.35,"97.500,00")DATA NUEVA: (8,89,3,2,"13.798.200,00",10,1231212,3,"2019-07-16 23:57:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
297	1	::1	114	apartado	INSERT	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA NUEVA: (92,3,"17/07/2019 00:08",1,)	dc:a2:66:70:cc:27
298	1	::1	114	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,15,,"500.500,00")	dc:a2:66:70:cc:27
299	1	::1	114	detalle_apartado	INSERT	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA NUEVA: (70,6,2,"17/07/2019 00:08",1,3,92,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
300	1	::1	114	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,15,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,15,,"500.500,00")	dc:a2:66:70:cc:27
301	1	::1	114	apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (92,3,"17/07/2019 00:08",1,)DATA NUEVA: (92,3,"17/07/2019 00:08",2,)	dc:a2:66:70:cc:27
302	1	::1	114	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (70,6,2,"17/07/2019 00:08",1,3,92,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (70,6,2,"17/07/2019 00:08",2,3,92,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
303	1	::1	114	ventas_productos	INSERT	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA NUEVA: (10,92,3,2,"1.509.508,00",2,12313131123123,3,"2019-07-17 00:08:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
304	1	::1	115	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (92,3,"17/07/2019 00:08",2,)DATA NUEVA: (92,3,"17/07/2019 00:08",3,)	dc:a2:66:70:cc:27
305	1	::1	115	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (70,6,2,"17/07/2019 00:08",2,3,92,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (70,6,2,"17/07/2019 00:08",3,3,92,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
306	1	::1	115	ventas_productos	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (10,92,3,2,"1.509.508,00",2,12313131123123,3,"2019-07-17 00:08:00",0.16,0.35,"650.650,00")DATA NUEVA: (10,92,3,2,"1.509.508,00",3,12313131123123,3,"2019-07-17 00:08:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
307	1	::1	115	catalogo_venta	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,15,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")	dc:a2:66:70:cc:27
308	1	::1	115	ventas_productos	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (10,92,3,2,"1.509.508,00",3,12313131123123,3,"2019-07-17 00:08:00",0.16,0.35,"650.650,00")DATA NUEVA: (10,92,3,2,"1.509.508,00",0,12313131123123,3,"2019-07-17 00:08:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
309	1	::1	115	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (92,3,"17/07/2019 00:08",3,)DATA NUEVA: (92,3,"17/07/2019 00:08",0,)	dc:a2:66:70:cc:27
310	1	::1	115	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (70,6,2,"17/07/2019 00:08",3,3,92,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (70,6,2,"17/07/2019 00:08",0,3,92,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
311	1	::1	115	apartado	INSERT	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (93,3,"17/07/2019 00:09",1,)	dc:a2:66:70:cc:27
312	1	::1	115	catalogo_venta	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,2,"5.850.000,00","936.000,00","6.786.000,00",13123,1,18,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,2,"5.850.000,00","936.000,00","6.786.000,00",13123,1,15,,)	dc:a2:66:70:cc:27
313	1	::1	115	detalle_apartado	INSERT	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (71,3,3,"17/07/2019 00:09",1,3,93,"6.786.000,00","5.850.000,00",0.16,0.35)	dc:a2:66:70:cc:27
314	1	::1	115	catalogo_venta	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,2,"5.850.000,00","936.000,00","6.786.000,00",13123,1,15,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,5,"5.850.000,00","936.000,00","6.786.000,00",13123,1,15,,)	dc:a2:66:70:cc:27
315	1	::1	115	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (93,3,"17/07/2019 00:09",1,)DATA NUEVA: (93,3,"17/07/2019 00:09",2,)	dc:a2:66:70:cc:27
316	1	::1	115	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (71,3,3,"17/07/2019 00:09",1,3,93,"6.786.000,00","5.850.000,00",0.16,0.35)DATA NUEVA: (71,3,3,"17/07/2019 00:09",2,3,93,"6.786.000,00","5.850.000,00",0.16,0.35)	dc:a2:66:70:cc:27
317	1	::1	115	ventas_productos	INSERT	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA NUEVA: (11,93,3,2,"20.358.000,00",2,23123123,3,"2019-07-17 00:09:00",0.16,0.35,"5.850.000,00")	dc:a2:66:70:cc:27
318	1	::1	116	apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=93, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=11, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=93	2019-07-17 00:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (93,3,"17/07/2019 00:09",2,)DATA NUEVA: (93,3,"17/07/2019 00:09",10,)	dc:a2:66:70:cc:27
319	1	::1	116	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=93, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=11, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=93	2019-07-17 00:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (71,3,3,"17/07/2019 00:09",2,3,93,"6.786.000,00","5.850.000,00",0.16,0.35)DATA NUEVA: (71,3,3,"17/07/2019 00:09",10,3,93,"6.786.000,00","5.850.000,00",0.16,0.35)	dc:a2:66:70:cc:27
320	1	::1	116	ventas_productos	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=93, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=11, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=93	2019-07-17 00:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (11,93,3,2,"20.358.000,00",2,23123123,3,"2019-07-17 00:09:00",0.16,0.35,"5.850.000,00")DATA NUEVA: (11,93,3,2,"20.358.000,00",10,23123123,3,"2019-07-17 00:09:00",0.16,0.35,"5.850.000,00")	dc:a2:66:70:cc:27
321	1	::1	117	apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=88, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=7, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=88	2019-07-17 00:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (88,3,"16/07/2019 23:54",3,)DATA NUEVA: (88,3,"16/07/2019 23:54",10,)	dc:a2:66:70:cc:27
322	1	::1	117	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=88, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=7, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=88	2019-07-17 00:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (65,2,2,"16/07/2019 23:54",3,3,88,"113.100,00","97.500,00",0.16,0.35)DATA NUEVA: (65,2,2,"16/07/2019 23:54",10,3,88,"113.100,00","97.500,00",0.16,0.35)	dc:a2:66:70:cc:27
323	1	::1	117	ventas_productos	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=88, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=7, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=88	2019-07-17 00:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (7,88,3,2,"226.200,00",3,123123123,3,"2019-07-16 23:54:00",0.16,0.35,"97.500,00")DATA NUEVA: (7,88,3,2,"226.200,00",10,123123123,3,"2019-07-16 23:54:00",0.16,0.35,"97.500,00")	dc:a2:66:70:cc:27
324	1	::1	117	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=88, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=7, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=88	2019-07-17 00:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	DATA ANTIGUA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,9,"65.000,00","10.400,00","75.400,00",12312,1,3,,)DATA NUEVA: (4,ACC1012,prueba,1,"Accesorios para Motociclistas",keeway,adadasdad,"../imagenesRepuestos/IMG_20160428_162828 - copia.jpg",Unidad,7,"65.000,00","10.400,00","75.400,00",12312,1,5,,)	dc:a2:66:70:cc:27
325	1	::1	118	detalle_apartado	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (36,4,2,"11/07/2019 10:46",3,3,59,"75.400,00","65.000,00",0.16,0.30)DATA NUEVA: (36,4,2,"11/07/2019 10:46",0,3,59,"75.400,00","65.000,00",0.16,0.30)	dc:a2:66:70:cc:27
326	1	::1	118	apartado	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (59,3,"11/07/2019 10:46",3,)DATA NUEVA: (59,3,"11/07/2019 10:46",0,)	dc:a2:66:70:cc:27
327	1	::1	118	ventas_productos	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (5,59,3,2,"150.800,00",3,231231211,3,"2019-07-11 10:47:00",0.16,0.30,"65.000,00")DATA NUEVA: (5,59,3,2,"150.800,00",0,231231211,3,"2019-07-11 10:47:00",0.16,0.30,"65.000,00")	dc:a2:66:70:cc:27
328	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
329	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
411	3	::1	149	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=99 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=83 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (99,3,"18/07/2019 00:55",1,)DATA NUEVA: (99,3,"18/07/2019 00:55",0,)	dc:a2:66:70:cc:27
330	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
331	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
332	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
333	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
334	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
335	1	::1	118	opiniones	UPDATE	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
336	1	::1	119	opiniones	UPDATE	UPDATE opiniones SET estatus=0 where id_opinion=1	2019-07-17 00:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/opinar/eliminarOpinion.php	DATA ANTIGUA: (1,"excelente recomendados",3,4,1,4,"2019-07-11 10:56:00")DATA NUEVA: (1,"excelente recomendados",3,4,0,4,"2019-07-11 10:56:00")	dc:a2:66:70:cc:27
337	1	::1	119	usuario	UPDATE	UPDATE opiniones SET estatus=0 where id_opinion=1	2019-07-17 00:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/opinar/eliminarOpinion.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,0)	dc:a2:66:70:cc:27
338	1	::1	120	usuario	UPDATE	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-17 00:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	DATA ANTIGUA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)DATA NUEVA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,0)	dc:a2:66:70:cc:27
339	1	::1	120	usuario	UPDATE	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-17 00:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	DATA ANTIGUA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,0)DATA NUEVA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)	dc:a2:66:70:cc:27
340	1	::1	121	usuario	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-17 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,0)DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
343	1	::1	121	apartado	INSERT	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-17 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA NUEVA: (94,3,"18/07/2019 00:03",1,)	dc:a2:66:70:cc:27
344	1	::1	121	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-17 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,17,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,16,,"500.500,00")	dc:a2:66:70:cc:27
345	1	::1	121	detalle_apartado	INSERT	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-17 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA NUEVA: (72,6,1,"18/07/2019 00:03",1,3,94,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
346	1	::1	122	usuario	UPDATE	UPDATE usuario SET estatus=0 where id_usuario=3	2019-07-18 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,0)	dc:a2:66:70:cc:27
347	1	::1	123	usuario	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,0)DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
348	1	::1	123	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,16,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,14,,"500.500,00")	dc:a2:66:70:cc:27
349	1	::1	123	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,14,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,12,,"500.500,00")	dc:a2:66:70:cc:27
350	1	::1	123	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,12,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,11,,"500.500,00")	dc:a2:66:70:cc:27
351	1	::1	123	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,11,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")	dc:a2:66:70:cc:27
352	1	::1	123	catalogo_venta	UPDATE	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")	dc:a2:66:70:cc:27
353	1	::1	123	detalle_apartado	INSERT	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	DATA NUEVA: (73,6,1,"18/07/2019 00:28",1,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
354	3	::1	124	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:28, 1, 3, 754.754,00)	2019-07-18 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
355	3	::1	124	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:28, 1, 3, 754.754,00)	2019-07-18 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (74,6,1,"18/07/2019 00:28",1,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
356	3	::1	125	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:29, 1, 3, 754.754,00)	2019-07-18 00:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
357	3	::1	125	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:29, 1, 3, 754.754,00)	2019-07-18 00:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (75,6,1,"18/07/2019 00:29",1,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
358	3	::1	125	detalle_apartado	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:29, 1, 3, 754.754,00)	2019-07-18 00:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (75,6,1,"18/07/2019 00:29",1,3,94,"754.754,00",,,)DATA NUEVA: (75,6,1,"18/07/2019 00:29",0,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
359	3	::1	125	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:29, 1, 3, 754.754,00)	2019-07-18 00:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
360	3	::1	126	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=74, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (74,6,1,"18/07/2019 00:28",1,3,94,"754.754,00",,,)DATA NUEVA: (74,6,1,"18/07/2019 00:28",0,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
361	3	::1	126	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=74, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")	dc:a2:66:70:cc:27
362	3	::1	127	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=73, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (73,6,1,"18/07/2019 00:28",1,3,94,"754.754,00",,,)DATA NUEVA: (73,6,1,"18/07/2019 00:28",0,3,94,"754.754,00",,,)	dc:a2:66:70:cc:27
363	3	::1	127	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=73, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")	dc:a2:66:70:cc:27
364	3	::1	128	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=94 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=72 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=11 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (94,3,"18/07/2019 00:03",1,)DATA NUEVA: (94,3,"18/07/2019 00:03",0,)	dc:a2:66:70:cc:27
365	3	::1	128	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=94 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=72 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=11 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (72,6,1,"18/07/2019 00:03",1,3,94,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (72,6,1,"18/07/2019 00:03",0,3,94,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
366	3	::1	128	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=94 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=72 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=11 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,11,,"500.500,00")	dc:a2:66:70:cc:27
367	3	::1	128	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=94 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=72 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=11 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,11,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")	dc:a2:66:70:cc:27
368	3	::1	129	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:48, 1), UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:48, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (95,3,"18/07/2019 00:48",1,)	dc:a2:66:70:cc:27
369	3	::1	130	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (95, 6, 1, 18/07/2019 00:48, 1, 3, 754.754,00)	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")	dc:a2:66:70:cc:27
370	3	::1	130	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (95, 6, 1, 18/07/2019 00:48, 1, 3, 754.754,00)	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (76,6,1,"18/07/2019 00:48",1,3,95,"754.754,00",,,)	dc:a2:66:70:cc:27
371	3	::1	131	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=95 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=76 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (95,3,"18/07/2019 00:48",1,)DATA NUEVA: (95,3,"18/07/2019 00:48",0,)	dc:a2:66:70:cc:27
372	3	::1	131	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=95 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=76 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (76,6,1,"18/07/2019 00:48",1,3,95,"754.754,00",,,)DATA NUEVA: (76,6,1,"18/07/2019 00:48",0,3,95,"754.754,00",,,)	dc:a2:66:70:cc:27
373	3	::1	131	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=95 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=76 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")	dc:a2:66:70:cc:27
374	3	::1	131	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=95 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=76 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,10,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")	dc:a2:66:70:cc:27
375	3	::1	132	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:49, 1), UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:49, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (96,3,"18/07/2019 00:49",1,)	dc:a2:66:70:cc:27
376	3	::1	133	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
377	3	::1	133	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (77,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
378	3	::1	134	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
379	3	::1	134	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (78,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
380	3	::1	135	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=78, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (78,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)DATA NUEVA: (78,6,1,"18/07/2019 00:50",0,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
381	3	::1	135	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=78, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
382	3	::1	136	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
383	3	::1	136	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (79,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
384	3	::1	137	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=79, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (79,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)DATA NUEVA: (79,6,1,"18/07/2019 00:50",0,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
385	3	::1	137	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=79, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
386	3	::1	138	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=96 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=77 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (96,3,"18/07/2019 00:49",1,)DATA NUEVA: (96,3,"18/07/2019 00:49",0,)	dc:a2:66:70:cc:27
387	3	::1	138	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=96 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=77 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (77,6,1,"18/07/2019 00:50",1,3,96,"754.754,00",,,)DATA NUEVA: (77,6,1,"18/07/2019 00:50",0,3,96,"754.754,00",,,)	dc:a2:66:70:cc:27
388	3	::1	138	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=96 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=77 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")	dc:a2:66:70:cc:27
389	3	::1	138	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=96 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=77 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,9,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
390	3	::1	139	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:51, 1), UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:51, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (97,3,"18/07/2019 00:51",1,)	dc:a2:66:70:cc:27
391	3	::1	140	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
421	3	::1	152	apartado	INSERT	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA NUEVA: (101,3,"18/07/2019 00:57",1,)	dc:a2:66:70:cc:27
392	3	::1	140	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (80,6,1,"18/07/2019 00:53",1,3,97,"754.754,00",,,)	dc:a2:66:70:cc:27
393	3	::1	141	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")	dc:a2:66:70:cc:27
394	3	::1	141	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (81,6,1,"18/07/2019 00:53",1,3,97,"754.754,00",,,)	dc:a2:66:70:cc:27
395	3	::1	142	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=97 and id_usuario=3 and id_detalle_apartado=80, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (80,6,1,"18/07/2019 00:53",1,3,97,"754.754,00",,,)DATA NUEVA: (80,6,1,"18/07/2019 00:53",0,3,97,"754.754,00",,,)	dc:a2:66:70:cc:27
396	3	::1	142	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=97 and id_usuario=3 and id_detalle_apartado=80, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
397	3	::1	143	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=97 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=81 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (97,3,"18/07/2019 00:51",1,)DATA NUEVA: (97,3,"18/07/2019 00:51",0,)	dc:a2:66:70:cc:27
398	3	::1	143	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=97 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=81 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (81,6,1,"18/07/2019 00:53",1,3,97,"754.754,00",,,)DATA NUEVA: (81,6,1,"18/07/2019 00:53",0,3,97,"754.754,00",,,)	dc:a2:66:70:cc:27
399	3	::1	143	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=97 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=81 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")	dc:a2:66:70:cc:27
400	3	::1	143	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=97 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=81 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,8,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
410	3	::1	148	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (99, 6, 1, 18/07/2019 00:55, 1, 3, 754.754,00)	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (83,6,1,"18/07/2019 00:55",1,3,99,"754.754,00",,,)	dc:a2:66:70:cc:27
401	3	::1	144	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:53, 1), UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (98,3,"18/07/2019 00:53",1,)	dc:a2:66:70:cc:27
402	3	::1	145	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (98, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")	dc:a2:66:70:cc:27
403	3	::1	145	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (98, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (82,6,1,"18/07/2019 00:53",1,3,98,"754.754,00",,,)	dc:a2:66:70:cc:27
404	3	::1	146	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=98 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=82 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (98,3,"18/07/2019 00:53",1,)DATA NUEVA: (98,3,"18/07/2019 00:53",0,)	dc:a2:66:70:cc:27
405	3	::1	146	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=98 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=82 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (82,6,1,"18/07/2019 00:53",1,3,98,"754.754,00",,,)DATA NUEVA: (82,6,1,"18/07/2019 00:53",0,3,98,"754.754,00",,,)	dc:a2:66:70:cc:27
406	3	::1	146	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=98 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=82 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")	dc:a2:66:70:cc:27
407	3	::1	146	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=98 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=82 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,7,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")	dc:a2:66:70:cc:27
408	3	::1	147	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:55, 1), UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:55, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (99,3,"18/07/2019 00:55",1,)	dc:a2:66:70:cc:27
409	3	::1	148	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (99, 6, 1, 18/07/2019 00:55, 1, 3, 754.754,00)	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
412	3	::1	149	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=99 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=83 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (83,6,1,"18/07/2019 00:55",1,3,99,"754.754,00",,,)DATA NUEVA: (83,6,1,"18/07/2019 00:55",0,3,99,"754.754,00",,,)	dc:a2:66:70:cc:27
413	3	::1	149	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=99 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=83 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")	dc:a2:66:70:cc:27
414	3	::1	149	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=99 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=83 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,6,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
415	3	::1	150	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:56, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:56, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (100,3,"18/07/2019 00:56",1,)	dc:a2:66:70:cc:27
416	3	::1	151	catalogo_venta	UPDATE	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (100, 6, 1, 18/07/2019 00:56, 1, 3, 754.754,00)	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,4,,"500.500,00")	dc:a2:66:70:cc:27
417	3	::1	151	detalle_apartado	INSERT	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (100, 6, 1, 18/07/2019 00:56, 1, 3, 754.754,00)	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (84,6,1,"18/07/2019 00:56",1,3,100,"754.754,00",,,)	dc:a2:66:70:cc:27
418	3	::1	152	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (100,3,"18/07/2019 00:56",1,)DATA NUEVA: (100,3,"18/07/2019 00:56",0,)	dc:a2:66:70:cc:27
419	3	::1	152	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (84,6,1,"18/07/2019 00:56",1,3,100,"754.754,00",,,)DATA NUEVA: (84,6,1,"18/07/2019 00:56",0,3,100,"754.754,00",,,)	dc:a2:66:70:cc:27
420	3	::1	152	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,4,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
422	3	::1	152	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,4,,"500.500,00")	dc:a2:66:70:cc:27
423	3	::1	153	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:57, 1), UPDATE catalogo_venta SET productos_disponibles=4 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (101, 6, 1, 18/07/2019 00:57, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (85,6,1,"18/07/2019 00:57",1,3,101,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
424	3	::1	154	apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=101 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=85 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (101,3,"18/07/2019 00:57",1,)DATA NUEVA: (101,3,"18/07/2019 00:57",0,)	dc:a2:66:70:cc:27
425	3	::1	154	detalle_apartado	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=101 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=85 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (85,6,1,"18/07/2019 00:57",1,3,101,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (85,6,1,"18/07/2019 00:57",0,3,101,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
426	3	::1	154	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=101 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=85 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,4,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
427	3	::1	154	catalogo_venta	UPDATE	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=101 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=85 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magnetos",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
428	1	::1	155	catalogo_venta	UPDATE	UPDATE catalogo_venta SET nombre_producto_v=embobinado magnetos, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magnetos",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magnetos",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
429	1	::1	156	catalogo_venta	UPDATE	UPDATE catalogo_venta SET nombre_producto_v=embobinado magnetos, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magnetos",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")	dc:a2:66:70:cc:27
430	1	::1	157	apartado	INSERT	UPDATE catalogo_venta SET nombre_producto_v=embobinado magneto, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	DATA NUEVA: (102,3,"18/07/2019 01:13",1,)	dc:a2:66:70:cc:27
431	1	::1	157	catalogo_venta	UPDATE	UPDATE catalogo_venta SET nombre_producto_v=embobinado magneto, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,5,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,3,,"500.500,00")	dc:a2:66:70:cc:27
432	3	::1	158	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (86,6,2,"18/07/2019 01:13",1,3,102,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
433	3	::1	158	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,3,"650.650,00","104.104,00","754.754,00",12,1,3,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,3,,"500.500,00")	dc:a2:66:70:cc:27
434	3	::1	158	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (102,3,"18/07/2019 01:13",1,)DATA NUEVA: (102,3,"18/07/2019 01:13",2,)	dc:a2:66:70:cc:27
435	3	::1	158	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (86,6,2,"18/07/2019 01:13",1,3,102,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (86,6,2,"18/07/2019 01:13",2,3,102,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
436	3	::1	158	ventas_productos	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (12,102,3,2,"1.509.508,00",2,12312313123,3,"2019-07-18 01:14:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
437	3	::1	158	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (103,3,"18/07/2019 01:40",1,)	dc:a2:66:70:cc:27
438	3	::1	158	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,3,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,2,,"500.500,00")	dc:a2:66:70:cc:27
439	3	::1	159	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:40, 1), UPDATE catalogo_venta SET productos_disponibles=2 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (103, 6, 1, 18/07/2019 01:40, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (87,6,1,"18/07/2019 01:40",1,3,103,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
440	3	::1	159	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:40, 1), UPDATE catalogo_venta SET productos_disponibles=2 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (103, 6, 1, 18/07/2019 01:40, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,5,"650.650,00","104.104,00","754.754,00",12,1,2,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,6,"650.650,00","104.104,00","754.754,00",12,1,2,,"500.500,00")	dc:a2:66:70:cc:27
441	3	::1	159	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:40, 1), UPDATE catalogo_venta SET productos_disponibles=2 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (103, 6, 1, 18/07/2019 01:40, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (103,3,"18/07/2019 01:40",1,)DATA NUEVA: (103,3,"18/07/2019 01:40",2,)	dc:a2:66:70:cc:27
442	3	::1	159	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:40, 1), UPDATE catalogo_venta SET productos_disponibles=2 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (103, 6, 1, 18/07/2019 01:40, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (87,6,1,"18/07/2019 01:40",1,3,103,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (87,6,1,"18/07/2019 01:40",2,3,103,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
443	3	::1	160	ventas_productos	INSERT	UPDATE catalogo_venta SET productos_vendidos=6 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=103 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=103 and id_usuario=3, 	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (13,103,3,2,"754.754,00",2,1231312312,3,"2019-07-18 01:40:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
444	3	::1	160	apartado	INSERT	UPDATE catalogo_venta SET productos_vendidos=6 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=103 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=103 and id_usuario=3, 	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (104,3,"18/07/2019 01:41",1,)	dc:a2:66:70:cc:27
445	3	::1	160	catalogo_venta	UPDATE	UPDATE catalogo_venta SET productos_vendidos=6 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=103 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=103 and id_usuario=3, 	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,7,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
446	3	::1	161	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (104, 1, 2, 18/07/2019 01:41, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (88,1,2,"18/07/2019 01:41",1,3,104,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
455	3	::1	163	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=0 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (105, 6, 2, 18/07/2019 01:41, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (105,3,"18/07/2019 01:41",1,)DATA NUEVA: (105,3,"18/07/2019 01:41",2,)	dc:a2:66:70:cc:27
447	3	::1	161	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (104, 1, 2, 18/07/2019 01:41, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,8,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
448	3	::1	161	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (104, 1, 2, 18/07/2019 01:41, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (104,3,"18/07/2019 01:41",1,)DATA NUEVA: (104,3,"18/07/2019 01:41",2,)	dc:a2:66:70:cc:27
449	3	::1	161	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (104, 1, 2, 18/07/2019 01:41, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (88,1,2,"18/07/2019 01:41",1,3,104,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (88,1,2,"18/07/2019 01:41",2,3,104,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
450	3	::1	162	ventas_productos	INSERT	UPDATE catalogo_venta SET productos_vendidos=10 WHERE id_producto_venta=1, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=104 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=104 and id_usuario=3, 	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (14,104,3,2,"120.640,00",2,1231231312313,3,"2019-07-18 01:41:00",0.16,0.35,"52.000,00")	dc:a2:66:70:cc:27
451	3	::1	162	apartado	INSERT	UPDATE catalogo_venta SET productos_vendidos=10 WHERE id_producto_venta=1, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=104 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=104 and id_usuario=3, 	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (105,3,"18/07/2019 01:41",1,)	dc:a2:66:70:cc:27
452	3	::1	162	catalogo_venta	UPDATE	UPDATE catalogo_venta SET productos_vendidos=10 WHERE id_producto_venta=1, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=104 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=104 and id_usuario=3, 	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,6,"650.650,00","104.104,00","754.754,00",12,1,2,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,6,"650.650,00","104.104,00","754.754,00",12,1,0,,"500.500,00")	dc:a2:66:70:cc:27
453	3	::1	163	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=0 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (105, 6, 2, 18/07/2019 01:41, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (89,6,2,"18/07/2019 01:41",1,3,105,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
454	3	::1	163	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=0 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (105, 6, 2, 18/07/2019 01:41, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,6,"650.650,00","104.104,00","754.754,00",12,1,0,,"500.500,00")DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,8,"650.650,00","104.104,00","754.754,00",12,1,0,,"500.500,00")	dc:a2:66:70:cc:27
491	1	::1	183	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (106,3,"18/07/2019 01:43",1,)DATA NUEVA: (106,3,"18/07/2019 01:43",0,)	dc:a2:66:70:cc:27
456	3	::1	163	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=0 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (105, 6, 2, 18/07/2019 01:41, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (89,6,2,"18/07/2019 01:41",1,3,105,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (89,6,2,"18/07/2019 01:41",2,3,105,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
457	3	::1	164	ventas_productos	INSERT	UPDATE catalogo_venta SET productos_vendidos=8 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=105 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=105 and id_usuario=3, INSERT INTO ventas_productos (id_apartado, id_banco_usuario, id_banco_empresa, monto_cancelado, fecha_hora_venta, estatus, numero_referencia, id_usuario, iva, ganancia, precio_base) \r\n\t\t\t\t\tVALUES \r\n\t\t\t(105, 3, 2, 1.509.508,00, 18/07/2019 01:42, 2, 12112313, 3, 0.16, 0.35, 650.650,00) 	2019-07-18 01:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (15,105,3,2,"1.509.508,00",2,12112313,3,"2019-07-18 01:42:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
458	3	::1	164	apartado	INSERT	UPDATE catalogo_venta SET productos_vendidos=8 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=105 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=105 and id_usuario=3, INSERT INTO ventas_productos (id_apartado, id_banco_usuario, id_banco_empresa, monto_cancelado, fecha_hora_venta, estatus, numero_referencia, id_usuario, iva, ganancia, precio_base) \r\n\t\t\t\t\tVALUES \r\n\t\t\t(105, 3, 2, 1.509.508,00, 18/07/2019 01:42, 2, 12112313, 3, 0.16, 0.35, 650.650,00) 	2019-07-18 01:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA NUEVA: (106,3,"18/07/2019 01:43",1,)	dc:a2:66:70:cc:27
459	3	::1	164	catalogo_venta	UPDATE	UPDATE catalogo_venta SET productos_vendidos=8 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=105 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=105 and id_usuario=3, INSERT INTO ventas_productos (id_apartado, id_banco_usuario, id_banco_empresa, monto_cancelado, fecha_hora_venta, estatus, numero_referencia, id_usuario, iva, ganancia, precio_base) \r\n\t\t\t\t\tVALUES \r\n\t\t\t(105, 3, 2, 1.509.508,00, 18/07/2019 01:42, 2, 12112313, 3, 0.16, 0.35, 650.650,00) 	2019-07-18 01:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
460	3	::1	165	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:43, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (106, 1, 2, 18/07/2019 01:43, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:43:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (90,1,2,"18/07/2019 01:43",1,3,106,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
461	1	::1	166	apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=15, SELECT * FROM ventas_productos where id_venta_producto=15, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=15	2019-07-18 01:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (105,3,"18/07/2019 01:41",2,)DATA NUEVA: (105,3,"18/07/2019 01:41",3,)	dc:a2:66:70:cc:27
462	1	::1	166	detalle_apartado	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=15, SELECT * FROM ventas_productos where id_venta_producto=15, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=15	2019-07-18 01:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (89,6,2,"18/07/2019 01:41",2,3,105,"754.754,00","650.650,00",0.16,0.35)DATA NUEVA: (89,6,2,"18/07/2019 01:41",3,3,105,"754.754,00","650.650,00",0.16,0.35)	dc:a2:66:70:cc:27
463	1	::1	166	ventas_productos	UPDATE	SELECT * FROM ventas_productos where id_venta_producto=15, SELECT * FROM ventas_productos where id_venta_producto=15, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=15	2019-07-18 01:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	DATA ANTIGUA: (15,105,3,2,"1.509.508,00",2,12112313,3,"2019-07-18 01:42:00",0.16,0.35,"650.650,00")DATA NUEVA: (15,105,3,2,"1.509.508,00",3,12112313,3,"2019-07-18 01:42:00",0.16,0.35,"650.650,00")	dc:a2:66:70:cc:27
464	3	::1	167	opiniones	INSERT	INSERT INTO opiniones (opinion_usuario, id_usuario, fecha_hora_opinion, id_venta_producto, estatus, id_producto_venta)\r\n    \t \t\tVALUES\r\n    (asdadasdadadsasasdasdadasdadsasd, 3, 18/07/2019 01:48, 15, 1, 6)	2019-07-18 01:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/opinar/opinarUsua.php	DATA NUEVA: (2,asdadasdadadsasasdasdadasdadsasd,3,15,1,6,"2019-07-18 01:48:00")	dc:a2:66:70:cc:27
465	1	::1	168	bancos_empresa	INSERT	INSERT INTO bancos_empresa (nomb_banc_empr, tipo_cuen_empr, num_cuen_empr, titu_cuen_empr, cedu_cuen_empr, estatus) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (100% BANCO, Corriente, 01561231312312312312, adasdasdasd, V-12312312, 1)	2019-07-18 01:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoEmpresa.php	DATA NUEVA: (4,"100% BANCO",Corriente,01561231312312312312,adasdasdasd,,V-12312312,1)	dc:a2:66:70:cc:27
466	1	::1	169	bancos_empresa	UPDATE	UPDATE bancos_empresa SET nomb_banc_empr=BANCO CARONI, C.A. BANCO UNIVERSAL, tipo_cuen_empr=Corriente, titu_cuen_empr=yurley contreras, cedu_cuen_empr=V-24819181, num_cuen_empr=01280924200000108889 WHERE id_banco_empresa=2 	2019-07-18 01:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarBancoEmpresa.php	DATA ANTIGUA: (2,banesco,Corriente,01020924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
467	1	::1	169	bancos_empresa	UPDATE	UPDATE bancos_empresa SET nomb_banc_empr=BANCO CARONI, C.A. BANCO UNIVERSAL, tipo_cuen_empr=Corriente, titu_cuen_empr=yurley contreras, cedu_cuen_empr=V-24819181, num_cuen_empr=01280924200000108889 WHERE id_banco_empresa=2 	2019-07-18 01:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)	dc:a2:66:70:cc:27
468	1	::1	170	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 01:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
469	1	::1	171	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=3	2019-07-18 01:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	DATA ANTIGUA: (3,BanPlussss,Corriente,01234578983738939303,"Leidy carvajala",,V-24882728,0)DATA NUEVA: (3,BanPlussss,Corriente,01234578983738939303,"Leidy carvajala",,V-24882728,1)	dc:a2:66:70:cc:27
470	1	::1	172	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 01:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)	dc:a2:66:70:cc:27
471	1	::1	173	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 01:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
472	1	::1	174	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 02:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)	dc:a2:66:70:cc:27
473	1	::1	175	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 02:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,0)DATA NUEVA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
474	1	::1	176	bancos_empresa	UPDATE	UPDATE bancos_empresa SET nomb_banc_empr=BANCO BANESCO, tipo_cuen_empr=Corriente, titu_cuen_empr=yurley contreras, cedu_cuen_empr=V-24819181, num_cuen_empr=01340924200000108889 WHERE id_banco_empresa=2 	2019-07-18 02:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO CARONI, C.A. BANCO UNIVERSAL",Corriente,01280924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO BANESCO",Corriente,01340924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
475	1	::1	177	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 02:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO BANESCO",Corriente,01340924200000108889,"yurley contreras",,V-24819181,1)DATA NUEVA: (2,"BANCO BANESCO",Corriente,01340924200000108889,"yurley contreras",,V-24819181,0)	dc:a2:66:70:cc:27
476	1	::1	178	bancos_empresa	UPDATE	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 02:19:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	DATA ANTIGUA: (2,"BANCO BANESCO",Corriente,01340924200000108889,"yurley contreras",,V-24819181,0)DATA NUEVA: (2,"BANCO BANESCO",Corriente,01340924200000108889,"yurley contreras",,V-24819181,1)	dc:a2:66:70:cc:27
477	3	::1	179	bancos_usuario	INSERT	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	DATA NUEVA: (4,"BANCO ACTIVO BANCO COMERCIAL, C.A.",Corriente,01711312312312312312,"prueba prueba",J-123123123,1,3)	dc:a2:66:70:cc:27
478	3	::1	179	bancos_usuario	UPDATE	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	DATA ANTIGUA: (3,"BANCO DE VENEZUELA, S.A.I.C.A.",Corriente,01021231312312312312,"vidermid sanchez",V-19121212,1,3)DATA NUEVA: (3,BANFANB,Corriente,01771231312312312312,"vidermid sanchez",V-19121212,1,3)	dc:a2:66:70:cc:27
479	3	::1	179	bancos_usuario	UPDATE	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	DATA ANTIGUA: (4,"BANCO ACTIVO BANCO COMERCIAL, C.A.",Corriente,01711312312312312312,"prueba prueba",J-123123123,1,3)DATA NUEVA: (4,"BANCO ACTIVO BANCO COMERCIAL, C.A.",Corriente,01711312312312312312,"prueba prueba",J-123123123,0,3)	dc:a2:66:70:cc:27
480	3	::1	179	bancos_usuario	UPDATE	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	DATA ANTIGUA: (4,"BANCO ACTIVO BANCO COMERCIAL, C.A.",Corriente,01711312312312312312,"prueba prueba",J-123123123,0,3)DATA NUEVA: (4,"BANCO ACTIVO BANCO COMERCIAL, C.A.",Corriente,01711312312312312312,"prueba prueba",J-123123123,1,3)	dc:a2:66:70:cc:27
481	3	::1	179	bancos_usuario	UPDATE	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	DATA ANTIGUA: (3,BANFANB,Corriente,01771231312312312312,"vidermid sanchez",V-19121212,1,3)DATA NUEVA: (3,BANFANB,Corriente,01771231312312312312,"vidermid sanchez",V-19121212,0,3)	dc:a2:66:70:cc:27
482	3	::1	180	bancos_usuario	UPDATE	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA ANTIGUA: (3,BANFANB,Corriente,01771231312312312312,"vidermid sanchez",V-19121212,0,3)DATA NUEVA: (3,BANFANB,Corriente,01771231312312312312,"vidermid sanchez",V-19121212,1,3)	dc:a2:66:70:cc:27
483	3	::1	180	usuario	UPDATE	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,12345678,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
484	3	::1	180	usuario	INSERT	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA NUEVA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,1,1)	dc:a2:66:70:cc:27
485	3	::1	180	usuario	INSERT	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA NUEVA: (5,V-24819181,asdadsadadassdasd,postgresasdasd,asssd@asdasd.com,248191812312,Barinas,Chameta,adasdadasdasdasdsdasdasdadadasd,0424,0123010,0239,1231231,,,1,1)	dc:a2:66:70:cc:27
486	3	::1	180	usuario	INSERT	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA NUEVA: (6,V-23121231,asdadad,postgres,cristhiasnsalgado_22@hotmail.com,24819181,Mérida,Chachopo,asdasdasd2123123132asddaddasdas,0414,1321312,0248,1231212,,,1,1)	dc:a2:66:70:cc:27
487	3	::1	180	usuario	INSERT	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	DATA NUEVA: (7,J-2312123177,asdadadhhhhhh,postgres,cristkjsalgado_22@hotmail.com,24819181,Mérida,Chiguará,asdasdasd2123123132asddaddasdas,0414,1321312,0248,1231212,,,1,1)	dc:a2:66:70:cc:27
488	9999	::1	181	usuario	INSERT	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus)\r\n\r\n\t \t\tVALUES\r\n\r\n\t\t(J-2312123170, asdadadhhhhhh, postgres, cristkjsalgado2@hotmail.com, 24819181, Aragua, 12 de Febrero, asdasdasd2123123132asddaddasdas,0414, 1321312, 0248, 1231212, 1, 1)	2019-07-18 03:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	DATA NUEVA: (8,J-2312123170,asdadadhhhhhh,postgres,cristkjsalgado2@hotmail.com,24819181,Aragua,"12 de Febrero",asdasdasd2123123132asddaddasdas,0414,1321312,0248,1231212,,,1,1)	dc:a2:66:70:cc:27
489	9999	::1	182	usuario	INSERT	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n\t\t(J-1231231231, asdadasdasdasdasdasd, postgres, asdassssasd@asdasd.com, 24819181, Aragua, 12 de Octubre, 123123123123123123123123asdasdas,0416, 1231231, 0252, 1231312, 1, 1, Donde Nacistes?, omaira)	2019-07-18 03:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	DATA NUEVA: (9,J-1231231231,asdadasdasdasdasdasd,postgres,asdassssasd@asdasd.com,24819181,Aragua,"12 de Octubre",123123123123123123123123asdasdas,0416,1231231,0252,1231312,"Donde Nacistes?",omaira,1,1)	dc:a2:66:70:cc:27
490	1	::1	183	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (90,1,2,"18/07/2019 01:43",1,3,106,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (90,1,2,"18/07/2019 01:43",0,3,106,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
492	1	::1	183	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
493	1	::1	183	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (107,3,"21/07/2019 16:11",1,)	dc:a2:66:70:cc:27
494	1	::1	183	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
495	3	::1	184	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:11, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (107, 1, 2, 21/07/2019 16:11, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (91,1,2,"21/07/2019 16:11",1,3,107,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
496	1	::1	185	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (91,1,2,"21/07/2019 16:11",1,3,107,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (91,1,2,"21/07/2019 16:11",0,3,107,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
497	1	::1	185	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (107,3,"21/07/2019 16:11",1,)DATA NUEVA: (107,3,"21/07/2019 16:11",0,)	dc:a2:66:70:cc:27
498	1	::1	185	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
499	1	::1	185	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (108,3,"21/07/2019 16:11",1,)	dc:a2:66:70:cc:27
500	1	::1	185	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
501	3	::1	186	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:11, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (108, 1, 2, 21/07/2019 16:11, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (92,1,2,"21/07/2019 16:11",1,3,108,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
502	1	::1	187	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (92,1,2,"21/07/2019 16:11",1,3,108,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (92,1,2,"21/07/2019 16:11",0,3,108,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
503	1	::1	187	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (108,3,"21/07/2019 16:11",1,)DATA NUEVA: (108,3,"21/07/2019 16:11",0,)	dc:a2:66:70:cc:27
504	1	::1	187	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
505	1	::1	187	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (109,3,"21/07/2019 16:14",1,)	dc:a2:66:70:cc:27
506	1	::1	187	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
507	3	::1	188	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (109, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (93,1,2,"21/07/2019 16:14",1,3,109,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
508	1	::1	189	detalle_apartado	UPDATE	, , UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (92,1,2,"21/07/2019 16:11",0,3,108,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (92,1,2,"21/07/2019 16:11",0,3,108,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
509	1	::1	189	apartado	UPDATE	, , UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (108,3,"21/07/2019 16:11",0,)DATA NUEVA: (108,3,"21/07/2019 16:11",0,)	dc:a2:66:70:cc:27
510	1	::1	190	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (93,1,2,"21/07/2019 16:14",1,3,109,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (93,1,2,"21/07/2019 16:14",0,3,109,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
511	1	::1	190	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (109,3,"21/07/2019 16:14",1,)DATA NUEVA: (109,3,"21/07/2019 16:14",0,)	dc:a2:66:70:cc:27
512	1	::1	190	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
513	1	::1	190	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (110,3,"21/07/2019 16:14",1,)	dc:a2:66:70:cc:27
514	1	::1	190	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
515	3	::1	191	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (94,1,2,"21/07/2019 16:14",1,3,110,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
516	3	::1	191	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (93,1,2,"21/07/2019 16:14",0,3,109,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (93,1,2,"21/07/2019 16:14",0,3,109,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
517	3	::1	191	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (109,3,"21/07/2019 16:14",0,)DATA NUEVA: (109,3,"21/07/2019 16:14",0,)	dc:a2:66:70:cc:27
518	3	::1	191	detalle_apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (94,1,2,"21/07/2019 16:14",1,3,110,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (94,1,2,"21/07/2019 16:14",0,3,110,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
519	3	::1	191	apartado	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (110,3,"21/07/2019 16:14",1,)DATA NUEVA: (110,3,"21/07/2019 16:14",0,)	dc:a2:66:70:cc:27
520	3	::1	191	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
521	3	::1	191	apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (111,3,"21/07/2019 16:15",1,)	dc:a2:66:70:cc:27
522	3	::1	191	catalogo_venta	UPDATE	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
523	3	::1	192	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:15, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (111, 1, 2, 21/07/2019 16:15, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (95,1,2,"21/07/2019 16:15",1,3,111,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
524	1	::1	193	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (95,1,2,"21/07/2019 16:15",1,3,111,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (95,1,2,"21/07/2019 16:15",0,3,111,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
525	1	::1	193	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (111,3,"21/07/2019 16:15",1,)DATA NUEVA: (111,3,"21/07/2019 16:15",0,)	dc:a2:66:70:cc:27
526	1	::1	193	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
527	1	::1	193	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (112,3,"21/07/2019 16:15",1,)	dc:a2:66:70:cc:27
528	1	::1	193	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
529	3	::1	194	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:15, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (112, 1, 2, 21/07/2019 16:15, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (96,1,2,"21/07/2019 16:15",1,3,112,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
530	1	::1	195	detalle_apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (96,1,2,"21/07/2019 16:15",1,3,112,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (96,1,2,"21/07/2019 16:15",0,3,112,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
531	1	::1	195	apartado	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (112,3,"21/07/2019 16:15",1,)DATA NUEVA: (112,3,"21/07/2019 16:15",0,)	dc:a2:66:70:cc:27
532	1	::1	195	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
533	1	::1	195	apartado	INSERT	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (113,3,"21/07/2019 16:17",1,)	dc:a2:66:70:cc:27
557	1	::1	213	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
534	1	::1	195	catalogo_venta	UPDATE	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")	dc:a2:66:70:cc:27
535	3	::1	196	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:17, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (113, 1, 2, 21/07/2019 16:17, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (97,1,2,"21/07/2019 16:17",1,3,113,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
536	1	::1	197	detalle_apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (97,1,2,"21/07/2019 16:17",1,3,113,"60.320,00","52.000,00",0.16,0.35)DATA NUEVA: (97,1,2,"21/07/2019 16:17",0,3,113,"60.320,00","52.000,00",0.16,0.35)	dc:a2:66:70:cc:27
537	1	::1	197	apartado	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (113,3,"21/07/2019 16:17",1,)DATA NUEVA: (113,3,"21/07/2019 16:17",0,)	dc:a2:66:70:cc:27
538	1	::1	197	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,3,,"40.000,00")DATA NUEVA: (1,ACC2528,"prueba ",1,"Accesorios para Motociclistas",KEEWAY,"CASCO KEEWAY","1463849799021 - copia - copia.jpg",Unico,10,"52.000,00","8.320,00","60.320,00",23123,1,5,,"40.000,00")	dc:a2:66:70:cc:27
539	1	::1	197	apartado	INSERT	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA NUEVA: (114,3,"21/07/2019 18:42",1,)	dc:a2:66:70:cc:27
540	1	::1	197	catalogo_venta	UPDATE	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	DATA ANTIGUA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,5,"5.850.000,00","936.000,00","6.786.000,00",13123,1,15,,)DATA NUEVA: (3,CHA342,chaleco,1,Chasis,Bera,"chaleco para motociclistas","../imagenesRepuestos/1464034253956 - copia - copia.jpg",Unico,5,"5.850.000,00","936.000,00","6.786.000,00",13123,1,12,,)	dc:a2:66:70:cc:27
541	3	::1	198	detalle_apartado	INSERT	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 18:42, 1), UPDATE catalogo_venta SET productos_disponibles=12 WHERE id_producto_venta=3, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (114, 3, 3, 21/07/2019 18:42, 1, 3, 6.786.000,00, 5.850.000,00,0.16, 0.35)	2019-07-21 18:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	DATA NUEVA: (98,3,3,"21/07/2019 18:42",1,3,114,"6.786.000,00","5.850.000,00",0.16,0.35)	dc:a2:66:70:cc:27
542	1	::1	199	usuario	UPDATE	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-22 09:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	DATA ANTIGUA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)   DATA NUEVA: (2,70000000,leydi,carrero,leydi@gmail.com,12345678,Táchira,"San Cristóbal","vivo por hay",0426,8292827,0416,8272829,"Cual fue tu mejor amigo de la infancia?",omaira,1,0)	0a:00:27:00:00:0b
543	1	::1	199	catalogo_venta	UPDATE	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-22 09:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,8,"650.650,00","104.104,00","754.754,00",12,1,0,,"500.500,00")   DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,8,"650.650,00","104.104,00","754.754,00",12,0,0,,"500.500,00")	0a:00:27:00:00:0b
544	1	::1	200	catalogo_venta	UPDATE	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1497	2019-07-22 09:18:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	DATA ANTIGUA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,8,"650.650,00","104.104,00","754.754,00",12,0,0,,"500.500,00")   DATA NUEVA: (6,ACC1497,"embobinado magneto",1,"Accesorios para Motociclistas",ckj,"prueba prueba",../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg,Unidad,8,"650.650,00","104.104,00","754.754,00",12,1,0,,"500.500,00")	0a:00:27:00:00:0b
545	9999	::1	201	usuario	INSERT	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n    (V-12312312, prueba, prueba, prueba@gmail.com, 12345678, Táchira, Cordero, prueba prueba prueba prueba ,0416, 8264285, 0252, 1231232, 1, 1, Cual fue tu mejor amigo de la infancia?, omaira)	2019-08-12 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	DATA NUEVA: (10,V-12312312,prueba,prueba,prueba@gmail.com,12345678,Táchira,Cordero,"prueba prueba prueba prueba ",0416,8264285,0252,1231232,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)	dc:a2:66:70:cc:27
546	9999	::1	202	usuario	INSERT	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n    (V-24131321, asdadasd, adsasdasd, pruebaalgado_22@hotmail.com, 12345678, Miranda, Barrio el Manguito Petare, sector la catedral calle 3 con carrera 3,0414, 1231231, 0248, 1231313, 1, 1, Cual fue tu mejor amigo de la infancia?, omaira)	2019-08-12 22:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	DATA NUEVA: (11,V-24131321,asdadasd,adsasdasd,pruebaalgado_22@hotmail.com,12345678,Miranda,"Barrio el Manguito Petare","sector la catedral calle 3 con carrera 3",0414,1231231,0248,1231313,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)	dc:a2:66:70:cc:27
547	1	::1	204	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 17:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
548	1	::1	204	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 17:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
549	1	::1	205	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 17:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
550	1	::1	206	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
551	1	::1	207	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
552	1	::1	208	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
553	1	::1	209	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
554	1	::1	210	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
555	1	::1	211	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
556	1	::1	212	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
558	1	::1	214	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
559	1	::1	215	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
560	1	::1	216	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
561	1	::1	217	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:18:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
562	1	::1	218	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:19:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
563	1	::1	219	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
564	1	::1	220	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
565	1	::1	221	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:21:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
566	1	::1	222	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
567	1	::1	223	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,10,t,t,t,t,t,t,t,f,1,t,t,t)   DATA NUEVA: (1,10,t,t,t,t,t,t,t,f,1,t,t,t)	dc:a2:66:70:cc:27
568	1	::1	224	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
569	1	::1	225	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
570	1	::1	226	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 10	2019-08-13 18:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (10,9,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (10,9,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
571	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,10,t,t,t,t,t,t,t,f,1,t,t,t)   DATA NUEVA: (1,10,t,f,f,t,t,t,t,f,1,t,t,t)	dc:a2:66:70:cc:27
572	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,f,f,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
573	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
574	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
575	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
576	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
577	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
578	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
579	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
580	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
581	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
582	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
583	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
584	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
585	1	::1	227	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
586	1	::1	228	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-14 09:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
587	1	::1	229	elementos	UPDATE	 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 09:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
588	1	::1	229	usuario	UPDATE	 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 09:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
589	1	::1	231	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 1 WHERE id_usuario=4	2019-08-14 09:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
590	1	::1	231	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 1 WHERE id_usuario=4	2019-08-14 09:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,1,1)   DATA NUEVA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,1,1)	dc:a2:66:70:cc:27
591	1	::1	232	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)	dc:a2:66:70:cc:27
592	1	::1	233	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
593	1	::1	233	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
594	1	::1	234	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)	dc:a2:66:70:cc:27
595	1	::1	235	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
596	1	::1	235	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
606	1	::1	243	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
597	1	::1	236	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)	dc:a2:66:70:cc:27
598	1	::1	236	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,1,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
599	1	::1	237	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 10 WHERE id_usuario=4	2019-08-14 09:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
600	1	::1	237	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 10 WHERE id_usuario=4	2019-08-14 09:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,1,1)   DATA NUEVA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,10,1)	dc:a2:66:70:cc:27
601	1	::1	238	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 5 UPDATE usuario SET bandera = 1 WHERE id_usuario=4	2019-08-14 09:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,10,1)   DATA NUEVA: (4,J-123123123,asdadsad,postgres,asdasasd@asdasd.com,24819181,Mérida,Chocantá,adasdadasdasdasdadasasdadasdasd,0424,0123010,0239,1231231,,,1,1)	dc:a2:66:70:cc:27
602	1	::1	239	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
603	1	::1	239	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,f,t,f,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
604	1	::1	240	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
605	1	::1	241	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
607	1	::1	243	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
608	1	::1	244	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
609	1	::1	245	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
610	1	::1	245	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
611	1	::1	246	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
612	1	::1	246	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
613	1	::1	247	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,f,f,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
614	1	::1	247	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
615	1	::1	249	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
616	1	::1	250	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,f,f,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
617	1	::1	250	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
618	1	::1	251	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
619	1	::1	252	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
620	1	::1	252	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
621	1	::1	253	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true  reg_adm=true mod_int=true mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
622	1	::1	254	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true  reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
623	1	::1	255	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,f,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
624	1	::1	255	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
625	1	::1	256	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
635	1	::1	261	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:24:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,f,f,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,f,f,1,f,t,t)	dc:a2:66:70:cc:27
626	1	::1	256	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
627	1	::1	257	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=false, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,f,f,t,t,t,t,t,1,t,f,t)	dc:a2:66:70:cc:27
628	1	::1	257	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=false, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
629	1	::1	258	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,f,f,t,t,t,t,t,1,t,f,t)   DATA NUEVA: (3,1,t,t,f,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
630	1	::1	258	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
631	1	::1	259	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,f,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
632	1	::1	259	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
633	1	::1	260	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,f,f,1,t,t,t)	dc:a2:66:70:cc:27
634	1	::1	260	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
636	1	::1	261	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:24:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
637	1	::1	262	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2 UPDATE usuario SET bandera = 1 WHERE id_usuario=11	2019-08-14 14:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (2,11,t,t,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
638	1	::1	262	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2 UPDATE usuario SET bandera = 1 WHERE id_usuario=11	2019-08-14 14:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (11,V-24131321,asdadasd,adsasdasd,pruebaalgado_22@hotmail.com,12345678,Miranda,"Barrio el Manguito Petare","sector la catedral calle 3 con carrera 3",0414,1231231,0248,1231313,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)   DATA NUEVA: (11,V-24131321,asdadasd,adsasdasd,pruebaalgado_22@hotmail.com,12345678,Miranda,"Barrio el Manguito Petare","sector la catedral calle 3 con carrera 3",0414,1231231,0248,1231313,"Cual fue tu mejor amigo de la infancia?",omaira,1,1)	dc:a2:66:70:cc:27
639	1	::1	263	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,f,f,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,f,t,t,f,f,1,f,t,t)	dc:a2:66:70:cc:27
640	1	::1	263	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
641	1	::1	264	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,f,f,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,f,t,1,f,t,t)	dc:a2:66:70:cc:27
642	1	::1	264	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
643	1	::1	265	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,f,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
644	1	::1	265	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
645	1	::1	266	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
646	1	::1	266	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
647	1	::1	267	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
648	1	::1	267	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
649	1	::1	268	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
650	1	::1	268	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
651	1	::1	268	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
652	1	::1	269	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
653	1	::1	269	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
654	1	::1	270	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
655	1	::1	270	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
656	1	::1	271	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,t,t,t)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
657	1	::1	271	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
658	1	::1	272	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
659	1	::1	272	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
660	1	::1	273	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)	dc:a2:66:70:cc:27
661	1	::1	273	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
662	1	::1	273	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)	dc:a2:66:70:cc:27
663	1	::1	273	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,f,f)	dc:a2:66:70:cc:27
664	1	::1	274	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,f,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)	dc:a2:66:70:cc:27
665	1	::1	274	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
666	1	::1	275	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=false, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,f,f)	dc:a2:66:70:cc:27
667	1	::1	275	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=false, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
668	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,f,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)	dc:a2:66:70:cc:27
669	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
670	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)	dc:a2:66:70:cc:27
672	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,f)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t)	dc:a2:66:70:cc:27
671	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
673	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)	dc:a2:66:70:cc:27
674	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
675	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)	dc:a2:66:70:cc:27
676	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
677	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)	dc:a2:66:70:cc:27
678	1	::1	276	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,0)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
679	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,f,t,t,t,t,t,t,t,1,t,t,t)   DATA NUEVA: (4,3,f,f,f,f,f,f,f,f,1,t,t,t)	dc:a2:66:70:cc:27
680	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,f,f,f,f,f,f,f,f,1,t,t,t)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t)	dc:a2:66:70:cc:27
681	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
682	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (6,5,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (6,5,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
683	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (7,6,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (7,6,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
684	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (8,7,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (8,7,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
685	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (9,8,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (9,8,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
686	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (11,2,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (11,2,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
687	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (5,4,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
688	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (2,11,t,t,t,f,t,t,t,t,1,t,t,t,)   DATA NUEVA: (2,11,t,t,t,f,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
689	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (10,9,t,t,t,t,t,t,t,t,1,t,t,t,)   DATA NUEVA: (10,9,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
690	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,10,t,f,f,t,t,t,t,f,1,t,t,t,)   DATA NUEVA: (1,10,t,f,f,t,t,t,t,f,1,t,t,t,t)	dc:a2:66:70:cc:27
691	1	::1	276	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t,)   DATA NUEVA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t,t)	dc:a2:66:70:cc:27
692	1	::1	277	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,t,t,f,t,t,t,t,1,f,t,t,t)   DATA NUEVA: (3,1,t,f,t,f,t,t,t,t,1,f,t,t,t)	dc:a2:66:70:cc:27
693	1	::1	277	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
694	1	::1	278	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,f,t,f,t,t,t,t,1,f,t,t,t)   DATA NUEVA: (3,1,t,f,t,f,t,t,t,t,1,f,t,t,t)	dc:a2:66:70:cc:27
695	1	::1	278	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
696	1	::1	279	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 17:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t,t)   DATA NUEVA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t,f)	dc:a2:66:70:cc:27
697	1	::1	279	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 17:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
698	1	::1	280	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
699	1	::1	281	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
700	1	::1	282	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
701	1	::1	283	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,t,t,t,t,t,1,t,t,t,f)   DATA NUEVA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)	dc:a2:66:70:cc:27
702	1	::1	283	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)	dc:a2:66:70:cc:27
703	1	::1	284	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)	dc:a2:66:70:cc:27
704	1	::1	285	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)	dc:a2:66:70:cc:27
705	1	::1	286	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)   DATA NUEVA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)	dc:a2:66:70:cc:27
706	1	::1	286	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",10,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
707	1	::1	287	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)   DATA NUEVA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
708	1	::1	287	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
709	1	::1	288	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,1,t,f,t,f,t,t,t,t,1,f,t,t,t)   DATA NUEVA: (3,1,t,t,t,t,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
710	1	::1	288	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)   DATA NUEVA: (1,24819181,"adams contreras","contreras ramirez",adamspurry@gmail.com,adams2481,Táchira,"San Cristóbal","centro de la ciudad calle 5 la catedral",0416,1231232,0416,1312312,"Cual fue tu mejor amigo de la infancia?",LEIDY,10,1)	dc:a2:66:70:cc:27
711	1	::1	289	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,t)   DATA NUEVA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)	dc:a2:66:70:cc:27
712	1	::1	289	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
713	1	::1	290	elementos	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:32:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,f)   DATA NUEVA: (4,3,t,t,t,f,t,t,t,t,1,t,t,t,t)	dc:a2:66:70:cc:27
714	1	::1	290	usuario	UPDATE	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:32:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	DATA ANTIGUA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)   DATA NUEVA: (3,18987289,vidermid,sanchez,vidermid@gmail.com,24819181,Cojedes,"El Baúl","en mi casa",0416,6785672,0212,2789654,"Donde Nacistes?","en el hospital",1,1)	dc:a2:66:70:cc:27
\.


--
-- Name: logs_acc_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_acc_log_seq', 1, false);


--
-- Name: logs_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_id_log_seq', 714, true);


--
-- Name: logs_mac_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('logs_mac_usu_seq', 1, false);


--
-- Data for Name: opiniones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY opiniones (id_opinion, opinion_usuario, id_usuario, id_venta_producto, estatus, id_producto_venta, fecha_hora_opinion) FROM stdin;
1	excelente recomendados	3	4	0	4	2019-07-11 10:56:00
2	asdadasdadadsasasdasdadasdadsasd	3	15	1	6	2019-07-18 01:48:00
\.


--
-- Name: opiniones_id_opinion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('opiniones_id_opinion_seq', 2, true);


--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pedidos (id_pedido, numero_pedido, id_usuario_a, id_proveedor, codigo_producto, nombre_producto, cantidad_producto, precio_costo, fecha_pedido) FROM stdin;
1	23123	1	3	8USH22	CASCO EK	2	5.500.000,00	2018-04-17
2	9955	1	2	7HYSH22	CARETA R1	4	1.000.000,00	2018-04-18
3	13123	1	3	38jsja	chaleco	20	4.500.000,00	2018-06-01
4	12312	1	3	2s37700	prueba	12	50.000,00	2019-07-08
5	1231	1	3	2s3770	prueba	12	50.000,00	2019-07-08
6	12	1	6	3s55888	embobinado magneto	20	500.500,00	2019-07-16
\.


--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedidos_id_pedido_seq', 6, true);


--
-- Data for Name: pre_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pre_logs (id_pre_log, id_usu, ip_usu, sql_exe, date_time, inf_usu, url_sql, mac_usu) FROM stdin;
1	3	192.168.0.1	adsadads	2019-07-13 11:04:00	\N	\N	\N
2	1	::1		2019-07-13 11:30:00	\N	\N	\N
3	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.apppppppppp	2019-07-13 11:54:00	\N	\N	\N
4	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.pruebita	2019-07-13 11:55:00	\N	\N	\N
5	1		UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.pruebitass	2019-07-13 12:01:00	\N	\N	\N
6	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 12:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	\N	\N
7	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.coms	2019-07-13 12:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36		\N
8	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 12:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36		\N
9	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.coms	2019-07-13 12:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36		\N
10	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 12:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
11	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.comss	2019-07-13 13:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
12	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
13	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.comss	2019-07-13 13:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
14	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
15	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
16	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
46	1	::1	UPDATE catalogo_venta SET precio_base=62.920,00, iva_producto=10.067,20, pvp=72.987,20 WHERE id_producto_venta=1	2019-07-13 19:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
17	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
18	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 13:36:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
19	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.comss	2019-07-13 13:46:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
20	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.comprueba	2019-07-13 15:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
21	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 16:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
22	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.comadams	2019-07-13 16:24:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
23	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.com	2019-07-13 16:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
24	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.co	2019-07-13 17:24:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
25	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmai.cosssss	2019-07-13 17:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
26	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
27	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:46:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
28	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
29	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comss	2019-07-13 17:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
30	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
31	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 17:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
32	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 17:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
33	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 18:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
34	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 18:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
35	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 18:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
36	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 18:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
37	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 19:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
38	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 19:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
39	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 19:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
40	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.com	2019-07-13 19:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	\N
41	1	::1		2019-07-13 19:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
42	1	::1		2019-07-13 19:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
43	1	::1		2019-07-13 19:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
44	1	::1		2019-07-13 19:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
45	1	::1		2019-07-13 19:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
47	1	::1	UPDATE catalogo_venta SET precio_base=117.975,00, iva_producto=18.876,00, pvp=136.851,00 WHERE id_producto_venta=2	2019-07-13 19:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
48	1	::1	UPDATE catalogo_venta SET precio_base=7.078.500,00, iva_producto=1.132.560,00, pvp=8.211.060,00 WHERE id_producto_venta=3	2019-07-13 19:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
49	1	::1	UPDATE catalogo_venta SET precio_base=78.650,00, iva_producto=12.584,00, pvp=91.234,00 WHERE id_producto_venta=4	2019-07-13 19:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
50	1	::1	UPDATE catalogo_venta SET precio_base=78.650,00, iva_producto=12.584,00, pvp=91.234,00 WHERE id_producto_venta=5	2019-07-13 19:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
51	1	::1	UPDATE catalogo_venta SET precio_base=69.212,00, iva_producto=11.073,92, pvp=80.285,92 WHERE id_producto_venta=1	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
52	1	::1	UPDATE catalogo_venta SET precio_base=129.772,50, iva_producto=20.763,60, pvp=150.536,10 WHERE id_producto_venta=2	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
53	1	::1	UPDATE catalogo_venta SET precio_base=7.786.350,00, iva_producto=1.245.816,00, pvp=9.032.166,00 WHERE id_producto_venta=3	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
54	1	::1	UPDATE catalogo_venta SET precio_base=86.515,00, iva_producto=13.842,40, pvp=100.357,40 WHERE id_producto_venta=4	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
55	1	::1	UPDATE catalogo_venta SET precio_base=86.515,00, iva_producto=13.842,40, pvp=100.357,40 WHERE id_producto_venta=5	2019-07-13 19:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
56	1		UPDATE catalogo_venta SET precio_base=76.133,20, iva_producto=12.181,31, pvp=88.314,51 WHERE id_producto_venta=1	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
57	1		UPDATE catalogo_venta SET precio_base=142.749,20, iva_producto=22.839,87, pvp=165.589,07 WHERE id_producto_venta=2	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
58	1		UPDATE catalogo_venta SET precio_base=8.564.985,00, iva_producto=1.370.397,60, pvp=9.935.382,60 WHERE id_producto_venta=3	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
59	1		UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=4	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
60	1		UPDATE catalogo_venta SET precio_base=95.166,50, iva_producto=15.226,64, pvp=110.393,14 WHERE id_producto_venta=5	2019-07-13 20:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	\N
61	1	::1	UPDATE catalogo_venta SET precio_base=111.465,20, iva_producto=17.834,43, pvp=129.299,63 WHERE id_producto_venta=1	2019-07-13 21:37:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
62	1	::1	UPDATE catalogo_venta SET precio_base=122.611,50, iva_producto=19.617,84, pvp=142.229,34 WHERE id_producto_venta=1	2019-07-13 21:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
63	1	::1	UPDATE catalogo_venta SET precio_base=134.872,10, iva_producto=21.579,54, pvp=156.451,64 WHERE id_producto_venta=1	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
64	1	::1	UPDATE catalogo_venta SET precio_base=157.023,90, iva_producto=25.123,82, pvp=182.147,72 WHERE id_producto_venta=2	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
65	1	::1	UPDATE catalogo_venta SET precio_base=9.421.483,50, iva_producto=1.507.437,36, pvp=10.928.920,86 WHERE id_producto_venta=3	2019-07-13 21:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
66	1	::1	UPDATE catalogo_venta SET precio_base=148.359,20, iva_producto=23.737,47, pvp=172.096,67 WHERE id_producto_venta=1	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
67	1	::1	UPDATE catalogo_venta SET precio_base=172.725,30, iva_producto=27.636,05, pvp=200.361,35 WHERE id_producto_venta=2	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
68	1	::1	UPDATE catalogo_venta SET precio_base=10.363.631,30, iva_producto=1.658.181,01, pvp=12.021.812,31 WHERE id_producto_venta=3	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
69	1	::1	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=4	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
70	1	::1	UPDATE catalogo_venta SET precio_base=104.682,60, iva_producto=16.749,22, pvp=121.431,82 WHERE id_producto_venta=5	2019-07-13 21:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
71	1	::1	UPDATE empresa SET rif_empresa=J-407404032, nombre_empresa=YURAL C.A., direccion_empresa=Venezuela - Tàchira San Cristòbal. Sector la Concordia AV.  Lucio Oquendo Al frente del Restaurante el Fogón de la Abuela. Al Lado de la Central Telefónica de CANTV. \r\n                                  , telefono_empresa=0276-3489493, correo_empresa=yuralrepuestos@gmail.comsss	2019-07-13 21:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarEmpresa.php	40:e2:30:20:75:cd
72	1	::1	UPDATE catalogo_venta SET precio_base=197.464,30, iva_producto=31.594,29, pvp=229.058,59 WHERE id_producto_venta=1	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
73	1	::1	UPDATE catalogo_venta SET precio_base=229.895,60, iva_producto=36.783,30, pvp=266.678,90 WHERE id_producto_venta=2	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
74	1	::1	UPDATE catalogo_venta SET precio_base=13.793.992,30, iva_producto=2.207.038,77, pvp=16.001.031,07 WHERE id_producto_venta=3	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
75	1	::1	UPDATE catalogo_venta SET precio_base=139.331,50, iva_producto=22.293,04, pvp=161.624,54 WHERE id_producto_venta=4	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
76	1	::1	UPDATE catalogo_venta SET precio_base=139.331,50, iva_producto=22.293,04, pvp=161.624,54 WHERE id_producto_venta=5	2019-07-13 22:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.46 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarGanIvaProdu.php	40:e2:30:20:75:cd
77	1	::1	INSERT INTO proveedores (id_usuario_a, nombre_proveedor, razon_social_proveedor, direccion_proveedor, telef_proveedor, tipo_producto, correo_proveedor, estatus)\r\n\r\n    \t \t\tVALUES\r\n\r\n    \t\t(1, johara, V-24743016, tariba calle 3 mas arriba del cementerio, 0276-55555555, Repuestos Varios, johara@pabon.com, 1)	2019-07-16 21:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroProveedor.php	dc:a2:66:70:cc:27
78	1	::1	INSERT INTO proveedores (id_usuario_a, nombre_proveedor, razon_social_proveedor, direccion_proveedor, telef_proveedor, tipo_producto, correo_proveedor, estatus)\r\n\r\n    \t \t\tVALUES\r\n\r\n    \t\t(1, joharita, V-24743017, en el centro calle 5 , 0276-55555555, Repuestos Varios, joharaamor@pabon.com, 1)	2019-07-16 21:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroProveedor.php	dc:a2:66:70:cc:27
79	1	::1	INSERT INTO catalogo_venta \r\n\t\t    \t\t(codigo_producto_v, nombre_producto_v, id_usuario_a, categoria, marca, descripcion, imagen, tipo_unidad, productos_vendidos, productos_disponibles, precio_base, iva_producto, pvp, numero_pedido, estatus, precio_costo)\r\n\t\t            VALUES\r\n\t\t        (ACC1497, embobinado magneto, 1, Accesorios para Motociclistas, ckj, prueba prueba, ../imagenesRepuestos/14352478_1109745255740710_114956751111561373_o.jpg, Unidad, 0, 20, 650.650,00, 104.104,00, 754.754,00, 12, 1, 500.500,00)	2019-07-16 21:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroMercancia.php	dc:a2:66:70:cc:27
80	1	::1	UPDATE catalogo_venta SET nombre_producto_v=prueba , id_usuario_a=1, marca=KEEWAY, descripcion=CASCO KEEWAY, tipo_unidad=Unico,  productos_disponibles=7 where codigo_producto_v=ACC2528	2019-07-16 22:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	dc:a2:66:70:cc:27
81	1	::1	UPDATE proveedores SET id_usuario_a=1, nombre_proveedor=adamsitossss, razon_social_proveedor=J-407404032, direccion_proveedor=tachira san cristoba                                        , telef_proveedor=0276-3489493, tipo_producto=Repuestos Varios, correo_proveedor=yuralrepuestos@gmail.com where id_proveedor=2	2019-07-16 22:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProveedor.php	dc:a2:66:70:cc:27
82	1	::1	UPDATE proveedores SET estatus=0 where id_proveedor=2	2019-07-16 22:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarProveedor.php	dc:a2:66:70:cc:27
83	1	::1	UPDATE proveedores SET estatus=0 where id_proveedor=2	2019-07-16 22:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarProveedor.php	dc:a2:66:70:cc:27
84	1	::1	UPDATE proveedores SET estatus=1 where id_proveedor=2	2019-07-16 22:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProvAdmin.php	dc:a2:66:70:cc:27
85	1	::1	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1012	2019-07-16 22:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	dc:a2:66:70:cc:27
86	1	::1	SELECT * FROM apartado WHERE id_apartado_usuario = 62 and id_usuario =3 and estatus=1	2019-07-16 22:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
87	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=64 and id_usuario=3 and estatus=1UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=41 and id_usuario=3 and id_producto_venta=6 and estatus=1UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
88	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=65 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=42 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
89	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=68 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=45 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
90	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=69 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=46 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
91	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=70 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=47 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
92	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=71 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=48 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
93	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=72 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=49 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 22:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
94	1	::1		2019-07-16 22:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
95	1	::1		2019-07-16 22:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
96	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=75 and id_usuario=3 and estatus=1	2019-07-16 23:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
97	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=76 and id_usuario=3 and estatus=1	2019-07-16 23:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
98	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=77 and id_usuario=3 and estatus=1	2019-07-16 23:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
99	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=78	2019-07-16 23:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
100	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=79	2019-07-16 23:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
101	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=80 and id_usuario=3 and estatus=1	2019-07-16 23:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
102	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=81 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=58 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
103	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=82 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=59 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
104	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=83 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=60 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
105	1	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=84 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=61 and id_usuario=3 and id_producto_venta=6 and estatus=1, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6	2019-07-16 23:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarApartadoAdmin.php	dc:a2:66:70:cc:27
106	1	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=85, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=85	2019-07-16 23:31:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
107	1	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=86, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=86	2019-07-16 23:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
108	1	::1	UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=4	2019-07-16 23:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
109	1	::1	sqlLog1, sqlLog2, sqlLog3	2019-07-16 23:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
110	1	::1	SELECT * FROM ventas_productos where id_venta_producto=8, SELECT * FROM ventas_productos where id_venta_producto=8, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=8	2019-07-16 23:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
111	1	::1	SELECT * FROM ventas_productos where id_venta_producto=7, SELECT * FROM ventas_productos where id_venta_producto=7, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=7	2019-07-17 00:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
112	1	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=90, UPDATE catalogo_venta SET productos_disponibles=20 WHERE id_producto_venta=6, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=90	2019-07-17 00:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
113	1	::1	SELECT * FROM ventas_productos where id_venta_producto=4	2019-07-17 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	dc:a2:66:70:cc:27
114	1	::1	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=89, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=8, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=89	2019-07-17 00:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	dc:a2:66:70:cc:27
115	1	::1	SELECT * FROM ventas_productos where id_venta_producto=10, SELECT * FROM ventas_productos where id_venta_producto=10, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=10	2019-07-17 00:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
116	1	::1	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=93, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=11, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=93	2019-07-17 00:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	dc:a2:66:70:cc:27
117	1	::1	UPDATE detalle_apartado SET estatus=10 WHERE id_apartado=88, UPDATE ventas_productos SET estatus=10 WHERE id_venta_producto=7, UPDATE apartado SET estatus=10 WHERE id_apartado_usuario=88	2019-07-17 00:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaVerificada.php	dc:a2:66:70:cc:27
118	1	::1	UPDATE catalogo_venta SET productos_vendidos=7, productos_disponibles=5 WHERE id_producto_venta=4, UPDATE ventas_productos SET estatus=0 WHERE id_venta_producto=5, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=59, UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=59	2019-07-17 00:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarVenta.php	dc:a2:66:70:cc:27
119	1	::1	UPDATE opiniones SET estatus=0 where id_opinion=1	2019-07-17 00:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/opinar/eliminarOpinion.php	dc:a2:66:70:cc:27
120	1	::1	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-17 00:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	dc:a2:66:70:cc:27
121	1	::1	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-17 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	dc:a2:66:70:cc:27
122	1	::1	UPDATE usuario SET estatus=0 where id_usuario=3	2019-07-18 00:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	dc:a2:66:70:cc:27
123	1	::1	UPDATE usuario SET estatus=1 where id_usuario=3	2019-07-18 00:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/activarUsuario.php	dc:a2:66:70:cc:27
124	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:28, 1, 3, 754.754,00)	2019-07-18 00:28:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
125	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (94, 6, 1, 18/07/2019 00:29, 1, 3, 754.754,00)	2019-07-18 00:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
126	3	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=74, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
127	3	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=94 and id_usuario=3 and id_detalle_apartado=73, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
128	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=94 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=72 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=11 WHERE id_producto_venta=6	2019-07-18 00:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
129	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:48, 1), UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:48, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
130	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (95, 6, 1, 18/07/2019 00:48, 1, 3, 754.754,00)	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
131	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=95 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=76 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=10 WHERE id_producto_venta=6	2019-07-18 00:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
132	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:49, 1), UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:49, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:49:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
133	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
134	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
135	3	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=78, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
136	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (96, 6, 1, 18/07/2019 00:50, 1, 3, 754.754,00)	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
137	3	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=96 and id_usuario=3 and id_detalle_apartado=79, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
138	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=96 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=77 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=9 WHERE id_producto_venta=6	2019-07-18 00:50:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
139	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:51, 1), UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:51, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
140	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
141	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (97, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
142	3	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=97 and id_usuario=3 and id_detalle_apartado=80, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
143	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=97 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=81 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=8 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
144	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:53, 1), UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
145	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (98, 6, 1, 18/07/2019 00:53, 1, 3, 754.754,00)	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
146	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=98 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=82 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=7 WHERE id_producto_venta=6	2019-07-18 00:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
147	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:55, 1), UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:55, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
148	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (99, 6, 1, 18/07/2019 00:55, 1, 3, 754.754,00)	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
149	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=99 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=83 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=6 WHERE id_producto_venta=6	2019-07-18 00:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
150	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:56, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (, 6, 1, 18/07/2019 00:56, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
151	3	::1	SELECT * FROM apartado WHERE estatus=1 and id_usuario =3 ORDER BY id_apartado_usuario DESC LIMIT 1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad)\r\n\r\n                                    VALUES\r\n\r\n                                (100, 6, 1, 18/07/2019 00:56, 1, 3, 754.754,00)	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
152	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=100 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=84 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
153	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 00:57, 1), UPDATE catalogo_venta SET productos_disponibles=4 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (101, 6, 1, 18/07/2019 00:57, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 00:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
154	3	::1	UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=101 and id_usuario=3 and estatus=1, UPDATE detalle_apartado SET estatus=0 WHERE id_detalle_apartado=85 and id_usuario=3 and id_producto_venta=6, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=6	2019-07-18 00:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoUser.php	dc:a2:66:70:cc:27
155	1	::1	UPDATE catalogo_venta SET nombre_producto_v=embobinado magnetos, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	dc:a2:66:70:cc:27
156	1	::1	UPDATE catalogo_venta SET nombre_producto_v=embobinado magnetos, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	dc:a2:66:70:cc:27
157	1	::1	UPDATE catalogo_venta SET nombre_producto_v=embobinado magneto, id_usuario_a=1, marca=ckj, descripcion=prueba prueba, tipo_unidad=Unidad,  productos_disponibles=5 where codigo_producto_v=ACC1497	2019-07-18 01:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarProducto.php	dc:a2:66:70:cc:27
158	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:13, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (102, 6, 2, 18/07/2019 01:13, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
159	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:40, 1), UPDATE catalogo_venta SET productos_disponibles=2 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (103, 6, 1, 18/07/2019 01:40, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
160	3	::1	UPDATE catalogo_venta SET productos_vendidos=6 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=103 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=103 and id_usuario=3, 	2019-07-18 01:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	dc:a2:66:70:cc:27
161	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (104, 1, 2, 18/07/2019 01:41, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
162	3	::1	UPDATE catalogo_venta SET productos_vendidos=10 WHERE id_producto_venta=1, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=104 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=104 and id_usuario=3, 	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	dc:a2:66:70:cc:27
163	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:41, 1), UPDATE catalogo_venta SET productos_disponibles=0 WHERE id_producto_venta=6, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (105, 6, 2, 18/07/2019 01:41, 1, 3, 754.754,00, 650.650,00,0.16, 0.35)	2019-07-18 01:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
164	3	::1	UPDATE catalogo_venta SET productos_vendidos=8 WHERE id_producto_venta=6, UPDATE apartado SET estatus=2 WHERE id_apartado_usuario=105 and id_usuario=3, UPDATE detalle_apartado SET estatus=2 WHERE id_apartado=105 and id_usuario=3, INSERT INTO ventas_productos (id_apartado, id_banco_usuario, id_banco_empresa, monto_cancelado, fecha_hora_venta, estatus, numero_referencia, id_usuario, iva, ganancia, precio_base) \r\n\t\t\t\t\tVALUES \r\n\t\t\t(105, 3, 2, 1.509.508,00, 18/07/2019 01:42, 2, 12112313, 3, 0.16, 0.35, 650.650,00) 	2019-07-18 01:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/pago/pagoUsuario.php	dc:a2:66:70:cc:27
183	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=106	2019-07-21 16:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
165	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 18/07/2019 01:43, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (106, 1, 2, 18/07/2019 01:43, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-18 01:43:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
166	1	::1	SELECT * FROM ventas_productos where id_venta_producto=15, SELECT * FROM ventas_productos where id_venta_producto=15, UPDATE ventas_productos SET estatus=3 WHERE id_venta_producto=15	2019-07-18 01:45:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/ventaPendiente.php	dc:a2:66:70:cc:27
167	3	::1	INSERT INTO opiniones (opinion_usuario, id_usuario, fecha_hora_opinion, id_venta_producto, estatus, id_producto_venta)\r\n    \t \t\tVALUES\r\n    (asdadasdadadsasasdasdadasdadsasd, 3, 18/07/2019 01:48, 15, 1, 6)	2019-07-18 01:48:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/opinar/opinarUsua.php	dc:a2:66:70:cc:27
168	1	::1	INSERT INTO bancos_empresa (nomb_banc_empr, tipo_cuen_empr, num_cuen_empr, titu_cuen_empr, cedu_cuen_empr, estatus) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (100% BANCO, Corriente, 01561231312312312312, adasdasdasd, V-12312312, 1)	2019-07-18 01:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoEmpresa.php	dc:a2:66:70:cc:27
169	1	::1	UPDATE bancos_empresa SET nomb_banc_empr=BANCO CARONI, C.A. BANCO UNIVERSAL, tipo_cuen_empr=Corriente, titu_cuen_empr=yurley contreras, cedu_cuen_empr=V-24819181, num_cuen_empr=01280924200000108889 WHERE id_banco_empresa=2 	2019-07-18 01:53:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarBancoEmpresa.php	dc:a2:66:70:cc:27
170	1	::1	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 01:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	dc:a2:66:70:cc:27
171	1	::1	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=3	2019-07-18 01:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	dc:a2:66:70:cc:27
172	1	::1	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 01:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	dc:a2:66:70:cc:27
173	1	::1	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 01:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	dc:a2:66:70:cc:27
174	1	::1	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 02:00:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	dc:a2:66:70:cc:27
175	1	::1	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 02:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	dc:a2:66:70:cc:27
176	1	::1	UPDATE bancos_empresa SET nomb_banc_empr=BANCO BANESCO, tipo_cuen_empr=Corriente, titu_cuen_empr=yurley contreras, cedu_cuen_empr=V-24819181, num_cuen_empr=01340924200000108889 WHERE id_banco_empresa=2 	2019-07-18 02:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarBancoEmpresa.php	dc:a2:66:70:cc:27
177	1	::1	UPDATE bancos_empresa SET estatus=0 where id_banco_empresa=2	2019-07-18 02:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/eliminarBancoEmpresa.php	dc:a2:66:70:cc:27
178	1	::1	UPDATE bancos_empresa SET estatus=1 where id_banco_empresa=2	2019-07-18 02:19:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoEmpresa.php	dc:a2:66:70:cc:27
179	3	::1	INSERT INTO bancos_usuario (nomb_banc_usua, tipo_cuen_usua, num_cuen_usua, titu_cuen_usua, cedu_cuen_usua, estatus, id_usuario) \r\n\t\t\t\t\tVALUES \r\n\t\t\t\t\t (BANCO ACTIVO BANCO COMERCIAL, C.A., Corriente, 01711312312312312312, prueba prueba, J-123123123, 1, 3)	2019-07-18 02:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroBancoUsuario.php	dc:a2:66:70:cc:27
180	3	::1	UPDATE bancos_usuario SET estatus=1 where id_banco_usuario=3	2019-07-18 02:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarBancoUsuario.php	dc:a2:66:70:cc:27
181	9999	::1	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus)\r\n\r\n\t \t\tVALUES\r\n\r\n\t\t(J-2312123170, asdadadhhhhhh, postgres, cristkjsalgado2@hotmail.com, 24819181, Aragua, 12 de Febrero, asdasdasd2123123132asddaddasdas,0414, 1321312, 0248, 1231212, 1, 1)	2019-07-18 03:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	dc:a2:66:70:cc:27
182	9999	::1	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n\t\t(J-1231231231, asdadasdasdasdasdasd, postgres, asdassssasd@asdasd.com, 24819181, Aragua, 12 de Octubre, 123123123123123123123123asdasdas,0416, 1231231, 0252, 1231312, 1, 1, Donde Nacistes?, omaira)	2019-07-18 03:38:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	dc:a2:66:70:cc:27
184	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:11, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (107, 1, 2, 21/07/2019 16:11, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
185	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=107	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
186	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:11, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (108, 1, 2, 21/07/2019 16:11, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
187	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
188	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (109, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
189	1	::1	, , UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=108	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
190	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=109	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
191	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:14, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (110, 1, 2, 21/07/2019 16:14, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
192	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:15, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (111, 1, 2, 21/07/2019 16:15, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
193	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=111	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
194	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:15, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (112, 1, 2, 21/07/2019 16:15, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
195	1	::1	, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=112	2019-07-21 16:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
196	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 16:17, 1), UPDATE catalogo_venta SET productos_disponibles=3 WHERE id_producto_venta=1, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (113, 1, 2, 21/07/2019 16:17, 1, 3, 60.320,00, 52.000,00,0.16, 0.35)	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
197	1	::1	UPDATE detalle_apartado SET estatus=0 WHERE id_apartado=113, UPDATE catalogo_venta SET productos_disponibles=5 WHERE id_producto_venta=1, UPDATE apartado SET estatus=0 WHERE id_apartado_usuario=113	2019-07-21 16:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/borrarApartadoCompletoAdmin.php	dc:a2:66:70:cc:27
198	3	::1	INSERT INTO apartado (id_usuario, fecha_hora_apartado, estatus)\r\n\r\n                                    VALUES\r\n\r\n                                (3, 21/07/2019 18:42, 1), UPDATE catalogo_venta SET productos_disponibles=12 WHERE id_producto_venta=3, INSERT INTO detalle_apartado (id_apartado, id_producto_venta, cantidad_apartada, fecha_hora, estatus, id_usuario, precio_unidad, precio_base, iva, ganancia)\r\n\r\n                                    VALUES\r\n\r\n                                (114, 3, 3, 21/07/2019 18:42, 1, 3, 6.786.000,00, 5.850.000,00,0.16, 0.35)	2019-07-21 18:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/apartados/apartar.php	dc:a2:66:70:cc:27
199	1	::1	UPDATE usuario SET estatus=0 where id_usuario=2	2019-07-22 09:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/desactivarUsuario.php	0a:00:27:00:00:0b
200	1	::1	UPDATE catalogo_venta SET estatus=1 where codigo_producto_v=ACC1497	2019-07-22 09:18:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/restaurarProducto.php	0a:00:27:00:00:0b
201	9999	::1	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n    (V-12312312, prueba, prueba, prueba@gmail.com, 12345678, Táchira, Cordero, prueba prueba prueba prueba ,0416, 8264285, 0252, 1231232, 1, 1, Cual fue tu mejor amigo de la infancia?, omaira)	2019-08-12 22:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	dc:a2:66:70:cc:27
202	9999	::1	INSERT INTO usuario (cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, bandera, estatus, pregunta_seguridad, respuesta_seguridad)\r\n\r\n\t \t\tVALUES\r\n\r\n    (V-24131321, asdadasd, adsasdasd, pruebaalgado_22@hotmail.com, 12345678, Miranda, Barrio el Manguito Petare, sector la catedral calle 3 con carrera 3,0414, 1231231, 0248, 1231313, 1, 1, Cual fue tu mejor amigo de la infancia?, omaira)	2019-08-12 22:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/Registros_sql/registroUsuario.php	dc:a2:66:70:cc:27
203	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5	2019-08-13 17:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
204	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 17:56:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
205	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 17:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
206	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
207	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
208	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
209	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
210	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
211	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
212	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
213	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
214	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
215	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
216	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
217	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:18:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
218	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:19:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
219	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
220	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:20:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
221	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:21:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
222	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:22:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
223	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
224	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:25:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
225	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-13 18:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
226	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 10	2019-08-13 18:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
227	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=false WHERE id_ele = 1	2019-08-13 18:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
228	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2	2019-08-14 09:30:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
229	1	::1	 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 09:40:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
230	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = undefined UPDATE usuario SET bandera = 1 WHERE id_usuario=undefined	2019-08-14 09:41:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
231	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 1 WHERE id_usuario=4	2019-08-14 09:42:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
232	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
233	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
234	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:54:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
235	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
236	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 1 WHERE id_usuario=1	2019-08-14 09:55:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
237	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 5 UPDATE usuario SET bandera = 10 WHERE id_usuario=4	2019-08-14 09:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
238	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 5 UPDATE usuario SET bandera = 1 WHERE id_usuario=4	2019-08-14 09:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
239	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:52:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
240	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:58:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
241	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 13:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
242	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = undefined UPDATE usuario SET bandera = 10 WHERE id_usuario=undefined	2019-08-14 14:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
243	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:01:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
244	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
245	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
246	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:04:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
247	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
248	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = undefined UPDATE usuario SET bandera = 1 WHERE id_usuario=undefined	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
249	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
250	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
251	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true reg_adm=truemod_int=truemod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
252	1	::1	UPDATE elementos SET \r\ncat_acc=false, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 14:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
253	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true  reg_adm=true mod_int=true mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
254	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true  reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:12:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
255	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
256	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:13:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
257	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=false,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=false, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:15:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
258	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=false,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
259	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
260	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:23:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
261	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:24:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
262	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true WHERE id_ele = 2 UPDATE usuario SET bandera = 1 WHERE id_usuario=11	2019-08-14 14:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
263	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=false , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
264	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=false,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
265	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:29:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
266	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:44:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
267	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:47:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
268	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:57:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
269	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 14:59:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
270	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=true, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:02:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
271	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=trueWHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:05:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
272	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
273	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:06:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
274	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:09:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
275	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=false, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
276	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=false WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 15:10:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
277	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:39:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
278	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=false,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true , reg_adm=false, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-14 16:51:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
279	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-14 17:03:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
280	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:07:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
281	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
282	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:08:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
283	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
284	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:11:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
285	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, WHERE id_ele = 4 UPDATE usuario SET bandera = 10 WHERE id_usuario=3	2019-08-15 09:14:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
286	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:16:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
287	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:17:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
288	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=true,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true , reg_adm=true, mod_int=true, mod_log=true WHERE id_ele = 3 UPDATE usuario SET bandera = 10 WHERE id_usuario=1	2019-08-15 09:26:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
289	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=false  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:27:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
290	1	::1	UPDATE elementos SET \r\ncat_acc=true, \r\ncat_car=true,\r\ncat_cha=true,\r\ncat_ele=false,\r\ncat_fre=true,\r\ncat_mot=true,\r\ncat_sus=true,\r\ncat_tra=true,\r\nmod_apa=true  WHERE id_ele = 4 UPDATE usuario SET bandera = 1 WHERE id_usuario=3	2019-08-15 09:32:00	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36	/pagina yural bootstrap pg/interfaz/modificar/modificarElementos.php	dc:a2:66:70:cc:27
\.


--
-- Name: pre_logs_id_pre_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pre_logs_id_pre_log_seq', 290, true);


--
-- Name: pre_logs_id_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pre_logs_id_usu_seq', 1, false);


--
-- Name: pre_logs_ip_usu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pre_logs_ip_usu_seq', 1, false);


--
-- Name: pre_logs_sql_exe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pre_logs_sql_exe_seq', 1, false);


--
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedores (id_proveedor, id_usuario_a, nombre_proveedor, razon_social_proveedor, direccion_proveedor, telef_proveedor, tipo_producto, correo_proveedor, estatus) FROM stdin;
3	1	adams	J-409822-3	valencia estado carabobo                                                                                                                                            	0276-3453298	Cauchos	provadams@hotmail.com	1
4	1	adasd	J-407404083-2	asdasdasdasdasdasd	0276-3489493	Accesorios	provadams@gmail.comk	1
5	1	johara	V-24743016	tariba calle 3 mas arriba del cementerio	0276-55555555	Repuestos Varios	johara@pabon.com	1
6	1	joharita	V-24743017	en el centro calle 5 	0276-55555555	Repuestos Varios	joharaamor@pabon.com	1
2	1	adamsitossss	J-407404032	tachira san cristoba                                        	0276-3489493	Repuestos Varios	yuralrepuestos@gmail.com	1
\.


--
-- Name: proveedores_correo_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_correo_proveedor_seq', 1, false);


--
-- Name: proveedores_direccion_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_direccion_proveedor_seq', 1, false);


--
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_id_proveedor_seq', 6, true);


--
-- Name: proveedores_id_usuario_a_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_id_usuario_a_seq', 1, false);


--
-- Name: proveedores_nombre_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_nombre_proveedor_seq', 1, false);


--
-- Name: proveedores_razon_social_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_razon_social_proveedor_seq', 1, false);


--
-- Name: proveedores_telef_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_telef_proveedor_seq', 1, false);


--
-- Name: proveedores_tipo_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proveedores_tipo_producto_seq', 1, false);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY session (id_session, id_usuario, fecha_hora_session, ip_session, permiso_session, mac_usu) FROM stdin;
11	1	24/04/2018 10:30	::1	0	\N
12	2	24/04/2018 10:32	::1	1	\N
13	2	24/04/2018 10:33	::1	0	\N
14	1	24/04/2018 10:34	::1	1	\N
15	1	24/04/2018 10:41	::1	0	\N
16	3	24/04/2018 10:47	::1	1	\N
17	3	24/04/2018 10:52	::1	0	\N
18	1	24/04/2018 10:53	::1	1	\N
19	1	24/04/2018 11:04	::1	0	\N
20	3	24/04/2018 11:12	::1	1	\N
21	3	24/04/2018 11:12	::1	0	\N
22	1	01/05/2018 18:53	::1	1	\N
23	1	01/05/2018 19:44	::1	0	\N
24	2	01/05/2018 19:44	::1	1	\N
25	2	01/05/2018 19:52	::1	0	\N
26	1	01/05/2018 20:00	::1	1	\N
27	1	01/05/2018 20:01	::1	0	\N
28	1	01/05/2018 20:02	::1	1	\N
29	1	01/05/2018 20:11	::1	0	\N
30	2	01/05/2018 20:11	::1	1	\N
31	2	01/05/2018 20:11	::1	0	\N
32	1	01/05/2018 20:14	::1	1	\N
33	1	01/05/2018 20:14	::1	0	\N
34	2	01/05/2018 20:15	::1	1	\N
35	2	01/05/2018 20:19	::1	0	\N
36	1	01/05/2018 20:21	::1	1	\N
37	1	01/05/2018 20:28	::1	0	\N
38	2	01/05/2018 20:29	::1	1	\N
39	2	01/05/2018 20:47	::1	0	\N
40	1	01/05/2018 21:00	::1	1	\N
41	1	01/05/2018 21:36	::1	0	\N
42	2	01/05/2018 21:36	::1	1	\N
43	2	01/05/2018 21:46	::1	0	\N
44	1	01/05/2018 21:47	::1	1	\N
45	1	01/05/2018 21:48	::1	0	\N
46	1	01/05/2018 21:49	::1	1	\N
47	1	01/05/2018 21:50	::1	0	\N
48	1	01/05/2018 21:53	::1	1	\N
49	1	01/05/2018 21:54	::1	0	\N
50	1	01/05/2018 21:55	::1	1	\N
51	1	01/05/2018 21:57	::1	0	\N
52	1	01/05/2018 21:58	::1	1	\N
53	1	01/05/2018 22:00	::1	0	\N
54	1	01/05/2018 22:00	::1	1	\N
55	1	01/05/2018 22:00	::1	0	\N
56	2	27/05/2018 11:35	::1	1	\N
57	2	27/05/2018 17:22	::1	0	\N
58	1	27/05/2018 17:34	::1	1	\N
59	1	29/05/2018 08:31	::1	0	\N
60	2	29/05/2018 08:32	::1	1	\N
61	2	29/05/2018 09:13	::1	0	\N
62	2	29/05/2018 10:18	::1	1	\N
63	2	29/05/2018 10:44	::1	0	\N
64	1	29/05/2018 10:46	::1	1	\N
65	1	29/05/2018 10:58	::1	0	\N
66	1	03/06/2018 16:37	::1	1	\N
67	1	03/06/2018 18:12	::1	0	\N
68	1	03/06/2018 18:12	::1	1	\N
69	1	03/06/2018 18:12	::1	0	\N
70	2	03/06/2018 18:13	::1	1	\N
71	2	03/06/2018 18:13	::1	0	\N
72	1	03/06/2018 18:15	::1	1	\N
73	1	03/06/2018 18:16	::1	0	\N
74	1	03/06/2018 18:17	::1	1	\N
75	1	03/06/2018 23:02	::1	0	\N
76	2	07/06/2018 05:23	::1	1	\N
77	2	11/06/2018 08:54	::1	1	\N
78	1	08/07/2019 19:49	::1	0	\N
79	3	08/07/2019 19:52	::1	1	\N
80	1	08/07/2019 20:27	::1	1	\N
81	1	10/07/2019 20:06	::1	1	\N
82	3	10/07/2019 20:11	::1	1	\N
83	1	11/07/2019 09:53	::1	1	\N
86	1	16/07/2019 21:45	::1	1	\N
87	3	16/07/2019 22:14	::1	1	\N
88	1	16/07/2019 23:17	::1	0	\N
89	1	16/07/2019 23:17	::1	1	dc:a2:66:70:cc:27
90	3	16/07/2019 23:17	::1	0	\N
91	3	16/07/2019 23:18	::1	1	dc:a2:66:70:cc:27
92	1	16/07/2019 23:19	::1	0	dc:a2:66:70:cc:27
93	1	16/07/2019 23:21	::1	1	dc:a2:66:70:cc:27
94	3	18/07/2019 00:01	::1	1	dc:a2:66:70:cc:27
95	3	18/07/2019 02:27	::1	0	\N
96	1	18/07/2019 02:53	::1	0	dc:a2:66:70:cc:27
97	3	19/07/2019 08:19	::1	1	dc:a2:66:70:cc:27
98	1	19/07/2019 08:20	::1	1	dc:a2:66:70:cc:27
99	1	20/07/2019 09:43	::1	1	dc:a2:66:70:cc:27
100	3	20/07/2019 09:43	::1	1	dc:a2:66:70:cc:27
101	1	20/07/2019 17:36	::1	1	dc:a2:66:70:cc:27
102	3	21/07/2019 16:10	::1	1	dc:a2:66:70:cc:27
103	1	21/07/2019 19:33	::1	0	dc:a2:66:70:cc:27
104	1	21/07/2019 20:14	::1	1	dc:a2:66:70:cc:27
105	1	22/07/2019 08:49	::1	1	0a:00:27:00:00:0b
106	1	22/07/2019 08:58	::1	0	0a:00:27:00:00:0b
107	1	22/07/2019 08:59	::1	1	0a:00:27:00:00:0b
108	1	22/07/2019 09:02	::1	0	0a:00:27:00:00:0b
109	1	22/07/2019 09:04	::1	1	0a:00:27:00:00:0b
110	1	12/08/2019 22:06	::1	1	dc:a2:66:70:cc:27
111	1	12/08/2019 22:38	::1	0	dc:a2:66:70:cc:27
112	1	12/08/2019 22:42	::1	1	dc:a2:66:70:cc:27
113	1	14/08/2019 09:56	::1	1	dc:a2:66:70:cc:27
114	3	14/08/2019 15:16	::1	1	dc:a2:66:70:cc:27
115	1	14/08/2019 15:32	::1	1	dc:a2:66:70:cc:27
116	1	14/08/2019 15:36	::1	1	dc:a2:66:70:cc:27
117	1	14/08/2019 15:38	::1	1	dc:a2:66:70:cc:27
118	1	14/08/2019 15:39	::1	1	dc:a2:66:70:cc:27
119	1	14/08/2019 15:41	::1	1	dc:a2:66:70:cc:27
120	1	14/08/2019 15:57	::1	1	dc:a2:66:70:cc:27
121	1	15/08/2019 09:06	::1	1	dc:a2:66:70:cc:27
122	1	15/08/2019 09:26	::1	1	dc:a2:66:70:cc:27
123	1	15/08/2019 09:27	::1	0	dc:a2:66:70:cc:27
124	3	15/08/2019 09:27	::1	1	dc:a2:66:70:cc:27
\.


--
-- Name: session_fecha_hora_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_fecha_hora_session_seq', 1, false);


--
-- Name: session_id_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_id_session_seq', 124, true);


--
-- Name: session_ip_session_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_ip_session_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id_usuario, cedula_usuario, nombre_usuario, apellido_usuario, correo_usuario, contra_usuario, estado, ciudad, direccion, cod_telef_pers, telef_personal, cod_telef_hog, telef_hog, pregunta_seguridad, respuesta_seguridad, bandera, estatus) FROM stdin;
5	V-24819181	asdadsadadassdasd	postgresasdasd	asssd@asdasd.com	248191812312	Barinas	Chameta	adasdadasdasdasdsdasdasdadadasd	0424	0123010	0239	1231231	\N	\N	1	1
6	V-23121231	asdadad	postgres	cristhiasnsalgado_22@hotmail.com	24819181	Mérida	Chachopo	asdasdasd2123123132asddaddasdas	0414	1321312	0248	1231212	\N	\N	1	1
7	J-2312123177	asdadadhhhhhh	postgres	cristkjsalgado_22@hotmail.com	24819181	Mérida	Chiguará	asdasdasd2123123132asddaddasdas	0414	1321312	0248	1231212	\N	\N	1	1
8	J-2312123170	asdadadhhhhhh	postgres	cristkjsalgado2@hotmail.com	24819181	Aragua	12 de Febrero	asdasdasd2123123132asddaddasdas	0414	1321312	0248	1231212	\N	\N	1	1
9	J-1231231231	asdadasdasdasdasdasd	postgres	asdassssasd@asdasd.com	24819181	Aragua	12 de Octubre	123123123123123123123123asdasdas	0416	1231231	0252	1231312	Donde Nacistes?	omaira	1	1
2	70000000	leydi	carrero	leydi@gmail.com	12345678	Táchira	San Cristóbal	vivo por hay	0426	8292827	0416	8272829	Cual fue tu mejor amigo de la infancia?	omaira	1	0
10	V-12312312	prueba	prueba	prueba@gmail.com	12345678	Táchira	Cordero	prueba prueba prueba prueba 	0416	8264285	0252	1231232	Cual fue tu mejor amigo de la infancia?	omaira	1	1
1	24819181	adams contreras	contreras ramirez	adamspurry@gmail.com	adams2481	Táchira	San Cristóbal	centro de la ciudad calle 5 la catedral	0416	1231232	0416	1312312	Cual fue tu mejor amigo de la infancia?	LEIDY	10	1
3	18987289	vidermid	sanchez	vidermid@gmail.com	24819181	Cojedes	El Baúl	en mi casa	0416	6785672	0212	2789654	Donde Nacistes?	en el hospital	1	1
4	J-123123123	asdadsad	postgres	asdasasd@asdasd.com	24819181	Mérida	Chocantá	adasdadasdasdasdadasasdadasdasd	0424	0123010	0239	1231231	\N	\N	1	1
11	V-24131321	asdadasd	adsasdasd	pruebaalgado_22@hotmail.com	12345678	Miranda	Barrio el Manguito Petare	sector la catedral calle 3 con carrera 3	0414	1231231	0248	1231313	Cual fue tu mejor amigo de la infancia?	omaira	1	1
\.


--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 11, true);


--
-- Data for Name: ventas_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas_productos (id_venta_producto, id_apartado, id_banco_usuario, id_banco_empresa, monto_cancelado, estatus, numero_referencia, id_usuario, fecha_hora_venta, iva, ganancia, precio_base) FROM stdin;
3	57	3	2	150.800,00	10	231231212	3	2019-07-11 09:53:00	0.16	0.30	\N
6	87	3	2	1.509.508,00	0	12312313231212121212	3	2019-07-16 23:52:00	0.16	0.35	650.650,00
9	91	3	2	2.264.262,00	10	12312313123	3	2019-07-17 00:02:00	0.16	0.35	650.650,00
4	58	3	2	150.800,00	10	23123123	3	2019-07-11 10:38:00	0.16	0.30	65.000,00
8	89	3	2	13.798.200,00	10	1231212	3	2019-07-16 23:57:00	0.16	0.35	97.500,00
10	92	3	2	1.509.508,00	0	12313131123123	3	2019-07-17 00:08:00	0.16	0.35	650.650,00
11	93	3	2	20.358.000,00	10	23123123	3	2019-07-17 00:09:00	0.16	0.35	5.850.000,00
7	88	3	2	226.200,00	10	123123123	3	2019-07-16 23:54:00	0.16	0.35	97.500,00
5	59	3	2	150.800,00	0	231231211	3	2019-07-11 10:47:00	0.16	0.30	65.000,00
12	102	3	2	1.509.508,00	2	12312313123	3	2019-07-18 01:14:00	0.16	0.35	650.650,00
13	103	3	2	754.754,00	2	1231312312	3	2019-07-18 01:40:00	0.16	0.35	650.650,00
14	104	3	2	120.640,00	2	1231231312313	3	2019-07-18 01:41:00	0.16	0.35	52.000,00
15	105	3	2	1.509.508,00	3	12112313	3	2019-07-18 01:42:00	0.16	0.35	650.650,00
\.


--
-- Name: ventas_productos_id_venta_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ventas_productos_id_venta_producto_seq', 15, true);


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
-- Name: elementos update_elementos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER update_elementos BEFORE UPDATE ON elementos FOR EACH ROW EXECUTE PROCEDURE func_update();


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

