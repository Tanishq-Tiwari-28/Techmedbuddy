-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: techmedbuddy
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add event',7,'add_event'),(26,'Can change event',7,'change_event'),(27,'Can delete event',7,'delete_event'),(28,'Can view event',7,'view_event'),(29,'Can add instructor',8,'add_instructor'),(30,'Can change instructor',8,'change_instructor'),(31,'Can delete instructor',8,'delete_instructor'),(32,'Can view instructor',8,'view_instructor'),(33,'Can add student',9,'add_student'),(34,'Can change student',9,'change_student'),(35,'Can delete student',9,'delete_student'),(36,'Can view student',9,'view_student'),(37,'Can add student_academics',10,'add_student_academics'),(38,'Can change student_academics',10,'change_student_academics'),(39,'Can delete student_academics',10,'delete_student_academics'),(40,'Can view student_academics',10,'view_student_academics'),(41,'Can add event_registration',11,'add_event_registration'),(42,'Can change event_registration',11,'change_event_registration'),(43,'Can delete event_registration',11,'delete_event_registration'),(44,'Can view event_registration',11,'view_event_registration'),(45,'Can add course',12,'add_course'),(46,'Can change course',12,'change_course'),(47,'Can delete course',12,'delete_course'),(48,'Can view course',12,'view_course'),(49,'Can add student opted courses',13,'add_studentoptedcourses'),(50,'Can change student opted courses',13,'change_studentoptedcourses'),(51,'Can delete student opted courses',13,'delete_studentoptedcourses'),(52,'Can view student opted courses',13,'view_studentoptedcourses'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add interns',15,'add_interns'),(58,'Can change interns',15,'change_interns'),(59,'Can delete interns',15,'delete_interns'),(60,'Can view interns',15,'view_interns'),(61,'Can add techteam',16,'add_techteam'),(62,'Can change techteam',16,'change_techteam'),(63,'Can delete techteam',16,'delete_techteam'),(64,'Can view techteam',16,'view_techteam'),(65,'Can add executive',17,'add_executive'),(66,'Can change executive',17,'change_executive'),(67,'Can delete executive',17,'delete_executive'),(68,'Can view executive',17,'view_executive'),(69,'Can add intern',15,'add_intern'),(70,'Can change intern',15,'change_intern'),(71,'Can delete intern',15,'delete_intern'),(72,'Can view intern',15,'view_intern'),(73,'Can add techteam_mem',16,'add_techteam_mem'),(74,'Can change techteam_mem',16,'change_techteam_mem'),(75,'Can delete techteam_mem',16,'delete_techteam_mem'),(76,'Can view techteam_mem',16,'view_techteam_mem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$rW1nEn0klCTX5TR3JKoVzv$3uiRyj32snRbODxoTjx2bAZ8EUhXW+9kA5Dmtlw66wk=','2023-07-03 08:11:41.892200',1,'admin','','','',1,1,'2023-06-24 07:03:07.976935');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` varchar(255) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `course_duration` varchar(100) DEFAULT NULL,
  `course_Description` longtext,
  `cost` varchar(255) NOT NULL,
  `opening_date` date DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `students_enrolled` int DEFAULT NULL,
  `course_tags` varchar(255) DEFAULT NULL,
  `available_seats` int DEFAULT NULL,
  `Prerequisites` longtext,
  `learning_outcomes` longtext,
  `course_content` longtext,
  `certification_criteria` longtext,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1','R for Bioinformatics','images/r.jpg','30 hours of immersive learning [15 hours of R programming and data analysis + 15 hours of biological','Through interactive lectures, hands-on exercises, and real-world case studies, students will gain a solid foundation in R programming and its application to bioinformatics. By the end of the course, students will be able to code and debug their problems and analyze biological datasets such as transcriptome and sequential datasets, i.e., Genome in R language with the number of packages.','TBD','2023-07-01',2,0,'Unlocking the Power of Data Analysis',50,'The course will be for students belonging to Computer science/ Life sciences domains who want to make a career as a bioinformatician, Basics of Biology! , Willingness to learn','By the end of course students will be able to,Code and debug their Problems , Process transcriptome and genome related data in R , Data Visualization especially Bioinformatics based data , Interactive Web app development','Function, Loop conditionals , Data Types, \r\nDataframes and manipulation of data,\r\nBasic statistics and analysis,\r\nMicroarray data analysis and GSEA,\r\nIntroduction to TCGA data','Attendance(10%),  Assignments(20%) , Exam(20%) ,  Project(50%)'),('10','Upskill the game of Data Analysis with the course','images/python0.png','30 hrs','Embark on a transformative learning journey with our comprehensive \"Basics of Bioinformatics with Python\" course. Designed for both beginners and those with some programming experience, this 30-hour course offers a hands-on approach to understanding the essential concepts of bioinformatics and harnessing the power of Python programming. In this course, you will delve into the fascinating world of bioinformatics, where biological data meets computational analysis.','TBD','2023-07-01',3,0,'Basics of Bioinformatics with Python.',30,'The course will be for students belonging to Computer science/ Life sciences domains who want to make a career as a bioinformatician,\r\nWillingness to learn and basics of molecular biology,\r\nStudent should have sound understanding of Basics of Python programing','Understand and perform local and global alignments along with paired and multiple sequence alignment,\r\nStructural Modelling of Proteins from Genes,\r\nFind conserved sequences of a gene across the species,\r\nBioinformatics with Biopython,\r\nHistory of sequencing and NGS data analysis pipeline,\r\nPerform biological data analysis with Biopython','Structural Modelling of Proteins,\r\nUnderstanding of BLAST : MSA : alignment,\r\nUnderstanding of different file formats of Biological datasets and analyze those datasets,\r\nFind conserved sequences of a gene across the species,\r\nHistory of Sequencing,\r\nNGS data analysis pipeline','Attendance(10%) + Assignments(20%) + Exam(20%) +  Project(50%)'),('2','Python for Bioinformatics','images/python.png','35 hours of immersive learning','Course Overview: In this engaging course, students will embark on a journey to understand how Python can revolutionize the field of bioinformatics. You will gain a solid foundation in Python programming, focusing on its application in various bioinformatics domains. This course will equip you with the essential Python programming skills and techniques to analyze and interpret biological data effectively.','1500','2023-07-01',3,23,'sgdgsdgsdfg',23,'willingness to learn, Basics of Biology!','Basics of Programming,\r\nRecursion + Object-Oriented Programming,\r\nData Analysis and Visualization + Biopython,\r\nPackage development and deployment','Basics of programming,\r\nLoops and conditionals,\r\nRecursion,\r\nObject Oriented Programming,\r\nFile handling and Regular Expressions,\r\nData Analysis -> Pandas : Numpy and Scipy,\r\nPackage development and deployment','Upon completing the course receive a certificate of achievement to showcase your newly acquired Biostatistics skills.'),('3','Master the fundamental concepts of Biostatistics.','images/intro_to_biostatics.jpg','30 hours (12 hours Descriptive + 12 hours of inferential statistics + 6 hours of Data Normalization)','Discover the essential principles of Biostatistics in our comprehensive 30-hour short detailed descriptive, hands-on course with R/Python language. Designed to equip you with the analytical skills needed in life sciences and other areas, this course delves into the fascinating world of data analysis and interpretation.','1000','2023-07-01',3,0,'NA',50,'R / Python','Students  will be able to understand and apply different inferential statistics in their problems, design survey experiments, do survival modeling including KM curves and cox proportional hazard modeling.','Descriptive Analysis,\r\nProbability and Distribution,\r\nDiscrete and Continuous Distribution,\r\nSampling and its types,\r\nExperimental Design,\r\nInferential Statistics,\r\nSurvival Analysis (Kaplan Analysis+Cox Proportional Hazard Model)','Upon completing the course, receive a certificate of achievement to showcase your newly acquired Biostatistics skills.'),('4','Data Visualization','images/data_viz.jpg','20 hours of immersive instruction and hands-on exercises.','In this comprehensive course, students will explore the fundamental principles and best data visualization practices with the help of the R language. Through hands-on exercises and real-world examples, you will learn how to create visually stunning and impactful charts and graphs of publication quality. Whether you\'re a data analyst, business professional, or aspiring data visualization specialist, this course will empower you to communicate complex information and uncover actionable insights effectively.','750','2023-07-01',3,0,'NA',50,'R programing','Students will be able to build appealing plots equivalent to publication level,\r\nPerform univariate and multivariate analysis,\r\nInterpret the meaning of graphs','Basics of Programing in R,\r\nData Analysis in R\r\nIntroduction to ggplot,\r\nUnivariate data  visualization,\r\nMultivariate data visualization','TBD'),('5','Basics of Data Science for Bioinformaticians','images/data_science.jpg','30 hours (20 hours supervised learning + 10 hours unsupervised learning)','In today\'s data-driven world, mastering the Basics of Data Science is essential for unlocking valuable insights and making informed decisions. Join our comprehensive 30-hour course and embark on an exciting journey into the world of data science and interpretation. This course equips you with the fundamental principles and practical skills necessary to navigate the dynamic field of Data Science.','1000','2023-07-01',3,0,'NA',50,'Python','Understand and solve regression and classification-based problems,\r\nDiscover signatures in transcriptome datasets with Differential expression analysis and machine learning algorithms,\r\nAlgorithms  covered: Linear Regression :  Logistic Regression,\r\nSupport vector Machine,\r\nEnsemble Based models (Random Forest : Bagging and Boosting),  \r\nDecision Tree, \r\nKNN, \r\nPCA, \r\nK Means, \r\nHierarchical clustering','Data Exploration (EDA),\r\nRegression ,\r\nClassification ,\r\nRegularization and its types(L1,L2),\r\nDiscover signatures in transcriptome datasets,\r\nML algorithms (Linear :  Logistic : Random Forest),\r\nClustering,\r\nANN','TBD'),('6','Discover the fascinating realm of Medical Image Data Analysis.','images/image_data_analysis.jpg','30 hours (divided into convenient sessions)','This course will equip students with the skills and knowledge to analyze and interpret medical images effectively. Whether you are a medical professional seeking to enhance your diagnostic capabilities or an aspiring researcher interested in medical imaging, this course is your gateway to unlocking a world of insights. Gain In-Depth Understanding: Dive into the principles and techniques of medical image analysis, and develop a profound understanding of various imaging modalities, such as X-ray, MRI, CT, and ultrasound. Explore image acquisition, processing, segmentation, feature extraction, and more.','1500','2023-07-01',3,0,'NA',50,'Python','Understanding of CTSCAN+XRAY+Ultrasound,\r\nUnderstanding of CNN-based models for segmentation: object detection : and classification,\r\nBuild models for medical images','Understanding of CTSCAN+XRAY+Ultrasound,\r\nUnderstanding of CNN-based models for segmentation :object detection: and classification,\r\nBuild models for medical images','TBD'),('7','Unlock the Power of Bioinformatics Text Data Analysis','images/text_data_analysis.png','30 hours of immersive learning spread across manageable modules.','Dive into the world of bioinformatics text data analysis (Genome sequence) and gain the skills needed to extract valuable insights from vast amounts of information. This comprehensive 30-hour course equips you with the tools and techniques to effectively navigate and analyze medical texts. Gain In-Demand Skills: Learn the essential methods for analyzing medical text data, a highly sought-after skill in the healthcare industry.','1500','2023-07-01',3,0,'NA',50,'Python, Machine Learning basics','Understand genome data,\r\nUnderstanding of language modeling including RNNs: LSTM: BiLSTM advanced State of the art  models BERT and Transformers,\r\nBuild language models for genome data','Understanding of genomic data\r\nLanguage modeling: RNNs : LSTM : BiLSTM : BERT : Transformers,\r\nBuilding Language models','TBD'),('8','Master the Art of Gene Expression Data Analysis','images/expression_data_analysis.png','40 hours','Discover the detailed gene expression data analysis world with our comprehensive 40-hour course. Designed for aspiring researchers, bioinformaticians, and data enthusiasts, this course delves deep into the techniques and tools required to analyze gene expression data generated from Microarray, Bulk RNA-Seq, and scRNA-Seq experiments.\r\nThis course offers a unique learning experience that combines theoretical knowledge with hands-on practical exercises. Gain the skills and expertise to unravel the complexities of gene expression and leverage this knowledge to advance your research or career in the life sciences domain.','1500','2023-07-01',3,0,'Unlock the Secrets of Microarray, Bulk RNA-Seq, and scRNA-Seq',50,'R, Machine Learning basics','Analyse microarray: Bulk Rna seq : or Sc RNA transcriptome datasets,\r\nDiscover signatures against specific clinical conditions,\r\nCell annotation and Protein-Protein interaction,\r\nBuilding Machine learning based models for validating signatures power to discriminate,\r\nagainst the different conditions','History of Sequencing (Micro array: NGS and scRNA)\r\nBiology of different methods,\r\nData Normalization Algorithms,\r\nMicro array Data analysis,\r\nUpstream data analysis for NGS RNA seq data analysis,\r\nDownstream data analysis,\r\nSingle cell RNA seq data analysis','TBD'),('9','Biology for Computer Science','images/bio_for_cs.jpg','30 hrs','Discover the fascinating intersection of biology and computer science with our immersive 30-hour biomedical sciences course. The course is aimed to train computer science graduates to a level where they understand biology at system level and related data with biology. No prior biology knowledge is required, making this course accessible to all computer science students eager to broaden their horizons','0','2023-07-01',3,0,'Mastering the Synergy Between Two Disciplines',30,'The course is open to all non life sciences graduates who want to understand biology from a system level approach,\r\nStudents should have a understanding R/ Python language as hands-on will be in R / Python language','Understand Biochemistry, physiology, Immunology, Molecular biology and medicinal chemistry\r\nUnderstand biology from system level approach and relate data, Computer science with biology','Physiology,\r\nBiochemistry,\r\nImmunology,\r\nMolecular Biology,\r\nEDA over Vitals data, \r\nEDA over gene sequences data,','Attendance(10%) + Assignments(20%) + Exam(20%) +  Project(50%)');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_instructor_id`
--

DROP TABLE IF EXISTS `course_instructor_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_instructor_id` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` varchar(255) NOT NULL,
  `instructor_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_instructor_id_course_id_instructor_id_b081eaa6_uniq` (`course_id`,`instructor_id`),
  KEY `course_instructor_id_instructor_id_7efaf31e_fk_instructo` (`instructor_id`),
  CONSTRAINT `course_instructor_id_course_id_598497d6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_instructor_id_instructor_id_7efaf31e_fk_instructo` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_instructor_id`
--

LOCK TABLES `course_instructor_id` WRITE;
/*!40000 ALTER TABLE `course_instructor_id` DISABLE KEYS */;
INSERT INTO `course_instructor_id` VALUES (2,'1','1'),(12,'1','4'),(20,'10','1'),(19,'10','3'),(4,'2','1'),(13,'2','4'),(5,'3','1'),(6,'4','1'),(14,'4','4'),(7,'5','1'),(15,'5','5'),(8,'6','1'),(9,'7','1'),(17,'8','1'),(16,'8','6'),(18,'9','1');
/*!40000 ALTER TABLE `course_instructor_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_order`
--

DROP TABLE IF EXISTS `dashboard_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_paid` tinyint(1) NOT NULL,
  `status` varchar(100) NOT NULL,
  `order_id` varchar(500) NOT NULL,
  `instamojo_response` longtext,
  `course_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_order_course_id_f191b9e8_fk_course_course_id` (`course_id`),
  KEY `dashboard_order_user_id_64525daa_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dashboard_order_course_id_f191b9e8_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `dashboard_order_user_id_64525daa_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_order`
--

LOCK TABLES `dashboard_order` WRITE;
/*!40000 ALTER TABLE `dashboard_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-24 07:41:37.883798','1','Event object (1)',1,'[{\"added\": {}}]',7,1),(2,'2023-06-24 07:56:26.542254','2','Event object (2)',1,'[{\"added\": {}}]',7,1),(3,'2023-06-24 09:31:36.188411','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event description\"]}}]',7,1),(4,'2023-06-24 13:04:02.029296','1','Instructor object (1)',1,'[{\"added\": {}}]',8,1),(5,'2023-06-24 13:05:17.618999','1','Course object (1)',1,'[{\"added\": {}}]',12,1),(6,'2023-06-24 17:55:52.710212','1','Course object (1)',3,'',12,1),(7,'2023-06-24 18:01:10.210376','1','Course object (1)',1,'[{\"added\": {}}]',12,1),(8,'2023-06-24 18:22:03.431917','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Learning outcomes\"]}}]',12,1),(9,'2023-06-24 18:32:10.240875','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Instructor name\"]}}]',8,1),(10,'2023-06-24 18:33:23.883805','2','Instructor object (2)',1,'[{\"added\": {}}]',8,1),(11,'2023-06-24 18:33:38.382351','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Instructor id\"]}}]',12,1),(12,'2023-06-24 18:51:30.288294','2','Instructor object (2)',2,'[{\"changed\": {\"fields\": [\"Instructor description\"]}}]',8,1),(13,'2023-06-24 19:19:19.983775','3','Event object (3)',1,'[{\"added\": {}}]',7,1),(14,'2023-06-24 19:23:02.271432','3','Event object (3)',2,'[{\"changed\": {\"fields\": [\"Event datetime\"]}}]',7,1),(15,'2023-06-24 19:23:34.298732','3','Event object (3)',2,'[{\"changed\": {\"fields\": [\"Event datetime\"]}}]',7,1),(16,'2023-06-24 19:28:27.722631','3','Event object (3)',2,'[{\"changed\": {\"fields\": [\"Event datetime\"]}}]',7,1),(17,'2023-06-24 19:28:44.583932','3','Event object (3)',2,'[{\"changed\": {\"fields\": [\"Event datetime\"]}}]',7,1),(18,'2023-06-24 19:59:11.697717','1','Event object (1)',1,'[{\"added\": {}}]',7,1),(19,'2023-06-24 20:04:43.684361','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\", \"Event duration\"]}}]',7,1),(20,'2023-06-24 20:06:34.913501','1','Event object (1)',2,'[]',7,1),(21,'2023-06-24 20:09:12.402955','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(22,'2023-06-24 20:14:08.348319','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(23,'2023-06-25 06:25:26.697327','2','Event object (2)',1,'[{\"added\": {}}]',7,1),(24,'2023-06-25 06:33:56.781348','2','Event object (2)',3,'',7,1),(25,'2023-06-25 06:34:01.984900','1','Event object (1)',3,'',7,1),(26,'2023-06-25 06:35:51.312294','1','Event object (1)',1,'[{\"added\": {}}]',7,1),(27,'2023-06-25 06:40:32.050978','2','Event object (2)',1,'[{\"added\": {}}]',7,1),(28,'2023-06-25 07:56:32.762495','3','Event object (3)',1,'[{\"added\": {}}]',7,1),(29,'2023-06-25 08:09:27.019316','3','event_registration object (3)',3,'',11,1),(30,'2023-06-25 08:09:44.407649','2','event_registration object (2)',3,'',11,1),(31,'2023-06-25 10:14:35.463687','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event name\"]}}]',7,1),(32,'2023-06-26 12:21:39.800058','2','Course object (2)',1,'[{\"added\": {}}]',12,1),(33,'2023-06-26 12:34:58.174868','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Course name\"]}}]',12,1),(34,'2023-06-26 14:33:07.565617','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\", \"Instructor description\", \"Instructor qualification\"]}}]',8,1),(35,'2023-06-26 14:34:06.405163','2','Instructor object (2)',2,'[{\"changed\": {\"fields\": [\"Image\", \"Instructor name\", \"Instructor description\", \"Instructor qualification\"]}}]',8,1),(36,'2023-06-26 14:34:34.352301','3','Instructor object (3)',1,'[{\"added\": {}}]',8,1),(37,'2023-06-26 14:35:10.721240','4','Instructor object (4)',1,'[{\"added\": {}}]',8,1),(38,'2023-06-26 14:36:51.958182','5','Instructor object (5)',1,'[{\"added\": {}}]',8,1),(39,'2023-06-26 14:37:32.499440','6','Instructor object (6)',1,'[{\"added\": {}}]',8,1),(40,'2023-06-26 14:38:09.874559','7','Instructor object (7)',1,'[{\"added\": {}}]',8,1),(41,'2023-06-26 14:40:16.471135','3','Instructor object (3)',2,'[{\"changed\": {\"fields\": [\"Instructor description\"]}}]',8,1),(42,'2023-06-26 17:17:27.313645','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(43,'2023-06-26 17:46:27.704404','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(44,'2023-06-26 17:48:25.624815','2','Instructor object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(45,'2023-06-26 19:00:55.733886','3','Event object (3)',3,'',7,1),(46,'2023-06-26 19:00:55.744425','2','Event object (2)',3,'',7,1),(47,'2023-06-26 19:00:55.744425','1','Event object (1)',3,'',7,1),(48,'2023-06-26 19:04:51.286352','1','Event object (1)',1,'[{\"added\": {}}]',7,1),(49,'2023-06-26 19:05:31.551035','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event link\"]}}]',7,1),(50,'2023-06-26 19:08:03.200387','2','Event object (2)',1,'[{\"added\": {}}]',7,1),(51,'2023-06-26 19:09:46.786891','3','Event object (3)',1,'[{\"added\": {}}]',7,1),(52,'2023-06-26 19:11:40.293259','4','Event object (4)',1,'[{\"added\": {}}]',7,1),(53,'2023-06-26 19:13:37.173570','5','Event object (5)',1,'[{\"added\": {}}]',7,1),(54,'2023-06-26 19:19:38.051165','6','Event object (6)',1,'[{\"added\": {}}]',7,1),(55,'2023-06-26 19:25:21.462432','6','Event object (6)',2,'[{\"changed\": {\"fields\": [\"Event speaker\"]}}]',7,1),(56,'2023-06-26 19:49:29.280285','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(57,'2023-06-26 19:50:24.453591','2','Instructor object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(58,'2023-06-26 19:52:33.465110','3','Instructor object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(59,'2023-06-26 19:53:05.514400','4','Instructor object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(60,'2023-06-26 20:33:18.198363','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Prerequisites\", \"Learning outcomes\", \"Course content\"]}}]',12,1),(61,'2023-06-26 20:34:11.443768','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Course content\"]}}]',12,1),(62,'2023-06-26 20:34:40.059469','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Course content\"]}}]',12,1),(63,'2023-06-26 20:39:07.904424','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Cost\", \"Certification criteria\"]}}]',12,1),(64,'2023-06-26 20:48:06.782180','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Course name\", \"Course duration\", \"Course description\", \"Cost\", \"Opening date\", \"Prerequisites\", \"Learning outcomes\", \"Course content\", \"Certification criteria\"]}}]',12,1),(65,'2023-06-26 20:52:10.290972','3','Course object (3)',1,'[{\"added\": {}}]',12,1),(66,'2023-06-26 20:55:41.913991','4','Course object (4)',1,'[{\"added\": {}}]',12,1),(67,'2023-06-26 21:00:26.916411','5','Course object (5)',1,'[{\"added\": {}}]',12,1),(68,'2023-06-26 21:02:53.761699','6','Course object (6)',1,'[{\"added\": {}}]',12,1),(69,'2023-06-26 21:04:05.825895','1','Interns object (1)',1,'[{\"added\": {}}]',15,1),(70,'2023-06-26 21:04:38.747573','2','Interns object (2)',1,'[{\"added\": {}}]',15,1),(71,'2023-06-26 21:05:21.353098','3','Interns object (3)',1,'[{\"added\": {}}]',15,1),(72,'2023-06-26 21:05:50.546804','4','Interns object (4)',1,'[{\"added\": {}}]',15,1),(73,'2023-06-26 21:06:31.837059','5','Interns object (5)',1,'[{\"added\": {}}]',15,1),(74,'2023-06-26 21:07:14.585143','7','Interns object (7)',1,'[{\"added\": {}}]',15,1),(75,'2023-06-26 21:07:39.123563','8','Interns object (8)',1,'[{\"added\": {}}]',15,1),(76,'2023-06-26 21:10:41.634722','7','Course object (7)',1,'[{\"added\": {}}]',12,1),(77,'2023-06-26 21:13:45.620145','9','Course object (9)',1,'[{\"added\": {}}]',12,1),(78,'2023-06-26 21:17:16.924596','10','Course object (10)',1,'[{\"added\": {}}]',12,1),(79,'2023-06-27 11:14:10.237513','11','Order object (11)',3,'',14,1),(80,'2023-06-27 11:14:10.244606','10','Order object (10)',3,'',14,1),(81,'2023-06-27 11:14:10.245607','9','Order object (9)',3,'',14,1),(82,'2023-06-27 11:14:10.246966','8','Order object (8)',3,'',14,1),(83,'2023-06-27 11:14:10.247415','7','Order object (7)',3,'',14,1),(84,'2023-06-27 11:14:10.247926','6','Order object (6)',3,'',14,1),(85,'2023-06-27 11:14:10.249071','5','Order object (5)',3,'',14,1),(86,'2023-06-27 11:14:10.250077','4','Order object (4)',3,'',14,1),(87,'2023-06-27 11:14:10.250077','3','Order object (3)',3,'',14,1),(88,'2023-06-27 11:14:40.832454','2','StudentOptedCourses object (2)',3,'',13,1),(89,'2023-06-27 11:14:40.833840','1','StudentOptedCourses object (1)',3,'',13,1),(90,'2023-06-27 15:03:36.280453','6','event_registration object (6)',3,'',11,1),(91,'2023-06-28 08:00:16.852941','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Instructor id\"]}}]',12,1),(92,'2023-06-28 08:01:09.532986','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Instructor id\"]}}]',12,1),(93,'2023-06-28 08:01:48.673155','4','Course object (4)',2,'[{\"changed\": {\"fields\": [\"Instructor id\"]}}]',12,1),(94,'2023-06-28 08:02:22.649989','5','Course object (5)',2,'[{\"changed\": {\"fields\": [\"Instructor id\"]}}]',12,1),(95,'2023-06-28 08:03:18.178952','8','Course object (8)',2,'[{\"changed\": {\"fields\": [\"Course id\", \"Instructor id\"]}}]',12,1),(96,'2023-06-28 08:03:28.468420','9','Course object (9)',3,'',12,1),(97,'2023-06-28 08:05:53.548800','9','Course object (9)',1,'[{\"added\": {}}]',12,1),(98,'2023-06-28 08:06:53.551243','10','Course object (10)',3,'',12,1),(99,'2023-06-28 08:10:08.498976','10','Course object (10)',1,'[{\"added\": {}}]',12,1),(100,'2023-06-28 08:34:33.639193','16','Order object (16)',3,'',14,1),(101,'2023-06-28 08:34:33.645960','15','Order object (15)',3,'',14,1),(102,'2023-06-28 08:34:33.645960','13','Order object (13)',3,'',14,1),(103,'2023-06-28 08:34:33.650873','12','Order object (12)',3,'',14,1),(104,'2023-06-28 08:38:32.451609','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Course name\"]}}]',12,1),(105,'2023-06-28 08:39:08.818858','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Cost\"]}}]',12,1),(106,'2023-06-28 08:39:33.700331','4','Course object (4)',2,'[{\"changed\": {\"fields\": [\"Cost\"]}}]',12,1),(107,'2023-06-28 08:40:06.161901','9','Course object (9)',2,'[{\"changed\": {\"fields\": [\"Cost\"]}}]',12,1),(108,'2023-06-28 08:41:00.280329','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Cost\"]}}]',12,1),(109,'2023-06-28 08:52:42.801783','44','Event object (44)',1,'[{\"added\": {}}]',7,1),(110,'2023-06-28 08:53:44.904362','44','Event object (44)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\"]}}]',7,1),(111,'2023-06-28 08:54:33.333461','44','Event object (44)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(112,'2023-06-28 10:10:24.129499','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event name\"]}}]',7,1),(113,'2023-06-28 10:10:41.582674','3','Event object (3)',2,'[]',7,1),(114,'2023-06-28 10:34:17.790812','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Cost\"]}}]',12,1),(115,'2023-07-01 11:58:37.099411','13','event_registration object (13)',3,'',11,1),(116,'2023-07-01 11:58:37.107289','12','event_registration object (12)',3,'',11,1),(117,'2023-07-01 11:58:37.107289','11','event_registration object (11)',3,'',11,1),(118,'2023-07-01 11:58:37.108392','10','event_registration object (10)',3,'',11,1),(119,'2023-07-01 11:58:37.109397','9','event_registration object (9)',3,'',11,1),(120,'2023-07-01 11:58:37.110414','8','event_registration object (8)',3,'',11,1),(121,'2023-07-01 11:58:37.110414','7','event_registration object (7)',3,'',11,1),(122,'2023-07-01 13:15:02.739844','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(123,'2023-07-01 13:15:09.485157','44','Event object (44)',3,'',7,1),(124,'2023-07-01 13:15:24.801055','2','Event object (2)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(125,'2023-07-01 13:15:44.605268','3','Event object (3)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(126,'2023-07-01 13:15:59.990154','4','Event object (4)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(127,'2023-07-01 13:16:11.109531','5','Event object (5)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(128,'2023-07-01 13:16:22.319053','6','Event object (6)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(129,'2023-07-01 13:47:05.591559','2','Event object (2)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(130,'2023-07-01 13:47:27.525746','2','Event object (2)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(131,'2023-07-01 13:48:33.116983','21','Order object (21)',3,'',14,1),(132,'2023-07-01 13:48:33.127292','20','Order object (20)',3,'',14,1),(133,'2023-07-01 13:48:33.127292','19','Order object (19)',3,'',14,1),(134,'2023-07-01 13:48:33.132205','18','Order object (18)',3,'',14,1),(135,'2023-07-01 13:48:33.132205','17','Order object (17)',3,'',14,1),(136,'2023-07-01 13:48:41.851805','15','event_registration object (15)',3,'',11,1),(137,'2023-07-01 13:48:41.853840','14','event_registration object (14)',3,'',11,1),(138,'2023-07-01 13:50:48.568644','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Course content\"]}}]',12,1),(139,'2023-07-01 13:51:46.947114','5','Course object (5)',2,'[]',12,1),(140,'2023-07-01 13:52:36.196944','9','Course object (9)',2,'[{\"changed\": {\"fields\": [\"Course content\"]}}]',12,1),(141,'2023-07-01 15:20:42.674645','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(142,'2023-07-01 15:27:11.379740','17','event_registration object (17)',3,'',11,1),(143,'2023-07-01 15:27:11.387032','16','event_registration object (16)',3,'',11,1),(144,'2023-07-01 16:14:35.733201','1','Event object (1)',2,'[{\"changed\": {\"fields\": [\"Event startdatetime\", \"Event enddatetime\"]}}]',7,1),(145,'2023-07-01 16:19:36.193127','18','event_registration object (18)',3,'',11,1),(146,'2023-07-01 16:19:53.589348','22','Order object (22)',3,'',14,1),(147,'2023-07-01 16:20:10.830496','2','Student object (2)',3,'',9,1),(148,'2023-07-01 16:20:10.831495','1','Student object (1)',3,'',9,1),(149,'2023-07-01 16:22:21.859852','2','1@gmail.com',3,'',4,1),(150,'2023-07-01 16:22:21.860852','3','tanishq21496@iiitd.ac.in',3,'',4,1),(151,'2023-07-02 11:23:56.085165','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(152,'2023-07-02 11:25:01.011443','3','Course object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(153,'2023-07-02 11:25:19.171251','4','Course object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(154,'2023-07-02 11:25:46.062531','5','Course object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(155,'2023-07-02 11:26:10.880056','6','Course object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(156,'2023-07-02 11:26:39.311188','7','Course object (7)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(157,'2023-07-02 11:27:00.251420','8','Course object (8)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(158,'2023-07-02 11:27:17.606972','9','Course object (9)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(159,'2023-07-02 11:28:01.034712','10','Course object (10)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(160,'2023-07-02 11:28:22.705339','7','Course object (7)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(161,'2023-07-02 12:53:32.075765','3','Course object (3)',2,'[{\"changed\": {\"fields\": [\"Course tags\"]}}]',12,1),(162,'2023-07-02 12:53:50.501137','5','Course object (5)',2,'[{\"changed\": {\"fields\": [\"Course tags\"]}}]',12,1),(163,'2023-07-02 12:53:59.732419','6','Course object (6)',2,'[{\"changed\": {\"fields\": [\"Course tags\"]}}]',12,1),(164,'2023-07-02 12:54:07.903699','7','Course object (7)',2,'[{\"changed\": {\"fields\": [\"Course tags\"]}}]',12,1),(165,'2023-07-02 12:55:00.530265','4','Course object (4)',2,'[{\"changed\": {\"fields\": [\"Course tags\"]}}]',12,1),(166,'2023-07-02 17:31:36.758463','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(167,'2023-07-02 17:36:45.560069','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(168,'2023-07-02 17:47:22.400750','1','Course object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(169,'2023-07-02 18:28:18.720079','2','Course object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(170,'2023-07-02 18:28:24.205988','3','Course object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(171,'2023-07-02 18:28:30.218569','4','Course object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(172,'2023-07-02 18:28:38.098266','5','Course object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(173,'2023-07-02 18:28:42.742592','6','Course object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(174,'2023-07-02 18:28:46.969713','7','Course object (7)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(175,'2023-07-02 18:28:51.558075','8','Course object (8)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(176,'2023-07-02 18:28:56.520238','9','Course object (9)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(177,'2023-07-02 18:29:03.111765','10','Course object (10)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',12,1),(178,'2023-07-02 18:29:27.639607','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(179,'2023-07-02 18:29:31.839147','2','Instructor object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(180,'2023-07-02 18:29:35.899930','3','Instructor object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(181,'2023-07-02 18:29:40.374096','4','Instructor object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(182,'2023-07-02 18:31:01.284897','5','Instructor object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(183,'2023-07-02 18:31:31.127585','6','Instructor object (6)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(184,'2023-07-02 18:32:30.292284','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(185,'2023-07-02 18:33:00.838298','1','Intern object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,1),(186,'2023-07-02 18:33:17.736948','2','Intern object (2)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,1),(187,'2023-07-02 18:33:34.965590','3','Intern object (3)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,1),(188,'2023-07-02 18:34:00.248800','4','Intern object (4)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,1),(189,'2023-07-02 18:34:31.085134','5','Intern object (5)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',15,1),(190,'2023-07-02 18:34:47.217517','6','Intern object (6)',2,'[{\"changed\": {\"fields\": [\"Intern id\", \"Image\"]}}]',15,1),(191,'2023-07-02 18:34:55.874502','7','Intern object (7)',3,'',15,1),(192,'2023-07-02 18:35:14.284463','7','Intern object (7)',2,'[{\"changed\": {\"fields\": [\"Intern id\", \"Image\"]}}]',15,1),(193,'2023-07-02 18:35:21.757546','8','Intern object (8)',3,'',15,1),(194,'2023-07-02 18:36:29.065888','1','Instructor object (1)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(195,'2023-07-02 18:45:48.226119','7','Instructor object (7)',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',8,1),(196,'2023-07-03 08:16:21.481094','1','Techteam object (1)',1,'[{\"added\": {}}]',16,1),(197,'2023-07-03 08:16:59.095474','2','Techteam object (2)',1,'[{\"added\": {}}]',16,1),(198,'2023-07-03 08:17:47.524409','3','Techteam object (3)',1,'[{\"added\": {}}]',16,1),(199,'2023-07-03 08:35:25.498782','3','Techteam_mem object (3)',2,'[{\"changed\": {\"fields\": [\"Image\", \"Name\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(12,'dashboard','course'),(7,'dashboard','event'),(11,'dashboard','event_registration'),(17,'dashboard','executive'),(8,'dashboard','instructor'),(15,'dashboard','intern'),(14,'dashboard','order'),(9,'dashboard','student'),(10,'dashboard','student_academics'),(13,'dashboard','studentoptedcourses'),(16,'dashboard','techteam_mem'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-24 07:02:43.093216'),(2,'auth','0001_initial','2023-06-24 07:02:43.408191'),(3,'admin','0001_initial','2023-06-24 07:02:43.499991'),(4,'admin','0002_logentry_remove_auto_add','2023-06-24 07:02:43.513933'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-24 07:02:43.526190'),(6,'contenttypes','0002_remove_content_type_name','2023-06-24 07:02:43.588539'),(7,'auth','0002_alter_permission_name_max_length','2023-06-24 07:02:43.634004'),(8,'auth','0003_alter_user_email_max_length','2023-06-24 07:02:43.664993'),(9,'auth','0004_alter_user_username_opts','2023-06-24 07:02:43.673245'),(10,'auth','0005_alter_user_last_login_null','2023-06-24 07:02:43.722464'),(11,'auth','0006_require_contenttypes_0002','2023-06-24 07:02:43.728672'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-24 07:02:43.738842'),(13,'auth','0008_alter_user_username_max_length','2023-06-24 07:02:43.783311'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-24 07:02:43.836811'),(15,'auth','0010_alter_group_name_max_length','2023-06-24 07:02:43.859047'),(16,'auth','0011_update_proxy_permissions','2023-06-24 07:02:43.869867'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-24 07:02:43.920501'),(18,'dashboard','0001_initial','2023-06-24 07:02:44.300516'),(19,'sessions','0001_initial','2023-06-24 07:02:44.329540'),(20,'dashboard','0002_alter_event_event_mode','2023-06-24 07:42:34.877049'),(21,'dashboard','0003_alter_event_event_duration','2023-06-24 08:51:40.343805'),(22,'dashboard','0004_rename_event_date_event_event_datetime','2023-06-24 09:19:02.961748'),(23,'dashboard','0005_alter_event_event_id','2023-06-24 11:46:31.529922'),(24,'dashboard','0006_event_event_venue','2023-06-24 12:23:16.319482'),(25,'dashboard','0007_alter_event_registration_table','2023-06-24 13:46:17.912091'),(26,'dashboard','0008_alter_event_registration_table','2023-06-24 13:48:02.632269'),(27,'dashboard','0009_alter_event_registration_table','2023-06-24 13:50:30.115353'),(28,'dashboard','0010_alter_event_registration_table_order','2023-06-24 17:37:39.284347'),(29,'dashboard','0011_event_speaker_dscription','2023-06-24 19:12:28.157599'),(30,'dashboard','0012_rename_speaker_dscription_event_speaker_description','2023-06-24 19:13:17.348495'),(31,'dashboard','0002_event','2023-06-24 19:57:16.581396'),(32,'dashboard','0003_event_registration','2023-06-24 19:57:28.175303'),(33,'dashboard','0004_event_event_status','2023-06-25 06:33:24.530400'),(34,'dashboard','0005_alter_event_event_status','2023-06-25 06:35:19.896644'),(35,'dashboard','0006_alter_event_event_status','2023-06-25 06:36:00.679316'),(36,'dashboard','0007_alter_event_registration_unique_together','2023-06-25 09:40:47.180439'),(37,'dashboard','0008_alter_event_speaker_description','2023-06-26 19:15:48.524316'),(38,'dashboard','0009_alter_event_event_description','2023-06-26 19:16:53.372468'),(39,'dashboard','0010_interns_techteam','2023-06-26 20:12:17.574020'),(40,'dashboard','0011_course_certification_criteria_alter_course_cost','2023-06-26 20:38:10.876768'),(41,'dashboard','0012_executive_rename_interns_intern','2023-06-28 10:55:06.073623'),(42,'dashboard','0013_alter_course_course_name','2023-07-01 11:29:31.383716'),(43,'dashboard','0014_event_registration_event_source_and_more','2023-07-01 11:58:18.928508'),(44,'dashboard','0015_event_registration_feedback_and_more','2023-07-01 12:08:04.575959'),(45,'dashboard','0016_alter_event_registration_event_source','2023-07-01 12:11:31.200257'),(46,'dashboard','0017_alter_course_course_name','2023-07-01 13:20:33.810897'),(47,'dashboard','0018_rename_techteam_description_techteam_description_and_more','2023-07-03 08:15:28.546497'),(48,'dashboard','0019_rename_techteam_techteam_mem_and_more','2023-07-03 08:33:48.484921');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('78jo5emfijvut2mh0a4kdhiurfvecivp','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qEPvb:oTx_-ZBEue9_afLJbh_K_JBo8ANzcN6cgKTDKbu2xv0','2023-07-12 07:49:27.287256'),('b0ronilhd20hkbxhts8pseya6a4zhdth','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qCxIi:BlvT_8gSfiIR3oy1LJ2w_Hg4KflzUjGBRmG1oYA-sns','2023-07-08 07:03:16.667998'),('brksl98x8haencdxgg9mw5coe9vu4t9d','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qGEer:-oDiJ5QB178cZRXfO2y8qNnw_wO9FgLIZorbWsOjhe8','2023-07-17 08:11:41.894974'),('cdym8mf97hcss7rgaveqi44h9c5ha9l5','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qFYkl:cyW9DdypYUhfGcL6uvesqWKav9CjmStZXpOsYaguLXA','2023-07-15 11:26:59.250467'),('dd33mi2q1hjtepizgoiv3sbegnmh93kn','.eJxVjEEOwiAQAP_C2RCgUMCjd99AlmWRqoGktCfj35WkB73OTObFAuxbCXunNSyJnZlip18WAR9Uh0h3qLfGsdVtXSIfCT9s59eW6Hk52r9BgV7GNoqEJguhtbOgrDMQhc9kBOEkxeyyl1Epmhz6L8uRSMnZaFRkNVhk7w_Y7DfI:1qFcJ4:32-Pm8Yr2zKGp1i9O2VyIjvl9RS4IFRiq2YfaiEvVBQ','2023-07-15 15:14:38.485357'),('ihmprdv586libqmmafhd6cjpsaw28o6t','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qDghf:6Wp-dpSG7xO2UESwqkqupFYNnWrzbmk0T4R1Jv-p-RQ','2023-07-10 07:32:03.277124'),('ri3toavmwwx1ka6qvywqz2m6rrbo763j','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qDIvw:b7FRir44gFvWdcmsiNNNUvyRnaCeMITLK-AuiXpEwsc','2023-07-09 06:09:12.776933'),('sp6abesup5crwqk620c5e3tlcy0lxi2l','.eJxVjEEOwiAQRe_C2hDGwnRw6b5naIaBStVAUtqV8e7apAvd_vfef6mRtzWPW0vLOEd1UaBOv1tgeaSyg3jncqtaalmXOehd0QdteqgxPa-H-3eQueVvnUjQGzERSbqOgZH6SSicRXpHYsB7D2CQQyIURHET0AQJCK231qn3B-A1N1k:1qE6BC:IMX8c7QdZT0LGMR4xsIBFNh2j6U30KLmDl3fCLW0L5Q','2023-07-11 10:44:14.475963');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` varchar(255) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_banner` longtext,
  `speaker_image` longtext,
  `event_link` longtext,
  `event_description` longtext NOT NULL,
  `event_speaker` varchar(255) NOT NULL,
  `speaker_description` longtext NOT NULL,
  `event_startdatetime` datetime(6) NOT NULL,
  `event_enddatetime` datetime(6) NOT NULL,
  `event_duration` longtext NOT NULL,
  `event_venue` longtext NOT NULL,
  `event_mode` varchar(255) NOT NULL,
  `students_enrolled` int NOT NULL,
  `available_seats` int NOT NULL,
  `event_fees` decimal(10,2) NOT NULL,
  `event_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES ('1','TCGA in Cancer Research','','','https://youtu.be/ObHhjS3e8uY','TCGA , one of the biggest repository in cancer database, plays a significant role in discovering prognostic and diagnostic markers in cancer research. In this event , we discussed  what is cancer and Pawan , a senior bioinformatics engineer at Elucidata ,','Pawan Verma','Pawan ,   M.Tech. in Computational Biology from IIITD is a , senior bioinformatics engineer at Elucidata','2022-09-25 05:30:00.000000','2022-09-25 07:30:00.000000','2 hours','TBD','TBD',0,30,0.00,'Past'),('2','NGS based application of RNA + DNA in clinical science','','','https://youtu.be/UFjhAENci6g','NGS is one the state of the art sequencing technique having great importance in the field of personalized medicine. In this event , Dr. Digvijay Singh, discusses the history of sequencing , need of it and what are the different application of DNA and RNA','Dr Kunwar Digvijay Narayan','NGS based Cancer diagnostics developer and Genomic Analyst at University of Illinois, Chicago','2022-10-15 14:30:00.000000','2022-10-15 16:30:00.000000','2 hours','TBD','TBD',0,30,0.00,'Past'),('3','Future Prospects of Research in India and Abroad','','','','Every third life sciences student today , wants to have a PhD from abroad, why , they also don\'t know? In this event , Dr. Nidula , discusses about the different career prospects of research in India and abroad, why should one pursue a phD from abroad.  A','Dr. Nidula Mullapilly','Works on clinical aspects of Pancreatitis and Pancreatic Cancer at Dake University, Dirham, North Carolina, US and PhD from the University of Verona, Italy','2022-10-22 13:30:00.000000','2022-10-22 15:30:00.000000','2 hours','TBD','TBD',0,30,0.00,'Past'),('4','Brief history of AI in healthcare: Roadmap towards biomedical data scientist career','','','https://youtu.be/106E_r-7phQ','Artificial Intelligence has continuously been spreading its applications in the field of healthcare and is gaining high importance in this domain. In order to understand, Data Science and AI or any field, it\'s always highly recommended to know the history','Dr Neel Das','Senior ML Expert  Roche, Switzerland','2022-10-30 10:30:00.000000','2022-10-30 12:30:00.000000','2 hours','TBD','TBD',0,30,0.00,'Past'),('5','Bioinformatics in Vaccine Discovery','','','https://youtu.be/ZfG60FAoXxE','Vaccines are a word and concept that all non-biologists wanted to know during the emergence of COVID cases. And biologists got interested in knowing the process, why, and how they are developed. To talk on \'in silico aspect of Role of bioinformatics in Va','Dr Dilraj Kaur','Computational Biologist and Post Doc Fellow at Nencki Institute of Experimental Biology PAS','2022-11-27 10:00:00.000000','2022-11-27 12:00:00.000000','2hours','TBD','TBD',0,30,0.00,'Past'),('6','Roadmap to career in Genetic Counseling','','','','B.Sc ----> M.Sc. ----> P.hD. ----> Post. Doc is not the only path for Life Sciences\r\nThis is something the general trend majority of life sciences graduates are following. But is it the only possible path in these fields?\r\nThis event is going to be centered around somewhere to this point?\r\nGenetic Counseling is one of the emerging and need of hour field to educate society regarding Genetics in laymen terms to every individual.\r\nIn this event, Dipanjana Datta will be discussing about why and what is Genetic counsleing and how to make a career after M.Sc. or M.Tech./P.hD. in this field. As well we will be having a fruitful interaction session where general queries and scientific questions will be answered.','Dr Dipanjana Dutta','Genetic Counseling at Apollo','2022-04-09 10:30:00.000000','2022-04-09 12:30:00.000000','2 hours','TBD','TBD',0,30,0.00,'Past');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_registeration`
--

DROP TABLE IF EXISTS `event_registeration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_registeration` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `event_id_id` varchar(255) DEFAULT NULL,
  `student_id_id` int DEFAULT NULL,
  `event_source` longtext,
  `previous_event` longtext,
  `previous_knowledge` longtext,
  `feedback` longtext,
  `suggestions` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_registeration_event_id_id_student_id_id_89731749_uniq` (`event_id_id`,`student_id_id`),
  KEY `event_registeration_student_id_id_b67477d8_fk_student_e` (`student_id_id`),
  CONSTRAINT `event_registeration_event_id_id_22d16d6c_fk_Event_event_id` FOREIGN KEY (`event_id_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `event_registeration_student_id_id_b67477d8_fk_student_e` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`enrollment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_registeration`
--

LOCK TABLES `event_registeration` WRITE;
/*!40000 ALTER TABLE `event_registeration` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_registeration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executives`
--

DROP TABLE IF EXISTS `executives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `executives` (
  `executives_id` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `executives_name` varchar(255) NOT NULL,
  `executives_description` longtext NOT NULL,
  `executives_qualification` longtext NOT NULL,
  PRIMARY KEY (`executives_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executives`
--

LOCK TABLES `executives` WRITE;
/*!40000 ALTER TABLE `executives` DISABLE KEYS */;
/*!40000 ALTER TABLE `executives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructor_id` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `instructor_name` varchar(255) NOT NULL,
  `instructor_description` varchar(10000) NOT NULL,
  `instructor_qualification` varchar(255) NOT NULL,
  PRIMARY KEY (`instructor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('1','images/Alok_Anand_dp.jpg','Alok Anand','With strong foundational skills in biostatistics, Machine Learning and Deep Learning, I am working with a multi-omics approach to Cancer Biology. With more than 6+ years of teaching experience, I am passionate about interacting with youths and guiding and teaching them from course curriculum to real life issues.','P.hD. (Computational Biology , IIITD)'),('2','images/manas_pic.jpeg','Manas Pratiti','I am pursuing a PhD in computational biology from IIIT-DELHI. My interests lie in the interdisciplinary field of \"AI in healthcare\". With a strong background in genomics and related life sciences, I will be glad to offer any kind of help to students regarding the same.','PhD , computational biology , IIITD'),('3','images/shailya_pic.jpeg','Shailya Verma','I am currently pursuing a PhD in Biological Science, and working in the field of Bioinformatics, Biophysics and Biochemistry. I have worked in different domains and would love to guide peers about various options in their careers, how to choose your topic of interest and excel in the field with the emerging interdisciplinary knowledge.','P.hD. scholar  Biological Sciences(NCBS)'),('4','images/prakriti_garg.jpg','Prakriti Garg','Being a graduate in Computer science with Bio-sciences, I am highly passionate about the intersection of Computer Science, Artificial Intelligence and its application in the Healthcare domain. Other than academia, I love to teach and interact with youth and guide them from my experience.','B.Tec. CSB(IIITD)'),('5','images/Prithivee_Photo.jpg','Prithivee Ramalingam','I am a Machine Learning Engineer with a background in MLOps. With masters from IIIT Hyderabad, with specialization  in Data Science, I am Currently working on MLOps, where I apply my knowledge of machine learning and software engineering to build scalable, production-ready systems.  Aside from my work, I am passionate about sharing my knowledge and insights with others. I frequently write technical blogs regarding Machine Learning, which I publish on Medium and LinkedIn. Medium Profile -> https://medium.com/@getprithivee','Machine Learning masters IIIT Hyderabad'),('6','images/pawan.jpg','Pawan Verma','Bioinformatics Engineer skilled in Transcriptomics, Biostatistics, Python (Programming Language), Exploratory Data Analysis, and Bioinformatics.  Strong research professional with a Masters focused in Biomathematics, Bioinformatics, and Computational Biology from International Institute of Information Technology.','Bioinformatics Engineer'),('7','images/hara.jpg','Dr. HaraPrasad Mishra','Pharmaceutical physician at the University of Delhi, India, & a computational medicine researcher at CHART, Ashoka University, India.  Dr. Mishra specializes in clinical pharmacology, digital health, computational medicine, & integrative medicine. He has worked on various projects involving \"AI & ML in healthcare\" with the Government of India, MNCs, & health-tech startups over the last five years in various capacities. He holds 3 patents & has 10 publications in national & international peer reviewed journals. His vision is to touch \"a billion lives\".','Pharmaceutical physician, University of Delhi');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intern`
--

DROP TABLE IF EXISTS `intern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intern` (
  `intern_id` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `intern_name` varchar(255) NOT NULL,
  `intern_description` longtext NOT NULL,
  `intern_qualification` longtext NOT NULL,
  PRIMARY KEY (`intern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intern`
--

LOCK TABLES `intern` WRITE;
/*!40000 ALTER TABLE `intern` DISABLE KEYS */;
INSERT INTO `intern` VALUES ('1','images/aishwarya.jpg','Aishwarya Deshpande','University of Mysore','MSc Biotechnology'),('2','images/prachi.jpg','Prachi Pawar','Guru Nanak Khalsa College, Matunga, Mumbai -16','Student'),('3','images/kadambari.jpg','Kadambari prakash Pimpalkar','Guru Nanak Khalsa College, Matunga, Mumbai -16','MSc Bioinformatics'),('4','images/megha.jpg','Megha','Savitribai Phule Pune University, Pune','MSc Bioinformatics'),('5','images/nilakshi.jpg','Nilakshi','Gauhati University, Assam','B.Tech. Biotechnology'),('6','images/farhan.jpg','Farhan Ali','University of Engineering and Technology, Lahore','Biomedical Engineering'),('7','images/priyanshu.jpg','Priyanshu Jain','Manav Rachna international Institute of research and studies','Btech Cse(AI/ML)');
/*!40000 ALTER TABLE `intern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  `address` longtext NOT NULL,
  `working_status` varchar(10) NOT NULL,
  `source` varchar(10) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `email` (`email`),
  KEY `student_user_id_dcc2526f_fk_auth_user_id` (`user_id`),
  CONSTRAINT `student_user_id_dcc2526f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_academics`
--

DROP TABLE IF EXISTS `student_academics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_academics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qualification` longtext,
  `college_university` longtext,
  `passing_year` int DEFAULT NULL,
  `student_id_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_academics_student_id_id_ef14f896_fk_student_e` (`student_id_id`),
  CONSTRAINT `student_academics_student_id_id_ef14f896_fk_student_e` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`enrollment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_academics`
--

LOCK TABLES `student_academics` WRITE;
/*!40000 ALTER TABLE `student_academics` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_academics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_opted_courses`
--

DROP TABLE IF EXISTS `student_opted_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_opted_courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` longtext,
  `grade` varchar(10) DEFAULT NULL,
  `attendance` decimal(5,2) DEFAULT NULL,
  `drive_link` longtext,
  `course_status` varchar(9) DEFAULT NULL,
  `course_id_id` varchar(255) DEFAULT NULL,
  `student_id_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_opted_courses_student_id_id_course_id_id_3d480b5b_uniq` (`student_id_id`,`course_id_id`),
  KEY `student_opted_courses_course_id_id_d8c05fab_fk_course_course_id` (`course_id_id`),
  CONSTRAINT `student_opted_course_student_id_id_05c483a4_fk_student_e` FOREIGN KEY (`student_id_id`) REFERENCES `student` (`enrollment_id`),
  CONSTRAINT `student_opted_courses_course_id_id_d8c05fab_fk_course_course_id` FOREIGN KEY (`course_id_id`) REFERENCES `course` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_opted_courses`
--

LOCK TABLES `student_opted_courses` WRITE;
/*!40000 ALTER TABLE `student_opted_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_opted_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `techteam_mem`
--

DROP TABLE IF EXISTS `techteam_mem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `techteam_mem` (
  `id` varchar(255) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `qualification` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techteam_mem`
--

LOCK TABLES `techteam_mem` WRITE;
/*!40000 ALTER TABLE `techteam_mem` DISABLE KEYS */;
INSERT INTO `techteam_mem` VALUES ('1','as','Tanishq Tiwari','Backend Developer','CBS undergraduate at IIITD'),('2','as','Om garg','Backend Developer','CSB undergraduate at IIITD'),('3','as','Gurpal Singh','Frontend Developer','undergraduate at Chitkara university');
/*!40000 ALTER TABLE `techteam_mem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-04  0:14:05
