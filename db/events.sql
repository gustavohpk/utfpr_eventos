-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id_administrator` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cpf` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `phone2` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_administrator`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (3,'Gustavo Pchek','ghpk88@gmail.com','e10adc3949ba59abbe56e057f20f883e',NULL,'08839621954','5555555',NULL);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `certificate` (
  `id_certificate` int(11) NOT NULL AUTO_INCREMENT,
  `id_enrollment` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  PRIMARY KEY (`id_certificate`),
  KEY `fk_certificate_enrollment1` (`id_enrollment`),
  CONSTRAINT `fk_certificate_enrollment1` FOREIGN KEY (`id_enrollment`) REFERENCES `enrollment` (`id_enrollment`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
INSERT INTO `certificate` VALUES (5,1,'e-5497486a71aea');
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `id_city` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `id_state` int(11) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `fk_city_state` (`id_state`),
  CONSTRAINT `fk_city_state` FOREIGN KEY (`id_state`) REFERENCES `state` (`id_state`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Guarapuava',1);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_event`
--

DROP TABLE IF EXISTS `cost_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_event` (
  `id_cost_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL COMMENT '	',
  `date_max` date NOT NULL,
  `cost` float NOT NULL,
  PRIMARY KEY (`id_cost_event`),
  KEY `fk_cost_event_event` (`id_event`),
  CONSTRAINT `fk_cost_event_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_event`
--

LOCK TABLES `cost_event` WRITE;
/*!40000 ALTER TABLE `cost_event` DISABLE KEYS */;
INSERT INTO `cost_event` VALUES (1,11,'2014-08-20',15),(2,11,'2014-09-19',20),(4,13,'2014-09-19',5),(5,14,'2014-09-19',5),(6,18,'2014-09-17',15),(7,18,'2014-09-13',20),(8,18,'2014-09-15',25),(9,18,'2014-09-17',30),(10,18,'2014-09-18',35),(11,18,'2014-09-27',40),(12,19,'2014-12-15',15);
/*!40000 ALTER TABLE `cost_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `id_enrollment` int(11) NOT NULL AUTO_INCREMENT,
  `id_participant` int(11) NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `date_enrollment` datetime NOT NULL,
  `date_payment` datetime DEFAULT NULL,
  `id_payment_type` int(11) DEFAULT NULL,
  `cost` float NOT NULL,
  `uri_payment` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attendance` tinyint(1) NOT NULL,
  `participant_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_enrollment`),
  KEY `fk_enrollment_participant` (`id_participant`),
  KEY `fk_enrollment_event` (`id_event`),
  KEY `fk_enrollment_payment_type` (`id_payment_type`),
  CONSTRAINT `fk_enrollment_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_participant` FOREIGN KEY (`id_participant`) REFERENCES `participant` (`id_participant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_payment_type` FOREIGN KEY (`id_payment_type`) REFERENCES `payment_type` (`id_payment_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,4,19,'2014-12-03 20:20:08','2014-12-03 20:20:30',NULL,15,NULL,1,NULL),(4,6,19,'2014-12-08 15:14:49',NULL,NULL,15,NULL,1,NULL);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id_event` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent_event` int(11) DEFAULT NULL,
  `id_event_type` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `teacher` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `local` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `spaces` int(11) NOT NULL,
  `start_date_enrollment` datetime NOT NULL,
  `end_date_enrollment` datetime NOT NULL,
  `views` int(11) NOT NULL,
  `logo` blob,
  `send_participant_data` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_event`),
  UNIQUE KEY `path` (`path`),
  KEY `fk_event_event` (`id_parent_event`),
  KEY `fk_event_event_type` (`id_event_type`),
  CONSTRAINT `fk_event_event` FOREIGN KEY (`id_parent_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_event_type` FOREIGN KEY (`id_event_type`) REFERENCES `event_type` (`id_event_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (11,NULL,1,'Semana Acadêmica TSI 2014','semana-academica-tsi-2014','<p>descricao teste 1</p>','ministrante 1','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-22 19:00:00','2014-09-26 22:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',17,'����\0JFIF\0\0\0d\0d\0\0��\0Ducky\0\0\0\0\0(\0\0��\0Adobe\0d�\0\0\0��\0�\0			\n$$\'\'$$53335;;;;;;;;;;\r\r\r%\Z\Z% ## ((%%((22022;;;;;;;;;;��\0^\"\0��\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1AQa��\"2qBR#����b�Cr��3$�Sc���4D�ⓣd%\0\0\0\0\0\0\0!1AQa���\"2q��BRbr3�#����\0\0\0?\0�T!B\0B�� !B\0B�� !B���. ���S^�E�0���~O\0���V����N�[#C�܀�B\0B�� !B\0B \"	\0M\0�J��y�K�w��.rr���K�v /��S��n������8+\0�!\0!@B�\0�!\0!@B�\0�!\0!@H�$���$�cqs�h\0�%\0�{��֌K��)�|��-K�ӛ�3\"�����f�.y�]v{�LV���t0m�U&F�n���m�h��\0��oi�`��R��\Z�����L�E�wYٿ�Vݶ�	|�j����p�6��n����=wYZI#-�X�E�B�o���k��Y<����\0�Vi�8���-���n#����zF�،#�R�����ɣ5d�i�*E�`�!\0!@B��xm�|��K��ƍkF$�Ps�Ɨ<����p\0,��9X��-5�P�`^Ö��.�\0Cj�n��L�l���!9���a�#���HǪ��J���\r*�WZۼ]��P�z\\;�T��s{}}|�I��{���ud #k�x�;K���}�2D�wn��Ъ�5����H�;b�i�<���G�>�9HÃ_���PɰѦv�,<�)��c�=ElB�VM�x���B�}ş�9����L�%�~�qYf�d�!B��\0�!\0!@B�\0�!\0!@B���h�5č�&b缆�zI@J��x������\\��ց�J�k?3�q��b7Ӝ�z\0�=f�������˙���ٌwGZ��W���ӭɃJ��O�I�����Y���\\��.�9�\r��cG�1���-.��{��}�;���2��g�Y�P����~.�\0���.��݌t�=K�����9Z�W\0,��~�ۧK�c����@y&�v��j؏�$��诅�AS�	g2�=��t�Tv�WH^��N%.e; s������6�V�����A֯c��`�l�R�<�_b�ދ�읣��^}�iZ�&o�7V�Xv�ſ�FKda��z\n�4��P��!\0!@G4�A��8��{�Z1$��{�~`�\0{�6��4{wT1�#nݎ����޷1�mSV��Ǧ���6KQ��hŞ���N��FgG�2�R\\�t%(�.rt�s$���y\"K�cS���wt;���q�#֦Ӵ�˺2�Y��{�O��6ڎs<��Rb:��^�C@\r\0�����a���ຏ4�+(���˔]�\\L%V0T�3���I^ڂ88-Ps�\0�Mv\0���O��ٷ�հpѶ���M۔�s�/8^u���D��x�q�Tf��u!�i�<�\0QnDs���摺^�ox\\�-nEiG���ի��s\\�����JCpG��t�6��Iu�5�/2�B*MkGf�Y��SцĨBɠB�� !B\0B���\0���[(]qw3 ��)$pkGYY.}��o�q��I�iC,��֒���C�nbׄ:�2]�c�f��u�eGEUHT��_5mZ�k��:�s�����Ŭ�}75�0k��z���[\0;�`��Vv:u��2Z�#���>�WXIP�g=��eb�[�\Zw����r�	pA@N\0.}B�+W��F3�q�|˩eh����GLFṽ{UI\'\r��RM$ҺYNiK�O������\\*ر��*{x�\Zِzǽ)�GwR�9C��S�)s!]$Θ��b��U�j�ӭ��F4��w��+�5d�+��l�y��_�~�q����f�\'�ym�:c?�^[\\\\*�\n�U���Mi�?�c���\'&hd�EJ��5�i�\\*S�M�\0�!\0�y�?�m��\0�қ�:�q�`ǟ�\0z��ҽAG41�ᕢH�ik��A\naF��x4F��yV�x˨+p;����ʻ_џ�z���.j�7��ma�M��t����X��s\\6W���OF~�<b���vۄ�בqh�ћy��\\��ym%����,x�*�p\0.�{\r�<���k����J�BN�������y����>�5��-i˛ڍر�h�MD��\Z%�����5�<Z֜�\\���h�G-��rj����ѓ��^�и�\nQq�\Z[I��.=-\rvSձ~�MzWl�S���IUS�{Oli6��wBA�*ٰB�� !B\0BU\0,_��� 66%���7�6��]�>�R��\0?��v��ȶ]^f�������>�X.R��K���y�l��#d�.����}}^}�M�I�n?���i$w�r�縚��W�{<\r��ѻ\n�����5�JҴd�s�<Q�4!(V:��f�K=\\%�nr���>�cVy�|�����;`T����T����\Z�ь\\t,}�5�Wud$Z�}Vb��4�.\0��\\���U�������,c��c����4��ɞg�Y�I=I��6�\01�ϲݝ�P�J0������9z6��i�I�X�A��$�Ƶt[�� v�� -��n�o�7�e*�����ʭW<�s.d���~Ϫ��\0�\0OB�\n��,��6탽�a���js�d��7���-p�(Q���|f���5�ӻ����?bЯ6�.��9�$��yR��7�]Ձ^�;a1P�(PB���P���g�is闠�S�ǉ����\r���C��C�����>���>F�v�4�2�oB�7���-����ۄ�⤳�$�*IUK)����\0�>\n7�#\"�<��������j��s����O���o�����������R�$c�P�Ed���?(9R�p���{���-.�ʜ���%��!�V�e3�����odu*ds8�\Z;U\\J� B\0B�� !%PV;���ߖ�͝�lڼ��3kai�I>�����ߖ����lڼͬq�4���`��^a��\rֿx�[V{��/{�{�?~>��ܱ˗\Z�ӵ�d�X�y��\Z�w����Z�FP\0\0`�u֡�i��]J�h�(�\r�b�ڧ�jV=&\n��������`������f�F�|Oy\r��ƭ�#K����}0���[]�ڼ��S�5i�]�%��V��4`����3��\\�/\"�ڷ7k��,��,��\0���e81=k���w��=���L1C���w��\n\\\\jMO��a0G�W\r��v)�=ṣؘФhTȭ\nF��\nV�\0ФkPХcP������)b��H�c4{sOHL���oL}X�����Q��Gr͏�78`B�hX�R����e!�w�]���͡e�LP�CB{B�3\\�A�����Od�OQW���q�[�Y�)��@�u��=�w0Io(�r��à�F�w\'/s)��4���&\'Gv�\0��\\�2g��%R��!%�\0��TN�k�.� 8�`�nM���uykg��V���h:�oQ�a�6�N���xf�e��6���L��1���\0��T}��gg�#RNi�h��(��\'!B\0B���\0���|��Smj[6�3kGO�I�\r���ϖܳjm��fզo���#�$���7wwW�R]�H�&qt�8ԒP����^ɨ�.�9���Y�q�8%Y������}2&�۴ea\0�)��<�i������C ����.�تL�.����9��)I�\')�����vs�ڥ�;v\'\0���G0�c����#B��RB�� \n��G�/(`���\01�����܅��NJ�\'B�2��S�ܱ9Z�,q��\rcK�v�����[޼���̏פ�W֖֍�M��=gj�j9ՋxZN���[=��u��6���fl�oP���vq��}g˺u��������~�`\np+�{�joa�������z6�^\'�X��{M��&������֫�ձ��eջ�~�6�t�GD�G0��.�+��ָ$�v���c9����$�3�{F���Qq��R��STP���)�+����+�Ak��1Ҵ]E����|g�+x=�/�y��&	�6�}\n�uo��~SH.��v	���Q��ФhLj��d��|��O����+�p>v�M	��p�Y�i8�s����G��5S��5���4R=ո���ƭ���}��>d�N�p�y���V�����Nε���!<B�A\\���e��K}} ��!Rv�Nƴoq;�څ��n�ٛ\r�/y�v���,��8�\\՚TLG���bb���U6�/.��e���,�p�N�=i�6�ð,��7�^�&#4u��MV3�x��Doq}r��>��W����SR:�q�����y$���1�c�GI5���s+�ơ�ǡ�[i7Q�Ks8�q��+��ٓc`����f#�?��v��H j ��d,�����C��g/ܿɓO��=��T�tG�هR�4�t$	T(!@BB�O�y�ۖ�~ޓ�ӷ�A�0ԓ��޵R�O�HZC	��`�w�7\\��������S晜A��3H��F�eԷW�R^_�e��٤{�\\IJƱ�N��2�Nhvn��BA]��$	�T�m;����cc˺���Ɍ���{�h,yN�\Z:�θ;%x��5�%>)}0�>��kC����~�`������7J㹠�{e�w�Q�o7����i�#�����h����s�Ҫ�mo~)w�\\��q����8��-2΅�y����ٱX�	���7nܺ��JS{��{cnT�TWA )^*3�;��0�l;a=�5�@S�L �Х2�[�Y�t���Jp�U�)Hik�Z�B:�I������y���G���vۃۗC3/�(Xd���ʫ�לj�F��vޠ������Qt�������c5�J*�9䶅�W��~���X�U>�pe��N�����\r|��J猜I>�z�A�6�\n��21����p\"�����J�u�$��&�9\Z*=�e��\'�h�X�Xj�\\s�������7X�Y�uo\0��\r��{��\\դ��|��\\ђSG��K^��\\O��R�~`kj-��}��;���o.p�C��7�(\\�U�*c�&]Y�z����ׇ���֭��2����I\"�Y4rj����e-���xE\\��kF�w�\\�������P\r���\'�`x�c�\0U���z�<��M�����mMh��P��e0�^+ib�v�[�襉Ů��s4д�zݸ9�Ef��3��\\�Kq�=��l�}������`V�:����4����v��8m��`i���e��k�F������S�[�L��#��l�aH��p���f��3�j�ҭٙ�e��U�ϣ��~�fu��#2[�~�5zh+i�p��[Q���&�8ݗ��v=�f��5Ayfm&?�ZPc��|\'�b��/�t�R��9At��1�Y)�=��k��]Q���;I�}�Z=h�~Ū����0�K��� �e ;���.kGd�ĨB��B�� ��\09�2�n�ї�����.�]�]�hR >h��������3�8�Xݴ8mMz�̮L��nu�>:�۷��ь�7�&����B�BРԘ�d�(���0w�$�+Se�i�@|<-��;���/���q#d����{ms���9Z~��\\>o��ήrvg�X$�:fv�_��\n(%z��kz�8)����gM���\np*3-()���e��0�T�����z[�&��h��\\�v7�o#8,�I!�\ZJ�8#n$f=*p�۸/�,}N��J���g����{�����P^Ʒ����W�����ߣlԌ�6��D�:lk�v.�+���ʮ�G/[m�����e-Wn�.p�G�$�2w<l�\\JA\Z�>��<Gq�$�8-���|u�s��\r\'M��3��2�mva��}��CԾ��q�2Q�����!�*)ݒ촞��=��MI�,.]�\'�-P^\\��Mo�\0*�\n��|���ͦ��`(.^ؤ�D�,�B�?1y?�״�U��m��7�\0����o���GP�����]�ՄR�}���_�Z��|��cNC��ˎş��e���Zv4z�R4o�ռ�k4�\r�/��4v�Q��Ws&ic�s2��ahT��k\0.ph�Mҙ\'1�6�It�Fֲ�?�U����I{]o�rR�FM���{U�:F��Xޏ�F�ސ��\\]j�6�% Ep�%�83��G\Z�N���|ǥ�v�Hf�Վg\0�C�k���w�\\�6�29͂R� i-˕�Ҙž���$�����erV����k]��{�T�R���*�� !��O�<�����Z{)c;�����q�S��W�(nmຂKk�	!���1�H�\n�@|����T�M�J���_U�ף����Zn\\��\"�����������JХ�P�nV�.��V����r�\0�=�U/�F9ϼ`�N;�=_HW�_����b��fOz���ؽ���m�n{���\n`)A^v��<�SJ\n�Z�\n��C-0�7����s�(����z7�C���|g��\'(C����L���.\rwL�V�d�u�8}Yϸ�����n넔����Jڒi�� ���GE#K^�Z����BUjy�G��n�\0�JC.i�����N���{�j7#�5��G\Z��nn/g�v�L�!�C�I��Uݩ�5ѽѻ4�B᪰{�&ٷd�����}O���G�,|���mF�%������iN�\0v���5i����g�(�÷�j��4�\Z,�i�d,\r<A5B\\���٧�y��{B�M�͖������W�,�3H�,���T�6����W��m�\ZY#���?,���R��҈u�j�t�\Zʴ���a�^�!+�g�6+Ӫm>�4��I��̭�N�Ӝڦ�uĶ6�c�f0�,~P�7s�^;x.��F��h���l\n�ޗb�ux�P��H�Ò�B�)�� �ݏ��c�d̯!�[�66�,��*�f��0]�9��)ڕD�T�\0�B�\0�!\0!@V������at0v1H<Lx�/����&�[��C��>4�+���nTf�c���5`Lٝ�LN=;�U��\Z<~\'9�a-sMAA[�_���8�J�$h��t�1�7�7���%�i��0 �+���KI�+1�o�8/6�F����q��{�V�X��1�r�k��5���h扲�j�\n�%W�%�TiѦ~�5$�uMU5�x)AL-V(\Z$�sj�\0�pQ�K�C��0`	C�uKU��j|�J��89U#.$������JfxB���Ymg������K��9���l�������\\=!z�e��m#��}����mt�v��*�zw}9?�=����[��\Z^(LFe�er�f��� �(�\'R�̗2��,\'����ݎS��7c&�������Xen^��iث���W�m��ʡ̀���n~ji�-�w�����ג|�nnc��ū����^��,ʁB��P�ih)���T�\r����Q�t�8�s˚s�m��?�6zM[Q��N��Z[�f�\n��4��.�\r8+FFѳ���M\n���4o��Ľ��ˍIi�bx|�*\0��B\0B�� !B��ar�p�r������7����z�\0н��9�Pp �^S�|�tkϊ�o�\0_p����a���̑S�^�i<��r�A��YF�i������}&sI��n��\\�k��N�+�.����r�m��<�}?Oqp\np)��p�v��\0o�z�-�����X��cꖩ�J\n�P��j��Z�BP}R�2��P�$̐���­\"����T�8�Ĕ<Ә����O���y}��W�Ufe����zs���]�߀f���\n��^~�Y˵����jq�ʪ�_w����wZ�N/M�U�ѷ��mnǷ�Nк�#KF���7qiث3.�i��c��\Z�.�z��ڽ��vo>P�6�~�\0fݣ�?��/.�8��j����z�̳*!\n\0H���`��4;A<��q)�ih��M&淣�܀~��Yi����wd���f�Gm!���p-w�\Z֤Ks�\0o�?�	�1�]ߺD��c��I��-��\'� ��T{[-�[Ěf*���/����,!q¤>_��I�K��M.����R^���N.�%U鮕���sOrj}�*��~w��C��9�{UƗx�g�4�8����jѓi$�d7Q\n�׼�=f��Ű�X剒�s1�i��*qѶF��ڴ� ��S��d8�{�j����a�E��� !B\0B�� �cmi%��s�0����J+�z\\��u,WU10g�_m�:w���y.��b�sfi�6Sо��V��m!�r.�:��ofA��a_=�X�X^Mew��Hø�[��\"TuF����j��Π���3�Z�y���M�]��R���i�ҽ\"���#���AQ�����a��g��sˡ�?G���������[�у@�>��TN{X3=����i\\7<â�TKv��kXs�ƯmNn����UOD�*�J?��iT����>i��[�,�l&�i���U�>�o���(�M^��A�/L9f�\'\n�7O�<�5�h��_���E=女K�&� 6�p�[����L�kZr��W��y��\\N�j~���$�\0eԺ\"���,��~Km�N��]s��oP\'38n������������e�3��,�ֱEW��(��̥s�}�<��7�P�Wy���zz���v�ѴW��*��U�n�772�]��4�ع(�4��$��v��m�-�=**�g�w�O�9K��Q.eae����\0G��J=���phl~Q��tpٴ�Y��X��>f?2|S:)#\r�^�c�D`�GT=,���|�����K���2�-���?�ǐ}\n�\'�7T���{�\r��ķ�zR��4m/I��鶱�F�W�!J��Oڣ\0�!S̜�a˺s�ob{�@�3���m~��xn��Z���K���� ,dq��/����q��+�9��,��K����ⷚ���:8�Ҵ�}7]�K׭Ǟ�daq9�\Zl-x�Vn\\�������e�x��U\Z�W�W�i����g����a��?z��|�3����Co�y�n8vUi`��8����\0���r�櫞�%X�J�w�����=��B>f����i���:��s���y�M�b�j6�iR�\r˻����4�!n����N$�nt��{��p_yf�6�=�oVМ�Yyj�7;w����Զ<O���\n���!9#Y��?O��� s��ݻ���U��`�Ӯ��:vN�iF�)�G7��^_������{��8X|M[)���G|F������\n�~���zXJ�,\Z!B\0B�� !\"P���V�w$\rj���{+�ڷ�ƌf����7wb��%P,�A��յ(��5!�z�����gs�����ؚ0�G~�ˎ�y�6��?˂7��iq�mT�c%I%%��X�Qu�q{Ӡ�]�N���|��.q?Z�_��\'6�PæL֟ZQ��\0�B��Ns���[Z���`�$��T\r���L\rJ��|��#���\'��lMlC�����ˮL��n���=k�:J��_�T���7����^�\'�+{M��m2���sl�W�6�Zu�2Y��nѱ�F֏����@x����j�����m��~s�r�X���m�jrIŐ03��/�\0uzG�8��@f,~V�e��t��\\H�W�ZZߡh,�M\Z��l�m���q��PS��|���E�%΀�(󄹂D&fKT��T�@)Ϝ��r�^Z0\rNվ���c=>�ա圻����������;F���M7��m.3�<n�h�p�h7YA��6���wQ��l�:�xz8/�s~^�Kֶ��o�˹�-�8�K��h�ݕ��q]-��\0���]����������ʢ��v����\r�+�gO����S��h�����4�A�\ZI���:���`�\r{���9Z��k�=��݉b<k�ޢ��W��o���L�c��YA�h��Y���cf�ewu���<�[�/t�eq�пa���\0��j#�r+��w<}�7��fB@�}���\0�!\0!@	�@IT����JK�K��q(��M♍�)W��9�h �TP�kj��1�����0v6�\\�s�WLx��yQ9�RF~��p8�\'H��r�܎)>(qUn��Dn^������GL.�l�(qp��*��9L׹`&O���Z�;��땤�\ZJ�989BҞ��j�	�\0�MJP\r����G#C�x-{*Nx�/��<�5)�e���L���	k���k6�CN��.I�&�&��,�����Ӹ؛��ү�/��ha�!{��03���f���\\��6\'hJ���\0	v�&\r�cCGcW@��SB��3�m�B����P��BP�*\0B�� !���E!4�%Q		��rԅ�W11�]e��4�Q�`b	� �+]L6�\n��		RP�6�	��pWBC\n�\0\rМ �VЏ��J����)\n�	��9����\nx�\ns�5#X�J�#\rN\rR�����%�Z 	h�\0�	�6�� #0��I���BB�`DtS������-��J�� !B\0B�!�!�!\0�\'u@ԝ�!\0w�B	�K�Bq/u@ԨBpFBpB�T!B\0B�� !B\0B���',0),(13,11,2,'Minicurso sobre Linux','minicurso-sobre-linux','<p>Minicurso sobre Linux</p>','ministrante 01','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-23 19:00:00','2014-09-23 21:00:00',25,'2014-07-23 00:00:00','2014-09-19 23:55:00',8,NULL,0),(14,NULL,3,'Palestra: O Mercado de Trabalho e o Profissional de TI','palestra-o-mercado-de-trabalho-e-o-profissional-de-ti','<p>palestra 1</p>','ministrante 01','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-09-24 19:00:00','2014-09-24 21:00:00',100,'2014-07-23 00:00:00','2014-09-19 23:55:00',6,NULL,0),(15,NULL,5,'III Mostra de Talentos UTFPR Guarapuava','iii-mostra-de-talentos-utfpr-guarapuava','<p>OBS.: Inscri&ccedil;&atilde;o necess&aacute;ria apenas para quem ser apresentar&aacute;.<br /><br />Enviar um e-mail para <a href=\"mailto:gadir-gp@utfpr.edu.br\">gadir-gp@utfpr.edu.br</a> com os seguintes dados:</p>\r\n<ul>\r\n<li>C&oacute;digo da inscri&ccedil;&atilde;o (gerado ap&oacute;s a finaliza&ccedil;&atilde;o)</li>\r\n<li>Nome completo e turma dos integrantes</li>\r\n<li>Nome da m&uacute;sica/apresenta&ccedil;&atilde;o</li>\r\n<li>Tempo aproximado da apresenta&ccedil;&atilde;o</li>\r\n</ul>\r\n<p>Ap&oacute;s a an&aacute;lise da equipe organizadora sua inscri&ccedil;&atilde;o ser&aacute; confirmada ou cancelada.</p>','nenhum','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-04-14 19:00:00','2014-04-14 22:00:00',15,'2014-04-01 00:00:00','2014-04-12 23:55:00',20,NULL,0),(16,NULL,4,'Lançamento do site de eventos da UTFPR Guarapuava','','<p>aaa</p>','nenhum','UTFPR - Câmpus Guarapuava - Avenida Professora Laura Pacheco Bastos, 800 - Bairr','','2014-07-23 19:25:00','2014-07-23 22:30:00',50,'2014-07-23 18:00:00','2014-07-23 18:01:00',3,NULL,0),(17,NULL,4,'Inauguração do Campus Guarapuava','inauguracao-do-campus-guarapuava','<p>aaa</p>','Nenhum','UTFPR - Câmpus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-05-23 10:00:00','2014-05-23 11:30:00',80,'2014-05-23 10:00:00','2014-05-23 10:01:00',2,NULL,0),(18,NULL,6,'Churrasco da Semana Acadêmica de TSI','churrasco-da-semana-academica-de-tsi','<p>churrasco tsi</p>','Ministrante 1','Acre/Unicentro','R. Francisco de Assis, 304 - Boqueirão, Guarapuava - PR','2014-09-26 19:00:00','2014-09-26 23:00:00',150,'2014-07-23 00:00:00','2014-09-19 23:55:00',7,NULL,0),(19,NULL,5,'Palestra teste 3','palestra-teste-3','<p><span style=\"color: #000080;\"><strong>Palestra teste 2</strong></span></p>\r\n<p>&nbsp;</p>\r\n<p>Conte&uacute;do:</p>\r\n<ul>\r\n<li>Conte&uacute;do 1</li>\r\n<li>Conte&uacute;do 2</li>\r\n<li>Conte&uacute;do 3</li>\r\n</ul>','Palestrante 02','UTFPR - Campus Guarapuava','Avenida Professora Laura Pacheco Bastos, 800 - Bairro Industrial CEP 85053-525 - Guarapuava - PR - Brasil','2014-12-07 14:00:00','2014-12-07 17:00:00',49,'2014-12-07 00:00:00','2014-12-07 10:00:00',87,'����\0JFIF\0\0\0\0\0\0��\0C\0\n	\n\r\r\r\r\Z��\0C\r��\0\0��\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0�[�\0��S�\0����cU\Z���\0�ϩ�\0����1��fl*����֟�o�L���_�\r��Y~����O��\0&}�������L�^��*�(��7���\0�8�����S{�xo��\0&q��\0�m���:Lks����֊�P��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(����\0�R_���\0���|��\n�\0ɩ/��n�\0�J�^�ld�\n(����(��(��(��(��(��(��(��]o�F}O����\0эTj���\0#>��\0_s�ƪ5�����ֿZe��3�\0�-�6��e���_�?������?���S�3=z�(�3\n(��\n����L���\0���Lu�Uῶ��ǋ�\0ݶ�\0Ҙ�1��ʓ֊Z*\rM?\r�+�x�GОv�u�{#2���U�p�8����\0��\Z/�]S�\0Q�u����,>�\0�����_�c��T�v>*�\0�xh��UuO�E�\0���\0�����*��\0�����dO3?0?h�ٚ��O�4]b����j7�jc�� ��~�U�}+�j��\0���/�����\0��?j^�zz�O�|Z�٤�\n�V�J��\'syBVO.&��$���k���?co�<�\n�\0���%����_��\r�����\0�����?��\Z/�]S�\0Q�u��/�m/l���І���\\�=+����?�)w�\0M~o�x���1�05(JN�5�\'���$���\Z�i\\��w���\0EWT�\0�T_�]��\r�����\0���������c����������R������/��\Z_z:?�ʿ��}ǈ�\0ü4_�*���\n��\0���\0�xh��UuO�E�\0�׷mk���\0�����c�������\0�\0@����������\0�xh��UuO�E�\0���\0�����*��\0��n���?�)w�\0M�Z��.�\0���\"�������\0W*�\0���#�\0�����*��\0�����\0�U�?�U�\0^�����R����?����\n]�\0��G�E��K�A��U�\0���<G���\0�U�?�U�\0G�;�E�\0����/�.���kX�\0�����4mk���\0������/��ރ�\\��\0?�t?~�|�\\<k�O�F/%��T�,-�1��RG�^�\\�\0�.\'��Ks4��dq��\'�t��W��a������T������):5eM���(���1\n(��\n(��\n(��\n(��\n(��\n(��\n(��?u���?����\0F5Q��������}��\0�\Z��f¯�Z�i���\0�ϼ�\0`��\0�ڿ%�~����g�\0�\0�Z�\0�mN$���(���(��\0+�l�3��\0�m�\0�1׹W����g/�\0v��\0Jc�Ʒ?*OZ(=h�5:O���X|#�\0a��)��h�Oƿ>�a����,?��:��?\Z��1h������K��\0ai�A�����\0���/�����\0��?j��+�?co�<�\n�\0���%�����6�\0����q��\0�Y)\r�~��D�\0�����\0�W]��O��\0��\0�o��qU������X�\0�1>�&�\0s����QEih�5ƹ|����*y�ɜc v����0������ǚr�.�R�i��n��W_�\0\n�V�\0��?Ϳ�W����Y�m����6}�\0@��?������\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��rW_�\0\n�V�\0��?Ϳ�W����Y�m��������\00����\0��t~�\0�>?���\0κJ���>��-�Ĉ��)�r}�Z���k\rW\r�a�V��E5٤|6:q�����aEW�r�Q@Q@Q@Q@Q@Q@Q@��������}��\0�\Z���o�F}O����\0эTk3aW~����g�\0�\0�Z�\0�m_����ֿZe��3�\0�-�6�fz�QVfQE\0ῶ��ǋ�\0ݶ�\0Ҙ�ܫ�l�3��\0�m�\0�1�c[��\'��T\Z�\'���,>�\0�����_�c��_��?��G�Ö�S~ю��TH��QEQ�?�P��%��\0���� ���~��B?��?����\0�_��sH������g������^^����xW����\0�,���?C�\"����s�+����\'���7�b���W��JO����y�����l+��{�\0#$�\0���%�J�߇��2O�\0^��\0BZ������2�_�J���?���K�3�?�{��Z����cop\r���ɹ�\'�(���_���\0�\0����.��\0�Uۃ�N����V�W�U�b���J�ӟ���\0�\0����.��\0�Q�\0\r���|�!�\0����|�E����7��\0�������\0���w�o�\0�?�_�=_1�E���s������C�\0��\0��?��7�\0ϟ�?�]/�\0����d~�~��G�g�=��<S�j2^�[�����lo��K1�=��G�3�?	�/��!-�Z����u��>�#��s\\��=�\0&�c�\0a;��T�\0n��5d�\0�ݧ򒫡O��\0�~<�\0��\0��\0�V?��?�~<�\0��\0��\0�V?���ƴ�o���SK��SW�*i��\\�jN`�p	�&�����\0\r���?��\0��\0���*������-7���m0�\0Ix��g�$��~.���\0�uB���/�\"iu/	��h���Ӧ�ŔQvG�zg���b�A���	�	�c�{v?���ʾ��C�e�=���[���xK\\��p��K[�=&�OEp3�k�+�qG�bqG�E|��[~�?���úO��tح���ngv�b]e\n0r01I�|x���>\Zx��5��͗��)V\'��J��*ø&���\n�\0%k�����\0G���%-l�3������\0��\0c�\0��������\0��\0c�\0���ksJ�_���<_�~��;B�Ŏ�4�F�R2=3P]��_��?��\0��\0�+�U*��_Aɾ��{0�u�?�%�;�w�	n��!�i�u�y���Ѯ��z�������@o��	_��\r�����ҽO���P�P�����4�������q��l���k�=GK�4{߱��m�q��7�</��XU(�T~�xw�z�|5k�\rj����v�ຶ}���Ѓ�<\Zԯ���3�m��������W_�Kk�do��v!c�_Np��\'��C�N�mX�E��\0�g��\0��o��F�k�3���7��j�Pj*����֟�o�L���_�\r��Y~����/�*������<�~�+��N$��*(���(��\0+�l�3��\0�m�\0�1׹W�~��?�Ǌwy�g�&�*Lks������T\Z�\'���,>�\0�����_�c��_��?��G�Ö�S~ю��TH��QEQ�?�P��%��\0���� ���~��B?��?����\0�_��sH������g������^^����xW����\0�,���?C�\"����s�+����\'���7�b���W��JO����y�����l+��{�\0#$�\0���%�J�߇��2O�\0^��\0BZ������2�_�J�������������\0������ۃ�N����V�W�U�`π[v�\Z�=�O�>�]𯀵�_L����ѳ)��GB�\"�P?b_�4\r��������pn����ο�x��\0��\0��������\0�:�\0�U��E>Ry��O�g_���J<O�\0���\0�Q�\0�����G��\0����{��P�<\'�D�|�3��~+�/4}I5�\Z���V�*p	����\0n��5d�\0�ݧ򒾚��n��5d�\0�ݧ�ؕ���_c�\0�=����2��\0GI_W��\0�O_�)>7�\0�e�����ni-��}h�U�.~�����Y��V�����};�:D{$������I\0�PY_�FA�͠A\0��y�b�6��M����\rkU�Rҧ���$C\Z �f��V5S�\08���OV��<A?��j�_�!E�Q[��Ld���l�\0���\0�Y�n�?�����)u�O�vp����V�Y��M}	�\0�\0�������\0��`�|}_������m����?�!_�U�m�\rɦ��\0�Z��\0BGp���X�я�U�����>�����x�H���T\"9YG�nǤ�?T`pr=9���iᛟ�F�|#y �}&�k&�o���l�{�����i��w�k�YXZD��\\��R$Q���+��O�\"�����8u]N{��������v���p9b̊]	�*Gb:W�\'ýbo�#�r���mnec��%-��_�����g�C�FIc��5�O�M_\r�/���P%���kI\0��D�ߨ4D&~6x���Ƶj�\r�q�+�YU�46���3�$�QSX�h��J|����ʒ�W���E����%��A�I��vN3�̞j�\0㲊�ï��`/ç���_�f\n5H�Q�V=e�m�G�B��\0\0>����c��(���(��\0+����\\�O��m4�0	�Mf�z�j��\n��_Q��W����uߌ\ZG��gC��V��i�3����j��ߵ\'���eQPju���㏃-�e�^��\\!?����ҿ$�f=M���=�&���H�l1����[Fp3֪$LZ(�����(G���\0�\0�Z_�k���@���K��\0ai�A��ڇ��v\n�����O3¿����\0Id��x�����<+�\0\\o��JC{��\0?��������Wk��?�?��\01\\U+���\0%\'�?�LO�ɿ����\06��=�\0����?��%]o���\'�\0�s�\0�-s�?��p���y���OC��ۃ�N����V�W�U�o���\0\'kw�\0`�?���*��g�-��Pb_�4\r����������Pb_�4\r��������qOc�z(���(��\0+�_۷�MY?�7i������_۷�MY?�7i����\Z��ѯo���:�_�Q�꺦�{���i\r�%�����wu��ҼB��V�}��^�5�}�!�\0\nϿ�\0��i�]3�m�I����DUϸXɯ��h$���vO*=S�\'��ߍz�_�O\r��l���{�#lc{̏��=2pMy],@�(��8	�O�+�>��_~%�����q�_�\ZK�F\"�J����f\'�6�С�u�\0���+�|d��%�\r\'�Ѵp����E�z�B�}%j�\0�B?�x7�����_r����s�K�R�Zi�I�9y��;����|5�\0�\0�������\0��U��N����g���#�c��¾�lmtř�sXG3os�;�g�y5w��#�[Ǟ_�C�:���4����\n]Na�>�%3��\0�h,�˥�\0��&��hi�j���x��l��kμO�⟃,\Z��?�A�Z\'߹�ԼK�tܣ�5�ӻ#���_�?m>��?jz����\0c,\"���Lh�=����1a��*���7�@�&}��Kf�~G�1�)#Ԍ�\r~��&��>	Zi�*������&��iX�;0�>���z��6�࿲��\0�x���?�I������ů��\Z�ʜ�@zƌ�H\n3�?I*+kkk+8�--ⷂ%	Q DE\0\0��*Z��f��Ο����h�\0\Z����E��d ���� �y��S��5�m~�|�Q��:���F��x���~w(�Oe`Jf�j���t��\'W���;Il�meh.-�]��p���R�qz�[�$�<�-3�\ZѶ��ۅ������Ԍ�;�k&�E�_�6�[�G�\"մ���`E]KIg������(���ЏB�N�į��^� �|5�^�:��wVr��}FGP{��k�	���kH�|M�h~$�nHk9�{���\0JD8�?G���O�=�ρ����u��\0Ef����5�9-<7��G}�k��>�\'��Ӻ+>������_<\r-����x��6\Zf���	V%<��M~P�ZΧ�/�������7������G9c�\0��0)u�oX��q�k��ާ�ܶ���2�!�c��\n�R��J�ED�u_���@�줽ԯ�[{kh�ZGc�?�=�\'�!�]~���Ǟ#��s�>�l4�W#�4�<�}T�����>|3��I�cH�]�$�!���>�r���\0L�?�U���7vQE1�\0�B?��?����\0�_����\0�\0�_��\0�K�\0�\r~~�=�#�W�~���y��\0�7��K%x={��m�\0\'��_��{�\0��R�����\0����\0��*�_����\0a�\0\\�����_��(1>��\0�b}�M��O�����������\0׹�\0Ж�*�~�\0��?�{��	k���\0�{��\0����*z���v��\n��\0�Z�r��n�;[��Y�\0�-_9W��>l����\0ɠh�\0��}�\0�\r_������\0ɠh�\0��}�\0�\rN;�{C�EfaEP_2�ݿ�j��\0a�O�%}5_2�ݿ�j��\0a�O�%\'����}Q����8���<a�/\\��O���u�D�W�=	\0¾W���\0����R|o�\0`�_�%J��[\\�\0�?|�\0�W�?���b��o��W��\n!��̈�\01^�EY��]+��Хh�Ѵ�\Z��(H�UA��(��>?��V��\0`y�\0�x��z���\0���Z�o����\0��ب�|}_�����M�����\0Ѕ~eW��5�\0&�o�\0ak��T�r�����4R\"�0*�� ��_�����k૖���M4A�\\�T��\\%��x�\0��98#�����ZƑ���\r括YE{a{[�[�2�#2��5M\\��~\"W�~Ο�.��[�Q��M=��e�\Z~Ky9������\Z����{P�/�v�Ò��i\0�i7��\0-�����\0}�߁�!^_Q�������Xk:5�����wew��G)\"0ʰ>�\Z�_\r~��f�3�K�\0k�Y[�夶�n����_rէs6����C�+��4K��\r���O��V!#�FOE�`�����	��Cմ�SA��t}oN�ӵW1�iu�H�ve<��T���o�/��\0����?�H�aԭϓu��H�\0e������`/XI-�������V�V_�N=��\n7ԅ�h�$|qEz��?f�~\Z��P�i�Ή�]:1x��b,J��\'�1�j^���uFG洊��EO����7Y���+J��-�&��]r��Ao��!?��5����>:��T[��Ų?��Ԃ٠���ҽ����u,W�ak���5���iH�2�\n���֝�t|��h\Z׉�Ck�xwK���+��\r��e���t���H�\0f?ق����o�~�{�+����u�3�Nz3����_\r�|=�O��xz)$P����ۛ���+rG�����\"�QE2B�(����K��\0ai�A����9���x��߁|9��M������u��-¡�� �^{Wȿ��ߴ\'�\n�_� �\0\Z���^��W�~���y��\0�7��K%O�\0]�BЭ��\0���V���f_�_�iM��,�l-t�8�i��b�����S��0��mY|D�\0�����\0�W^��-S�����cFK��$z�5�\0W���?���\0�7q��x��Z�\Zr�j�E����#��e\nxHFsI��wg=]o���\'�\0�s�\0�-S�\0�+�?����ƺ�{U�u�n/��8���\r�A���8?�sL6s��[\r8�KV��Zuv+2��煜c4�]����p����\0�*��\0Aj�ʾ���?g/���\0hK��;ö��[�[��I$��6����\0�2����N��\0����\0_���Տ��ؗ�MG�\0����(j�������\0�:��\0��\0�U}��0x�\r�gM70���U���Y!�u�y���RG �#���=��(� (��\0+�_۷�MY?�7i�����Ŀj��*���!|/��kk�Hjv�[.g����=�a�&5��I_c�\0�=��������:J���bo�����\0�m�Wѿ�\'�_��<g�}K���j0A��Y�d����0�H�5c�Z(���(��\0+���\n�\0%k�����\0G�����k��_>/x�\0Ú��l4��k:[y���`!�P�\0z�w��*;���m�\rɦ��\0�Z��\0B��17���h�5��+���{�ϊ>��¾/���R]B�ॼ�e��\n�ÿ���=��(� �_��՟Ə�:*,Q�Y��.��.p>��8�O�{W�����隕�������ʻ^)ᕇ� ������\0jO�K\\����o�4���ҼV�iq:۬���I�k�S�R�Qg��V��h�垳���ge2\\[�Dp�H�*��E~�����|d�;a�qjQ�\0�j���\\��?��2�c_�|}�\0�6��\0�X�\0½��l�#�A��������I�IE��o����W����Ғ*Vg��^%�������ޟt�d��uqk\"��Ƀ�9 ���x��w1��o�\ZU��\r-��2/����������=坍��ows��-BYQ�)Dkn�C��x��v����\0�O�t}I��Vk\rR�O�N7��{ʹ>���X���Ş�������os�ڋ��e�E{{s�K \'*����7I��u�M���z^�v���5���H��1�T�`A\r���:w�/>\"���cN�N�-�\Z�7W��6�7��\"J�$���⺘�o��?>6]�}��5�H��O����ޤ2��E�c�G�/�4��jx�A��Ν-�|����4�\"I��\0�$U􏊟�����?�\ZԦ���;MJ)Z8���������4�7�u#�h�6���_�~9��g�Η��ȚI�Rq�, \\�1�r���x���>�M�C�\0��C?�a�nK��*��w�s�P(��z���w�V��çi<)yy3��\rZ�F=�l�}]�?�_\0�*�����2��9�Fa�P���g\n�8�~������_�������~\n�|I�X�~ $M5�N�oB�<�_�W������\Z��+�\rw�ƣ�_��閖z�\0�|an�Kx�<#A1P�� �\'$�0\\v>���>�m&9��1Xm�hk��\0M;wby����ċ���ɵ���#�T�����\0j�$�\nmݝ������k����x[����&��?�����D����rK&������	|9��\0cϊ���tMI�ֵ�K��c�T�Y�|c����c�[W���W��];O�M��]J\"�%�f�EW������Eƹ�E�E�Ԟ�E��q��3�i��5�w�|qs�~̿�x�=j���{]S�Q�Z�sv�u�-c��|�\0�MS�<a������i����H���-��v��=�x�R���fx�7�<Y�5��<m��f�T�[�jO �ڬN=ꖥ�w�^���iZ��oX_[Hb���T�9\"q�YKdj��⯇�\'��|��4�+M���\r��l)��2D>� Ԍn�z��G��9�Mk���y�-�O�\Z�Q���Y<e�,lb��\r��sE���k�_?���)MsNm��W���_��Xϙ�gn�w�+��������[_���y�X��=Zi�\n�rI \0=kwF� o��:6��誆�!���� v��4#��:W��\r����q|[�>�>�ao��g�b�l�\"ţ]�C�F9�kߌ�	t�B��P���;K�y\Z)��U�7RC+�Aկ�x����ſ���h�n�r����WiS����9����\0<3�gU��u�|&�-�54y�a�tx%T�0��A�-^�6��k?���\0MҦ�����$j�Bs(Y��m$\0@�!TzQp���Ǿ	>\n�\0��x�E>�U����@2gh9 c=N*�߈��2��Z���T*�9gUk�ۻl@������|��K�?a�3|WҾ<)/���5�KF\"�客�����Bq��A\\ݦ��\r��	~��I�x�G�5^/��mX[�����\0g�`���oÿ	k0�\'�Ǉ�{��)m}2z�r�<V�׈�Ӗ�[ӭΧ ��Kr���#!b������c���=��[�F��#K�uO��K�u�5��I`�N#R_�����灏-�5�ľ� �<�h�����igbsb���� ��.;~�,P[��H��\Z�wr\0P9$��W�x���y��\0xwI�t\'M6a\r���Cq>��$�d�jN��9�8����\0P���_�[K�c��Ԭ��ym���y��$t����E�o�ׅ>�Y�m��g������FDI�F`ANdB��9�2y丒>��O�� ��0�v�������/�tʆ9#ޭM�	[�~�]�ĺBiw����?&�G8EG��\08���ca��|����Ҽ]�:�8t�#Y�4�a�)\"iAT���?�yΧ�xz��z��<=��\ZG�]:���-T�1	��9��S<_����\\v>��?�?x*��x�C���\0S�y\r �2H�~��5=4��jt�\0\'�k��������9�+揅�\'��W�C�r����iZ��k���.�\ZHm����	>�drH�ְ~(x����\0b�\'�/����_��bm���d��-xcF��h�W���.+Xh���Mc������ϟ*��e�\'� ᔐpA�d���7�|#�&��\Zh\Z-ܑ��\rF�8��\0�eHϱ��?e/h�7�_\Z�$ѭ�{=	e\Z�`�,䴜[�ԙ6J�\0s���P|XҼE��ߺu��<-�?^��k?g�ʂ���\n�x$�B�\\,}	7��6���?�Ŧ^I$Vׯ�B!��諭��\0�N�����S��\rKM��\0������[ۈ5(�-���`�PO\0����O��A��F_��_�W�2h��0�C\0���;s���?��\'�c?�o��8ѧ�O�@|���Uϝ��#n3��p��g��\"xŷ�c�\Z�Y�E,��~��\0:����ި�_�h��Ɨ�|G����)��uHc�\'U��A���_xO�z?��w�ZF��x�_�PB�l)���@p�\\c9�S�X���5���&𯄾k0��ْI<c�*6�@�b0َ��\\v>��~)�4��lnu_�j�Bug%ƣkq8!-�\\�Vփ�ox�L:��u�3Y�\r��i�Ip��!#>���=#�\'���s�h>�v���ໝ�%�i���qP����8��	x�J�W��oWJѯ��.����E�\\���������>e�������_kz������w���^�kp�=���Ƞ�O��Si�拫�^�iZ����{���Y\Z�P3�@��lv85�w�/��;����˘|C�3��O�Eƭ��k�L��$o\"�~\\Ǒ۞�İ��O㉒D�>4��?吡0h�}[WҴ�W��];O�]��]J\"�%�2�x$u�o|E��/����6���t�Y���B)�\n:����޸/ڨ���|~A4G�tJ�o�~������t�+L�!�`���R�-�}�0@�1�����H�S��<��,�[�=D�������q�!X��+�����������i�I�8t�OFV}E|��OA�g��,�g����i:��\"�,��G�ē5���	�\\�8�V��\"���i�i����e���ŋ\"����bqۓE�Ǭ^�Z�]��hڏ�_Y�0Ja���T�9#q�YY���޵�\r�oJ�S����vSȰ�syr�G#�%UY��	ھ(��|_㯎��~�W�b�ķͬkWq��s�`�P��w��r+7▟bo�#��Wz��a��\n�ۮt]:{�mVhv[n��a�n���q����>(�߄���<Q�i�5��![�B�`���������?x���/���1�u��]�E�_�p��J�{��^5���ğ�o��Ŵ� �񮛣��߂�%�>bm�HWdd<WI��N���\0n!/�|9�?�:�����6�Y�q�?�ڨ�zcp=@��qX��_xv��i��:=nxM�Zk\\ ��1��ǝ�~S�;Js��@��Q�fMj�5� 7I�4�\'x� �#��g�<�E�\"\rG⎫�A�Yx�mcM�DO�I�9�m0J�p��f��s�Mzw�{����Ӽk�������i(���n�t�I�1��w���\r���꺆�a�j�W�Zt�� �]��#pI\09S�p{W=�\'�u�[�kc\r���6�è�s,�G�#Ɵ�A9\n�K	 W˟\r�4�zo�?h�Z\\rF�Z��Ɵo0Û�mV8�#�{�?g\rM�k���zx�_��i�K��٫�q��|fP7���|�\\,s��N��[�՚7���X��b���\"U�W8������J�{��v�g���m�����6��$��¿dQ�\0aF;\n(�7�8/i�|?�=�6љ�LR%a1.Kq�>�{�ŕ��\0�M�� �8�4���U;�\0�����E�X�����w��ck�݀H�\r�A����}����Aφu@p���(���kc�5}?O��\0�X��=���E��I\Z<Jʌ&epFO\"�k�����D�[�Goj7��wW��Mp�����$�E6�]CIҴ��ٲ��L����x��EB֠�P$�qԚ���������P��.�e�f2A=�H����T�\Z(�Ə��K[U��<@�mk��3y�v/�W�q^a�����7���h�~Fg���F��8�E��9?��C�g��y6�a%ݭ��{��C$$�J1^	W�|o���\0�����ϬLY����E�����xUO�{�J�F��\0`Z�|+�d�X�bE��t��؈�\'�Uv#���ě;5���Ҷ���� ���ɯ�?h�;O?�?�5Salo�--V��ľl����8=������4�&��	�l��]�\"���y�p*���d_;�|������J��cd�\0�/�k׳������0\\/�u�I8��hGΟ�f���~Қ��m�/��ۚ8UM�8����{=+�?km\'J��	�=2����p ��H�g��O�.�;�i�m���k�>���}6�	�WI��2��=�r_�摤���z��,���Y���\n���G����QE}N����t�y<3���ZũLL^�����⼞	�tz���鿱��h��O�I�S��H���y<�����)�C���t�6/x?P�O�K���\\�,J$�0�팲��Z-+L���>\n��鶖����{h\"�Q &!���(����n������Wt� ���J#(Q�����\\d�*����\0���O7��_3hݏ��ϥS�?n[x&�|�A�.�ʗPv��:g�xW��[V�/�3m	F�mC)A�>�ފ*^�-�@���=o��ڄ�=�����m���烱�����_�6v����Xw6�9c�e�G&�(�>���\0������#��Um� y��}+���eg�7�� K[�K�0巡�\"�s�rsE��=����>[I$H��c,,�	�ć��<����m���4\'���}Zᙶ��S�EH\"}��\Z��\0�{O�#�|1d\n2��j���C�f��{�M��Iwkj������	<����(���-�[���4�o���-��Xn�bX��#�VK�\r��0a�0s�}���MӴ��^�Ҭ-lmR�\"�[D�\"���*�I$��(�n\'�<��\\0����G!H�U@�|�����\0�~/�h���OyB��/�ԁ�Ҋ)��x��l����3�m X��}`�09I	|x�������+�����\"��.�ڐm��0���ӹ������]���ce�\0	���������X�s�����\\��g⇁�1����>9/��A�E�ﴭ2oĖ1i֑ڿ��?|\n�n%<�0y�����#���wf47�,�xe��|������>���',1);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_organizer`
--

DROP TABLE IF EXISTS `event_organizer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_organizer` (
  `id_event_organizer` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_administrator` int(11) NOT NULL,
  PRIMARY KEY (`id_event_organizer`),
  KEY `fk_event_organizer_event` (`id_event`),
  KEY `fk_event_organizer_administrator` (`id_administrator`),
  CONSTRAINT `fk_event_organizer_administrator` FOREIGN KEY (`id_administrator`) REFERENCES `administrator` (`id_administrator`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_organizer_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_organizer`
--

LOCK TABLES `event_organizer` WRITE;
/*!40000 ALTER TABLE `event_organizer` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_organizer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_type` (
  `id_event_type` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `teacher_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
INSERT INTO `event_type` VALUES (1,'Semana Acadêmica','Coordenador','semana_academica'),(2,'Minicurso','Professor','minicurso'),(3,'Palestra','Palestrante','palestra'),(4,'sem_inscricao','','sem_inscricao'),(5,'sem_pagamento','','sem_pagamento'),(6,'Outro','Organizador','outro');
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id_media` int(11) NOT NULL AUTO_INCREMENT,
  `media_type` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `id_event` int(11) DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_media`),
  KEY `fk_media_event` (`id_event`),
  CONSTRAINT `fk_media_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (12,'p',11,'Logo Semana Acadêmica TSI','/pi2_integrador/media/image/event/event11_image1.jpg'),(13,'p',13,'Logo minicurso Linux','/pi2_integrador/media/image/event/event13_image1.png'),(14,'p',14,'Logo - Palestra sobre mercado de trabalho','/pi2_integrador/media/image/event/event14_image1.jpg'),(15,'p',17,'Inauguração UTFPR-GP','/pi2_integrador/media/image/event/event17_image1.jpg'),(16,'p',15,'Logo - Mostra de Talentos','/pi2_integrador/media/image/event/event15_image1.jpg'),(18,'v',17,'UTFPR Guarapuava 3 anos','https://www.youtube.com/watch?v=tkOsLyMDFao'),(19,'p',15,'III Mostra de Talentos UTFPR Guarapuava','/pi2_integrador/media/image/event/event15_image2.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id_news` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `path` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_news`),
  KEY `fk_news_event` (`id_event`),
  CONSTRAINT `fk_news_event` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,11,'2014-07-13 18:47:00','2014-07-23 16:19:00','Programação da IV Semana Acadêmica de TSI','A programação da IV Semana Acadêmica do curso de Tecnologia em Sistemas para Internet foi divulgada.','<p>A programa&ccedil;&atilde;o da IV Semana Acad&ecirc;mica do curso de Tecnologia em Sistemas para Internet foi divulgada.<br /><br />A semana ter&aacute; palestras e minicursos sobre diversos assuntos relacionados ao curso de TSI.</p>',4,NULL),(3,13,'2014-07-23 12:57:00','2014-07-23 12:57:00','Semana Acadêmica de TSI terá minicurso sobre Linux','Na IV Semana Acadêmica de Tecnologia em Sistemas para Internet haverá um minicurso sobre o sistema operacional Linujx','<p>Na IV Semana Acad&ecirc;mica de Tecnologia em Sistemas para Internet haver&aacute; um minicurso sobre o sistema operacional Linujx</p>',0,NULL),(4,14,'2014-07-23 17:09:00','2014-08-31 19:32:00','S. A. de TSI terá palestra sobre mercado de trabalho','A IV Semana Acadêmica de TSI terá uma palestra que falará sobre a relação entre o profissional de TI e o mercado de trabalho.','<p>A IV Semana Acad&ecirc;mica de TSI ter&aacute; uma palestra que falar&aacute; sobre a rela&ccedil;&atilde;o entre o profissional de TI e o mercado de trabalho.</p>',10,NULL),(5,19,'2014-12-18 21:51:00','2014-12-18 21:51:00','Noticia teste','Noticia teste subtitulo','<p>Noticia teste descricao</p>',4,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participant` (
  `id_participant` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `rg` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `id_city` int(11) NOT NULL,
  `address` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `district` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complement` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone2` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_participant`),
  KEY `fk_participant_city` (`id_city`),
  CONSTRAINT `fk_participant_city` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (4,'Participante TesteA','30145144119','1234567890','M','1995-10-10',1,'rua 1','111','bairro 1','77777777','complemento 1','55555555555','77777777777','teste5@teste505.com','e10adc3949ba59abbe56e057f20f883e'),(5,'Participante TesteB','53830951876','1234567890','F','1992-07-15',1,'Rua 2','222','Bairro 2','22222222','complemento 2','9999999999','8888888888','teste7@teste7.com','25d55ad283aa400af464c76d713c07ad'),(6,'Participante TesteC','79875886955','1234567890','M','1993-05-05',1,'Rua 3','333','bairro 3','33333333','','88888888888','77777777777','teste9@teste99.com','e10adc3949ba59abbe56e057f20f883e'),(7,'Participante TesteD','22540907989','1234567890','F','1989-02-27',1,'Rua 4','444','Rua 4','44444444','complemento 4','8765432100','00112233445','teste11@teste11.com','25d55ad283aa400af464c76d713c07ad'),(8,'Participante TesteE','82550675665','1234567890','M','1996-07-08',1,'Rua 5','555','Bairro 5','55555555','','5874445555','44488875474','teste4@teste4.com','25d55ad283aa400af464c76d713c07ad');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `id_payment_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
INSERT INTO `payment_type` VALUES (1,'Pagseguro','pag_seguro');
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `id_setting` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `value` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_setting`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,'site_title','UTFPR Eventos'),(2,'favicon','media/img/favicon.png'),(5,'themes_name','Padrão, UTFPR'),(6,'themes_path','default, /app/resources/css/utfpr.css'),(7,'current_theme_name','Padrão'),(8,'current_theme_path','default'),(9,'banner1_name','Banner 1'),(10,'banner1_path','media/image/banner/banner1.png'),(11,'banner2_name','Banner 2'),(12,'banner2_path','media/image/banner/banner2.png'),(13,'banner3_name','Banner 3'),(14,'banner3_path','media/image/banner/banner3.png'),(15,'banner4_name','Banner 4'),(16,'banner4_path','media/image/banner/banner4.png'),(17,'contact_mail',NULL),(18,'header_title_banner','media/img/header_title_banner.png'),(19,'maintenance_status','0'),(20,'maintenance_message','site offline'),(21,'google_maps_api',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id_sponsor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `web_address` varchar(80) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_sponsor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (5,'Escola 01','www.escola01.com.br','Descrição da escola 01'),(6,'Universidade 01','www.universidade01.com.br','Descrição da universidade 01'),(7,'Empresa 01','www.empresa01.com.br','Descrição da empresa 01'),(8,'Universidade 02','www.universidade02.com.br','Descrição da universidade 02'),(9,'Escola 02','www.escola02.com.rb','Descrição de escola 02'),(10,'Empresa 02','www.empresa02.com.br','Descrição da empresa 02'),(11,'Empresa 03','www.empresa03.com.br','Descrição da empersa 03');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsorship`
--

DROP TABLE IF EXISTS `sponsorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsorship` (
  `id_sponsorship` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` int(11) NOT NULL,
  `id_sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id_sponsorship`),
  KEY `fk_event_sponsor_event` (`id_event`),
  KEY `fk_event_sponsor_sponsor` (`id_sponsor`),
  CONSTRAINT `fk_event_sponsor_sponsor` FOREIGN KEY (`id_sponsor`) REFERENCES `sponsor` (`id_sponsor`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsorship`
--

LOCK TABLES `sponsorship` WRITE;
/*!40000 ALTER TABLE `sponsorship` DISABLE KEYS */;
INSERT INTO `sponsorship` VALUES (143,19,7),(144,19,9),(151,18,7),(152,18,8),(153,18,11),(155,17,11);
/*!40000 ALTER TABLE `sponsorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id_state` int(11) NOT NULL AUTO_INCREMENT,
  `state` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_state`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'PR');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-06 14:14:26
