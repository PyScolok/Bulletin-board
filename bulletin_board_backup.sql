PGDMP         1                 x            bulletin_board_db    12.3    12.3    y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            {           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            |           1262    17431    bulletin_board_db    DATABASE     �   CREATE DATABASE bulletin_board_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
 !   DROP DATABASE bulletin_board_db;
                postgres    false            �            1259    17432 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    17435    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    202            }           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    203            �            1259    17437    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    17440    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    204            ~           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    205            �            1259    17442    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    17445    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    206                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    207            �            1259    17447    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    17454    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    208            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    209            �            1259    17456    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    17459    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    210            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    17461    django_flatpage    TABLE     4  CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);
 #   DROP TABLE public.django_flatpage;
       public         heap    postgres    false            �            1259    17467    django_flatpage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.django_flatpage_id_seq;
       public          postgres    false    212            �           0    0    django_flatpage_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;
          public          postgres    false    213            �            1259    17469    django_flatpage_sites    TABLE     �   CREATE TABLE public.django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);
 )   DROP TABLE public.django_flatpage_sites;
       public         heap    postgres    false            �            1259    17472    django_flatpage_sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_flatpage_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.django_flatpage_sites_id_seq;
       public          postgres    false    214            �           0    0    django_flatpage_sites_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;
          public          postgres    false    215            �            1259    17474    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    17480    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    216            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    217            �            1259    17482    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    17488    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         heap    postgres    false            �            1259    17491    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public          postgres    false    219            �           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
          public          postgres    false    220            �            1259    17493    easy_thumbnails_source    TABLE     �   CREATE TABLE public.easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);
 *   DROP TABLE public.easy_thumbnails_source;
       public         heap    postgres    false            �            1259    17496    easy_thumbnails_source_id_seq    SEQUENCE     �   CREATE SEQUENCE public.easy_thumbnails_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.easy_thumbnails_source_id_seq;
       public          postgres    false    221            �           0    0    easy_thumbnails_source_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.easy_thumbnails_source_id_seq OWNED BY public.easy_thumbnails_source.id;
          public          postgres    false    222            �            1259    17498    easy_thumbnails_thumbnail    TABLE     �   CREATE TABLE public.easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);
 -   DROP TABLE public.easy_thumbnails_thumbnail;
       public         heap    postgres    false            �            1259    17501     easy_thumbnails_thumbnail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.easy_thumbnails_thumbnail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.easy_thumbnails_thumbnail_id_seq;
       public          postgres    false    223            �           0    0     easy_thumbnails_thumbnail_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.easy_thumbnails_thumbnail_id_seq OWNED BY public.easy_thumbnails_thumbnail.id;
          public          postgres    false    224            �            1259    17503 #   easy_thumbnails_thumbnaildimensions    TABLE     K  CREATE TABLE public.easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);
 7   DROP TABLE public.easy_thumbnails_thumbnaildimensions;
       public         heap    postgres    false            �            1259    17508 *   easy_thumbnails_thumbnaildimensions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq;
       public          postgres    false    225            �           0    0 *   easy_thumbnails_thumbnaildimensions_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq OWNED BY public.easy_thumbnails_thumbnaildimensions.id;
          public          postgres    false    226            �            1259    17510    main_ad    TABLE     �  CREATE TABLE public.main_ad (
    id integer NOT NULL,
    title character varying(40) NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    contacts text NOT NULL,
    image character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    author_id integer NOT NULL,
    rubric_id integer NOT NULL
);
    DROP TABLE public.main_ad;
       public         heap    postgres    false            �            1259    17516    main_ad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_ad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.main_ad_id_seq;
       public          postgres    false    227            �           0    0    main_ad_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.main_ad_id_seq OWNED BY public.main_ad.id;
          public          postgres    false    228            �            1259    17518    main_additionalimage    TABLE     �   CREATE TABLE public.main_additionalimage (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    ad_id integer NOT NULL
);
 (   DROP TABLE public.main_additionalimage;
       public         heap    postgres    false            �            1259    17521    main_additionalimage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_additionalimage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.main_additionalimage_id_seq;
       public          postgres    false    229            �           0    0    main_additionalimage_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.main_additionalimage_id_seq OWNED BY public.main_additionalimage.id;
          public          postgres    false    230            �            1259    17523    main_advanceduser    TABLE     -  CREATE TABLE public.main_advanceduser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    is_activated boolean NOT NULL,
    send_messages boolean NOT NULL
);
 %   DROP TABLE public.main_advanceduser;
       public         heap    postgres    false            �            1259    17529    main_advanceduser_groups    TABLE     �   CREATE TABLE public.main_advanceduser_groups (
    id integer NOT NULL,
    advanceduser_id integer NOT NULL,
    group_id integer NOT NULL
);
 ,   DROP TABLE public.main_advanceduser_groups;
       public         heap    postgres    false            �            1259    17532    main_advanceduser_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_advanceduser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.main_advanceduser_groups_id_seq;
       public          postgres    false    232            �           0    0    main_advanceduser_groups_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.main_advanceduser_groups_id_seq OWNED BY public.main_advanceduser_groups.id;
          public          postgres    false    233            �            1259    17534    main_advanceduser_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_advanceduser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.main_advanceduser_id_seq;
       public          postgres    false    231            �           0    0    main_advanceduser_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.main_advanceduser_id_seq OWNED BY public.main_advanceduser.id;
          public          postgres    false    234            �            1259    17536 "   main_advanceduser_user_permissions    TABLE     �   CREATE TABLE public.main_advanceduser_user_permissions (
    id integer NOT NULL,
    advanceduser_id integer NOT NULL,
    permission_id integer NOT NULL
);
 6   DROP TABLE public.main_advanceduser_user_permissions;
       public         heap    postgres    false            �            1259    17539 )   main_advanceduser_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_advanceduser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.main_advanceduser_user_permissions_id_seq;
       public          postgres    false    235            �           0    0 )   main_advanceduser_user_permissions_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.main_advanceduser_user_permissions_id_seq OWNED BY public.main_advanceduser_user_permissions.id;
          public          postgres    false    236            �            1259    17823    main_comment    TABLE     �   CREATE TABLE public.main_comment (
    id integer NOT NULL,
    author character varying(30) NOT NULL,
    text text NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    ad_id integer NOT NULL
);
     DROP TABLE public.main_comment;
       public         heap    postgres    false            �            1259    17821    main_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.main_comment_id_seq;
       public          postgres    false    250            �           0    0    main_comment_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.main_comment_id_seq OWNED BY public.main_comment.id;
          public          postgres    false    249            �            1259    17541    main_rubric    TABLE     �   CREATE TABLE public.main_rubric (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    "order" smallint NOT NULL,
    super_rubric_id integer
);
    DROP TABLE public.main_rubric;
       public         heap    postgres    false            �            1259    17544    main_rubric_id_seq    SEQUENCE     �   CREATE SEQUENCE public.main_rubric_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.main_rubric_id_seq;
       public          postgres    false    237            �           0    0    main_rubric_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.main_rubric_id_seq OWNED BY public.main_rubric.id;
          public          postgres    false    238            �            1259    17546    social_auth_association    TABLE     <  CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);
 +   DROP TABLE public.social_auth_association;
       public         heap    postgres    false            �            1259    17552    social_auth_association_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.social_auth_association_id_seq;
       public          postgres    false    239            �           0    0    social_auth_association_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;
          public          postgres    false    240            �            1259    17554    social_auth_code    TABLE     �   CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);
 $   DROP TABLE public.social_auth_code;
       public         heap    postgres    false            �            1259    17557    social_auth_code_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.social_auth_code_id_seq;
       public          postgres    false    241            �           0    0    social_auth_code_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;
          public          postgres    false    242            �            1259    17559    social_auth_nonce    TABLE     �   CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);
 %   DROP TABLE public.social_auth_nonce;
       public         heap    postgres    false            �            1259    17562    social_auth_nonce_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.social_auth_nonce_id_seq;
       public          postgres    false    243            �           0    0    social_auth_nonce_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;
          public          postgres    false    244            �            1259    17564    social_auth_partial    TABLE     T  CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);
 '   DROP TABLE public.social_auth_partial;
       public         heap    postgres    false            �            1259    17571    social_auth_partial_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.social_auth_partial_id_seq;
       public          postgres    false    245            �           0    0    social_auth_partial_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;
          public          postgres    false    246            �            1259    17573    social_auth_usersocialauth    TABLE     =  CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);
 .   DROP TABLE public.social_auth_usersocialauth;
       public         heap    postgres    false            �            1259    17579 !   social_auth_usersocialauth_id_seq    SEQUENCE     �   CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.social_auth_usersocialauth_id_seq;
       public          postgres    false    247            �           0    0 !   social_auth_usersocialauth_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;
          public          postgres    false    248                       2604    17581    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202                       2604    17582    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204                       2604    17583    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206                       2604    17584    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208                       2604    17585    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210                       2604    17586    django_flatpage id    DEFAULT     x   ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);
 A   ALTER TABLE public.django_flatpage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212                       2604    17587    django_flatpage_sites id    DEFAULT     �   ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);
 G   ALTER TABLE public.django_flatpage_sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214                       2604    17588    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216                        2604    17589    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            !           2604    17590    easy_thumbnails_source id    DEFAULT     �   ALTER TABLE ONLY public.easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_source_id_seq'::regclass);
 H   ALTER TABLE public.easy_thumbnails_source ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221            "           2604    17591    easy_thumbnails_thumbnail id    DEFAULT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnail_id_seq'::regclass);
 K   ALTER TABLE public.easy_thumbnails_thumbnail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223            #           2604    17592 &   easy_thumbnails_thumbnaildimensions id    DEFAULT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnaildimensions_id_seq'::regclass);
 U   ALTER TABLE public.easy_thumbnails_thumbnaildimensions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            &           2604    17593 
   main_ad id    DEFAULT     h   ALTER TABLE ONLY public.main_ad ALTER COLUMN id SET DEFAULT nextval('public.main_ad_id_seq'::regclass);
 9   ALTER TABLE public.main_ad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227            '           2604    17594    main_additionalimage id    DEFAULT     �   ALTER TABLE ONLY public.main_additionalimage ALTER COLUMN id SET DEFAULT nextval('public.main_additionalimage_id_seq'::regclass);
 F   ALTER TABLE public.main_additionalimage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229            (           2604    17595    main_advanceduser id    DEFAULT     |   ALTER TABLE ONLY public.main_advanceduser ALTER COLUMN id SET DEFAULT nextval('public.main_advanceduser_id_seq'::regclass);
 C   ALTER TABLE public.main_advanceduser ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    231            )           2604    17596    main_advanceduser_groups id    DEFAULT     �   ALTER TABLE ONLY public.main_advanceduser_groups ALTER COLUMN id SET DEFAULT nextval('public.main_advanceduser_groups_id_seq'::regclass);
 J   ALTER TABLE public.main_advanceduser_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            *           2604    17597 %   main_advanceduser_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.main_advanceduser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.main_advanceduser_user_permissions_id_seq'::regclass);
 T   ALTER TABLE public.main_advanceduser_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235            2           2604    17826    main_comment id    DEFAULT     r   ALTER TABLE ONLY public.main_comment ALTER COLUMN id SET DEFAULT nextval('public.main_comment_id_seq'::regclass);
 >   ALTER TABLE public.main_comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            +           2604    17598    main_rubric id    DEFAULT     p   ALTER TABLE ONLY public.main_rubric ALTER COLUMN id SET DEFAULT nextval('public.main_rubric_id_seq'::regclass);
 =   ALTER TABLE public.main_rubric ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            ,           2604    17599    social_auth_association id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);
 I   ALTER TABLE public.social_auth_association ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            -           2604    17600    social_auth_code id    DEFAULT     z   ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);
 B   ALTER TABLE public.social_auth_code ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241            .           2604    17601    social_auth_nonce id    DEFAULT     |   ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);
 C   ALTER TABLE public.social_auth_nonce ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243            /           2604    17602    social_auth_partial id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);
 E   ALTER TABLE public.social_auth_partial ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245            1           2604    17603    social_auth_usersocialauth id    DEFAULT     �   ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);
 L   ALTER TABLE public.social_auth_usersocialauth ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247            F          0    17432 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    202   �\      H          0    17437    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    204   ]      J          0    17442    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    206   4]      L          0    17447    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    208   a      N          0    17456    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    210   �d      P          0    17461    django_flatpage 
   TABLE DATA           y   COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
    public          postgres    false    212   �e      R          0    17469    django_flatpage_sites 
   TABLE DATA           I   COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
    public          postgres    false    214   Ug      T          0    17474    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    216   xg      V          0    17482    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    218   �j      W          0    17488    django_site 
   TABLE DATA           7   COPY public.django_site (id, domain, name) FROM stdin;
    public          postgres    false    219   :l      Y          0    17493    easy_thumbnails_source 
   TABLE DATA           R   COPY public.easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
    public          postgres    false    221   gl      [          0    17498    easy_thumbnails_thumbnail 
   TABLE DATA           `   COPY public.easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
    public          postgres    false    223   Om      ]          0    17503 #   easy_thumbnails_thumbnaildimensions 
   TABLE DATA           ^   COPY public.easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
    public          postgres    false    225   in      _          0    17510    main_ad 
   TABLE DATA           ~   COPY public.main_ad (id, title, description, price, contacts, image, is_active, created_at, author_id, rubric_id) FROM stdin;
    public          postgres    false    227   �n      a          0    17518    main_additionalimage 
   TABLE DATA           @   COPY public.main_additionalimage (id, image, ad_id) FROM stdin;
    public          postgres    false    229   r      c          0    17523    main_advanceduser 
   TABLE DATA           �   COPY public.main_advanceduser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, is_activated, send_messages) FROM stdin;
    public          postgres    false    231   �r      d          0    17529    main_advanceduser_groups 
   TABLE DATA           Q   COPY public.main_advanceduser_groups (id, advanceduser_id, group_id) FROM stdin;
    public          postgres    false    232   3t      g          0    17536 "   main_advanceduser_user_permissions 
   TABLE DATA           `   COPY public.main_advanceduser_user_permissions (id, advanceduser_id, permission_id) FROM stdin;
    public          postgres    false    235   Pt      v          0    17823    main_comment 
   TABLE DATA           V   COPY public.main_comment (id, author, text, is_active, created_at, ad_id) FROM stdin;
    public          postgres    false    250   mt      i          0    17541    main_rubric 
   TABLE DATA           I   COPY public.main_rubric (id, name, "order", super_rubric_id) FROM stdin;
    public          postgres    false    237   �u      k          0    17546    social_auth_association 
   TABLE DATA           o   COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
    public          postgres    false    239   v      m          0    17554    social_auth_code 
   TABLE DATA           R   COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
    public          postgres    false    241   3v      o          0    17559    social_auth_nonce 
   TABLE DATA           N   COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
    public          postgres    false    243   Pv      q          0    17564    social_auth_partial 
   TABLE DATA           _   COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
    public          postgres    false    245   mv      s          0    17573    social_auth_usersocialauth 
   TABLE DATA           o   COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
    public          postgres    false    247   �v      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    203            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    205            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 88, true);
          public          postgres    false    207            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 23, true);
          public          postgres    false    209            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 22, true);
          public          postgres    false    211            �           0    0    django_flatpage_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.django_flatpage_id_seq', 1, true);
          public          postgres    false    213            �           0    0    django_flatpage_sites_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 1, true);
          public          postgres    false    215            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 45, true);
          public          postgres    false    217            �           0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);
          public          postgres    false    220            �           0    0    easy_thumbnails_source_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.easy_thumbnails_source_id_seq', 8, true);
          public          postgres    false    222            �           0    0     easy_thumbnails_thumbnail_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.easy_thumbnails_thumbnail_id_seq', 8, true);
          public          postgres    false    224            �           0    0 *   easy_thumbnails_thumbnaildimensions_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.easy_thumbnails_thumbnaildimensions_id_seq', 1, false);
          public          postgres    false    226            �           0    0    main_ad_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.main_ad_id_seq', 6, true);
          public          postgres    false    228            �           0    0    main_additionalimage_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.main_additionalimage_id_seq', 17, true);
          public          postgres    false    230            �           0    0    main_advanceduser_groups_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.main_advanceduser_groups_id_seq', 1, false);
          public          postgres    false    233            �           0    0    main_advanceduser_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.main_advanceduser_id_seq', 17, true);
          public          postgres    false    234            �           0    0 )   main_advanceduser_user_permissions_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.main_advanceduser_user_permissions_id_seq', 1, false);
          public          postgres    false    236            �           0    0    main_comment_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.main_comment_id_seq', 9, true);
          public          postgres    false    249            �           0    0    main_rubric_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.main_rubric_id_seq', 7, true);
          public          postgres    false    238            �           0    0    social_auth_association_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);
          public          postgres    false    240            �           0    0    social_auth_code_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);
          public          postgres    false    242            �           0    0    social_auth_nonce_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);
          public          postgres    false    244            �           0    0    social_auth_partial_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);
          public          postgres    false    246            �           0    0 !   social_auth_usersocialauth_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, true);
          public          postgres    false    248            5           2606    17605    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    202            :           2606    17607 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    204    204            =           2606    17609 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    204            7           2606    17611    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    202            @           2606    17613 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    206    206            B           2606    17615 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    206            E           2606    17617 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    208            H           2606    17619 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    210    210            J           2606    17621 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    210            L           2606    17623 $   django_flatpage django_flatpage_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.django_flatpage DROP CONSTRAINT django_flatpage_pkey;
       public            postgres    false    212            Q           2606    17625 M   django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);
 w   ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq;
       public            postgres    false    214    214            S           2606    17627 0   django_flatpage_sites django_flatpage_sites_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_sites_pkey;
       public            postgres    false    214            V           2606    17629 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    216            Y           2606    17631 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    218            ]           2606    17633 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public            postgres    false    219            _           2606    17635    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public            postgres    false    219            c           2606    17637 2   easy_thumbnails_source easy_thumbnails_source_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.easy_thumbnails_source DROP CONSTRAINT easy_thumbnails_source_pkey;
       public            postgres    false    221            g           2606    17639 M   easy_thumbnails_source easy_thumbnails_source_storage_hash_name_481ce32d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq UNIQUE (storage_hash, name);
 w   ALTER TABLE ONLY public.easy_thumbnails_source DROP CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq;
       public            postgres    false    221    221            i           2606    17641 Y   easy_thumbnails_thumbnail easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq UNIQUE (storage_hash, name, source_id);
 �   ALTER TABLE ONLY public.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq;
       public            postgres    false    223    223    223            m           2606    17643 8   easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thumbnail_pkey;
       public            postgres    false    223            r           2606    17645 L   easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions DROP CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey;
       public            postgres    false    225            t           2606    17647 X   easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);
 �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions DROP CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key;
       public            postgres    false    225            x           2606    17649    main_ad main_ad_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.main_ad
    ADD CONSTRAINT main_ad_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.main_ad DROP CONSTRAINT main_ad_pkey;
       public            postgres    false    227            |           2606    17651 .   main_additionalimage main_additionalimage_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.main_additionalimage
    ADD CONSTRAINT main_additionalimage_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.main_additionalimage DROP CONSTRAINT main_additionalimage_pkey;
       public            postgres    false    229            �           2606    17653 X   main_advanceduser_groups main_advanceduser_groups_advanceduser_id_group_id_b26c975b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_groups
    ADD CONSTRAINT main_advanceduser_groups_advanceduser_id_group_id_b26c975b_uniq UNIQUE (advanceduser_id, group_id);
 �   ALTER TABLE ONLY public.main_advanceduser_groups DROP CONSTRAINT main_advanceduser_groups_advanceduser_id_group_id_b26c975b_uniq;
       public            postgres    false    232    232            �           2606    17655 6   main_advanceduser_groups main_advanceduser_groups_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.main_advanceduser_groups
    ADD CONSTRAINT main_advanceduser_groups_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.main_advanceduser_groups DROP CONSTRAINT main_advanceduser_groups_pkey;
       public            postgres    false    232                       2606    17657 (   main_advanceduser main_advanceduser_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.main_advanceduser
    ADD CONSTRAINT main_advanceduser_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.main_advanceduser DROP CONSTRAINT main_advanceduser_pkey;
       public            postgres    false    231            �           2606    17659 b   main_advanceduser_user_permissions main_advanceduser_user_p_advanceduser_id_permissi_5c308ce3_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_user_permissions
    ADD CONSTRAINT main_advanceduser_user_p_advanceduser_id_permissi_5c308ce3_uniq UNIQUE (advanceduser_id, permission_id);
 �   ALTER TABLE ONLY public.main_advanceduser_user_permissions DROP CONSTRAINT main_advanceduser_user_p_advanceduser_id_permissi_5c308ce3_uniq;
       public            postgres    false    235    235            �           2606    17661 J   main_advanceduser_user_permissions main_advanceduser_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_user_permissions
    ADD CONSTRAINT main_advanceduser_user_permissions_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.main_advanceduser_user_permissions DROP CONSTRAINT main_advanceduser_user_permissions_pkey;
       public            postgres    false    235            �           2606    17663 0   main_advanceduser main_advanceduser_username_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.main_advanceduser
    ADD CONSTRAINT main_advanceduser_username_key UNIQUE (username);
 Z   ALTER TABLE ONLY public.main_advanceduser DROP CONSTRAINT main_advanceduser_username_key;
       public            postgres    false    231            �           2606    17831    main_comment main_comment_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.main_comment
    ADD CONSTRAINT main_comment_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.main_comment DROP CONSTRAINT main_comment_pkey;
       public            postgres    false    250            �           2606    17665     main_rubric main_rubric_name_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.main_rubric
    ADD CONSTRAINT main_rubric_name_key UNIQUE (name);
 J   ALTER TABLE ONLY public.main_rubric DROP CONSTRAINT main_rubric_name_key;
       public            postgres    false    237            �           2606    17667    main_rubric main_rubric_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.main_rubric
    ADD CONSTRAINT main_rubric_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.main_rubric DROP CONSTRAINT main_rubric_pkey;
       public            postgres    false    237            �           2606    17669 4   social_auth_association social_auth_association_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.social_auth_association DROP CONSTRAINT social_auth_association_pkey;
       public            postgres    false    239            �           2606    17671 O   social_auth_association social_auth_association_server_url_handle_078befa2_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);
 y   ALTER TABLE ONLY public.social_auth_association DROP CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq;
       public            postgres    false    239    239            �           2606    17673 :   social_auth_code social_auth_code_email_code_801b2d02_uniq 
   CONSTRAINT     |   ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);
 d   ALTER TABLE ONLY public.social_auth_code DROP CONSTRAINT social_auth_code_email_code_801b2d02_uniq;
       public            postgres    false    241    241            �           2606    17675 &   social_auth_code social_auth_code_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.social_auth_code DROP CONSTRAINT social_auth_code_pkey;
       public            postgres    false    241            �           2606    17677 (   social_auth_nonce social_auth_nonce_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.social_auth_nonce DROP CONSTRAINT social_auth_nonce_pkey;
       public            postgres    false    243            �           2606    17679 K   social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);
 u   ALTER TABLE ONLY public.social_auth_nonce DROP CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq;
       public            postgres    false    243    243    243            �           2606    17681 ,   social_auth_partial social_auth_partial_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.social_auth_partial DROP CONSTRAINT social_auth_partial_pkey;
       public            postgres    false    245            �           2606    17683 :   social_auth_usersocialauth social_auth_usersocialauth_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersocialauth_pkey;
       public            postgres    false    247            �           2606    17685 P   social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);
 z   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq;
       public            postgres    false    247    247            3           1259    17686    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    202            8           1259    17687 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    204            ;           1259    17688 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    204            >           1259    17689 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    206            C           1259    17690 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    208            F           1259    17691 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    208            O           1259    17692 *   django_flatpage_sites_flatpage_id_078bbc8b    INDEX     s   CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);
 >   DROP INDEX public.django_flatpage_sites_flatpage_id_078bbc8b;
       public            postgres    false    214            T           1259    17693 &   django_flatpage_sites_site_id_bfd8ea84    INDEX     k   CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);
 :   DROP INDEX public.django_flatpage_sites_site_id_bfd8ea84;
       public            postgres    false    214            M           1259    17694    django_flatpage_url_41612362    INDEX     W   CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);
 0   DROP INDEX public.django_flatpage_url_41612362;
       public            postgres    false    212            N           1259    17695 !   django_flatpage_url_41612362_like    INDEX     p   CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);
 5   DROP INDEX public.django_flatpage_url_41612362_like;
       public            postgres    false    212            W           1259    17696 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    218            Z           1259    17697 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    218            [           1259    17698     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public            postgres    false    219            `           1259    17699 $   easy_thumbnails_source_name_5fe0edc6    INDEX     g   CREATE INDEX easy_thumbnails_source_name_5fe0edc6 ON public.easy_thumbnails_source USING btree (name);
 8   DROP INDEX public.easy_thumbnails_source_name_5fe0edc6;
       public            postgres    false    221            a           1259    17700 )   easy_thumbnails_source_name_5fe0edc6_like    INDEX     �   CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON public.easy_thumbnails_source USING btree (name varchar_pattern_ops);
 =   DROP INDEX public.easy_thumbnails_source_name_5fe0edc6_like;
       public            postgres    false    221            d           1259    17701 ,   easy_thumbnails_source_storage_hash_946cbcc9    INDEX     w   CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9 ON public.easy_thumbnails_source USING btree (storage_hash);
 @   DROP INDEX public.easy_thumbnails_source_storage_hash_946cbcc9;
       public            postgres    false    221            e           1259    17702 1   easy_thumbnails_source_storage_hash_946cbcc9_like    INDEX     �   CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON public.easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);
 E   DROP INDEX public.easy_thumbnails_source_storage_hash_946cbcc9_like;
       public            postgres    false    221            j           1259    17703 '   easy_thumbnails_thumbnail_name_b5882c31    INDEX     m   CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31 ON public.easy_thumbnails_thumbnail USING btree (name);
 ;   DROP INDEX public.easy_thumbnails_thumbnail_name_b5882c31;
       public            postgres    false    223            k           1259    17704 ,   easy_thumbnails_thumbnail_name_b5882c31_like    INDEX     �   CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON public.easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);
 @   DROP INDEX public.easy_thumbnails_thumbnail_name_b5882c31_like;
       public            postgres    false    223            n           1259    17705 ,   easy_thumbnails_thumbnail_source_id_5b57bc77    INDEX     w   CREATE INDEX easy_thumbnails_thumbnail_source_id_5b57bc77 ON public.easy_thumbnails_thumbnail USING btree (source_id);
 @   DROP INDEX public.easy_thumbnails_thumbnail_source_id_5b57bc77;
       public            postgres    false    223            o           1259    17706 /   easy_thumbnails_thumbnail_storage_hash_f1435f49    INDEX     }   CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49 ON public.easy_thumbnails_thumbnail USING btree (storage_hash);
 C   DROP INDEX public.easy_thumbnails_thumbnail_storage_hash_f1435f49;
       public            postgres    false    223            p           1259    17707 4   easy_thumbnails_thumbnail_storage_hash_f1435f49_like    INDEX     �   CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON public.easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);
 H   DROP INDEX public.easy_thumbnails_thumbnail_storage_hash_f1435f49_like;
       public            postgres    false    223            u           1259    17708    main_ad_author_id_5659b247    INDEX     S   CREATE INDEX main_ad_author_id_5659b247 ON public.main_ad USING btree (author_id);
 .   DROP INDEX public.main_ad_author_id_5659b247;
       public            postgres    false    227            v           1259    17709    main_ad_created_at_1a3e4c19    INDEX     U   CREATE INDEX main_ad_created_at_1a3e4c19 ON public.main_ad USING btree (created_at);
 /   DROP INDEX public.main_ad_created_at_1a3e4c19;
       public            postgres    false    227            y           1259    17710    main_ad_rubric_id_a98f1f81    INDEX     S   CREATE INDEX main_ad_rubric_id_a98f1f81 ON public.main_ad USING btree (rubric_id);
 .   DROP INDEX public.main_ad_rubric_id_a98f1f81;
       public            postgres    false    227            z           1259    17711 #   main_additionalimage_ad_id_8d04a991    INDEX     e   CREATE INDEX main_additionalimage_ad_id_8d04a991 ON public.main_additionalimage USING btree (ad_id);
 7   DROP INDEX public.main_additionalimage_ad_id_8d04a991;
       public            postgres    false    229            �           1259    17712 1   main_advanceduser_groups_advanceduser_id_882d5050    INDEX     �   CREATE INDEX main_advanceduser_groups_advanceduser_id_882d5050 ON public.main_advanceduser_groups USING btree (advanceduser_id);
 E   DROP INDEX public.main_advanceduser_groups_advanceduser_id_882d5050;
       public            postgres    false    232            �           1259    17713 *   main_advanceduser_groups_group_id_ba839d8f    INDEX     s   CREATE INDEX main_advanceduser_groups_group_id_ba839d8f ON public.main_advanceduser_groups USING btree (group_id);
 >   DROP INDEX public.main_advanceduser_groups_group_id_ba839d8f;
       public            postgres    false    232            }           1259    17714 '   main_advanceduser_is_activated_030f1df0    INDEX     m   CREATE INDEX main_advanceduser_is_activated_030f1df0 ON public.main_advanceduser USING btree (is_activated);
 ;   DROP INDEX public.main_advanceduser_is_activated_030f1df0;
       public            postgres    false    231            �           1259    17715 ;   main_advanceduser_user_permissions_advanceduser_id_c885c20c    INDEX     �   CREATE INDEX main_advanceduser_user_permissions_advanceduser_id_c885c20c ON public.main_advanceduser_user_permissions USING btree (advanceduser_id);
 O   DROP INDEX public.main_advanceduser_user_permissions_advanceduser_id_c885c20c;
       public            postgres    false    235            �           1259    17716 9   main_advanceduser_user_permissions_permission_id_1f88ee98    INDEX     �   CREATE INDEX main_advanceduser_user_permissions_permission_id_1f88ee98 ON public.main_advanceduser_user_permissions USING btree (permission_id);
 M   DROP INDEX public.main_advanceduser_user_permissions_permission_id_1f88ee98;
       public            postgres    false    235            �           1259    17717 (   main_advanceduser_username_15b854df_like    INDEX     ~   CREATE INDEX main_advanceduser_username_15b854df_like ON public.main_advanceduser USING btree (username varchar_pattern_ops);
 <   DROP INDEX public.main_advanceduser_username_15b854df_like;
       public            postgres    false    231            �           1259    17838    main_comment_ad_id_bff24c40    INDEX     U   CREATE INDEX main_comment_ad_id_bff24c40 ON public.main_comment USING btree (ad_id);
 /   DROP INDEX public.main_comment_ad_id_bff24c40;
       public            postgres    false    250            �           1259    17837     main_comment_created_at_ee17dcea    INDEX     _   CREATE INDEX main_comment_created_at_ee17dcea ON public.main_comment USING btree (created_at);
 4   DROP INDEX public.main_comment_created_at_ee17dcea;
       public            postgres    false    250            �           1259    17718    main_rubric_name_11e469c7_like    INDEX     j   CREATE INDEX main_rubric_name_11e469c7_like ON public.main_rubric USING btree (name varchar_pattern_ops);
 2   DROP INDEX public.main_rubric_name_11e469c7_like;
       public            postgres    false    237            �           1259    17719    main_rubric_order_77235d35    INDEX     U   CREATE INDEX main_rubric_order_77235d35 ON public.main_rubric USING btree ("order");
 .   DROP INDEX public.main_rubric_order_77235d35;
       public            postgres    false    237            �           1259    17720 $   main_rubric_super_rubric_id_58ac1630    INDEX     g   CREATE INDEX main_rubric_super_rubric_id_58ac1630 ON public.main_rubric USING btree (super_rubric_id);
 8   DROP INDEX public.main_rubric_super_rubric_id_58ac1630;
       public            postgres    false    237            �           1259    17721    social_auth_code_code_a2393167    INDEX     [   CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);
 2   DROP INDEX public.social_auth_code_code_a2393167;
       public            postgres    false    241            �           1259    17722 #   social_auth_code_code_a2393167_like    INDEX     t   CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);
 7   DROP INDEX public.social_auth_code_code_a2393167_like;
       public            postgres    false    241            �           1259    17723 #   social_auth_code_timestamp_176b341f    INDEX     g   CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");
 7   DROP INDEX public.social_auth_code_timestamp_176b341f;
       public            postgres    false    241            �           1259    17724 &   social_auth_partial_timestamp_50f2119f    INDEX     m   CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");
 :   DROP INDEX public.social_auth_partial_timestamp_50f2119f;
       public            postgres    false    245            �           1259    17725 "   social_auth_partial_token_3017fea3    INDEX     c   CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);
 6   DROP INDEX public.social_auth_partial_token_3017fea3;
       public            postgres    false    245            �           1259    17726 '   social_auth_partial_token_3017fea3_like    INDEX     |   CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);
 ;   DROP INDEX public.social_auth_partial_token_3017fea3_like;
       public            postgres    false    245            �           1259    17727 '   social_auth_usersocialauth_uid_796e51dc    INDEX     m   CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);
 ;   DROP INDEX public.social_auth_usersocialauth_uid_796e51dc;
       public            postgres    false    247            �           1259    17728 ,   social_auth_usersocialauth_uid_796e51dc_like    INDEX     �   CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);
 @   DROP INDEX public.social_auth_usersocialauth_uid_796e51dc_like;
       public            postgres    false    247            �           1259    17729 +   social_auth_usersocialauth_user_id_17d28448    INDEX     u   CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);
 ?   DROP INDEX public.social_auth_usersocialauth_user_id_17d28448;
       public            postgres    false    247            �           2606    17730 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    2882    204    206            �           2606    17735 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    2871    204    202            �           2606    17740 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2890    206    210            �           2606    17745 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    208    210    2890            �           2606    17750 J   django_admin_log django_admin_log_user_id_c564eba6_fk_main_advanceduser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_main_advanceduser_id FOREIGN KEY (user_id) REFERENCES public.main_advanceduser(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_main_advanceduser_id;
       public          postgres    false    231    2943    208            �           2606    17755 L   django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl;
       public          postgres    false    212    214    2892            �           2606    17760 N   django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.django_flatpage_sites DROP CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id;
       public          postgres    false    2911    214    219            �           2606    17765 N   easy_thumbnails_thumbnail easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum    FK CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum FOREIGN KEY (source_id) REFERENCES public.easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.easy_thumbnails_thumbnail DROP CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum;
       public          postgres    false    2915    223    221            �           2606    17770 [   easy_thumbnails_thumbnaildimensions easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum    FK CONSTRAINT     �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum FOREIGN KEY (thumbnail_id) REFERENCES public.easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions DROP CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum;
       public          postgres    false    225    223    2925            �           2606    17775 :   main_ad main_ad_author_id_5659b247_fk_main_advanceduser_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_ad
    ADD CONSTRAINT main_ad_author_id_5659b247_fk_main_advanceduser_id FOREIGN KEY (author_id) REFERENCES public.main_advanceduser(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.main_ad DROP CONSTRAINT main_ad_author_id_5659b247_fk_main_advanceduser_id;
       public          postgres    false    227    2943    231            �           2606    17780 4   main_ad main_ad_rubric_id_a98f1f81_fk_main_rubric_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_ad
    ADD CONSTRAINT main_ad_rubric_id_a98f1f81_fk_main_rubric_id FOREIGN KEY (rubric_id) REFERENCES public.main_rubric(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.main_ad DROP CONSTRAINT main_ad_rubric_id_a98f1f81_fk_main_rubric_id;
       public          postgres    false    237    2964    227            �           2606    17785 F   main_additionalimage main_additionalimage_ad_id_8d04a991_fk_main_ad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_additionalimage
    ADD CONSTRAINT main_additionalimage_ad_id_8d04a991_fk_main_ad_id FOREIGN KEY (ad_id) REFERENCES public.main_ad(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.main_additionalimage DROP CONSTRAINT main_additionalimage_ad_id_8d04a991_fk_main_ad_id;
       public          postgres    false    227    229    2936            �           2606    17790 S   main_advanceduser_groups main_advanceduser_gr_advanceduser_id_882d5050_fk_main_adva    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_groups
    ADD CONSTRAINT main_advanceduser_gr_advanceduser_id_882d5050_fk_main_adva FOREIGN KEY (advanceduser_id) REFERENCES public.main_advanceduser(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.main_advanceduser_groups DROP CONSTRAINT main_advanceduser_gr_advanceduser_id_882d5050_fk_main_adva;
       public          postgres    false    232    2943    231            �           2606    17795 T   main_advanceduser_groups main_advanceduser_groups_group_id_ba839d8f_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_groups
    ADD CONSTRAINT main_advanceduser_groups_group_id_ba839d8f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.main_advanceduser_groups DROP CONSTRAINT main_advanceduser_groups_group_id_ba839d8f_fk_auth_group_id;
       public          postgres    false    202    232    2871            �           2606    17800 ]   main_advanceduser_user_permissions main_advanceduser_us_advanceduser_id_c885c20c_fk_main_adva    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_user_permissions
    ADD CONSTRAINT main_advanceduser_us_advanceduser_id_c885c20c_fk_main_adva FOREIGN KEY (advanceduser_id) REFERENCES public.main_advanceduser(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.main_advanceduser_user_permissions DROP CONSTRAINT main_advanceduser_us_advanceduser_id_c885c20c_fk_main_adva;
       public          postgres    false    231    235    2943            �           2606    17805 [   main_advanceduser_user_permissions main_advanceduser_us_permission_id_1f88ee98_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_advanceduser_user_permissions
    ADD CONSTRAINT main_advanceduser_us_permission_id_1f88ee98_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.main_advanceduser_user_permissions DROP CONSTRAINT main_advanceduser_us_permission_id_1f88ee98_fk_auth_perm;
       public          postgres    false    206    235    2882            �           2606    17832 6   main_comment main_comment_ad_id_bff24c40_fk_main_ad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_comment
    ADD CONSTRAINT main_comment_ad_id_bff24c40_fk_main_ad_id FOREIGN KEY (ad_id) REFERENCES public.main_ad(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.main_comment DROP CONSTRAINT main_comment_ad_id_bff24c40_fk_main_ad_id;
       public          postgres    false    250    2936    227            �           2606    17810 B   main_rubric main_rubric_super_rubric_id_58ac1630_fk_main_rubric_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.main_rubric
    ADD CONSTRAINT main_rubric_super_rubric_id_58ac1630_fk_main_rubric_id FOREIGN KEY (super_rubric_id) REFERENCES public.main_rubric(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.main_rubric DROP CONSTRAINT main_rubric_super_rubric_id_58ac1630_fk_main_rubric_id;
       public          postgres    false    237    237    2964            �           2606    17815 M   social_auth_usersocialauth social_auth_usersoci_user_id_17d28448_fk_main_adva    FK CONSTRAINT     �   ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersoci_user_id_17d28448_fk_main_adva FOREIGN KEY (user_id) REFERENCES public.main_advanceduser(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.social_auth_usersocialauth DROP CONSTRAINT social_auth_usersoci_user_id_17d28448_fk_main_adva;
       public          postgres    false    247    2943    231            F      x������ � �      H      x������ � �      J   �  x���Mn�0���)t�"�mI^�
�R�lHr��vW覫m��M�ҦW�oT�93L�	� "�=�Q�7T*�V]R�u�٭���+�
=~��v(3��.�n�0�M!8�`�l���n
��/��%��B��l���v�]'2k'dN�1����	[�EFZ��[��~w؋�5h�ezF��u�HJ=y� ��X�<V�n��.����[#0efd:�v"\1~A�E<Xd|�F#��el\�{�kF2-�Yd�g���#b`�c�ZCȺ
H��ڱ���e� �ވX��-X�T<,�?n��_l�1�W�F�ϛ�ʌ�9�����)	��$5N9�)�������ƪ���VMm���9P�����[$5�u�!��jv����u�⌜��笷IqV��f)Nʞ��2E�պ�A��֍��<�n9��K�GG� jb~F��!zf+���(R���@�Y�  ��<0`Rꁰ&`}��)�og�T��B����y7mf�<��+��XW����x�+y��*{�X�)�W���E��	��=�9���;�s$"�r��g0!��oW"uׂ�"`�S,H�!O� c�x�_}TG��t}z�����O�[E
7�A_�^�B1��
YV���EaN"4%s���0Y곺����D� `a�҄s�ߔ,�*�H$�Dp� ���O�|sz���[u��j͍H�d��9��@�,�S|�dN�8E�� sL�z���O����J㷧���N�$Z�C?�pT�q'�խi�զݚ�`�}���D{��?r�𲢽I�x���b�}���Co:��s�H�� ��(�U����*ȸb��xq؞wU���XÄ,X#a �",��sȖ�]0�Z$\z�eR�ۦ3���Rn�d�=h=Rǧ��<O�A|4����CFr~^*&�䃮�?�GW�.���?�D��W�V�FY�2�	�F �}eR��@F�ˤ>����)����D      L   �  x��Y�r�6>�O�ᩙZ�?�c/y��ʤ]��u�r�d&NO���c�9�	��'�� �Q@�� ��&������X�~��	K@�(��'����J�GV~N1��~5�?]��'�ܾ���}ݞ�ۏ�U]7ua�gϟf*�=�v�rF�$a%J`�3�=�}5[Tf�v�8�GC5AN������=SK���Rt�:��6'+k1n-)���V���hg/��0U
�=�'{a��ڿ����^������8���gqV=i�Eqp�r8^6���/N}��&�7Q���-��b>}�-�>k�L�>�E�e��(�����(���m�g�?^6���&�h�i@���d�
������ )Ԑ`�"� ���u�8��:;�!;�5������j+���|{D���:$=I�D�d�U��ܾ���e{n�q�h_���W��N�����m�rH�]ο�7���}e�s/�{�C�`jU�^��������ڋI7S����Ɓ�8�ɸ��hʕD?M��/��3��A��D��{���:��j�F���컋<Z�*z7�P12.��E�z���Ϫ�/�T'M��2ߵ�Yj	�=/`ݞXD�(ιS0�Kc!5X��੭�Z�2���pI��L�1j�����7;
M$�,����r+P7��"	��Ϛ�u%l�c)݇�-  {/\��H"%#��~It�
�>C�0m�֩iW�Z�@Cn�7 c��R�TK��.��^�*��:J�ϕE7���k=��N�`��8y�a�6�!�b��F *G�7"w�&(݇��Xc���������+�o�C?�a�w|Rq���d� �����e�?��4F75�K�ilth�	�1��e��S��ꄝ��/ר�$�O��C�Y����� \+=z�]v����ݟ�����ݗ��h���(��r#���թu J"�"ɝCArQ�D����wf9�      N   �   x�u��n� ��퇙j���ˤ��2�0L��QU�v�|>��l�0�ц�T�%?a��;72�Xf<��!�Ҽ�V��A��Cz��kY{�
����c=�O�\ǳ�ᠭ)b�@�v<��7�1˪s�H�]RGc�hGC�ݐ���i������)W�t��JeHN#�7)����KgC'���e˸�6O�7�t˲���!���ibIuUu��y�����qކ���6UG_YƯD��L��      P   g  x�U�A��0E��)�z��E�n��%�a!K)��Ez����!s��q�I�I���o��X�=u����_�>�t/Uh�jR�U��j=b-J�Q3AH��F.3(s�])��*%�&�8+Z@3i
�e%��{'#�T��H<V��G�4��.̕o;K-XML|��Â ���L{ȱ�h��g���N�l�O������3��0���g���r�D6s��4q�m��O�v1�P�߽V����p�����6��UF���'����O��'o�凲�z�Wd=�{
�m�n���:�C�;�=�ߦ���$�N�yоԕRXy�������vS�����4ے���k8� �+��      R      x�3�4�4����� �X      T   ]  x����n�0��ݧ���@$%Kʳ�XK=�T���Gˉ��Β���#M�$ɡ��P���	]"� �Wy��"A��0?�|E���i	(��^p�D׆�����q�/�6JJ5�(�C��Dp�A��rV��EZׄ�̻.��ѕ���:�PF
L�R3�Ψ��P��xL1�`��3E.)�GL�n�n���fD�����w�+�c�6ۅ1��y��r7އ�����ƒm3
�#��}N��y�����2ڶn]��Ýǲ��U f��,̓[!��$���S(2
/(gԱ���9�D�Ѹ0;��(���?O;n��*E�Đ	[�z�~kȨ`�f�c�ډ�D_@z��h'6D{�,?D=vvb4�S+�BW�h	����S��;���a���T�;0I���w�ځ`E�M8B�D�=֑!�C�t�܍�2�y$��)^�LV��rC��[{M�g���"&Y�㇢�ռ�ړ�+�Sd���CJ����s�يK�ދQ)��06�\��ݬ�<�͡���6� PS�2��B��K�@��:B�m����2�l�ds�5<�NH!�@��m&߀Lk��-D- �C"چH���	.�쯯������uE����k�棐���{_6�C��F�K�GKb_I�)v.�e'n�S#�66��
�K|�3���A���6@J3]$J�y<��'_ME�k����J�i��Yc��;��L-�kƷf���&�k��׏V���	�%�Kx�Xeg5�W�,��8&|M��໓�߆�w�)��� q��^������-5^�g����9^��̀�\$]�1}yp��j��l��V�Z���JbՄ���~�x�Fɯ����?�o�      V   E  x���Ɏ�0 �����'��,
��,����4sa
���#���8�y��ɟ�S/�q.�I�\\:�1 ʞ=�jY��<�Q�
�cI�c���\�2=%^�}W�N(�����p����W�X���D�f��,>6�&��fl���gU�^p�Ic2�����P�g�(�{A��5�Y|�I����
i��<ww,E��c���_�Y�@�Lc�_M�OX'�;Q?��<R�cg���Li�\kD�v8þǃ+�xC �Ud.�!�� j��4e��g���T�N�Yi�b�|�����;X*0 غf���\�:\��}.E����      W      x�3�L�H�-�I�K��Efs��qqq �<	�      Y   �   x���;n�@�Z:���C.�,ibI�*��"n�D�`32=��ĺE�#]����
쓠R�B�����礬|�v]ԺI��{��۬c�L*��X�����ڰ
�#V�Wj��Bp�>Ƃ=Q�M���"�2�X��'�a���Y�5��N4FQ���^�-�]s�M/P���Vg�w��h�jT���Ѽ^�X$:�nA�Uu��4���i�M      [   
  x����N�0�u�ݣZ󞱿%R�&�����c��M�#���\��i>>�M��i���>q��'�e��ގ����:������[��zy��~�>C���e����=�iG\�R`| 0�z�T�A&De\�Sɤ 7�o�,�պ7=��d��vw-����N]w�-�����.I7��J�{���6�nk�-���d��9ڠG�-wK�Ew)��V�^*h�� i�=�<�����;uۡU���"��F�#�9��=V�      ]      x������ � �      _   p  x�mTMoE=���R��mu�L�����nXp@��DBp (�����	 "EA��;x��_��G��oH�Z�[]]��ի*��78�g�/y!zk�2G<'�LS^�2=�-�6��`:��2�´�%�j�3	C��9�g�§�u:!��'����
��Ɲ�K��/y+W��O���tȘ~��Ќ�v���3�ѧ{73�.�C�Uz��u:�R�1�fR��� �2���b�K�i�'�~�d	��4�Bn){����i*��O@�%�Xx¶�5ut��>���US7e����*����u(��~����\pcW�}��'>L
g�/b�����T���o�������h��)i�������;�J�\I��;�������PzK�Aů��T� '}{�tPڦ��.d�HG�VB.�ݶ�W���-/|xI�Eu����j��A����&���'��b1ߑؔ�-\�o��ŉ+m(B(K��#o��(E��]e �N�
g��R�H��Ja2'�\W���1An�`:��o8��n�"�����������>ZO!Lb9��VU^�Q�FS���{���=����c��qT�!j��\%+�[�E/��2:"�^{�"��e����p�����[0tS2����f��r|V��Dڊ�>D>���u�ĎϨ��q�i��V���}po^��q�}�/�����K�2R��{�i:V��AD(`���c��H�l�N����+%�+��n��՞N�3qN��u��0��t�I����{.����)��a�]h��R���u��yGY�}C���l�Uv��Iz������<#�.Q�٬)����T7��1��TM�e�܍��7WL��ct��P�h4���      a   l   x�U�;�0��<��G+�%}�T���a�~p �9�Yj+é����u⃼S��M뒚�1�U��\�E��N�X��vɻAlbT���� %4;�M/��e8      c   �  x�m��j�0 ����� w�B?�%�m�4v�i��`8v+N�b���˽�`���]����M]������`^]�j5��d�9�o7;���p��zΊ�?�����I
"��L,�=�=��mc��`�r-��RU�R沊A�RY�X�X�.՞ ����HokXޛ?�1	3���Q�~J�@���-�tE��,&�ic��i���/.jv����7�N��Ng��H]<C�J���!�g��HF��z}�$�Bȳ��P�����~�yl�5�??6_@���|5�A����ww�ܾ0�1�ƄAG��G������`|�ﶗ��h=a����u4��,���^l���f��ϧ�7�����/D����4��ϕq�3 �t��*7ȴ��͜���?h�"�,�Q�Cw�B���V�ꘝ=      d      x������ � �      g      x������ � �      v     x���=JD1�:9��e���k�nAo`#�Xh��u����@V��+Lndb��	�$��e&A%O�+�e,�JV�iKy����[E@� ^ 3�Lɠ���X�5���뫛� �3)�3�)8�3v���Bƚ�����;X�[����|�q�f�K�u����2ԓQ��N^d]��p|�<9�pܚ��$�	C�¿��}�1$׹8y�*ɾ�u�>�e+�3�uI������2~w��Oq&�*��b�]J���W��- t��h�?�M��      i   �   x�U�A�PE��/FeV�Ŵ5ԉHLĀ4�|[8oGn���9��N�=�7���eajy2���:�����R�F�Pf��qV,ȋ���Hː����#Wz�3sc�򢏨:���B����bB�-�V       k      x������ � �      m      x������ � �      o      x������ � �      q      x������ � �      s   �   x�=�Kj�0D��)��ɘ�Z�e�Hr���{��G$P�WEU��8n鱽�B0�Y����N�m��{���1��z�w�l@���]�F�316�J�u���I�kgq��R���Ks�*%D�YL͕�U"68g�sv�a˸\�Ԑ��Z[S ݆~��󾿼>��o�^ 4��#ۑ� �}�/`�]��p?,�๹�q��fcG7     