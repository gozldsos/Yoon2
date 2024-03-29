  
  CREATE TABLE "MEMBER" 
   (	"M_ID" NVARCHAR2(40), 
	"M_PW" NVARCHAR2(120) NOT NULL ENABLE, 
	"M_NAME" NVARCHAR2(10) NOT NULL ENABLE, 
	"M_PHONE" NVARCHAR2(13) NOT NULL ENABLE, 
	"M_BIRTH" DATE NOT NULL ENABLE, 
	"M_ADDR" NVARCHAR2(50) NOT NULL ENABLE, 
	"M_KIND" NCHAR(1) NOT NULL ENABLE, 
	"M_EXADDR" NVARCHAR2(40), 
	 CONSTRAINT "PK_M_ID" PRIMARY KEY ("M_ID") ENABLE
   ) ;
   
   
     CREATE TABLE "PROFILEPHOTO" 
   (	"PF_ID" NVARCHAR2(40), 
	"PF_IMAGE" NVARCHAR2(60), 
	 CONSTRAINT "PK_PF_ID" PRIMARY KEY ("PF_ID") ENABLE, 
	 CONSTRAINT "FK_PF_ID" FOREIGN KEY ("PF_ID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
   
   
   
     CREATE TABLE "TRAINER" 
   (	"T_ID" NVARCHAR2(40), 
	"T_CID" NVARCHAR2(40), 
	"T_CAREER" NVARCHAR2(500), 
	 CONSTRAINT "PK_T_ID" PRIMARY KEY ("T_ID") ENABLE, 
	 CONSTRAINT "FK_T_ID" FOREIGN KEY ("T_ID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
   
   
  CREATE TABLE "COMPANY" 
   (	"C_ID" NVARCHAR2(40), 
	"C_NUM" NVARCHAR2(12) NOT NULL ENABLE, 
	"C_BNAME" NVARCHAR2(13) NOT NULL ENABLE, 
	"C_BPHONE" NVARCHAR2(20) NOT NULL ENABLE, 
	 CONSTRAINT "PK_C_ID" PRIMARY KEY ("C_ID") ENABLE, 
	 CONSTRAINT "FK_C_ID" FOREIGN KEY ("C_ID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
  
  
    CREATE TABLE "ADVERTISE" 
   (	"AD_CODE" NVARCHAR2(10), 
	"AD_NAME" NVARCHAR2(40), 
	"AD_TITLE" NVARCHAR2(30) NOT NULL ENABLE, 
	"AD_CATEGORY" NVARCHAR2(200), 
	"AD_STATUS" NVARCHAR2(10), 
	"AD_DATE" DATE, 
	"AD_CONTENT" NVARCHAR2(2000), 
	 CONSTRAINT "PK_AD_CODE" PRIMARY KEY ("AD_CODE") ENABLE, 
	 CONSTRAINT "FK_AD_NAME" FOREIGN KEY ("AD_NAME")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;


    CREATE TABLE "ADPHOTO" 
   (	"AP_ADCODE" NVARCHAR2(10), 
	"AP_IMAGE" NVARCHAR2(60) NOT NULL ENABLE
   ) ;
   
  
  CREATE TABLE "ADOPTION" 
   (	"OP_CODE" NVARCHAR2(10), 
	"OP_ADCODE" NVARCHAR2(10), 
	"OP_TRAINER" NVARCHAR2(40), 
	"OP_PRICE" NUMBER NOT NULL ENABLE, 
	"OP_PERIOD" NVARCHAR2(30), 
	"OP_TIMES" NUMBER, 
	"OP_DAY" NVARCHAR2(20), 
	"OP_CONTENT" NVARCHAR2(50), 
	"OP_CLOCK" NVARCHAR2(20), 
	"OP_PERSONNEL" NUMBER, 
	"OP_EXPIRE" NUMBER(1,0), 
	 CONSTRAINT "PK_OP_CODE" PRIMARY KEY ("OP_CODE") ENABLE, 
	 CONSTRAINT "FK_OP_ADCODE" FOREIGN KEY ("OP_ADCODE")
	  REFERENCES "ADVERTISE" ("AD_CODE") ENABLE, 
	 CONSTRAINT "FK_OP_TRAINER" FOREIGN KEY ("OP_TRAINER")
	  REFERENCES "TRAINER" ("T_ID") ENABLE
   ) ;


 CREATE TABLE "DAILY" 
   (	"DA_CODE" NVARCHAR2(10), 
	"DA_PSCODE" NVARCHAR2(10), 
	"DA_STATUS" NVARCHAR2(5) NOT NULL ENABLE, 
	"DA_OPPERIOD" NVARCHAR2(30), 
	 CONSTRAINT "PK_DA_DACODE" PRIMARY KEY ("DA_CODE") ENABLE, 
	 CONSTRAINT "FK_DA_PSCODE" FOREIGN KEY ("DA_PSCODE")
	  REFERENCES "PAYMENTHISTORY" ("PS_CODE") ENABLE
   ) ;


  CREATE TABLE "DAILYCHECKN" 
   (	"DN_DACODE" NVARCHAR2(10), 
	"DN_DATE" DATE, 
	 CONSTRAINT "PK_DN_DACODE" PRIMARY KEY ("DN_DACODE", "DN_DATE") ENABLE, 
	 CONSTRAINT "FK_DN_DACODE" FOREIGN KEY ("DN_DACODE")
	  REFERENCES "DAILY" ("DA_CODE") ENABLE
   ) ;
   
   
   
     CREATE TABLE "DAILYCHECKT" 
   (	"DT_TID" NVARCHAR2(40), 
	"DT_CID" NVARCHAR2(40), 
	"DT_DATE" DATE, 
	"DT_STATUS" NCHAR(2) NOT NULL ENABLE, 
	 CONSTRAINT "PK_DT_TID" PRIMARY KEY ("DT_TID", "DT_CID", "DT_DATE") ENABLE, 
	 CONSTRAINT "FK_DT_TID" FOREIGN KEY ("DT_TID")
	  REFERENCES "TRAINER" ("T_ID") ENABLE, 
	 CONSTRAINT "FK_DT_CID" FOREIGN KEY ("DT_CID")
	  REFERENCES "COMPANY" ("C_ID") ENABLE
   ) ;
   
   
     CREATE TABLE "DIBS" 
   (	"D_ADCODE" NVARCHAR2(10), 
	"D_ID" NVARCHAR2(40), 
	 CONSTRAINT "PK_D_ADCODE" PRIMARY KEY ("D_ADCODE", "D_ID") ENABLE, 
	 CONSTRAINT "FK_D_ADCODE" FOREIGN KEY ("D_ADCODE")
	  REFERENCES "ADVERTISE" ("AD_CODE") ENABLE, 
	 CONSTRAINT "FK_D_ID" FOREIGN KEY ("D_ID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
   
   
     CREATE TABLE "PAYMENTHISTORY" 
   (	"PS_CODE" NVARCHAR2(10), 
	"PS_ADCODE" NVARCHAR2(10), 
	"PS_OPCODE" NVARCHAR2(40), 
	"PS_MID" NVARCHAR2(40), 
	"PS_DATE" DATE NOT NULL ENABLE, 
	"PS_PRICE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_PS_CODE" PRIMARY KEY ("PS_CODE") ENABLE, 
	 CONSTRAINT "FK_PS_ADCODE" FOREIGN KEY ("PS_ADCODE")
	  REFERENCES "ADVERTISE" ("AD_CODE") ENABLE, 
	 CONSTRAINT "FK_PS_OPCODE" FOREIGN KEY ("PS_OPCODE")
	  REFERENCES "ADOPTION" ("OP_CODE") ENABLE, 
	 CONSTRAINT "FK_PS_MID" FOREIGN KEY ("PS_MID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
   
   
     CREATE TABLE "QNA" 
   (	"QA_NUM" NVARCHAR2(10), 
	"QA_ADCODE" NVARCHAR2(10), 
	"QA_WRITER" NVARCHAR2(40), 
	"QA_WCONTENT" NVARCHAR2(200) NOT NULL ENABLE, 
	"QA_WDATE" DATE, 
	"QA_ANSWER" NVARCHAR2(40) NOT NULL ENABLE, 
	"QA_ACONTENT" NVARCHAR2(200), 
	"QA_ADATE" DATE, 
	"QA_TRUE" NCHAR(1), 
	 CONSTRAINT "PK_QA_NUM" PRIMARY KEY ("QA_NUM") ENABLE, 
	 CONSTRAINT "FK_QA_ADCODE" FOREIGN KEY ("QA_ADCODE")
	  REFERENCES "ADVERTISE" ("AD_CODE") ENABLE, 
	 CONSTRAINT "FK_QA_WRITER" FOREIGN KEY ("QA_WRITER")
	  REFERENCES "MEMBER" ("M_ID") ENABLE, 
	 CONSTRAINT "FK_QA_ANSWER" FOREIGN KEY ("QA_ANSWER")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;
   
   
     CREATE TABLE "REVIEW" 
   (	"RV_NUM" NVARCHAR2(10), 
	"RV_PSCODE" NVARCHAR2(10), 
	"RV_NAME" NVARCHAR2(40), 
	"RV_CONTENT" NVARCHAR2(200) NOT NULL ENABLE, 
	"RV_DATE" DATE NOT NULL ENABLE, 
	"RV_STPOINT" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "PK_RV_NUM" PRIMARY KEY ("RV_NUM") ENABLE, 
	 CONSTRAINT "FK_RV_NAME" FOREIGN KEY ("RV_NAME")
	  REFERENCES "MEMBER" ("M_ID") ENABLE, 
	 CONSTRAINT "FK_RV_PSCODE" FOREIGN KEY ("RV_PSCODE")
	  REFERENCES "PAYMENTHISTORY" ("PS_CODE") ENABLE
   ) ;
   
   
     CREATE TABLE "YESORNO" 
   (	"YN_COMPANY" NVARCHAR2(40), 
	"YN_TRAINER" NVARCHAR2(40), 
	"YN_STATE" NVARCHAR2(2), 
	"YN_DATE" DATE, 
	 CONSTRAINT "FK_YN_COMPANY" FOREIGN KEY ("YN_COMPANY")
	  REFERENCES "COMPANY" ("C_ID") ENABLE, 
	 CONSTRAINT "FK_YN_TRAINER" FOREIGN KEY ("YN_TRAINER")
	  REFERENCES "TRAINER" ("T_ID") ENABLE
   ) ;
   
     CREATE TABLE "ALARM" 
   (	"AL_CODE" NVARCHAR2(10), 
	"AL_MSID" NVARCHAR2(40), 
	"AL_MRID" NVARCHAR2(40), 
	"AL_KIND" NVARCHAR2(4) NOT NULL ENABLE, 
	"AL_STATUS" NCHAR(1) NOT NULL ENABLE, 
	"AL_DATE" DATE NOT NULL ENABLE, 
	 CONSTRAINT "PK_AL_CODE" PRIMARY KEY ("AL_CODE") ENABLE, 
	 CONSTRAINT "FK_AL_MSID" FOREIGN KEY ("AL_MSID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE, 
	 CONSTRAINT "FK_AL_MRID" FOREIGN KEY ("AL_MRID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE
   ) ;


     CREATE TABLE "COUNSEL" 
   (	"CS_OPCODE" NVARCHAR2(10), 
	"CS_MID" NVARCHAR2(40), 
	"CS_DATE" DATE, 
	"CS_CONTENT" NVARCHAR2(200), 
	"CS_IMAGE" NVARCHAR2(60), 
	 CONSTRAINT "PK_CS_ADCODE" PRIMARY KEY ("CS_OPCODE", "CS_MID", "CS_DATE") ENABLE, 
	 CONSTRAINT "FK_CS_MID" FOREIGN KEY ("CS_MID")
	  REFERENCES "MEMBER" ("M_ID") ENABLE, 
	 CONSTRAINT "FK_CS_OPCODE" FOREIGN KEY ("CS_OPCODE")
	  REFERENCES "ADOPTION" ("OP_CODE") ENABLE
   ) ;
   
   
   
   
     CREATE TABLE "DELETEREALID" 
   (	"M_ID" NVARCHAR2(40), 
	"M_KIND" NCHAR(1)
   ) ;
   
   
--시퀀스

CREATE SEQUENCE AD_SEQ; 
CREATE SEQUENCE AL_SEQ;
CREATE SEQUENCE BF_SEQ;
CREATE SEQUENCE BOARD_SEQ;
CREATE SEQUENCE CS_SEQ;
CREATE SEQUENCE D_SEQ;
CREATE SEQUENCE DA_SEQ;
CREATE SEQUENCE DN_SEQ;
CREATE SEQUENCE EMPNO_SEQ;
CREATE SEQUENCE OP_SEQ;
CREATE SEQUENCE PS_SEQ;
CREATE SEQUENCE QA_SEQ;
CREATE SEQUENCE REPLY_SEQ;
CREATE SEQUENCE RV_SEQ;
CREATE SEQUENCE YN_SEQ;

--뷰

CREATE OR REPLACE FORCE VIEW "AD_OP" ("AD_CODE", "AD_NAME", "AD_TITLE", "AD_CATEGORY", "AD_STATUS", "AD_DATE", "AD_CONTENT", "OP_CODE", "OP_ADCODE", "OP_TRAINER", "OP_PRICE", "OP_PERIOD", "OP_TIMES", "OP_DAY", "OP_CONTENT", "OP_CLOCK", "OP_PERSONNEL", "OP_EXPIRE") AS 
  selecT "AD_CODE","AD_NAME","AD_TITLE","AD_CATEGORY","AD_STATUS","AD_DATE","AD_CONTENT","OP_CODE","OP_ADCODE","OP_TRAINER","OP_PRICE","OP_PERIOD","OP_TIMES","OP_DAY","OP_CONTENT","OP_CLOCK","OP_PERSONNEL","OP_EXPIRE" FROM AD,OP
WHERE AD.AD_CODE= OP.OP_CODE
WITH CHECK OPTION;


CREATE OR REPLACE FORCE VIEW "ADOP" ("AD_CODE", "AD_NAME", "AD_TITLE", "AD_CONTENT", "AD_CATEGORY", "AD_STATUS", "AD_DATE", "OP_CODE", "OP_ADCODE", "OP_TRAINER", "OP_PRICE", "OP_PERIOD", "OP_TIMES", "OP_DAY", "OP_CONTENT", "OP_CLOCK", "OP_PERSONNEL", "OP_EXPIRE") AS 
  select "AD_CODE","AD_NAME","AD_TITLE","AD_CONTENT","AD_CATEGORY","AD_STATUS","AD_DATE","OP_CODE","OP_ADCODE","OP_TRAINER","OP_PRICE","OP_PERIOD","OP_TIMES","OP_DAY","OP_CONTENT","OP_CLOCK","OP_PERSONNEL","OP_EXPIRE" from ad
left join op on ad_code = op_adcode;


  CREATE OR REPLACE FORCE VIEW "CATEGORY" ("OP_ADCODE", "OP_CODE", "OP_TRAINER", "OP_CONTENT", "OP_PRICE", "OP_PERIOD", "OP_TIMES", "OP_DAY", "OP_CLOCK", "OP_PERSONNEL", "M_NAME", "M_ADDR", "M_EXADDR") AS 
  SELECT OP_ADCODE, OP_CODE, OP_TRAINER, OP_CONTENT, OP_PRICE, OP_PERIOD, OP_TIMES, OP_DAY, OP_CLOCK, OP_PERSONNEL, M_NAME, M_ADDR, M_EXADDR
FROM OP
LEFT JOIN AD ON OP_ADCODE=AD_CODE
LEFT OUTER JOIN M ON OP_TRAINER=M_ID;


  CREATE OR REPLACE FORCE VIEW "CINFO" ("M_ID", "M_NAME", "M_PHONE", "M_BIRTH", "M_ADDR", "M_EXADDR", "M_KIND", "C_NUM", "C_BNAME", "C_BPHONE", "PF_IMAGE") AS 
  SELECT M_ID, M_NAME, M_PHONE, M_BIRTH, M_ADDR, M_EXADDR, M_KIND, C_NUM, C_BNAME, C_BPHONE, PF_IMAGE 
FROM M JOIN C ON M_ID=C_ID
LEFT JOIN PF ON M_ID=PF_ID;


CREATE OR REPLACE FORCE VIEW "DAILY_NORMAL" ("DA_STATUS", "DA_OPPERIOD", "PS_MID", "PS_DATE", "PS_CODE", "OP_CODE", "OP_ADCODE", "OP_PERIOD", "AD_CODE", "AD_CATEGORY", "AD_NAME") AS 
  select distinct da_status,da_opperiod,ps_mid,ps_date,ps_code,op_code,op_adcode,op_period,ad_code,ad_category,ad_name from daily left join ps on ps.ps_code= da_pscode left join op on ps.ps_adcode = op.op_adcode left join ad on op.op_adcode = ad.ad_code where ad_category = '일반' and da_status = '이용중' or da_status = '일시정지';



  CREATE OR REPLACE FORCE VIEW "DETAILPAGE" ("AD_CODE", "AD_NAME", "AD_TITLE", "AD_STATUS", "AD_DATE", "AD_CATEGORY", "AP_IMAGE", "M_ADDR", "T_CID", "M_NAME", "M_KIND") AS 
  SELECT AD_CODE, AD_NAME, AD_TITLE, AD_STATUS, AD_DATE, AD_CATEGORY, AP_IMAGE, M_ADDR, T_CID, M_NAME, M_KIND 
FROM AD 
LEFT JOIN AP ON AD_CODE=AP_ADCODE
LEFT JOIN M ON AD_NAME=M_ID
LEFT JOIN T ON AD_NAME=T_ID;


  CREATE OR REPLACE FORCE VIEW "MAINLIST" ("AD_CODE", "AD_NAME", "AD_TITLE", "AD_DATE", "AD_CATEGORY", "PF_IMAGE", "M_ADDR", "M_EXADDR", "T_CID") AS 
  SELECT AD_CODE, AD_NAME, AD_TITLE, AD_DATE, AD_CATEGORY, PF_IMAGE, M_ADDR, M_EXADDR ,T_CID 
FROM AD
LEFT JOIN PROFILEPHOTO ON AD_NAME=PF_ID
LEFT JOIN M ON AD_NAME=M_ID
LEFT JOIN T ON AD_NAME=T_ID
WHERE AD_STATUS='모집중';


  CREATE OR REPLACE FORCE VIEW "NINFO" ("M_ID", "M_NAME", "M_PHONE", "M_BIRTH", "M_ADDR", "M_EXADDR", "M_KIND", "PF_IMAGE") AS 
  SELECT M_ID, M_NAME, M_PHONE, M_BIRTH, M_ADDR, M_EXADDR, M_KIND, PF_IMAGE
FROM M LEFT JOIN PF ON M_ID=PF_ID
WHERE M_KIND='n';


 CREATE OR REPLACE FORCE VIEW "NORMAL_TOTAL2" ("M_NAME", "M_BIRTH", "M_PHONE", "AD_CATEGORY") AS 
  select distinct m_name,m_birth,m_phone,ad_category from ad,ps,m;
  
  
CREATE OR REPLACE FORCE VIEW "T_CID_ADDR" ("T_CID", "T_CID_ADDR") AS 
  SELECT T_CID, M_ADDR AS T_CID_ADDR 
FROM T 
LEFT JOIN M ON T_CID=M_ID;



  CREATE OR REPLACE FORCE VIEW "T_MODIFY" ("M_ID", "M_PW", "M_NAME", "M_PHONE", "M_BIRTH", "M_ADDR", "M_EXADDR", "M_KIND", "PF_IMAGE") AS 
  SELECT M_ID , M_PW ,M_NAME,M_PHONE, TO_CHAR(M_BIRTH,'yyyy/mm/dd') AS M_BIRTH , M_ADDR ,M_EXADDR, M_KIND ,PF_IMAGE  FROM M
LEFT JOIN PF ON M_ID=PF_ID;


  CREATE OR REPLACE FORCE VIEW "TINFO" ("M_ID", "M_NAME", "M_PHONE", "M_BIRTH", "M_ADDR", "M_EXADDR", "M_KIND", "T_CID", "T_CAREER", "PF_IMAGE") AS 
  SELECT M_ID, M_NAME, M_PHONE, M_BIRTH, M_ADDR, M_EXADDR, M_KIND, T_CID, T_CAREER, PF_IMAGE
FROM M 
JOIN T ON M_ID=T_ID
LEFT JOIN PF ON M_ID=PF_ID;


  CREATE OR REPLACE FORCE VIEW "TRAINER_SALES" ("AD_CODE", "AD_NAME", "AD_TITLE", "AD_CATEGORY", "AD_STATUS", "AD_DATE", "AD_CONTENT", "OP_CODE", "OP_ADCODE", "OP_TRAINER", "OP_PRICE", "OP_PERIOD", "OP_TIMES", "OP_DAY", "OP_CONTENT", "OP_CLOCK", "OP_PERSONNEL", "OP_EXPIRE", "PS_CODE", "PS_ADCODE", "PS_OPCODE", "PS_MID", "PS_DATE", "PS_PRICE") AS 
  select "AD_CODE","AD_NAME","AD_TITLE","AD_CATEGORY","AD_STATUS","AD_DATE","AD_CONTENT","OP_CODE","OP_ADCODE","OP_TRAINER","OP_PRICE","OP_PERIOD","OP_TIMES","OP_DAY","OP_CONTENT","OP_CLOCK","OP_PERSONNEL","OP_EXPIRE","PS_CODE","PS_ADCODE","PS_OPCODE","PS_MID","PS_DATE","PS_PRICE" from ad left join op on op_adcode = ad_code left join ps on ps_opcode = op_code;
  
  
  --SYNONYM
    
    
    CREATE OR REPLACE SYNONYM M FOR MEMBER;
    CREATE OR REPLACE SYNONYM C FOR COMPANY;
    CREATE OR REPLACE SYNONYM T FOR TRAINER;
    CREATE OR REPLACE SYNONYM PF FOR PROFILEPHOTO;
    CREATE OR REPLACE SYNONYM AD FOR ADVERTISE;
    CREATE OR REPLACE SYNONYM OP FOR ADOPTION;
    CREATE OR REPLACE SYNONYM RV FOR REVIEW;
    CREATE OR REPLACE SYNONYM QA FOR QNA;
    CREATE OR REPLACE SYNONYM PS FOR PAYMENTHISTORY;
    CREATE OR REPLACE SYNONYM CS FOR COUNSEL;
    CREATE OR REPLACE SYNONYM DA FOR DAILY;
    CREATE OR REPLACE SYNONYM DN FOR DAILYCHECKN;
    CREATE OR REPLACE SYNONYM DT FOR DAILYCHECKT;
    CREATE OR REPLACE SYNONYM AP FOR ADPHOTO;
    CREATE OR REPLACE SYNONYM AL FOR ALARM;
    CREATE OR REPLACE SYNONYM YN FOR YESORNO;
    CREATE OR REPLACE SYNONYM DR FOR DELETEREALID;