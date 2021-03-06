PGDMP     9                     x        
   EDTeam_POS    12.3    12.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                        0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            !           1262    16417 
   EDTeam_POS    DATABASE     �   CREATE DATABASE "EDTeam_POS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE "EDTeam_POS";
             
   Desarrollo    false            �            1259    16420    Clients    TABLE     �   CREATE TABLE public."Clients" (
    cls_id bigint NOT NULL,
    "cls_Name" character(200) NOT NULL,
    cls_phone character(25),
    "cls_RFC" character(13),
    cls_status boolean NOT NULL,
    cls_country character(100) NOT NULL
);
    DROP TABLE public."Clients";
       public         heap 
   Desarrollo    false            �            1259    16418    Clients_cls_id_seq    SEQUENCE     �   ALTER TABLE public."Clients" ALTER COLUMN cls_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Clients_cls_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       
   Desarrollo    false    203            �            1259    16435    Invoice_Header    TABLE     G  CREATE TABLE public."Invoice_Header" (
    "Inv_Id" bigint NOT NULL,
    "Inv_id_Client" bigint NOT NULL,
    "Inv_AmountTax" real,
    "Inv_NetAmount" real,
    "Inv_Amount" real,
    "Inv_BussinesDate" date NOT NULL,
    "Inv_TranstDate" date NOT NULL,
    "Inv_Comments" character(250),
    "Inv_Reference" character(50)
);
 $   DROP TABLE public."Invoice_Header";
       public         heap 
   Desarrollo    false            �            1259    16440    Invoices_Detail    TABLE       CREATE TABLE public."Invoices_Detail" (
    "Inv_Id" bigint NOT NULL,
    "Inv_LineNum" bigint,
    "Inv_Id_Product" bigint NOT NULL,
    "Inv_Quantity" bigint NOT NULL,
    "Inv_Pricce" real,
    "Inv_PriceLineTotal" real,
    "Inv_PriceAfTAx" real,
    "Inv_Tax" real
);
 %   DROP TABLE public."Invoices_Detail";
       public         heap 
   Desarrollo    false            �            1259    16427 	   Productos    TABLE     }  CREATE TABLE public."Productos" (
    "Prd_id" bigint NOT NULL,
    "Prd_Name" character(100) NOT NULL,
    "Prd_Descripcion" character(250),
    "Prd_Precio" real DEFAULT 0.0,
    "Prd_Aplicated_TAX" boolean NOT NULL,
    "Prd_Start_Aplicated" date,
    "Prd_Finish_pplicated" date,
    "Prd_Status" boolean DEFAULT true NOT NULL,
    "Prd_Available" bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public."Productos";
       public         heap 
   Desarrollo    false            �            1259    16425    Productos_Prd_id_seq    SEQUENCE     �   ALTER TABLE public."Productos" ALTER COLUMN "Prd_id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Productos_Prd_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       
   Desarrollo    false    205                      0    16420    Clients 
   TABLE DATA           f   COPY public."Clients" (cls_id, "cls_Name", cls_phone, "cls_RFC", cls_status, cls_country) FROM stdin;
    public       
   Desarrollo    false    203   "                 0    16435    Invoice_Header 
   TABLE DATA           �   COPY public."Invoice_Header" ("Inv_Id", "Inv_id_Client", "Inv_AmountTax", "Inv_NetAmount", "Inv_Amount", "Inv_BussinesDate", "Inv_TranstDate", "Inv_Comments", "Inv_Reference") FROM stdin;
    public       
   Desarrollo    false    206   T                 0    16440    Invoices_Detail 
   TABLE DATA           �   COPY public."Invoices_Detail" ("Inv_Id", "Inv_LineNum", "Inv_Id_Product", "Inv_Quantity", "Inv_Pricce", "Inv_PriceLineTotal", "Inv_PriceAfTAx", "Inv_Tax") FROM stdin;
    public       
   Desarrollo    false    207   �%                 0    16427 	   Productos 
   TABLE DATA           �   COPY public."Productos" ("Prd_id", "Prd_Name", "Prd_Descripcion", "Prd_Precio", "Prd_Aplicated_TAX", "Prd_Start_Aplicated", "Prd_Finish_pplicated", "Prd_Status", "Prd_Available") FROM stdin;
    public       
   Desarrollo    false    205   r,       "           0    0    Clients_cls_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Clients_cls_id_seq"', 6, true);
          public       
   Desarrollo    false    202            #           0    0    Productos_Prd_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Productos_Prd_id_seq"', 11, true);
          public       
   Desarrollo    false    204            �
           2606    16439    Invoice_Header Invoice_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Invoice_Header"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY ("Inv_Id");
 I   ALTER TABLE ONLY public."Invoice_Header" DROP CONSTRAINT "Invoice_pkey";
       public         
   Desarrollo    false    206            �
           2606    16424    Clients PK_Clients 
   CONSTRAINT     X   ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "PK_Clients" PRIMARY KEY (cls_id);
 @   ALTER TABLE ONLY public."Clients" DROP CONSTRAINT "PK_Clients";
       public         
   Desarrollo    false    203            �
           2606    16431    Productos Productos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Productos"
    ADD CONSTRAINT "Productos_pkey" PRIMARY KEY ("Prd_id");
 F   ALTER TABLE ONLY public."Productos" DROP CONSTRAINT "Productos_pkey";
       public         
   Desarrollo    false    205            �
           2606    16443    Invoices_Detail FK_Invoices    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoices_Detail"
    ADD CONSTRAINT "FK_Invoices" FOREIGN KEY ("Inv_Id") REFERENCES public."Invoice_Header"("Inv_Id");
 I   ALTER TABLE ONLY public."Invoices_Detail" DROP CONSTRAINT "FK_Invoices";
       public       
   Desarrollo    false    206    207    2709            �
           2606    16448    Invoices_Detail FK_Products    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoices_Detail"
    ADD CONSTRAINT "FK_Products" FOREIGN KEY ("Inv_Id_Product") REFERENCES public."Productos"("Prd_id");
 I   ALTER TABLE ONLY public."Invoices_Detail" DROP CONSTRAINT "FK_Products";
       public       
   Desarrollo    false    205    207    2707               "  x�Ք1N�0��ߧ�	P�č36�۴J	�t`1I�,�5r��3G��p*�Hl��������#�V�ѢT}�S&�݈�������,�����G������x#�Eٺ�u ��8�XO��h}�V�F��%ZFc�l��h�*��:(��:�F�#^^�J�E-
#�yc�Zg% ���L�<�Y���]i)���,�N6n�\,�A�l���r}ˉ��F�|���U-��pzCv���U�徭^pzz{�� �ڃ0 ߕ<K��t��A������]6�] ��z7�         (	  x��]�n\G]����E��ˌa`&�p�U6[P��%��j��-�˄�E�h>�y��r(q�@�"�� v�	�}�=�6�}�rw��|�������������w��/�;������?�	���;��>�O><�q�$�����|{��p��|������|{8�Gn0`�%���G �X�u�h]���/���/�wO���w�������P(�Ԙ�%�����ǬMv���w������|z�#7]�=��R���P^��6\�ײ����q�g�����pj�a�0meXaP� �	J��8��WH�H����8	`&H�a���[z^m�͏'��<2��O/�_�O������������H���MN��L̸�b^��6�k7`?�3������`�m%kL�R\��6�c-˞ȱ�)f�����K���q�8K{,-fMg�Ck��e��l$�W���C���gA��I�7.`I{f:�&��"o9zAD(��^b���^<W�[]��{Qbd��ءM�Մ��a��+���tKs[]��E�A��cB�	!��F�ǮMG�丢�"t�_��+�o�|7����2�b�#Bb`3��F�SZ�@I���,�E�A�{�Ug�Ӆ�UX;3�-���0FD&����@�����H!��q45��m%涒\,�tR0�I2&IB4�!G��_>W�u3��k�TD��XK]�AҦCk����5f�>˶c�l�^��\��3*�8���Gp�p�\�M�����,�	l��V'�6\�S�a��|��c�[Z�_C������m%x5a�̜;F���F��O��5(�DJ��`�mb���+��5���W�.���Ė-l9;h�tlM���"@���ơ��YFl�ȲЦ�k���ڙtg��{v�\帜y��pViJ�ĚW%_�M/'X�	4�Y���HO�vm��M�\K*F�q�e64	�..�k��.#�+�t���.�.̸�W�-�k3b�m�W5PC�t�51퐁�RH�ʹB�2����bզ{�i�!��PJbM��oH���%����)�̸��dP�'�}I��MGגdcu�+8��ܽ�p�\�S�a�Cv�ː�HM�e�Xm:�&��.2!d�4���*̜���D�ui�c($��ʂ�nrV��tkF���8:j�"��	0��Fm~4�03o{-�3��#���k�k��w!O�U�;�Y���D> �M>���tefQfyH�Fj��A
WE!����k�֊B]���mn�%�ї��fC��К6ΥS�8ta�=�y3a��ŢM��´���I4k�#��9h��5q� ;k^����oK:���k̈́ �R��M-���ʈ���6\�r(�Y��1��l�Q�%�X��g�l��*����H*�9�K5o��-�gfߝ���we�MG��]:9��*��>מ �`�x��U�N5�ܚ�։�iDB5�ش��n*��'$N�*��F)��ζ�P|��ʳ�o����&u��S\Ba� �>f���-���n�{�k��6W�f�4�rj�%��Uѫk�A5�@h%�
�q,:P[��������#D�3I��4��n��WA���{ed��Y�M�b�K������q�
#��u}׍Bg�u����ZD����볓C�|�ty���2O�+e�&˶!�;�T�y+)h����8����ӄ�&�6hӡ5ݸ�6�H�N[*����Pe�MG�ºm���X&�m��~b�����`e:�&Z�N��4My���jڒ:_E�txM���i%��VI�6��o���M����zh�9l�4m�9�i�������f��rf�$(rn2��	�83}&�2�8�Ih���*���F�"��sM��u���S`���C$m:���wH]��nY�:�z�{#�sV�:���"��s��.�����=T�xz����PD��(������m:�����y��-\��ty���t���Y:��e[��������� k;(+��V=�j�a5Ql�'jR��T�c�t�nZ�:��:f���*WZ!�$â#�I@m:�&h[�;�%�2)��h�q5��c�y���D?䨶M}wo>W�y)_�L"�0����:Q�j�T�O�~�ү1;h������*�m��\1Xw��Fy�V�,F֋�[��z�������wl�����/:6� R����´P�
b����*\�\#p�b����{�+nmE��Eq3���a�$0/v��G�R?�|+��b�S�Q�V.�'s=�2�]2����_[�&k�����@��{`��U����nO��������5����!�@�k�����d<�         �  x�}Ykr4+��Y��
�����:�@g�|V*�I3*��~ݗ^p�}�F��6�N?��_xq[bj4���	C6���.���ӏl��W�>�\֖���&(!��t���)u��@!�\�������rMj�B�֙sIc�:y��BX'��ڞ�~�/l���s���Z�f7��h����Q��¥��������6�֢+���:۷�������I�K���}/���k)��-v4�n�"����a�Ǿ��N;e���9e����y������������n�1����1�����3X6cĽ�������N�20��%����6�jlJe�7����b����w���4�K`&�	�ғv�~�����PC��<�{� 	P�LrE!�p����I:�r�&�,�4Y� up`%�2�V���]e��U�_��#h���R�A}z\�W�ض534�BB�;��2���JDG�ÿ����nZ����M��� ��+p��V�a�g���[
� ��*�CA}��BsɶrA��'���M6��I-��� r�E�-���G��}���n����1�g�}����)_5m*�kF�e��U��b
̭D���5Е(6��>1l&����d�\�|U�A�a�c<!��sl]�B�&.����D�ě�1c; ZŰT���`G
Ğ�$�g�ȕ�X������v����Y&��1�?��<�@�0�m�O*����l��)p��G�+`Dmg;��2���e��]��ˀ�$�+iN�<�0��
E!�H�eӐ�]G��2�B�e�7�+v
�����tg� �g�z��^�o�:.X����-Y��x��.h����?�zʳ
��0}Z�E�k:>5=!x;LHh�5�'�t� ��ox���G�pI HW� ���@�l{�EpgN3�oX�BD.	*��
4���V,#�p_*̇W,`�	:d�p�l醳.Zy�p"��,6�������F-M�ن��x�[�R=v_��y���_H�����Cq����y;�����g�����f�D�h!�2h�D��n���#�>s�L�h,Ku+�|ǼxL8L��6&��Ԛf�-a�Aۛ�̧'ue��<��f�" � �^�+�0%�����t3ճA#����j�=�Ja��H��G�t�b(���r�ZAʀi��?wQ�Y	J_c4E�|W��"�h���/�~gf
N �"�{��ME��pB1���Q��7�)�o�72�PUr���L�Zv�d5t&($�ky��(���9f�֔�����M�p�����
��=��ҟ|j��CTr9>��w!�'�^H�8{�ӽ��!G��d��$��x�,�O^7@�i��@2�4�ZU)���(�EƊ�3F�֡߱����CL���;h�/^=�O#(��������"��V������r�ͽ9'f9_�p̮'�!�Z]^p4�4��a�	ŕ�|1�J�bB�侠B�ʯ�󲔙*�!��0�2$n��=Sb��,��8����AF=��N��6�va��npr*�ޑH�.H\AӖ��W%"�z^�D�x
l�Um��h��R�"���c"�[���mD��л�5��W���d��^��ڣM�_D��4	1��%��C��Q4S��$�����w`R�_ )V���*X�:?a�:�{X��]�r9.��(�k�%R�K�������J�Qs�(�IwUu�&ɫ��=���.�lL��&(�������������         �  x���N1��ݧ������p�č$��qwX�vSyz�4b��jX��	�M�&��|1KԺ@�ff^�Q�����Ź��(cASndJjB��r��8�-��X�c�������[��\puX�RW0E��
���h�]�b���~�����v����X�:#L���K��k�dej��쩤F�2�v&��t�rkb�c\�v��<�W�D妩F�{����$�L�ҁ�UI�D�6CW�Ȱ�0��i%�5i����$��<+�r��������*W7t�/&��0 a��)W�¿S����h'^Ľ�R��~TK^ʇ��|.S�%7�֤�i�ڣ ��w������o̎.9��!/y{�w!yl��� �3�u(���{#�� ��c�c,~�%]r<��(zϼ�     