﻿-----------------삭제------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
---------------------------------------



CREATE TABLE "LEAVE" (
	"LEAVE_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"LEAVE_CATEGORY"	NUMBER		NOT NULL,
	"LEAVE_START"	VARCHAR2(50)		NOT NULL,
	"LEAVE_END"	VARCHAR2(50)		NOT NULL,
	"LEAVE_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"LEAVE_STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NOT NULL,
	"LEAVE_CHECK"	NUMBER	DEFAULT 0	NOT NULL,
	"ENROLL_DATE"	VARCHAR2(50)		NOT NULL,
	"FIRST_DATE"	VARCHAR2(50)		NULL,
	"SECOND_DATE"	VARCHAR2(50)		NULL,
	"FAIL_DATE"	VARCHAR2(50)		NULL,
	"FIRST_APPROVAL"	NUMBER		NULL,
	"SECOND_APPROVAL"	NUMBER		NULL
);

COMMENT ON COLUMN "LEAVE"."LEAVE_STATUS" IS 'Y/N';

COMMENT ON COLUMN "LEAVE"."LEAVE_CHECK" IS '0:결재대기(1차)/1:결재대기(2차)/2:승인/3:반려';

COMMENT ON COLUMN "LEAVE"."FIRST_APPROVAL" IS '1차결재자 사번';

COMMENT ON COLUMN "LEAVE"."SECOND_APPROVAL" IS '2차결재자 사번';

CREATE TABLE "APPROVAL" (
	"APP_NO"	NUMBER		NOT NULL,
	"DOC_NO"	VARCHAR2(50)		NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"DOC_TYPE"	NUMBER	DEFAULT 0	NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"UPDATE_DATE"	DATE		NULL,
	"DOC_TITLE"	VARCHAR2(200)		NULL,
	"DOC_CONTENT"	CLOB		NULL,
	"DOC_ORIGINNAME"	VARCHAR2(200)		NULL,
	"DOC_FILEPATH"	VARCHAR2(4000)		NULL,
	"APP_STATUS"	NUMBER	DEFAULT 0	NOT NULL,
	"DOC_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL,
	"APP_COUNT"	NUMBER		NOT NULL,
	"APP_TURN"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "APPROVAL"."DOC_NO" IS '결재양식+연도+번호';

COMMENT ON COLUMN "APPROVAL"."DOC_TYPE" IS '0:기안서, 1:품의서, 2:사직서';

COMMENT ON COLUMN "APPROVAL"."APP_STATUS" IS '0: 결재대기, 1: 진행중,  2: 결재완료, 3: 반려, 4: 임시저장';

COMMENT ON COLUMN "APPROVAL"."DOC_STATUS" IS 'Y:등록, N:삭제, D:임시저장';

COMMENT ON COLUMN "APPROVAL"."APP_COUNT" IS '1,2,3';

COMMENT ON COLUMN "APPROVAL"."APP_TURN" IS '1,2,3';

CREATE TABLE "BUSINESSTRIP" (
	"BT_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"BT_START"	VARCHAR2(50)		NOT NULL,
	"BT_END"	VARCHAR2(50)		NOT NULL,
	"BT_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"BT_STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NOT NULL,
	"BT_CHECK"	NUMBER	DEFAULT 0	NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"FIRST_DATE"	VARCHAR2(50)		NULL,
	"SECOND_DATE"	VARCHAR2(50)		NULL,
	"FAIL_DATE"	VARCHAR2(50)		NULL,
	"FIRST_APPROVAL"	VARCHAR2(50)		NULL,
	"SECOND_APPROVAL"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "BUSINESSTRIP"."BT_STATUS" IS 'Y/N';

COMMENT ON COLUMN "BUSINESSTRIP"."BT_CHECK" IS '0:결재대기(1차)/1:결재대기(2차)/2:승인/3:반려';

COMMENT ON COLUMN "BUSINESSTRIP"."FIRST_APPROVAL" IS '1차결재자사번';

COMMENT ON COLUMN "BUSINESSTRIP"."SECOND_APPROVAL" IS '2차결재자사번';

CREATE TABLE "OVERTIME" (
	"OT_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"ENROLL_DATE"	VARCHAR2(50)		NOT NULL,
	"OT_CATEGORY"	NUMBER		NOT NULL,
	"OT_START"	VARCHAR2(50)		NOT NULL,
	"OT_END"	VARCHAR2(50)		NOT NULL,
	"OT_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"OT_STATUS"	VARCHAR2(10)	DEFAULT 'Y'	NOT NULL,
	"OT_CHECK"	NUMBER	DEFAULT 0	NOT NULL,
	"FIRST_DATE"	VARCHAR2(50)		NULL,
	"SECOND_DATE"	VARCHAR2(50)		NULL,
	"FAIL_DATE"	VARCHAR2(50)		NULL,
	"FIRST_APPROVAL"	VARCHAR2(50)		NULL,
	"SECOND_APPROVAL"	VARCHAR2(50)		NULL
);

COMMENT ON COLUMN "OVERTIME"."OT_CATEGORY" IS '0:시간외근무,1:야간,2:주말';

COMMENT ON COLUMN "OVERTIME"."OT_STATUS" IS 'Y/N';

COMMENT ON COLUMN "OVERTIME"."OT_CHECK" IS '0:결재대기(1차),1:결재대기(2차),2:승인,3:반려';

COMMENT ON COLUMN "OVERTIME"."FIRST_APPROVAL" IS '1차결재자사번';

COMMENT ON COLUMN "OVERTIME"."SECOND_APPROVAL" IS '2차결재자사번';

CREATE TABLE "ATTENDENCE" (
	"ATT_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"START_TIME"	VARCHAR2(50)		NULL,
	"END_TIME"	VARCHAR2(50)		NULL,
	"ATT_TIME"	VARCHAR2(50)		NULL,
	"ATT_STATUS"	NUMBER	DEFAULT 3	NOT NULL,
	"ATT_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"AFTER_TIME"	VARCHAR2(50)	DEFAULT 0	NULL
);

COMMENT ON COLUMN "ATTENDENCE"."ATT_STATUS" IS '0:정상,1:지각,2:조퇴,3:결근,4:휴가,5:출장';

COMMENT ON COLUMN "ATTENDENCE"."AFTER_TIME" IS '시간외근무시간';

CREATE TABLE "ANNUAL" (
	"ANNUAL_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"ANNUAL_CREATE"	NUMBER		NULL,
	"ANNUAL_USE"	NUMBER		NULL,
	"ANNUAL_DATE"	VARCHAR2(50)		NOT NULL,
	"ANNUAL_CATEGORY"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ANNUAL"."ANNUAL_CATEGORY" IS '1:발생/2:사용';

CREATE TABLE "MAIL" (
	"MAIL_NO"	NUMBER		NOT NULL,
	"SENDER_NO"	NUMBER		NOT NULL,
	"SENDER"	VARCHAR2(50)		NOT NULL,
	"RECEIVER"	VARCHAR2(50)		NULL,
	"MAIL_TITLE"	VARCHAR2(4000)	DEFAULT '(제목없음)'	NOT NULL,
	"MAIL_CONTENT"	CLOB		NULL,
	"REGISTER_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"SEND"	VARCHAR2(1)		NOT NULL
);

COMMENT ON COLUMN "MAIL"."REGISTER_DATE" IS '임시서장|전송 날짜';

COMMENT ON COLUMN "MAIL"."SEND" IS 'N : 임시저장 | Y : 발송';

CREATE TABLE "MAIL_DETAIL" (
	"MAIL_NO"	NUMBER		NOT NULL,
	"MAILBOX_NO"	NUMBER		NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"EMP_NAME"	VARCHAR2(50)		NULL,
	"READ"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"READ_DATE"	DATE		NULL,
	"IMPORTANT"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"TYPE"	VARCHAR2(1)		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NOT NULL
);

COMMENT ON COLUMN "MAIL_DETAIL"."READ" IS 'N : 안읽음 | Y : 읽음';

COMMENT ON COLUMN "MAIL_DETAIL"."IMPORTANT" IS 'Y : 중요메일';

COMMENT ON COLUMN "MAIL_DETAIL"."TYPE" IS 'R : 수신 | S : 발신';

COMMENT ON COLUMN "MAIL_DETAIL"."STATUS" IS 'N : 휴지통';

CREATE TABLE "MAILBOX" (
	"MAILBOX_NO"	NUMBER		NOT NULL,
	"MAILBOX_NAME"	VARCHAR2(1000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL
);

CREATE TABLE "CAR" (
	"CAR_NAME"	VARCHAR2(1000)		NOT NULL,
	"CAR_IMG"	VARCHAR2(1000)		NULL,
	"CAR_TYPE"	VARCHAR2(1000)		NOT NULL,
	"GEAR_TYPE"	VARCHAR2(1000)		NOT NULL,
	"CAR_COLOR"	VARCHAR2(1000)		NOT NULL,
	"MAKER"	VARCHAR2(1000)		NOT NULL,
	"FUEL_TYPE"	VARCHAR2(1000)		NOT NULL,
	"MODEL_YEAR"	VARCHAR2(1000)		NOT NULL,
	"ETC"	VARCHAR2(3000)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

CREATE TABLE "CF_ROOM" (
	"CFR_NAME"	VARCHAR2(1000)		NOT NULL,
	"CFR_IMG"	VARCHAR2(1000)		NULL,
	"CAPACITY"	NUMBER		NOT NULL,
	"EQUIPMENT"	VARCHAR2(100)		NOT NULL
);

CREATE TABLE "MAIL_AT" (
	"ATTACHMENT_NO"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(100)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(100)		NOT NULL,
	"MAIL_NO"	NUMBER		NOT NULL
);

CREATE TABLE "PROJECT_REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REF_PROJECT"	NUMBER		NOT NULL,
	"REPLY_WRITER"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

CREATE TABLE "PROJECT" (
	"PROJECT_NO"	NUMBER		NOT NULL,
	"PROJECT_WRITER"	NUMBER		NOT NULL,
	"PROJECT_NAME"	VARCHAR2(100)		NOT NULL,
	"PROJECT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"STATUS"	VARCHAR2(100)		NOT NULL,
	"FILE_URL"	VARCHAR2(1000)		NULL,
	"ORIGIN_FILENAME"	VARCHAR2(1000)		NULL,
	"START_DATE"	VARCHAR2(100)		NOT NULL,
	"END_DATE"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "PROJECT"."STATUS" IS '1/2/3 /4 | 정상, 지연, 매우지연, 완료';

CREATE TABLE "REFERENCE" (
	"REF_NO"	NUMBER		NOT NULL,
	"APP_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"CHECK_DATE"	DATE		NULL
);

CREATE TABLE "APP_LINE" (
	"LINE_NO"	NUMBER		NOT NULL,
	"APP_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"APP_LEVEL"	NUMBER		NOT NULL,
	"CONFIRM_STATUS"	NUMBER	DEFAULT 0	NOT NULL,
	"APP_DATE"	DATE		NULL,
	"RE_REASON"	VARCHAR2(1000)		NULL
);

COMMENT ON COLUMN "APP_LINE"."APP_LEVEL" IS '1, 2, 3';

COMMENT ON COLUMN "APP_LINE"."CONFIRM_STATUS" IS '0: 대기중, 1: 승인, 2: 반려';

CREATE TABLE "EMPLOYEE" (
	"EMP_NO"	NUMBER		NOT NULL,
	"EMP_PWD"	VARCHAR2(100)		NOT NULL,
	"EMP_NAME"	VARCHAR2(20)		NOT NULL,
	"GENDER"	VARCHAR2(1)		NULL,
	"PHONE"	VARCHAR2(13)		NULL,
	"EMAIL"	VARCHAR2(50)		NULL,
	"BIRTH"	VARCHAR2(20)		NULL,
	"DEPT_CODE"	NUMBER		NOT NULL,
	"TEAM_CODE"	NUMBER		NOT NULL,
	"JOB_CODE"	NUMBER		NOT NULL,
	"EMP_PHONE"	VARCHAR2(13)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"RESIGN_DATE"	DATE		NULL,
	"MODIFY_DATE"	DATE		NULL,
	"PROFILE_URL"	VARCHAR2(400)		NULL,
	"TASK"	VARCHAR2(1000)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"ACCOUNT_STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "EMPLOYEE"."GENDER" IS 'F/M';

COMMENT ON COLUMN "EMPLOYEE"."STATUS" IS '재직Y/퇴사N';

COMMENT ON COLUMN "EMPLOYEE"."ACCOUNT_STATUS" IS '정상Y/정지N';

CREATE TABLE "DEPARTMENT" (
	"DEPT_CODE"	NUMBER		NOT NULL,
	"DEPT_NAME"	VARCHAR2(20)		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "DEPARTMENT"."STATUS" IS '존재Y/삭제N';

CREATE TABLE "TEAM" (
	"TEAM_CODE"	NUMBER		NOT NULL,
	"TEAM_NAME"	VARCHAR2(20)		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"DEPT_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "TEAM"."STATUS" IS 'Y/N';

CREATE TABLE "JOB" (
	"JOB_CODE"	NUMBER		NOT NULL,
	"JOB_NAME"	VARCHAR2(20)		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "JOB"."STATUS" IS 'Y/N';

CREATE TABLE "ADDRESS_OUT" (
	"ADDOUT_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(20)		NOT NULL,
	"BIZ_NAME"	VARCHAR2(50)		NULL,
	"DEPT"	VARCHAR2(20)		NULL,
	"JOB"	VARCHAR2(20)		NULL,
	"EMAIL"	VARCHAR2(50)		NULL,
	"PHONE"	VARCHAR2(13)		NULL,
	"BIZ_PHONE"	VARCHAR2(13)		NULL,
	"MEMO"	VARCHAR2(1000)		NULL,
	"GROUP_NO"	NUMBER		NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "ADDRESS_OUT"."STATUS" IS 'Y/N';

CREATE TABLE "ADDRESS_GR" (
	"GROUP_NO"	NUMBER		NOT NULL,
	"GROUP_NAME"	VARCHAR2(30)		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL
);

CREATE TABLE "SCHEDULE" (
	"SCH_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"SCH_TITLE"	VARCHAR2(100)		NOT NULL,
	"SCH_CONTENT"	VARCHAR2(1000)		NOT NULL,
	"SCH_BEGIN"	VARCHAR2(50)		NULL,
	"SCH_END"	VARCHAR2(50)		NULL,
	"TIME_BEGIN"	VARCHAR2(50)		NULL,
	"TIME_END"	VARCHAR2(50)		NULL,
	"GROUP_NO"	NUMBER		NOT NULL,
	"SCH_PLACE"	VARCHAR2(100)		NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "SCHEDULE"."STATUS" IS '존재Y/삭제N';

CREATE TABLE "SCH_ATTENDEE" (
	"SCH_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL
);

CREATE TABLE "SCH_GROUP" (
	"GROUP_NO"	NUMBER		NOT NULL,
	"GROUP_NAME"	VARCHAR2(30)		NOT NULL,
	"GROUP_COLOR"	VARCHAR2(30)		NULL,
	"EMP_NO"	NUMBER		NOT NULL
);

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(30)		NOT NULL,
	"NOTICE_CONTENT"	CLOB		NOT NULL,
	"NOTICE_WRITER"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(100)		NULL,
	"CHANGE_NAME"	VARCHAR2(100)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COUNT"	NUMBER	DEFAULT 0	NULL,
	"IMPORTANT"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "NOTICE"."IMPORTANT" IS '중요Y/아니면N';

CREATE TABLE "NOTICE_REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(400)		NOT NULL,
	"REF_NNO"	NUMBER		NOT NULL,
	"REPLY_WRITER"	NUMBER		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"REF_REPLY_NO"	NUMBER	DEFAULT 0	NULL
);

COMMENT ON COLUMN "NOTICE_REPLY"."STATUS" IS 'Y/N';

COMMENT ON COLUMN "NOTICE_REPLY"."REF_REPLY_NO" IS '이 댓글이 어떤댓글에 딸린건지 (만일 원글일 경우 0)';

CREATE TABLE "NOTICE_LIKE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"EMP_NO"	NUMBER		NOT NULL,
	"DATE_LIKE"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "LEAVE_CATEGORY" (
	"LCATEGORY_NO"	NUMBER		NOT NULL,
	"LCATEGORY_NAME"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "LEAVE_CATEGORY"."LCATEGORY_NO" IS '0:연차/1:조의3/2:산전후90/3:결혼1/ 4:결혼3/ 5:리프레쉬휴가/6:조의5/ 7:산전후120/ 8:공가';

COMMENT ON COLUMN "LEAVE_CATEGORY"."LCATEGORY_NAME" IS '0:연차/1:조의3/2:산전후90/3:결혼1/ 4:결혼3/ 5:리프레쉬휴가/6:조의5/ 7:산전후120/ 8:공가';

CREATE TABLE "RESIGNATION" (
	"APP_NO"	NUMBER		NOT NULL,
	"ENROLL_DATE"	VARCHAR2(50)		NOT NULL,
	"RESIGN_DATE"	VARCHAR2(50)		NOT NULL
);

CREATE TABLE "ADDRESS_FAV" (
	"EMP_NO"	NUMBER		NOT NULL,
	"ADDOUT_FAV"	NUMBER		NULL,
	"EMP_FAV"	NUMBER		NULL,
	"DATE_FAV"	VARCHAR2(30)		NULL
);

CREATE TABLE "PROJECT_EMP" (
	"PROJECT_NO"	NUMBER		NOT NULL,
	"PROJECT_EMP"	NUMBER		NOT NULL,
	"EMP_LEVEL"	NUMBER		NOT NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "PROJECT_EMP"."EMP_LEVEL" IS '책임자1/참여자2/열람자3';

CREATE TABLE "WORKTIME" (
	"WT_NO"	NUMBER		NOT NULL,
	"ATT_NO"	NUMBER		NOT NULL,
	"RE_STRAR_TIME"	VARCHAR2(50)		NOT NULL,
	"RE_END_TIME"	VARCHAR2(50)		NOT NULL,
	"RE_CONTENT"	VARCHAR2(600)		NOT NULL
);

CREATE TABLE "CAR_RESERVATION" (
	"CAR_NAME"	VARCHAR2(1000)		NOT NULL,
	"RESERVATION"	NUMBER		NOT NULL,
	"REQUEST_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"AP_DATE"	VARCHAR2(50)		NULL,
	"AP_STATUS"	NUMBER		NOT NULL,
	"APPROVER"	NUMBER		NULL,
	"RES_DATE"	VARCHAR2(50)		NOT NULL,
	"START_TIME"	VARCHAR2(500)		NOT NULL,
	"END_TIME"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "CAR_RESERVATION"."AP_STATUS" IS '1/2/3  | 미승인, 승인, 반려';

CREATE TABLE "CFR_RESERVATION" (
	"CFR_NAME"	VARCHAR2(1000)		NOT NULL,
	"RESERVATION"	NUMBER		NOT NULL,
	"STATUS"	NUMBER	DEFAULT 1	NOT NULL,
	"START_TIME"	VARCHAR2(500)		NOT NULL,
	"END_TIME"	VARCHAR2(500)		NOT NULL,
	"USE_DATE"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "CFR_RESERVATION"."STATUS" IS '1/2/3/4 | 미예약 /예약완료 / 취소완료 / 이용완료';

CREATE TABLE "CFR_IMG" (
	"FILE_NO"	NUMBER		NOT NULL,
	"CFR_NAME"	VARCHAR2(1000)		NOT NULL,
	"FILE_URL"	VARCHAR2(1000)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL
);

ALTER TABLE "LEAVE" ADD CONSTRAINT "PK_LEAVE" PRIMARY KEY (
	"LEAVE_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY (
	"APP_NO"
);

ALTER TABLE "BUSINESSTRIP" ADD CONSTRAINT "PK_BUSINESSTRIP" PRIMARY KEY (
	"BT_NO"
);

ALTER TABLE "OVERTIME" ADD CONSTRAINT "PK_OVERTIME" PRIMARY KEY (
	"OT_NO"
);

ALTER TABLE "ATTENDENCE" ADD CONSTRAINT "PK_ATTENDENCE" PRIMARY KEY (
	"ATT_NO"
);

ALTER TABLE "ANNUAL" ADD CONSTRAINT "PK_ANNUAL" PRIMARY KEY (
	"ANNUAL_NO"
);

ALTER TABLE "MAIL" ADD CONSTRAINT "PK_MAIL" PRIMARY KEY (
	"MAIL_NO"
);

ALTER TABLE "MAILBOX" ADD CONSTRAINT "PK_MAILBOX" PRIMARY KEY (
	"MAILBOX_NO"
);

ALTER TABLE "CAR" ADD CONSTRAINT "PK_CAR" PRIMARY KEY (
	"CAR_NAME"
);

ALTER TABLE "CF_ROOM" ADD CONSTRAINT "PK_CF_ROOM" PRIMARY KEY (
	"CFR_NAME"
);

ALTER TABLE "MAIL_AT" ADD CONSTRAINT "PK_MAIL_AT" PRIMARY KEY (
	"ATTACHMENT_NO"
);

ALTER TABLE "PROJECT_REPLY" ADD CONSTRAINT "PK_PROJECT_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"PROJECT_NO"
);

ALTER TABLE "REFERENCE" ADD CONSTRAINT "PK_REFERENCE" PRIMARY KEY (
	"REF_NO"
);

ALTER TABLE "APP_LINE" ADD CONSTRAINT "PK_APP_LINE" PRIMARY KEY (
	"LINE_NO"
);

ALTER TABLE "EMPLOYEE" ADD CONSTRAINT "PK_EMPLOYEE" PRIMARY KEY (
	"EMP_NO"
);

ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY (
	"DEPT_CODE"
);

ALTER TABLE "TEAM" ADD CONSTRAINT "PK_TEAM" PRIMARY KEY (
	"TEAM_CODE"
);

ALTER TABLE "JOB" ADD CONSTRAINT "PK_JOB" PRIMARY KEY (
	"JOB_CODE"
);

ALTER TABLE "ADDRESS_OUT" ADD CONSTRAINT "PK_ADDRESS_OUT" PRIMARY KEY (
	"ADDOUT_NO"
);

ALTER TABLE "ADDRESS_GR" ADD CONSTRAINT "PK_ADDRESS_GR" PRIMARY KEY (
	"GROUP_NO"
);

ALTER TABLE "SCHEDULE" ADD CONSTRAINT "PK_SCHEDULE" PRIMARY KEY (
	"SCH_NO"
);

ALTER TABLE "SCH_GROUP" ADD CONSTRAINT "PK_SCH_GROUP" PRIMARY KEY (
	"GROUP_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "NOTICE_REPLY" ADD CONSTRAINT "PK_NOTICE_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "LEAVE_CATEGORY" ADD CONSTRAINT "PK_LEAVE_CATEGORY" PRIMARY KEY (
	"LCATEGORY_NO"
);

ALTER TABLE "RESIGNATION" ADD CONSTRAINT "PK_RESIGNATION" PRIMARY KEY (
	"APP_NO"
);

ALTER TABLE "WORKTIME" ADD CONSTRAINT "PK_WORKTIME" PRIMARY KEY (
	"WT_NO"
);

ALTER TABLE "CAR_RESERVATION" ADD CONSTRAINT "PK_CAR_RESERVATION" PRIMARY KEY (
	"CAR_NAME",
	"RESERVATION"
);

ALTER TABLE "CFR_RESERVATION" ADD CONSTRAINT "PK_CFR_RESERVATION" PRIMARY KEY (
	"CFR_NAME",
	"RESERVATION"
);

ALTER TABLE "CFR_IMG" ADD CONSTRAINT "PK_CFR_IMG" PRIMARY KEY (
	"FILE_NO",
	"CFR_NAME"
);

ALTER TABLE "RESIGNATION" ADD CONSTRAINT "APPROVAL_TO_RESIGNATION" FOREIGN KEY (
	"APP_NO"
)
REFERENCES "APPROVAL" (
	"APP_NO"
);

ALTER TABLE "CAR_RESERVATION" ADD CONSTRAINT "CAR_TO_CAR_RESERVATION" FOREIGN KEY (
	"CAR_NAME"
)
REFERENCES "CAR" (
	"CAR_NAME"
);

ALTER TABLE "CAR_RESERVATION" ADD CONSTRAINT "EMPLOYEE_TO_CAR_RESERVATION" FOREIGN KEY (
	"RESERVATION"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "CFR_RESERVATION" ADD CONSTRAINT "CF_ROOM_TO_CFR_RESERVATION" FOREIGN KEY (
	"CFR_NAME"
)
REFERENCES "CF_ROOM" (
	"CFR_NAME"
);

ALTER TABLE "CFR_RESERVATION" ADD CONSTRAINT "EMPLOYEE_TO_CFR_RESERVATION" FOREIGN KEY (
	"RESERVATION"
)
REFERENCES "EMPLOYEE" (
	"EMP_NO"
);

ALTER TABLE "CFR_IMG" ADD CONSTRAINT "CF_ROOM_TO_CFR_IMG" FOREIGN KEY (
	"CFR_NAME"
)
REFERENCES "CF_ROOM" (
	"CFR_NAME"
);




-- 유림
-- 메일
ALTER TABLE MAIL 
   ADD CHECK 
(SEND IN ('Y', 'N'));

-- 메일 상세
ALTER TABLE MAIL_DETAIL
   ADD CHECK 
(READ IN ('Y', 'N'));

ALTER TABLE MAIL_DETAIL
   ADD CHECK 
(IMPORTANT IN ('Y', 'N'));

ALTER TABLE MAIL_DETAIL
   ADD CHECK 
(TYPE IN ('R', 'S'));

ALTER TABLE MAIL_DETAIL
   ADD CHECK 
(STATUS IN ('Y', 'N'));

-- 여진
ALTER TABLE CFR_IMG 
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE CAR_RESERVATION
   ADD CHECK 
(AP_STATUS IN (1,2,3));

ALTER TABLE CAR
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE CFR_RESERVATION
   ADD CHECK 
(STATUS IN (1,2,3,4));

ALTER TABLE PROJECT
   ADD CHECK 
(STATUS IN (1,2,3,4));

ALTER TABLE PROJECT_EMP
   ADD CHECK 
(STATUS IN ('Y', 'N'));

-- 수정
ALTER TABLE APPROVAL
   ADD CHECK 
(DOC_TYPE IN (0, 1, 2));

ALTER TABLE APPROVAL 
   ADD CHECK 
(APP_STATUS IN (0, 1, 2, 3, 4));

ALTER TABLE APPROVAL
   ADD CHECK 
(DOC_STATUS IN ('Y', 'N', 'D'));

ALTER TABLE APPROVAL
   ADD CHECK 
(APP_COUNT IN (0, 1, 2, 3));

ALTER TABLE APPROVAL
   ADD CHECK 
(APP_TURN IN (0, 1, 2, 3));

ALTER TABLE APP_LINE
   ADD CHECK 
(APP_LEVEL IN (1, 2, 3));

ALTER TABLE APP_LINE
   ADD CHECK 
(APP_LEVEL IN (0, 1, 2));

-- 다솜
ALTER TABLE EMPLOYEE
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE EMPLOYEE
   ADD CHECK 
(ACCOUNT_STATUS IN ('Y', 'N'));

ALTER TABLE DEPARTMENT
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE TEAM
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE JOB
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE ADDRESS_OUT
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE NOTICE
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE NOTICE
   ADD CHECK 
(IMPORTANT IN ('Y', 'N'));

ALTER TABLE NOTICE_REPLY
   ADD CHECK 
(STATUS IN ('Y', 'N'));

ALTER TABLE SCHEDULE
   ADD CHECK 
(STATUS IN ('Y', 'N'));


-- 정은
ALTER TABLE ATTENDENCE
   ADD CHECK
(ATT_STATUS IN (0, 1, 2, 3, 4, 5));

ALTER TABLE BUSINESSTRIP
    ADD CHECK
(BT_STATUS IN ('Y', 'N'));

ALTER TABLE BUSINESSTRIP
    ADD CHECK
(BT_CHECK IN (0, 1, 2, 3));

ALTER TABLE ANNUAL
    ADD CHECK
(ANNUAL_CATEGORY IN (1, 2));

ALTER TABLE LEAVE
    ADD CHECK
(LEAVE_STATUS IN ('Y', 'N'));

ALTER TABLE LEAVE
    ADD CHECK
(LEAVE_CHECK IN (0, 1, 2, 3));

ALTER TABLE LEAVE_CATEGORY
    ADD CHECK
(LCATEGORY_NO IN (0, 1, 2, 3, 4, 5, 6, 7, 8));

ALTER TABLE OVERTIME
    ADD CHECK
(OT_CATEGORY IN (0, 1, 2));


-- 시퀀스

-- 메일번호
CREATE SEQUENCE SEQ_MNO
NOCACHE;

-- 메일함번호
CREATE SEQUENCE SEQ_MBNO
NOCACHE;

-- 메일첨부파일번호
CREATE SEQUENCE SEQ_MATNO
NOCACHE;

-- 전자결재
CREATE SEQUENCE SEQ_APNO
NOCACHE;

--결재선
CREATE SEQUENCE SEQ_ALNO
NOCACHE;

--수신참조문서
CREATE SEQUENCE SEQ_ARNO
NOCACHE;

--회의실 상세이미지
CREATE SEQUENCE SEQ_CFNO 
NOCACHE;

--프로젝트 번호
CREATE SEQUENCE SEQ_PNO 
NOCACHE;

--프로젝트 댓글번호
CREATE SEQUENCE SEQ_PRNO 
NOCACHE;

-- 사원번호
CREATE SEQUENCE SEQ_ENO 
 START WITH 41500
NOCACHE; 

-- 부서번호
CREATE SEQUENCE SEQ_DNO
NOCACHE;

-- 팀번호
CREATE SEQUENCE SEQ_TNO
NOCACHE;

-- 직급번호
CREATE SEQUENCE SEQ_JNO
NOCACHE;

-- 외부주소록번호
CREATE SEQUENCE SEQ_ADNO
NOCACHE;

-- 주소록그룹번호
CREATE SEQUENCE SEQ_AGRNO
NOCACHE;

-- 공지사항
CREATE SEQUENCE SEQ_NNO
NOCACHE;

-- 공지댓글번호
CREATE SEQUENCE SEQ_NRNO
NOCACHE;

-- 일정
CREATE SEQUENCE SEQ_SCHNO
NOCACHE;

-- 일정그룹번호
CREATE SEQUENCE SEQ_SGRNO
NOCACHE;

-- 근태관리
CREATE SEQUENCE SEQ_ATTNO
NOCACHE;

-- 출장신청
CREATE SEQUENCE SEQ_BTNO
NOCACHE;

-- 시간외근무신청
CREATE SEQUENCE SEQ_OTNO
NOCACHE;

-- 근무시간조정
CREATE SEQUENCE SEQ_WTNO
NOCACHE;

--개인휴가일자
CREATE SEQUENCE SEQ_ANNO
NOCACHE;

-- 휴가신청
CREATE SEQUENCE SEQ_LENO
NOCACHE;

-- 휴가구분번호
CREATE SEQUENCE SEQ_LCNO
NOCACHE;

COMMIT;