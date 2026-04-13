GAME_VER_MAJOR                                     =  	1
GAME_VER_MINOR                                     =  	8

MAX_QUEST_PER_CARD_NEW                             = 						4		 -- 4 한개의 카드가 가질 수 있는 퀘스트
MAX_CARD_PER_CARDSET                               = 						10		 -- 각각 P,O,I,N,T,B,L,A,N2,K 총 10개의 카드가 한개의 카드셋안에 들어있다.
MAX_CARDSET_PER_USER                               = 						4		 -- 4가지 종류의 카드를 저장한다.
TUTORIAL_CARDSET_SLOT                              = 						0
EVENT_CARDSET_SLOT                                 = 							(MAX_CARDSET_PER_USER - 1)
MAX_QUEST_PER_CARDSET_NEW                          = 					(MAX_QUEST_PER_CARD_NEW * MAX_CARD_PER_CARDSET)							 -- 4 * 10	총 40개입니다.
MAX_QUEST_ALL_CARD                                 = 							(MAX_CARD_PER_CARDSET * MAX_CARDSET_PER_USER)							 -- 10 * 4 
MAX_QUEST_ALL_USE_NEW                              = 						(MAX_QUEST_PER_CARD_NEW * MAX_CARD_PER_CARDSET * MAX_CARDSET_PER_USER)	 -- 4 * 10 * 4 총 160개입니다. 

-- enum ENUM_QUEST_CARDSET_TYPE
QUEST_CARDSET_TYPE_NONE                            = 0
QUEST_CARDSET_TYPE_TUTORIAL                        = 1
QUEST_CARDSET_TYPE_NORMAL                          = 2 -- 삭제 됨(유저는 가지고 있음)
QUEST_CARDSET_TYPE_SILVER                          = 3 -- 삭제 됨(유저는 가지고 있음)
QUEST_CARDSET_TYPE_GOLD                            = 4 -- 삭제 됨
QUEST_CARDSET_TYPE_ASSAULT                         = 5 -- 돌격
QUEST_CARDSET_TYPE_BACKUP                          = 6 -- 지원
QUEST_CARDSET_TYPE_INFILTRATION                    = 7 -- 침투
QUEST_CARDSET_TYPE_SPECIAL                         = 8 -- 특공
QUEST_CARDSET_TYPE_DEFCON                          = 9 -- 데프콘
QUEST_CARDSET_TYPE_COMMISSIONED_O                  = 10 -- 사관 
QUEST_CARDSET_TYPE_COMPANY_O                       = 11 -- 위관
QUEST_CARDSET_TYPE_FIELD_O                         = 12 -- 영관
QUEST_CARDSET_TYPE_EVENT                           = 13 -- 이벤트	// 주의-이벤트 카드는 항상 맨 뒤에 있어야 합니다. 추가시 가운데에 넣어주시고 인덱스 값 변경 바랍니다.
QUEST_CARDSET_TYPE_COUNT                           = 14
-- end enum --

QUEST_CARDSET_TYPE_BUY_START                       =  		(QUEST_CARDSET_TYPE_NORMAL)				 --  구입가능 카드셋 시작
QUEST_CARDSET_TYPE_BUY_END                         =  			(QUEST_CARDSET_TYPE_FIELD_O)			 --  구입가능 카드셋 끝

MAX_QUEST_PER_CARD                                 = 						16		 -- 16 한개의 카드가 가질 수 있는 퀘스트
MAX_QUEST_PER_CARDSET                              = 					MAX_QUEST_PER_CARD*MAX_CARD_PER_CARDSET							 -- 16 * 10	총 160개입니다.
MAX_QUEST_ALL_USE                                  = 						MAX_QUEST_PER_CARD*MAX_CARD_PER_CARDSET*MAX_CARDSET_PER_USER	 -- 16 * 10 * 4 총 640개입니다. 
MAX_QUEST_ROW_PER_CARD                             = 					4  -- 카드 한장의 최대 열개수 
MAX_QUEST_COL_PER_CARD                             = 					4  -- 카드 한장의 최대 행개수
MAX_QUEST_ARG_COMPLETE                             = 			5			 --  QUEST_CTX 배열중 임무 개수를 담고있는 배열
MAX_QUEST_ARG                                      = 					6			 --  QUEST_CTX 배열의 개수입니다.

-- enum QUEST_STAGE_ORDINAL_ID
QUEST_STAGE_ORD_NA                                 = 0
QUEST_STAGE_ORD_PORT_AKABA                         = 1
QUEST_STAGE_ORD_RED_ROCK                           = 2
QUEST_STAGE_ORD_LIBRARY                            = 3
QUEST_STAGE_ORD_MSTATION                           = 4
QUEST_STAGE_ORD_MIDNIGHT_ZONE                      = 5
QUEST_STAGE_ORD_DOWNTOWN                           = 6
QUEST_STAGE_ORD_BREAKDOWN                          = 7
QUEST_STAGE_ORD_UPTOWN                             = 8
QUEST_STAGE_ORD_GIRAN                              = 9
QUEST_STAGE_ORD_BURNINGHALL                        = 10
QUEST_STAGE_ORD_LUXVILLE                           = 11
QUEST_STAGE_ORD_GIRAN2                             = 12
QUEST_STAGE_ORD_DSQUAD                             = 13
QUEST_STAGE_ORD_OUTPOST                            = 14
QUEST_STAGE_ORD_CRACKDOWN                          = 15
QUEST_STAGE_ORD_BLOWCITY                           = 16
QUEST_STAGE_ORD_STORMTUBE                          = 17
QUEST_STAGE_ORD_SAINTMANSION                       = 18
QUEST_STAGE_ORD_EASTERNROAD                        = 19
QUEST_STAGE_ORD_MC_PARK                            = 20
QUEST_STAGE_ORD_D_DOWNTOWN                         = 21
QUEST_STAGE_ORD_D_LUXVILLE                         = 22
QUEST_STAGE_ORD_D_BLOWCITY                         = 23
QUEST_STAGE_ORD_D_STORMTUBE                        = 24
QUEST_STAGE_ORD_D_GIRAN2                           = 25
QUEST_STAGE_ORD_D_BREAKDOWN                        = 26
QUEST_STAGE_ORD_HELISPOT                           = 27
QUEST_STAGE_ORD_SENTRYBASE                         = 28
QUEST_STAGE_ORD_TRAININGCAMP                       = 29
QUEST_STAGE_ORD_HOSPITAL                           = 30
QUEST_STAGE_ORD_DOWNTOWN2                          = 31
QUEST_STAGE_ORD_DESERTCAMP                         = 32
QUEST_STAGE_ORD_KICKPOINT                          = 33
ifdef                                              = 34
QUEST_STAGE_ORD_BLACKPANTHER                       = 35
endif                                              = 36
QUEST_STAGE_ORD_MAX                                = 37
-- end enum --

GET_EXP_POINT_MULTI_VALUE                          =  		10		 -- 보상을 받는 Exp, Point  UINT8을 사용합니다.. 화면에 출력시에는 * 10을 해서 보여 줘야하고 보상도 * 10을 해줘야 합니다.
RENDEZVOUS_SEND_PORT_COUNT                         =  			2
RENDEZVOUS_RECV_PORT_COUNT                         =  			4
FRIEND_MAX_COUNT                                   =  					50			 -- 친구 생성 맥스 카운트 
BLOCK_MAX_COUNT                                    =  						50			 -- 차단 생성 맥스 카운트
EVENT_ERROR_SUCCESS                                =  									0x00000000	 --  기본 성공
EVENT_ERROR_FAIL                                   =  									0x80000000	 --  기본 실패
EVENT_ERROR_MASK_FAIL                              =  								0x80FFFFFF	 --  ERC Fail Bit-mask

EVENT_ERROR_SUCCESS_1                              =  								0x00000001	 --  기본 성공 1
EVENT_ERROR_GAME_WRONG_POSITION                    =  						0x80000001	 --  명령을 실행할 수 없는 포지션에 있습니다. 이메시를 받으면 다시 시작위치로 이동합니다. 서버에서도 리셋합니다.	-2147483647
EVENT_ERROR_GAME_WRONG_SAME_REQ                    =  						0x80000002	 --  채널이 선택되있지않음, CServerStage구현 후 redefine 예정 - praptor
EVENT_ERROR_GAME_WRONG_REQUEST_LOGIN               =  				0x80000003	 --  로그인 하지 않은 유저가 로그인 이후의 동작을 요구한 경우 : 해킹 입니다.
EVENT_ERROR_GAME_WRONG_REQUEST_CHANNEL             =  				0x80000004	 --  채널선택을 하지않은 유저가 채널선택 이후의 동작을 요구한 경우 : 해킹 입니다.									-2147483644
EVENT_ERROR_GAME_WRONG_REQUEST_ROOM                =  					0x80000005	 --  방에 없는 유저가 방안에 있는 동작을 요구한 경우 : 해킹입니다. 
EVENT_ERROR_GAME_WRONG_DATA                        =  							0x80000006	 --  보낼수 없는 값을 요청한 경우 : 해킹이나..깨진 데이터 입니다. 
EVENT_ERROR_LOGIN                                  =  									0x80000100
EVENT_ERROR_EVENT_LOG_IN_ALEADY_LOGIN              =  				0x80000101	 --  동일 아이디로 접속된 사용자가 있음
EVENT_ERROR_EVENT_LOG_IN_INVALID_ACCOUNT           =  			0x80000102	 --  아이디나 패스워드가 틀림
EVENT_ERROR_LOGIN_BREAK_SESSION                    =  						0x80000103	 --  Session이 깨졌음
EVENT_ERROR_EVENT_LOGOUTING                        =  							0x80000104	 --  아직 로그아웃 중입니다.
EVENT_ERROR_EVENT_LOG_IN_TIME_OUT1                 =  					0x80000105	 --  로그인-서버에 문제가 있습니다.
EVENT_ERROR_EVENT_LOG_IN_TIME_OUT2                 =  					0x80000106	 --  로그인-서버에 문제가 있습니다.
EVENT_ERROR_EVENT_LOG_IN_BLOCK_ACCOUNT             =  				0x80000107	 --  계정제재
EVENT_ERROR_EVENT_LOG_IN_UNKNOWN                   =  					0x80000108	 --  처리 외 이유로 로그인 실패
EVENT_ERROR_EVENT_LOG_IN_PACKET                    =  						0x80000109	 --  패킷 깨짐 
EVENT_ERROR_EVENT_LOG_IN_MD5                       =  						0x8000010A	 --  MD5 
EVENT_ERROR_EVENT_LOG_IN_HTTP                      =  						0x8000010B	 --  HTTP ERROR
EVENT_ERROR_EVENT_LOG_IN_SYS                       =  						0x8000010C	 --  HTTP ERROR
EVENT_ERROR_EVENT_LOG_IN_NOTAVAILABLE              =  				0x8000010D	 --  HTTP ERROR
EVENT_ERROR_EVENT_LOG_IN_MAXUSER                   = 					0x8000010E	 --  
EVENT_ERROR_EVENT_SIA_USERITEM_SUCCESS             =  				0x8000010F	 --  SIA 를 사용하지 않음
EVENT_ERROR_EVENT_BUY_GOODS_REPAIR                 =  					0x80000110	 --  Repair 실패
EVENT_ERROR_EVENT_BUFFER_FULL                      =  						0x80000111	 --  버퍼가 가득 찼다.
EVENT_ERROR_DATABASE                               =  								0x80000112	 --  DATABASE ERROR
EVENT_ERROR_EVENT_DUPLICATE_NICK                   =  					0x80000113	 --  닉네임 중복
EVENT_ERROR_EVENT_LOG_IN_DB_BUFFER_FULL            = 				0x80000114	 --  
EVENT_ERROR_SERVER                                 =  									0x80000200
EVENT_ERROR_SERVER_USER_FULL                       =  						0x80000201	 --  채널에 사람이 꽉 찼음, CServerStage구현 후 redefine 예정 - praptor
EVENT_ERROR_SERVER_CLAN                            =  								0x80000202	 --  클랜채널
EVENT_ERROR_SERVER_BEGIN1                          =  							0x80000203	 --  초버채널
EVENT_ERROR_SERVER_BEGIN2                          =  							0x80000204	 --  초버채널
EVENT_ERROR_SERVER_EXPERT                          = 							0x80000205	 --  
EVENT_ERROR_LOBBY                                  =  									0x80000300
EVENT_ERROR_ROOM                                   =  									0x80000400
EVENT_ERROR_ROOM_NO_AUTHORITY                      =  						0x80000401	 --  권한없는 작업
EVENT_ERROR_EVENT                                  =  									0x80001000
EVENT_ERROR_EVENT_TRANS                            =  								0x80001001	 --  Trans 버퍼가 가득차 더이상 Send 할수 없음
EVENT_ERROR_EVENT_JOIN_ROOM_SLOT_FULL              =  				0x80001003	 --  방안에 유저가 다 차있음
EVENT_ERROR_EVENT_JOIN_ROOM_NOT_EXIST_ROOM         =  			0x80001004	 --  방이 이미 사라졌음
EVENT_ERROR_EVENT_JOIN_ROOM_WRONG_PASSWORD         =  			0x80001005	 --  방 비밀번호가 다름
EVENT_ERROR_EVENT_BATTLE_TIMEOUT_CN                =  					0x80001006	 --  타임아웃 에러이다.. 로비로 강제 이동합니다.
EVENT_ERROR_EVENT_BATTLE_TIMEOUT_CS                =  					0x80001007	 --  타임아웃 에러
EVENT_ERROR_NO_REAL_IP                             =  								0x80001008	 --  RealIP가 없다
EVENT_ERROR_NO_READY_TEAM                          =  							0x80001009	 --  2팀이 되지 않았다
EVENT_ERROR_FIRST_MAINLOAD                         =  							0x8000100A	 --  로딩시간으로 아웃(방장)
EVENT_ERROR_FIRST_HOLE                             =  								0x8000100B	 --  홀펀칭으로 아웃
EVENT_ERROR_NO_ENEMY                               =  								0x8000100C	 --  ! praptor - 사용하지 않습니다.
EVENT_ERROR_WAIT_BATTLE_CLIMAX                     =  						0x8000100F	 --  ! praptor - 사용하지 않습니다.
EVENT_ERROR_NO_START_FOR_UNDER_NAT                 =  					0x80001012	 --  게임을 시작할 수 없는 NAT 아래에 있음
EVENT_ERROR_EVENT_JOIN_ROOM_LOCK_INTERENTER        =  			0x80001013	 --  난입이 불가능한 방 
EVENT_ERROR_EVENT_JOIN_ROOM_LOCK_LEVEL             =  				0x80001014	 --  난입이 불가능한 방 
EVENT_ERROR_PRESTART_BATTLE_ALEADY_END             =  				0x80001015	 --  난입 시 이미 게임이 끝났다
EVENT_ERROR_START_BATTLE_ALEADY_END                =  					0x80001016   --  난입 시 이미 게임이 끝났다
EVENT_ERROR_EVENT_BUY_GOODS_PARAMETER_GOODS        =  			0x80001017	 --  목록에 없는 상품 - idx overflow
EVENT_ERROR_EVENT_BUY_GOODS_PARAMETER_USER         =  			0x80001018	 --  유저를 찾을 수 없음
EVENT_ERROR_EVENT_BUY_GOODS_NETWORK                =  					0x80001019	 --  IBGame error
EVENT_ERROR_EVENT_BUY_GOODS_OVERLOAD               =  				0x8000101A	 --  빌링요청 폭주로 당분간 요청을 받을 수없음
EVENT_ERROR_EVENT_GET_USER_ITEM_PARAMETER_USER     =  		0x8000101B	 --  유저를 찾을 수 없음
EVENT_ERROR_EVENT_GET_USER_ITEM_NETWORK            =  				0x8000101C	 --  IBGame error
EVENT_ERROR_EVENT_GET_USER_ITEM_OVERLOAD           =  			0x8000101D	 --  빌링요청 폭주로 당분간 요청을 받을 수없음
EVENT_ERROR_EVENT_GET_USER_ITEM_FAIL               =  				0x8000101E	 --  Auth fail - 반환 목록 만들기 실패
EVENT_ERROR_EVENT_INSERT_PERMANENT_PARAMETER_USER  =  	0x8000101F	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_INSERT_PERMANENT_NETWORK         =  			0x80001020	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_INSERT_PERMANENT_OVERLOAD        =  			0x80001021	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_INSERT_PERMANENT_FAIL            =  				0x80001022	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_AUTH_START_PARAMETER_USER        =  			0x80001023	 --  유저를 찾을 수 없음
EVENT_ERROR_EVENT_AUTH_START_NETWORK               =  				0x80001024	 --  IBGame error
EVENT_ERROR_EVENT_AUTH_START_OVERLOAD              =  				0x80001025	 --  빌링요청 폭주로 당분간 요청을 받을 수없음
EVENT_ERROR_EVENT_AUTH_START_FAIL                  =  					0x80001026	 --  IBGame fail
EVENT_ERROR_EVENT_AUTH_START_PRICE                 =  					0x80001027	 --  돈이없음 
EVENT_ERROR_EVENT_AUTH_START_ENDTIME_FAIL          =  			0x80001028	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_BUY_GOODS_INVENTORY_FULL         =  			0x80001029   --  아이템을 넣을수 있는 인벤토리가 없습니다. 	
EVENT_ERROR_EVENT_BUY_GOODS_ENDTIME_FAIL           =  			0x80001030	 --  ! 사용하지 않는다.
EVENT_ERROR_EVENT_AUTH_START_ALREADY_AUTH          =  			0x80001031	 --  이미 인증되었음.
EVENT_ERROR_EVENT_AUTH_START_NONSEC                =  					0x80001032	 --  기간인증 아이템 아님
EVENT_ERROR_EVENT_AUTH_FAIL                        =  							0x80001033	 --  인증실패
EVENT_ERROR_EVENT_LOG_IN_USER_ITEM_FAIL            =  				0x80001034	 --  로그인 중 창고 받아오기 실패
ERROR_EVENT_FRIEND_INFO_PARAMETER_USER             =  				0x80001035	 --  유저정보 찾지 못함
ERROR_EVENT_FRIEND_INFO_QUERY                      =  						0x80001036	 --  DB 작업 실패
EVENT_ERROR_EVENT_FRIEND_INSERT_PARAMETER_USER     =  		0x80001037	 --  유저정보 찾지 못함
EVENT_ERROR_EVENT_FRIEND_INSERT_FULL               =  				0x80001038	 --  허용 친구수 다참
EVENT_ERROR_EVENT_FRIEND_INSERT_QUERY              =  				0x80001039	 --  DB 작업 실패
EVENT_ERROR_EVENT_FRIEND_ACCEPT_PARAMETER_USER     =  		0x8000103A	 --  유저정보 찾지 못함
EVENT_ERROR_EVENT_FRIEND_ACCEPT_PARAMETER_IDX      =  		0x8000103B	 --  친구 idx 범위 초과
EVENT_ERROR_EVENT_FRIEND_ACCEPT_QUERY              =  				0x8000103C	 --  DB 작업 실패
EVENT_ERROR_EVENT_FRIEND_INVITED_PARAMETER_USER    =  		0x8000103D	 --  유저정보 찾지 못함
EVENT_ERROR_EVENT_FRIEND_INVITED_PARAMETER_IDX     =  		0x8000103E	 --  친구 idx 범위 초과
EVENT_ERROR_EVENT_FRIEND_INVITED_NOT_CONNECTED     =  		0x8000103F	 --  접속중인 친구 정보 찾지 못함
EVENT_ERROR_EVENT_FRIEND_INVITED_NOT_MATCHED       =  		0x80001040	 --  상대방에 친구등록정보가 없다
EVENT_ERROR_EVENT_FRIEND_INSERT_ALREADY_FRIEND     =  		0x80001041	 --  이미 등록된 친구
EVENT_ERROR_EVENT_FRIEND_INSERT_NOT_FIND_NICK      =  		0x80001042	 --  닉네임을 찾을 수 없음
EVENT_ERROR_EVENT_INSERT_ITEM_VALID_ITEM_ID        =  			0x80001043	 --  잘못된 아이템ID
EVENT_ERROR_EVENT_INSERT_ITEM_OVERLOAD             =  				0x80001044	 --  요청 폭주로 당분간 요청을 받을 수 없음
EVENT_ERROR_EVENT_INSERT_ITEM_NETWORK              =  				0x80001045	 --  IBGame error
EVENT_ERROR_EVENT_INSERT_ITEM_PARAMETER_USER       =  		0x80001046	 --  유저를 찾을 수 없음
EVENT_ERROR_EVENT_INSERT_ITEM_FAIL                 =  					0x80001047	 --  IBGame fail
EVENT_ERROR_CLAN_CREATE_FAIL                       =  						0x80001048	 --  DB에 쓰기 실패
EVENT_ERROR_CLAN_CREATE_DUPLICATE                  =  					0x80001049	 --  중복된 클랜(클랜명||azitURL)
EVENT_ERROR_CLAN_CREATE_ALEADY_MEMBER              =  				0x8000104A	 --  클랜에 가입된 유저
EVENT_ERROR_EVENT_INSERT_INFO_FAIL                 =  					0x8000104B	 --  추가성공하였으나 종료일을 받아내지 못했음
EVENT_ERROR_EVENT_BUY_CARD_PARAMETER_FAIL          =  			0x8000104C	 --  구입할 카드를 찾을 수 없다
EVENT_ERROR_EVENT_BUY_CARD_PRICE_FAIL              =  				0x8000104D	 --  돈이 부족하다
EVENT_ERROR_EVENT_BUY_CARD_UNKOWN_FAIL             =  				0x8000104E	 --  그외 이유로 실패
EVENT_ERROR_EVENT_DELETE_CARD_PARAMETER_FAIL       =  		0x8000104F	 --  삭제할 카드를 찾을 수 없다
EVENT_ERROR_EVENT_DELETE_CARD_UNKOWN_FAIL          =  			0x80001050	 --  그외 이유로 실패
EVENT_ERROR_EVENT_AUTH_COUNT_PARAMETER_USER        =  			0x80001051	 --  유저정보 찾지 못함
EVENT_ERROR_EVENT_AUTH_COUNT_NETWORK               =  				0x80001052	 --  IBGame error
EVENT_ERROR_EVENT_AUTH_COUNT_OVERLOAD              =  				0x80001053	 --  요청 폭주로 당분간 요청을 받을 수 없음
EVENT_ERROR_EVENT_AUTH_COUNT_FAIL                  =  					0x80001054	 --  개수인증 실패
EVENT_ERROR_CLAN_MAXCLAN                           =  							0x80001055	 --  클랜의 맴버임
EVENT_ERROR_CLAN_MAXMEMBER                         =  							0x80001056	 --  클랜의 멤버가 아님
EVENT_ERROR_CLAN_MAXREQUEST                        =  							0x80001057	 --  클랜에 가입되 있지 않음
EVENT_ERROR_CLAN_MEMBER                            =  								0x80001058	 --  클랜의 맴버임
EVENT_ERROR_CLAN_NOMEMBER                          =  							0x80001059	 --  클랜의 멤버가 아님
EVENT_ERROR_CLAN_SEARCH_CLANIDX                    =  						0x8000105A	 --  클랜에 가입되 있지 않음
EVENT_ERROR_CLAN_NOSEARCH_CLANIDX                  =  					0x8000105B	 --  클랜을 찾을수 없다.
EVENT_ERROR_CLAN_SEARCH_CLANMEMBERIDX              =  				0x8000105C	 --  클랜원이 존재한다.
EVENT_ERROR_CLAN_NOSEARCH_CLANMEMBERIDX            =  				0x8000105D	 --  클랜원을 찾을수 없다.
EVENT_ERROR_CLAN_LEVEL_MASTER                      =  						0x8000105E	 --  클랜 레벨이 클랜장이다.
EVENT_ERROR_CLAN_LEVEL_NOMASTER                    =  						0x8000105F	 --  클랜 레벨이 클랜장이 아니다.
EVENT_ERROR_CLAN_LEVEL_STAFF                       =  						0x80001060	 --  클랜 레벨이 스탭이다.
EVENT_ERROR_CLAN_LEVEL_NOSTAFF                     =  						0x80001061	 --  클랜 레벨이 스탭이 아니다.
EVENT_ERROR_CLAN_LEVEL_REGULAR                     =  						0x80001062	 --  클랜 레벨이 일반 회원이다.
EVENT_ERROR_CLAN_LEVEL_NOREGULAR                   =  					0x80001063	 --  클랜 레벨이 일반 회원이 아니다.
EVENT_ERROR_CLAN_SEARCH_SECTION                    =  						0x80001064	 --  색션을 찾았음
EVENT_ERROR_CLAN_NOSEARCH_SECTION                  =  					0x80001065	 --  색션을 찾을수 없음
EVENT_ERROR_CLAN_SEARCH_REQUESTIDX                 =  					0x80001066	 --  가입신청서에 있다
EVENT_ERROR_CLAN_NOSEARCH_REQUESTIDX               =  				0x80001067	 --  가입신청서에 없다
EVENT_ERROR_CLAN_REQUEST_FAIL                      =  						0x80001068	 --  가입신청 실패
EVENT_ERROR_CLAN_SECESSION_FAIL                    =  						0x80001069	 --  클랜탈퇴 실패
EVENT_ERROR_CLAN_CLOSECLAN_FAIL                    =  						0x8000106A	 --  클랜 해체 실패
EVENT_ERROR_CLAN_CLOSECLAN_MEMBER_FAIL             =  				0x8000106B	 --  클랜에 가입인원이 남아있어 해체 실패
EVENT_ERROR_CLAN_COMMISSION_FAIL                   =  					0x8000106C	 --  권한변경 실패
EVENT_ERROR_CLAN_CANCEL_REQUEST_FAIL               =  				0x8000106D	 --  클랜신청서 취소에 실패
EVENT_ERROR_CLAN_DEPORTATION_FAIL                  =  					0x8000106E	 --  클랜원 제명 실패
EVENT_ERROR_FIND_USER_DB                           =  							0x8000106F	 --  유저찾기 DB 실패
EVENT_ERROR_FIND_USER_NOT_FOUND                    =  						0x80001070	 --  유저찾기 없는 유저
EVENT_ERROR_NO_CLAN_TEAM                           =  							0x80001071	 --  팀이 이상하다
EVENT_ERROR_NO_CLAN_TEAM_NOTFULL                   =  					0x80001072	 --  한팀에 4명 이상이 되지 않았다
EVENT_ERROR_CLAN_NOTICE_FAIL                       =  						0x80001073	 --  공지사항 변경 실패
EVENT_ERROR_CLAN_INTRO_FAIL                        =  							0x80001074	 --  클랜 소개 변경 실패
EVENT_ERROR_CLAN_MARKCHANGE_FAIL                   =  					0x80001075	 --  클랜 마크 변경 실패
EVENT_ERROR_CLAN_NAMECHANGE_FAIL                   =  					0x80001076	 --  클랜 이름 변경 실패
EVENT_ERROR_CLAN_BATTLE_TEAM_CREATE_FAIL           =  			0x80001077	 --  배틀 클랜팀 만들기 실패
EVENT_ERROR_CLAN_BATTLE_TEAM_JOIN_FAIL             =  				0x80001078	 --  배틀 클랜팀 입장 실패
EVENT_ERROR_CLAN_BATTLE_TEAM_CLOSE_FAIL            =  				0x80001079	 --  배틀 클랜팀 해체
EVENT_ERROR_CLAN_JOIN_AUTH_AGE_FAIL                =  					0x8000107A	 --  가입 권한(나이)이 맞지 않는다.
EVENT_ERROR_CLAN_JOIN_AUTH_RANK_FAIL               =  				0x8000107B	 --  가입 권한(계급)이 맞지 않는다.
EVENT_ERROR_EVENT_JOIN_ROOM_TRAINING               =  				0x8000107C	 --  사격장은 난입할 수 없다.
EVENT_ERROR_EVENT_CREATE_TRAINING_WRONG_CHANNEL    =  		0x8000107D	 --  사격장을 만들 수 있는 채널이 아니다.
EVENT_ERROR_NOTE_SEND_UKNOWN_NICK                  =  					0x8000107E	 --  해당 닉네임의 사용자 없다.
EVENT_ERROR_NOTE_SEND_BOX_FULL                     =  						0x8000107F	 --  쪽지함이 꽉 찼다.
EVENT_ERROR_NOTE_SEND_SELF                         =  							0x80001080	 --  스스로에게 쪽지를 보낼 수 없다.
EVENT_ERROR_NOTE_SEND_DAILY_LIMIT                  =  					0x80001081	 --  하루 쪽지 발송 제한에 걸려 보낼 수 없다.
EVENT_ERROR_CLAN_RECORDRESET_FAIL                  =  					0x80001082	 --  클랜 전적을 초기화 할수 없다.
EVENT_ERROR_USER_TITLE_REQUIREMENT_FAIL            =  				0x80001083	 --  호칭 교환 조건을 만족하지 않는다.
EVENT_ERROR_USER_TITLE_ALREADY_GAIN_FAIL           =  			0x80001084	 --  이미 호칭을 보유중이다.
EVENT_ERROR_EVENT_BUY_GOODS_USER_TITLE_NOT_ALLOWED =  	0x80001085	 --  허용된 호칭이 없어 구입할 수 없다.
EVENT_ERROR_EVENT_EQUIP_USER_TITLE_NOT_ALLOWED     =  		0x80001086	 --  허용된 호칭이 없어 장비할 수 없다.
EVENT_ERROR_CLAN_BATTLE_TEAM_HAVE_FAIL             =  				0x80001087	 --  배틀 클랜팀 실패_이미 팀을 가지고 있다.
EVENT_ERROR_CLAN_BATTLE_TEAM_CREATE_FULL_FAIL      =  		0x80001088	 --  배틀 클랜팀 만들기 실패_모든 팀이 가득차서 더이상 생성불가
EVENT_ERROR_CLAN_BATTLE_TEAM_CREATE_PER_FAIL       =  		0x80001089	 --  배틀 클랜팀 만들기 실패_제한인원수가 이상하다
EVENT_ERROR_CLAN_BATTLE_TEAM_CREATE_NOTEMPTY_FAIL  =  	0x8000108A	 --  배틀 클랜팀 만들기 실패_비어있는 클랜이 아니다.
EVENT_ERROR_CLAN_BATTLE_TEAM_JOIN_NOSEARCH_FAIL    =  		0x8000108B	 --  배틀 클랜팀 입장 실패_찾을수 없는 팀
EVENT_ERROR_CLAN_BATTLE_TEAM_JOIN_EMPTY_FAIL       =  		0x8000108C	 --  배틀 클랜팀 입장 실패_없는 방
EVENT_ERROR_CLAN_BATTLE_TEAM_JOIN_PERMAX_FAIL      =  		0x8000108D	 --  배틀 클랜팀 입장 실패_인원이 가득차 입장할 수 없음
EVENT_ERROR_CLAN_BATTLE_TEAM_LEAVE_EMPTY_FAIL      =  		0x8000108E	 --  배틀 클랜팀 퇴장 실패_찾을수 없는 팀
EVENT_ERROR_CLAN_BATTLE_TEAM_LEAVE_NOUSER_FAIL     =  		0x8000108F	 --  배틀 클랜팀 퇴장 실패_없는 유저
EVENT_ERROR_CLAN_BATTLE_TEAM_REQUEST_READY_FAIL    =  		0x80001090	 --  배틀 클랜전 신청 실패_이미 시작된 팀
EVENT_ERROR_CLAN_BATTLE_TEAM_REQUEST_SELF_FAIL     =  		0x80001091	 --  배틀 클랜전 신청 실패_자기자신에게 신청
EVENT_ERROR_CLAN_BATTLE_TEAM_REQUEST_NOPER_FAIL    =  		0x80001092	 --  배틀 클랜전 신청 실패_인원이 맞지 않습니다.
EVENT_ERROR_CLAN_BATTLE_TEAM_REQUEST_REFUSAL_FAIL  =  	0x80001093	 --  배틀 클랜전 신청 거절
EVENT_ERROR_CLAN_BATTLE_TEAM_NOSEARCH_FAIL         =  			0x80001094	 --  존재하지 않는 팀
EVENT_ERROR_CLAN_BATTLE_TEAM_CHANGE_FAIL           =  			0x80001095	 --  배틀 클랜전 인원변경 실패_변경할 인원이 이상함
EVENT_ERROR_CLAN_BATTLE_TEAM_CHANGE_PERMAX_FAIL    =  		0x80001096	 --  배틀 클랜전 인원변경 실패_인원이 많아서 실패
EVENT_ERROR_CLAN_BATTLE_TEAM_CHANGE_NOMASTER_FAIL  =  	0x80001097	 --  배틀 클랜전 인원변경 실패_방장이 아닌데 전달 되었음
EVENT_ERROR_NO_CLAN_TEAM_NOT_ALL_READY             =  				0x80001098	 --  클랜전 실패, 모두 레뒤가 아니다.
EVENT_ERROR_CLAN_INVITED_REFUSAL                   =  					0x80001099	 --  클랜 가입 신청 거절
EVENT_ERROR_EVENT_GIFT_GOODS_PARAMETER_GOODS       =  		0x8000109A	 --  선물하기 실패 - 잘못된 상품아이디
EVENT_ERROR_CLAN_INCREASE_MAXPERSON_FAIL           =  			0x8000109B	 --  클랜 최대인원 증가 실패
EVENT_ERROR_EVENT_GIFT_GOODS_PARAMETER_USER        =  			0x8000109C	 --  선물하기 실패 - 잘못된 유저
EVENT_ERROR_EVENT_GIFT_GOODS_NOT_ENOUGH_POINT      =  		0x8000109D	 --  선물하기 실패 - 포인트 부족
EVENT_ERROR_EVENT_GIFT_GOODS_WRONG_RECEIVE_USER    =  		0x8000109E	 --  선물하기 실패 - 잘못된 상대 유저
EVENT_ERROR_EVENT_CHEKC_GIFT_PARAMETER_GOODS       =  		0x8000109F	 --  선물받기 실패 - 없는 상품
EVENT_ERROR_EVENT_CHECK_GIFT_OVERLOAD              =  				0x800010A0	 --  선물받기 실패 - 서버과부화
EVENT_ERROR_EVENT_CHECK_GIFT_NETWORK               =  				0x800010A1	 --  선물받기 실패 - 네트워크 문제 - IBGameError
EVENT_ERROR_EVENT_DELETE_INFO_FAIL                 =  					0x800010A2	 --  아이템 삭제 실패
EVENT_ERROR_EVENT_DELETE_ITEM_VALID_ITEM_ID        =  			0x800010A3	 --  잘못된 아이템ID
EVENT_ERROR_EVENT_DELETE_ITEM_OVERLOAD             =  				0x800010A4	 --  요청 폭주로 당분간 요청을 받을 수 없음
EVENT_ERROR_EVENT_DELETE_ITEM_NETWORK              =  				0x800010A5	 --  IBGame error
EVENT_ERROR_EVENT_DELETE_ITEM_PARAMETER_USER       =  		0x800010A6	 --  유저를 찾을 수 없음
EVENT_ERROR_EVENT_DELETE_ITEM_FAIL                 =  					0x800010A7	 --  IBGame fail
EVENT_ERROR_CLAN_USE_ITEM_FAIL                     =  						0x800010A8	 --  클랜 아이템이 있어서 실패
EVENT_ERROR_EVENT_BLOCK_INSERT_ALREADY_BLOCK       =  		0x800010A9	 --  이미 차단된 목록
EVENT_ERROR_EVENT_BLOCK_INSERT_ALREADY_CLAN        =  			0x800010AA	 --  같은 클랜
EVENT_ERROR_EVENT_READY_WEAPON_EQUIP               = 				0x800010AB	 --  
EVENT_ERROR_CLAN_MEMORY_FULL                       =  						0x800010AC	 --  메모리가 부족하여 더이상 클랜 생성에 실패
EVENT_ERROR_HACKING_EXIT_USER                      =  						0x800010AD	 --  유저가 해킹을 하여 GM이 팅겨냅니다.
EVENT_ERROR_GAMEGUARD_ERROR                        =  							0x800010AE	 --  게임가드에 문제가 있습니다.
EVENT_ERROR_LOGIN_ERROR                            =  								0x800010AF	 --  로그인에 문제가 있습니다.
EVENT_ERROR_CHANNEL_TIMEOUT                        =  							0x800010B0	 --  로그인에 문제가 있습니다.
EVENT_ERROR_EVENT_LOG_IN_BLOCK_MASK                =  					0x000FFFFF	 --  하위 20 bits Mask
EVENT_ERROR_EVENT_LOG_IN_BLOCK_INNER               =  				0x80100000	 --  InnerBlock in GameBlock 
EVENT_ERROR_EVENT_LOG_IN_BLOCK_OUTER               =  				0x80200000	 --  OuterBlock in GameBlock 
EVENT_ERROR_EVENT_LOG_IN_BLOCK_RESERVED            =  				0x80400000	 --  예약.
EVENT_ERROR_EVENT_LOG_IN_BLOCK_GAME                =  					0x80800000	 --  GameBlock in PortalBlock
EVENT_ERROR_EVENT_UNEXPECTED_VALUE                 =  					0x80002001
EVENT_RECEIVE_CLAN_NOTE                            =  								0x80003001	 --  클랜 전체 쪽지 도착
EVENT_ERROR_EVENT_FAIL_INVITED_USER                =  					0x80003002	 --  배틀룸에 초대된 유저가 초대 가능한 상태가 아님
EVENT_ERROR_EVENT_FAIL_INVITED_USER_IN_CLAN_MATCH  =  	0x80003003	 --  배틀룸에 초대된 유저가 클랜 서버에서 매치 매이킹 중이면 초대 가능한 상태가 아님
INVENTORY_FLAG_CHARACTER                           =  		0x00000001
INVENTORY_FLAG_WEAPON                              =  			0x00000002
INVENTORY_FLAG_ITEM                                =  				0x00000004
CONVERT_STRING_COUNT                               =  			1024
GAME_CHANNEL_COUNT                                 =  			10
INCREASE_MEMBER_COUNT                              =  		50			 --  추가 클랜원 수
MAX_MEMBER_COUNT                                   =  			250			 --  최대 클랜원 수
MAX_REQUEST_COUNT                                  =  			100			 --  최대 가입신청서 수
MAX_BATTLE_CLAN_ROOM_COUNT                         =  	250			 --  각 클랜에서 만들수 있는 최대 전투방 개수
NET_CLAN_NAME_SIZE                                 =  			17			 --  클랜명
NET_CLAN_NOTICE_SIZE                               =  		255			 --  클랜 공지
NET_CLAN_INTRO_SIZE                                =  			255			 --  클랜 소개
NET_CLAN_REQUEST_SIZE                              =  		255			 --  신청서 내용
NET_CLAN_AZIT_URL_SIZE                             =  		21			 --  아지트 URL
NET_MD5_KEY_SIZE                                   =  			32			 --  MD5 KEY SIZE
CLAN_TEAM_MEMBER_COUNT                             =  		8			 --  클랜 매치메이킹 최대인원수
CLAN_BASIC_POINT                                   =  			1000		 --  최초 클랜 포인트
CLAN_MARK_DEFAULT                                  =  			0xFFFFFFFF	 --  클랜마크 default
ACCOUNT_KICK_LOGIN                                 =  			0x01			 --  중복로그인으로 인한 킥
ACCOUNT_KICK_GM_TOOL                               =  		0x02			 --  운영툴에 의한 킥
ACCOUNT_KICK_OTHER                                 =  			0xFF			 --  그 외 다른 이유로 인한 킥
NET_ID_SIZE                                        =  					65
NET_PW_SIZE                                        =  					21
NET_SERVER_PW                                      =  				12
NET_ROOM_PW                                        =  					4				 --  null 종료 문자열 아님
NET_NICK_NAME_SIZE                                 =  			33				 --  한글/영문 16자 (note. 다른 언어일 경우 16자 아닐 수 있음.)
NET_ROOM_NAME_SIZE                                 =  			23
NET_NCGUSID_SIZE                                   =  			16
NET_SESSION_KEY_SIZE                               =  		16
INVEN_ITEMDATA_SIZE                                =  			33
TURKEY_UID_SIZE                                    =  				21				 -- NULL 포함 
MACRO_MAX_COUNT                                    =  				5
MACRO_MAX_LENGHT                                   =  			255
VIEW_ROOM_COUNT                                    = 					300				 -- 채널당 명수랑 같아야 합니다. 
SEND_MAX_ROOM_COUNT                                = 				15				 -- 몇개의 카운터는 정확해야한다.
SEND_MAX_LOBBY_USER_COUNT                          = 		10				 -- 게임서버에서 보내는 로비 유저 카운트
VIEW_CHANNEL_COUNT                                 =  			10				 --  GAME_CHANNEL_COUNT와 뭐가 다른가요? (영권)
SLOT_MAX_COUNT                                     = 					16				 --  플레이어 슬롯입니다.
SLOT_MAX_OBSERVER_COUNT                            = 			0				 --  옵저버 플레이어 슬롯입니다.
SLOT_MAX_HIDDEN_OBSERVER_COUNT                     = 		1			 --  히든 옵저버 플레이어 슬롯입니다.(GM만 사용가능)
SLOT_ROOM_VIEW_COUNT                               = 			SLOT_MAX_COUNT + SLOT_MAX_OBSERVER_COUNT									 --  히든슬롯을 뺀 슬롯의 전체 개수
SLOT_ALL_COUNT                                     = 					SLOT_MAX_COUNT + SLOT_MAX_OBSERVER_COUNT + SLOT_MAX_HIDDEN_OBSERVER_COUNT	 --  슬롯의 전체 개수
MAX_AI_CHARA_COUNT                                 =  			8
MAX_KILLUSER_COUNT                                 =  			16				 --  최대 킬 카운터
NEW_MEDAL_FLAG_SIZE                                =  			32				 --  NEW표시를 위한 저장소

-- enum MISSION_OBJECT_COUNT
MISSION_FIRST_DEFENCE_OBJECT                       = 0 --  첫번째 오브젝트
MISSION_SECOND_DEFENCE_OBJECT                      = 1 --  두번째 오브젝트
MAX_OBJECT_COUNT                                   = 2 --  최대 오브젝트의 수
-- end enum --

ENV_SETTING_DEFAULT                                =  			1				 --  기본 옵션입니다.
ENV_SETTING_CHANGE                                 =  			0				 --  옵션이 변경 되었습니다.
MISSION_END_TIMEOUT                                =  				1
MISSION_END_BOMBFIRE                               =  			2
MISSION_END_UNINSTALL                              =  			3
MISSION_END_ALLDEATH                               =  			4
V_STAGEOPTION                                      =  				UINT8			 --  옵션이 더 늘어나게 되면 혹시나 몰라서..

-- enum STAGE_OPTION_TYPE
STAGE_OPTION_AI                                    = 0
STAGE_OPTION_RPG                                   = 1
STAGE_OPTION_SNIPER                                = 2
-- end enum --

STAGE_OPTION_AI                                    =  				0x01
STAGE_OPTION_RPG                                   =  			0x02
STAGE_OPTION_SNIPER                                =  			0x04
STAGE_OPTION_ANNIHILATION                          =  	0x08
MAX_STRING_COUNT                                   = 			256
MAX_CHATTING_COUNT                                 = 			256
CHATTING_TYPE_ALL                                  = 							1		 -- Room에서만 사용
CHATTING_TYPE_WHISPER                              = 						2
CHATTING_TYPE_REPLY                                = 							3	
CHATTING_TYPE_TEAM                                 = 							4		 -- Room에서만 사용
CHATTING_TYPE_CLAN                                 = 							5
CHATTING_TYPE_LOBBY                                = 							6
CHATTING_TYPE_MATCH                                = 							7
CHATTING_TYPE_CLAN_MEMBER_PAGE                     = 				8
MISSION_FREE_TIME                                  =  			5			 -- 5초 프리타임
MISSION_RESULT_TIME                                =  			3			 -- 3초 결과타임
BATTLE_KILL_TYPE_60                                =  			0x00
BATTLE_KILL_TYPE_80                                =  			0x01
BATTLE_KILL_TYPE_100                               =  		0x02
BATTLE_KILL_TYPE_120                               =  		0x03
BATTLE_KILL_TYPE_140                               =  		0x04
BATTLE_KILL_TYPE_160                               =  		0x05

-- enum BATTLE_ROUND_TYPE
BATTLE_ROUND_TYPE_1                                = 0
BATTLE_ROUND_TYPE_2                                = 1 -- BATTLE_ROUND_TYPE_2,
BATTLE_ROUND_TYPE_3                                = 2
BATTLE_ROUND_TYPE_5                                = 3
BATTLE_ROUND_TYPE_7                                = 4
BATTLE_ROUND_TYPE_9                                = 5
BATTLE_ROUND_TYPE_ENDLESS                          = 6
BATTLE_ROUND_TYPE_MAX                              = 7
-- end enum --

BATTLE_TIME_MISSION_TYPE_3                         =  	0x00
BATTLE_TIME_MISSION_TYPE_5                         =  	0x10
BATTLE_TIME_MISSION_TYPE_7                         =  	0x20
BATTLE_TIME_TYPE_5                                 =  			0x30
BATTLE_TIME_TYPE_10                                =  			0x40
BATTLE_TIME_TYPE_15                                =  			0x50
BATTLE_TIME_TYPE_20                                =  			0x60
BATTLE_TIME_TYPE_25                                =  			0x70
BATTLE_TIME_TYPE_30                                =  			0x80
MAX_NPC_COUNT                                      =  				16
GET_QUEST_EXP_POINT                                =  			0x00000001
GET_QUEST_WEAPON                                   =  			0x00000010
GET_QUEST_FINISH_LAST_CARD                         =  	0x00000100
RESULT_ICON_PC                                     =  				0x0001
RESULT_ICON_PC_PLUS                                =  			0x0002
RESULT_ICON_ITEM                                   =  			0x0004
RESULT_ICON_EVENT                                  =  			0x0008
TRAINING_DIFFICULTY_LEVEL_NONE                     =  		0
TRAINING_DIFFICULTY_LEVEL_HIGH                     =  		10
TRAINING_DIFFICULTY_LEVEL_LOW                      =  		1
MAX_BEGIN_RANK                                     =  			3	 -- 최대 초보계급
--GET_POINTITEM                                      =  (ItemID)			((GET_ITEM_FLAG_USAGE(ItemID)*1000000)+(GET_ITEM_FLAG_NUMBER(ItemID)*1000)+(GET_ITEM_FLAG_TYPE(ItemID)*100))

-- enum SChannelType
S_CHANNEL_TYPE_UNDEFINED                           = 0
S_CHANNEL_TYPE_ALL                                 = 1 -- 전체
S_CHANNEL_TYPE_NORMAL                              = 2 -- 일반 
S_CHANNEL_TYPE_NORMAL2                             = 3 -- 일반 2
S_CHANNEL_TYPE_BEGIN                               = 4 -- 초보 
S_CHANNEL_TYPE_CLAN                                = 5 -- 클랜
S_CHANNEL_TYPE_EXPERT                              = 6 -- 고수 
S_CHANNEL_TYPE_CONBINATION                         = 7 -- 조합	
S_CHANNEL_TYPE_CHAMPIONSHIP                        = 8 -- 대회
S_CHANNEL_TYPE                                     = 9
-- end enum --


-- enum ChannelType
CHANNEL_TYPE_NONE                                  = 0
CHANNEL_TYPE_NORMAL                                = 1 -- 일반 채널
CHANNEL_TYPE_BEGIN1                                = 2 -- 초보 채널 Kill/Death로 제한
CHANNEL_TYPE_BEGIN2                                = 3 -- 초보 채널 계급으로 제한
CHANNEL_TYPE_CLAN                                  = 4 -- 클랜 채널
CHANNEL_TYPE_EXPERT                                = 5 -- 고수 채널 병장 이상 
CHANNEL_TYPE_EXPERT2                               = 6 -- 고수 채널 상사 이상
CHANNEL_TYPE_CHAMPIONSHIP                          = 7 -- 대회 채널
CHANNEL_TYPE_NORMAL2                               = 8 -- 일반 채널 2
CHANNEL_TYPE                                       = 9
-- end enum --


-- enum TEAM_TYPE
TEAM_RED                                           = 0
TEAM_BLUE                                          = 1
TEAM_COUNT                                         = 2
-- end enum --


-- enum TEAM_RESULT_TYPE
TEAM_RED_WIN                                       = 0
TEAM_BLUE_WIN                                      = 1
TEAM_DRAW                                          = 2
-- end enum --

KILLING_MESSAGE_PIERCINGSHOT                       =  		0x0100
KILLING_MESSAGE_MASSKILL                           =  			0x0200
KILLING_MESSAGE_CHAINSTOPPER                       =  		0x0400
KILLING_MESSAGE_HEADSHOT                           =  			0x0800
KILLING_MESSAGE_CHAINHEADSHOT                      =  		0x1000
KILLING_MESSAGE_CHAINSLUGGER                       =  		0x2000
KILLING_MESSAGE_SUICIDE                            =  				0x4000
KILLING_MESSAGE_OBJECTDEFENCE                      =  		0x8000
MAX_INVITE_COUNT                                   =  			8			 --  5명
NOTICE_TYPE_NORMAL                                 =  			1
NOTICE_TYPE_EMERGENCY                              =  		2
NOTICE_STRING_MAX_COUNT                            =  		1024

-- enum PC_CAFE_TYPE
PC_NOT_CAFE                                        = 0 --  PC방 아님
PC_NORMAL_CAFE                                     = 1 --  일반 PC방
PC_PREMIUM_CAFE                                    = 2 --  고급 PC방
-- end enum --


-- enum ESPORT_ID_TYPE
ESPORT_NOT_ID                                      = 0 --  ESport ID 아님
ESPORT_ID                                          = 1 --  ESport ID
-- end enum --


-- enum GAME_KEY_MAP
GAME_KEY_MAP_VERSION                               = 0
GAME_KEY_MAP_LEFT                                  = 1
GAME_KEY_MAP_RIGHT                                 = 2
GAME_KEY_MAP_FORWARD                               = 3
GAME_KEY_MAP_BACKWARD                              = 4
GAME_KEY_MAP_JUMP                                  = 5 --  점프 키
GAME_KEY_MAP_FOOTSTEP                              = 6 --  걷기
GAME_KEY_MAP_CROUCH                                = 7 --  앉기
GAME_KEY_MAP_TURNBACK                              = 8 --  Extension 활성화 버튼
GAME_KEY_MAP_ATTACK                                = 9 --  무기 공격
GAME_KEY_MAP_SUBFUNC                               = 10 --  특수기능
GAME_KEY_MAP_RELOAD                                = 11 --  탄환 재장전
GAME_KEY_MAP_CHANGEWEAPON                          = 12 --  무기교체창 활성화
GAME_KEY_MAP_CHANGEWEAPON_1                        = 13 --  주무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_2                        = 14 --  보조무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_3                        = 15 --  근접무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_4                        = 16 --  투척무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_5                        = 17 --  특수무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_6                        = 18 --  폭발물로 교체
GAME_KEY_MAP_CHANGEWEAPON_QUICK                    = 19 --  지난무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_PREV                     = 20 --  이전무기로 교체
GAME_KEY_MAP_CHANGEWEAPON_NEXT                     = 21 --  다음무기로 교체
GAME_KEY_MAP_DROP                                  = 22 --  무기 드랍 버튼	
GAME_KEY_MAP_SHOWSCORE                             = 23 -- 	현재 게임전적 보기
GAME_KEY_MAP_TOGGLE_MAP                            = 24 --  전체맵 보기
GAME_KEY_MAP_MINIMAP_ENLARGE                       = 25 --  미니맵 확대
GAME_KEY_MAP_MINIMAP_REDUCTION                     = 26 --  미니맵 축소
GAME_KEY_MAP_CHAT                                  = 27 --  채팅
GAME_KEY_MAP_CHAT_ALL                              = 28 --  전체채팅모드
GAME_KEY_MAP_CHAT_TEAM                             = 29 --  팀 채팅모드
GAME_KEY_MAP_CHAT_HISTORY                          = 30 --  지난 대화보기(게임안에서만 사용됨)
GAME_KEY_MAP_VOICECHAT                             = 31 --  음성채팅
GAME_KEY_MAP_RADIOMESSAGE1                         = 32 --  라디오 메시지 1
GAME_KEY_MAP_RADIOMESSAGE2                         = 33
GAME_KEY_MAP_RADIOMESSAGE3                         = 34
GAME_KEY_MAP_SPECIALACTION                         = 35 --  특수 행동키(폭발물 해체등)
GAME_KEY_MAP_MOUSE_SENS_UP                         = 36 --  마우스 감도 증가
GAME_KEY_MAP_MOUSE_SENS_DOWN                       = 37 --  마우스 감도 감소
GAME_KEY_MAP_SCREENSHOT                            = 38 --  화면저장	
GAME_KEY_MAP_CHAT_CLAN                             = 39 --  클랜 채팅모드
GAME_KEY_MAP_LASERDOT                              = 40 --  레이져 도트
GAME_KEY_MAP_COUNT                                 = 41
-- end enum --


-- enum SLOT_STATE
SLOT_STATE_EMPTY                                   = 0 --  
SLOT_STATE_CLOSE                                   = 1 --  	
SLOT_STATE_SHOP                                    = 2 --  상점
SLOT_STATE_INFO                                    = 3 --  유저정보
SLOT_STATE_CLAN                                    = 4 --  클랜
SLOT_STATE_INVENTORY                               = 5 --  인벤토리
SLOT_STATE_NORMAL                                  = 6 --  레디룸에서 상태
SLOT_STATE_READY                                   = 7 --  레디룸에서 상태
SLOT_STATE_LOAD                                    = 8 --  (게임중) 로딩중입니다.			Time Out ( 2분)     처음시작 방장시작후 (10초)
SLOT_STATE_RENDEZVOUS                              = 9 --  (게임중) 랑데뷰서버 홀펀칭		Time Out ( )
SLOT_STATE_PRESTART                                = 10 --  (게임중) 홀펀칭					Time Out ( )
SLOT_STATE_BATTLE_READY                            = 11 --  (게임중) 홀펀칭 완료후 게임 시작을 기다림 
SLOT_STATE_BATTLE                                  = 12 --  (게임중) 전투중입니다.
-- end enum --


-- enum ROOM_STATE
ROOM_STATE_READY                                   = 0 -- ReadyRoom 상태 
ROOM_STATE_COUNTDOWN                               = 1 -- start countdown
ROOM_STATE_LOADING                                 = 2 -- 로딩 상태
ROOM_STATE_RENDEZVOUS                              = 3 -- 랑데뷰 서버에 접속준비 중인 상태
ROOM_STATE_PRE_BATTLE                              = 4 -- 로딩 이 끝나고, 홀펀칭 상태 
ROOM_STATE_BATTLE                                  = 5 -- 홀펀칭이 끝나고 게임을 시작하는 상태 
ROOM_STATE_BATTLE_END                              = 6 -- 배틀  종료  바로 Ready로 변경됨 
ROOM_STATE_EMPTY                                   = 7 -- 깨진방: Lobby의 Room 목록에서 AutoRefresh 시, 이 빠진 방 구분 용. Lobby에서만 사용.	
-- end enum --


-- enum MISSION_STATE
MISSION_STATE_UNKNOWN                              = 0
MISSION_STATE_PRE_BATTLE                           = 1 -- 보스전으로 들어갔습니다. 모든 미션전에서 사용합니다. 
MISSION_STATE_BATTLE                               = 2
MISSION_STATE_FREE                                 = 3
MISSION_STATE_RESULT                               = 4
-- end enum --


-- enum STAGE_MASK
STAGE_MASK_NORMAL                                  = 0
STAGE_MASK_TRAINING                                = 1
STAGE_MASK_MAX                                     = 2
-- end enum --


-- enum STAGE_MODE
STAGE_MODE_NORMAL                                  = 0
STAGE_MODE_MATCH                                   = 1
STAGE_MODE_MAX                                     = 2
-- end enum --


-- enum STAGE_SLOT_MODE
STAGE_SLOT_MODE_NORMAL                             = 0
STAGE_SLOT_MODE_4VS4                               = 1
STAGE_SLOT_MODE_MAX                                = 2
-- end enum --

STAGE_NAME_COUNT                                   = 				64

-- enum STAGE_ORDINAL_ID
STAGE_ORD_NA                                       = 0
STAGE_ORD_PORT_AKABA                               = 1
STAGE_ORD_RED_ROCK                                 = 2
STAGE_ORD_LIBRARY                                  = 3
STAGE_ORD_MSTATION                                 = 4
STAGE_ORD_MIDNIGHT_ZONE                            = 5
STAGE_ORD_UPTOWN                                   = 6
STAGE_ORD_BURNINGHALL                              = 7
STAGE_ORD_DSQUAD                                   = 8
STAGE_ORD_CRACKDOWN                                = 9
STAGE_ORD_SAINTMANSION                             = 10
STAGE_ORD_EASTERNROAD                              = 11
STAGE_ORD_D_DOWNTOWN                               = 12
STAGE_ORD_D_LUXVILLE                               = 13
STAGE_ORD_D_BLOWCITY                               = 14
STAGE_ORD_D_STORMTUBE                              = 15
STAGE_ORD_D_GIRAN2                                 = 16
STAGE_ORD_D_BREAKDOWN                              = 17
STAGE_ORD_TRAININGCAMP                             = 18
STAGE_ORD_D_SENTRYBASE                             = 19
STAGE_ORD_DESERTCAMP                               = 20
STAGE_ORD_KICKPOINT                                = 21
STAGE_ORD_DOWNTOWN                                 = 22
STAGE_ORD_LUXVILLE                                 = 23
STAGE_ORD_OUTPOST                                  = 24
STAGE_ORD_BLOWCITY                                 = 25
STAGE_ORD_STORMTUBE                                = 26
STAGE_ORD_SENTRYBASE                               = 27
STAGE_ORD_HOSPITAL                                 = 28
STAGE_ORD_DOWNTOWN2                                = 29
STAGE_ORD_BREAKDOWN                                = 30
STAGE_ORD_GIRAN                                    = 31
STAGE_ORD_GIRAN2                                   = 32
STAGE_ORD_HELISPOT                                 = 33
ifdef                                              = 34
STAGE_ORD_BLACKPANTHER                             = 35
endif                                              = 36
STAGE_ORD_MC_PARK                                  = 37
STAGE_ORD_MAX                                      = 38
-- end enum --


-- enum DESIGNATION_APPLY_TYPE
DESIGNATION_APPLY_TYPE_ALL                         = 0 --  전체 계열
DESIGNATION_APPLY_TYPE_ASSULT                      = 1 --  어설트라이플 계열
DESIGNATION_APPLY_TYPE_RIFLE                       = 2 --  저격소총 계열
DESIGNATION_APPLY_TYPE_SMG                         = 3 --  SMG(기관단총)계열
DESIGNATION_APPLY_TYPE_MELLE                       = 4 --  근접무기 계열
DESIGNATION_APPLY_TYPE_HANDGUN                     = 5 --  핸드건 계열
DESIGNATION_APPLY_TYPE_SHOTGUN                     = 6 --  샷건 계열
DESIGNATION_APPLY_TYPE_BOMB                        = 7 --  폭탄 계열
DESIGNATION_APPLY_TYPE_COUNT                       = 8
-- end enum --


-- enum DESIGNATION_TYPE
DESIGNATION_TYPE_NONE                              = 0
DESIGNATION_TYPE_1                                 = 1 --  최 하위 단계 공통 호칭 A
DESIGNATION_TYPE_2                                 = 2 --  최 하위 단계 공통 호칭 B
DESIGNATION_TYPE_3                                 = 3 --  최 하위 단계 공통 호칭 C
DESIGNATION_TYPE_4                                 = 4 --  최 하위 단계 공통 호칭 D
DESIGNATION_TYPE_5                                 = 5 --  1차 선택 단계 호칭 A
DESIGNATION_TYPE_6                                 = 6 --  1차 선택 단계 호칭 B
DESIGNATION_TYPE_7                                 = 7 --  1차 선택 단계 호칭 C
DESIGNATION_TYPE_8                                 = 8 --  2차 선택 단계 호칭 A (Assault Rifle)
DESIGNATION_TYPE_9                                 = 9 --  2차 선택 단계 호칭 B (Assault Rifle)
DESIGNATION_TYPE_10                                = 10 --  2차 선택 단계 호칭 C (Assault Rifle)
DESIGNATION_TYPE_11                                = 11 --  2차 선택 단계 호칭 D (Assault Rifle)
DESIGNATION_TYPE_12                                = 12 --  마스터 (Assault Rifle)
DESIGNATION_TYPE_13                                = 13 --  히어로 (Assault Rifle)
DESIGNATION_TYPE_14                                = 14 --  2차 선택 단계 호칭 A (Rifle)
DESIGNATION_TYPE_15                                = 15 --  2차 선택 단계 호칭 B (Rifle)
DESIGNATION_TYPE_16                                = 16 --  2차 선택 단계 호칭 C (Rifle)
DESIGNATION_TYPE_17                                = 17 --  2차 선택 단계 호칭 D (Rifle)
DESIGNATION_TYPE_18                                = 18 --  마스터 (Rifle)
DESIGNATION_TYPE_19                                = 19 --  히어로 (Rifle)
DESIGNATION_TYPE_20                                = 20 --  2차 선택 단계 호칭 A (SMG)
DESIGNATION_TYPE_21                                = 21 --  2차 선택 단계 호칭 B (SMG)
DESIGNATION_TYPE_22                                = 22 --  2차 선택 단계 호칭 C (SMG)
DESIGNATION_TYPE_23                                = 23 --  2차 선택 단계 호칭 D (SMG)
DESIGNATION_TYPE_24                                = 24 --  마스터 (SMG)
DESIGNATION_TYPE_25                                = 25 --  히어로 (SMG)
DESIGNATION_TYPE_26                                = 26 --  2차 선택 단계 호칭 A (Knife)
DESIGNATION_TYPE_27                                = 27 --  2차 선택 단계 호칭 B (Knife)
DESIGNATION_TYPE_28                                = 28 --  2차 선택 단계 호칭 C (Knife)
DESIGNATION_TYPE_29                                = 29 --  마스터 (Knife)
DESIGNATION_TYPE_30                                = 30 --  2차 선택 단계 호칭 A (Hand Gun)
DESIGNATION_TYPE_31                                = 31 --  2차 선택 단계 호칭 B (Hand Gun)
DESIGNATION_TYPE_32                                = 32 --  2차 선택 단계 호칭 C (Hand Gun)
DESIGNATION_TYPE_33                                = 33 --  마스터 (Hand Gun)
DESIGNATION_TYPE_34                                = 34 --  히어로 (Hand Gun)
DESIGNATION_TYPE_35                                = 35 --  2차 선택 단계 호칭 A (Shot Gun)
DESIGNATION_TYPE_36                                = 36 --  2차 선택 단계 호칭 B (Shot Gun)
DESIGNATION_TYPE_37                                = 37 --  2차 선택 단계 호칭 C (Shot Gun)
DESIGNATION_TYPE_38                                = 38 --  마스터 (Shot Gun)
DESIGNATION_TYPE_39                                = 39 --  히어로 (Shot Gun)
DESIGNATION_TYPE_40                                = 40 --  2차 선택 단계 호칭 A (Composition)
DESIGNATION_TYPE_41                                = 41 --  2차 선택 단계 호칭 B (Composition)
DESIGNATION_TYPE_42                                = 42 --  2차 선택 단계 호칭 C (Composition)
DESIGNATION_TYPE_43                                = 43 --  2차 선택 단계 호칭 D (Composition)
DESIGNATION_TYPE_44                                = 44 --  마스터 (Composition)
DESIGNATION_TYPE_MAX                               = 45
-- end enum --


-- enum SALE_ITEM_TYPE
SALE_ITEM_DISGUISE_RANK                            = 0
SALE_ITEM_DISGUISE_NAME                            = 1
SALE_ITEM_COLOR_CROSSHAIR                          = 2
SALE_ITEM_COLOR_CHATTING                           = 3
SALE_ITEM_COLOR_NICK                               = 4
SALE_ITEM_MAX_COUNT                                = 5
-- end enum --

STAGE_FLAG_PRIVATE                                 = 							0x80
STAGE_FLAG_TRAINING                                = 							0x40
STAGE_FLAG_CLANMATCH                               = 						0x20
STAGE_FLAG_SNIPER                                  = 							0x10
STAGE_FLAG_SHOTGUN                                 = 							0x08
STAGE_FLAG_RANDOM                                  = 							0x04
DEF_RANK_COUNT                                     = 				52

-- enum RANK_COUNT
RANK_00                                            = 0 -- 	"훈련병"
RANK_01                                            = 1 -- 	"이병"
RANK_02                                            = 2 -- 	"일병"
RANK_03                                            = 3 -- 	"상병"
RANK_04                                            = 4 -- 	"병장"
RANK_05                                            = 5 -- 	"하사 1호봉"
RANK_06                                            = 6 -- 	"하사 2호봉"
RANK_07                                            = 7 -- 	"하사 3호봉"
RANK_08                                            = 8 -- 	"중사 1호봉"
RANK_09                                            = 9 -- 	"중사 2호봉"
RANK_10                                            = 10 -- 	"중사 3호봉"
RANK_11                                            = 11 -- 	"중사 4호봉"
RANK_12                                            = 12 -- 	"상사 1호봉"
RANK_13                                            = 13 -- 	"상사 2호봉"
RANK_14                                            = 14 -- 	"상사 3호봉"
RANK_15                                            = 15 -- 	"상사 4호봉"
RANK_16                                            = 16 -- 	"상사 5호봉"
RANK_17                                            = 17 -- 	"소위 1호봉"
RANK_18                                            = 18 -- 	"소위 2호봉"
RANK_19                                            = 19 -- 	"소위 3호봉"
RANK_20                                            = 20 -- 	"소위 4호봉"
RANK_21                                            = 21 -- 	"중위 1호봉"
RANK_22                                            = 22 -- 	"중위 2호봉"
RANK_23                                            = 23 -- 	"중위 3호봉"
RANK_24                                            = 24 -- 	"중위 4호봉"
RANK_25                                            = 25 -- 	"중위 5호봉"
RANK_26                                            = 26 -- 	"대위 1호봉"
RANK_27                                            = 27 -- 	"대위 2호봉"
RANK_28                                            = 28 -- 	"대위 3호봉"
RANK_29                                            = 29 -- 	"대위 4호봉"
RANK_30                                            = 30 -- 	"대위 5호봉"
RANK_31                                            = 31 -- 	"소령 1호봉"
RANK_32                                            = 32 -- 	"소령 2호봉"
RANK_33                                            = 33 -- 	"소령 3호봉"
RANK_34                                            = 34 -- 	"소령 4호봉"
RANK_35                                            = 35 -- 	"소령 5호봉"
RANK_36                                            = 36 -- 	"중령 1호봉"
RANK_37                                            = 37 -- 	"중령 2호봉"
RANK_38                                            = 38 -- 	"중령 3호봉"
RANK_39                                            = 39 -- 	"중령 4호봉"
RANK_40                                            = 40 -- 	"중령 5호봉"
RANK_41                                            = 41 -- 	"대령 1호봉"
RANK_42                                            = 42 -- 	"대령 2호봉"
RANK_43                                            = 43 -- 	"대령 3호봉"
RANK_44                                            = 44 -- 	"대령 4호봉"
RANK_45                                            = 45 -- 	"대령 5호봉"
RANK_46                                            = 46 -- 	"준장"
RANK_47                                            = 47 -- 	"소장"
RANK_48                                            = 48 -- 	"중장"
RANK_49                                            = 49 -- 	"대장"
RANK_50                                            = 50 -- 	"원수"
RANK_51                                            = 51 -- 	"영웅"	
RANK_NEWBIE                                        = 52 --  클라만 사용합니다.
RANK_GAMEMASTER                                    = 53
RANK_MAX                                           = 54
-- end enum --


-- enum STAGE_ID
STAGE_ID_NA                                        = 0
STAGE_ID_PORT_AKABA                                = 1
STAGE_ID_RED_ROCK                                  = 2
STAGE_ID_LIBRARY                                   = 3
STAGE_ID_MSTATION                                  = 4
STAGE_ID_MIDNIGHT_ZONE                             = 5
STAGE_ID_UPTOWN                                    = 6
STAGE_ID_BURNINGHALL                               = 7
STAGE_ID_DSQUAD                                    = 8
STAGE_ID_EASTERNROAD                               = 9
STAGE_ID_D_DOWNTOWN                                = 10
STAGE_ID_D_LUXVILLE                                = 11
STAGE_ID_D_BLOWCITY                                = 12
STAGE_ID_D_STORMTUBE                               = 13
STAGE_ID_D_GIRAN2                                  = 14
STAGE_ID_D_BREAKDOWN                               = 15
STAGE_ID_OUTPOST                                   = 16 -- STAGE_ID_OUTPOST					= MAKE_STAGEID( STAGE_TYPE_DEATHMATCH,	STAGE_SLOT_MODE_NORMAL,	STAGE_ORD_OUTPOST),	
STAGE_ID_TRAININGCAMP                              = 17
STAGE_ID_D_SENTRYBASE                              = 18
STAGE_ID_DESERTCAMP                                = 19
STAGE_ID_KICKPOINT                                 = 20
STAGE_ID_DOWNTOWN                                  = 21
STAGE_ID_LUXVILLE                                  = 22
STAGE_ID_OUTPOST                                   = 23
STAGE_ID_BLOWCITY                                  = 24
STAGE_ID_STORMTUBE                                 = 25
STAGE_ID_SENTRYBASE                                = 26
STAGE_ID_HOSPITAL                                  = 27
STAGE_ID_DOWNTOWN2                                 = 28
STAGE_ID_BREAKDOWN                                 = 29
STAGE_ID_GIRAN                                     = 30
STAGE_ID_GIRAN2                                    = 31
STAGE_ID_HELISPOT                                  = 32
STAGE_ID_CRACKDOWN                                 = 33
STAGE_ID_SAINTMANSION                              = 34
ifdef                                              = 35
STAGE_ID_BLACKPANTHER                              = 36
endif                                              = 37
STAGE_ID_MC_PARK                                   = 38
-- end enum --

TEAMBATTLE_TIME_COUNT                              = 				10			 -- 클라이언트에서 이값을 사용하면 -1을해줘야 함	 
TEAMBATTLE_KILL_COUNT                              =  			7			 -- 클라이언트에서 이값을 사용하면 -1을해줘야 함	
MISSION_ROUND_TIME_COUNT                           =  		30			

-- enum CHARA_DEATH_TYPE
CHARA_DEATH_UN                                     = 0
CHARA_DEATH_A                                      = 1 --  default
CHARA_DEATH_B                                      = 2 --  Bome! = Granade
CHARA_DEATH_H                                      = 3 --  Head Shot!!
CHARA_DEATH_F                                      = 4 --  Falling death
CHARA_DEATH_O                                      = 5 --  by Object Explosion
CHARA_DEATH_FAST_OBJECT                            = 6 --  by Fast Object, Damage Object
CHARA_DEATH_POISON                                 = 7 --  독에 의한 사망
CHARA_DEATH_TRAMPLED                               = 8 --  짓밟힘
CHARA_DEATH_HOWL                                   = 9 --  HOWL에 놀라 죽음;;;
CHARA_DEATH_MAXCOUNT                               = 10
-- end enum --


-- enum CHARA_DEFENCE_SYSTEM
CHARA_DEFENCE_SYSTEM_FAIL                          = 0 --  default
CHARA_DEFENCE_SYSTEM_SUCCESS                       = 1 --  오브젝트 공격자 제거
CHARA_DEFENCE_SYSTEM_MAXCOUNT                      = 2
-- end enum --


-- enum CHARA_KILL_TYPE
CHARA_KILL_DEFAULT                                 = 0
CHARA_KILL_PIERCING                                = 1
CHARA_KILL_MASS                                    = 2
-- end enum --


-- enum GAMEKEY_MODE_STATE
GAMEKEY_MODE_MENU                                  = 0 --  메뉴에 사용되는 게임키 모드
GAMEKEY_MODE_GAME                                  = 1 --  게임에 사용되는 게임키 모드
GAMEKEY_MODE_COUNT                                 = 2
-- end enum --


-- enum FONT_TYPE
FONT_ENGLISH_COMMON                                = 0
FONT_KOREAN_COMMON                                 = 1
FONT_TYPE_COUNT                                    = 2
-- end enum --


-- enum MESSAGE_BOX_TYPE
MESSAGE_BOX_TYPE_CONFIRM                           = 0
MESSAGE_BOX_TYPE_CONFIRM_CANCEL                    = 1
MESSAGE_BOX_TYPE_NONE                              = 2
MESSAGE_BOX_TYPE_COUNT                             = 3
-- end enum --


-- enum WEAPON_CLASS_TYPE
WEAPON_CLASS_UNKNOWN                               = 0
WEAPON_CLASS_KNIFE                                 = 1 -- 	나이프
WEAPON_CLASS_HANDGUN                               = 2 -- 	권총
WEAPON_CLASS_ASSAULT                               = 3 -- 	소총
WEAPON_CLASS_SMG                                   = 4 -- 	서브머신건
WEAPON_CLASS_SNIPER                                = 5 -- 	저격총
WEAPON_CLASS_SHOTGUN                               = 6 -- 	산탄총
WEAPON_CLASS_THROWING                              = 7 -- 	투척 무기
WEAPON_CLASS_ITEM                                  = 8 -- 	아이템
WEAPON_CLASS_MISSION                               = 9 -- 	미션 아이템
WEAPON_CLASS_MG                                    = 10 -- 	머신건
WEAPON_CLASS_GRENADESHELL                          = 11 --  유탄
WEAPON_CLASS_BOMBTRIGGER                           = 12 --  폭탄 스위치
WEAPON_CLASS_CIC                                   = 13
WEAPON_CLASS_DUALHANDGUN                           = 14
WEAPON_CLASS_DUALKNIFE                             = 15
WEAPON_CLASS_ROCKET_LAUNCHER                       = 16
WEAPON_CLASS_OBJECT_GUN                            = 17 --  특정 오브젝트에 붙어 있는 총 ( M197....)
WEAPON_CLASS_DUALSMG                               = 18
WEAPON_CLASS_DINO                                  = 19
WEAPON_CLASS_DINO_LEFT_SCRATCH                     = 20 --  왼쪽 손 할퀴기 이펙트를 위해 만듬.
WEAPON_CLASS_COUNT                                 = 21
WEAPON_CLASS_WOODEN_ARROW                          = 22
-- end enum --


-- enum WEAPON_NUM_ASSAULT
WEAPON_NUM_ASSAULT_UNKNOWN                         = 0
WEAPON_NUM_ASSAULT_SG550_DOTSIGHT                  = 1 -- 	SG550_DOTSIGHT		( Extension)
WEAPON_NUM_ASSAULT_AK47_DUALMAG                    = 2 -- 	AK47_DUALMAGAZINE	( Extension)
WEAPON_NUM_ASSAULT_M4A1_SCOPE2                     = 3 -- 	M4A1_SCOPE2			( Extension)
WEAPON_NUM_ASSAULT_K2                              = 4 -- 	K2
WEAPON_NUM_ASSAULT_F2000_SCOPE2                    = 5 -- 	F2000_SCOPE2		( Extension)
WEAPON_NUM_ASSAULT_SG550                           = 6 -- WEAPON_NUM_ASSAULT_SG550					= 6,	//	SG550	====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_ASSAULT_AK47                            = 7 -- WEAPON_NUM_ASSAULT_AK47					= 7,	//	AK47	====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_ASSAULT_M4A1                            = 8 -- WEAPON_NUM_ASSAULT_M4A1					= 8,	//	M4A1	====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_ASSAULT_AK47_GOLD                       = 9
WEAPON_NUM_ASSAULT_M4A1_CAMO                       = 10 --  M4A1_Camo
WEAPON_NUM_ASSAULT_K201_GL                         = 11 --  K201_GrenadeLauncher
WEAPON_NUM_ASSAULT_K201_EVENT                      = 12 -- WEAPON_NUM_ASSAULT_K201_EVENT				= 12,		====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_ASSAULT_G36C_SCOPE2                     = 13
WEAPON_NUM_ASSAULT_SG550_SE                        = 14
WEAPON_NUM_ASSAULT_AK_SOPMOD                       = 15
WEAPON_NUM_ASSAULT_AK_SOPMOD_EVENT                 = 16 -- WEAPON_NUM_ASSAULT_AK_SOPMOD_EVENT		= 16,	// 이벤트
WEAPON_NUM_ASSAULT_AK47_SILVER                     = 17 -- AK-47 Ext. S
WEAPON_NUM_ASSAULT_SG550_MB                        = 18 -- SG550 Ext. Metallic Blue
WEAPON_NUM_ASSAULT_SG550_SILVER                    = 19 -- SG550 Ext. Silver
WEAPON_NUM_ASSAULT_SG550_WHITE                     = 20 -- SG550 Ext. White
WEAPON_NUM_ASSAULT_M4A1_SILVER                     = 21 -- M4A1 Ext. Silver
WEAPON_NUM_ASSAULT_M4A1_WHITE                      = 22 -- M4A1 Ext. White
WEAPON_NUM_ASSAULT_M4A1_GOLD                       = 23 -- M4A1 Ext. Gold
WEAPON_NUM_ASSAULT_M4A1_G_EXP_PT_30                = 24 --  M4A1 Ext. Gold + EXP/PT 30%		(캐시 상품)
WEAPON_NUM_ASSAULT_AK47_S_POINT15                  = 25 --  AK47 Ext. Silver + Point 15%		(태국 이벤트 무기)
WEAPON_NUM_ASSAULT_SG550_MB_EXP_PT_10              = 26 --  SG550 Ext. MB + Exp/PT 10%		(Giga Bomb 무기)
WEAPON_NUM_ASSAULT_G36C_EVENT                      = 27 --  G36C (태국 이벤트 무기)
WEAPON_NUM_ASSAULT_AUG_A3_EVENT                    = 28 --  AUG A3 Event
WEAPON_NUM_ASSAULT_G36C_SILVER                     = 29
WEAPON_NUM_ASSAULT_SG550_MB_EXP_PT_20              = 30 --  SG550 Ext. MB + Exp/PT 20% ( 토너먼트 우승자 무기 )
WEAPON_NUM_ASSAULT_G36C_SI_SPECIAL_EXP_PT_20       = 31 --  G36C S + Exp/PT 20% ( 토너먼트 우승자 무기 )
WEAPON_NUM_ASSAULT_F2000_SILVER                    = 32 -- 	F2000 Ext Silver
WEAPON_NUM_ASSAULT_AK_SOPMOD_EXP_PT_20             = 33
WEAPON_NUM_ASSAULT_G36C_SILVER_EXP_PT_20           = 34
WEAPON_NUM_ASSAULT_SG550_SE_D                      = 35 -- SG550 Ext. Camo D
WEAPON_NUM_ASSAULT_AUG_A3                          = 36 --  AUG A3
WEAPON_NUM_ASSAULT_AUG_A3_GOLD                     = 37 --  AUG A3 Gold
WEAPON_NUM_ASSAULT_G36C_SCOPE2_D                   = 38
WEAPON_NUM_ASSAULT_AK_SOPMOD_D                     = 39
WEAPON_NUM_ASSAULT_AUG_A3_D                        = 40
WEAPON_NUM_ASSAULT_AK_SOPMOD_KING_COBRA            = 41 --  Exp 5% 증가됨,
WEAPON_NUM_ASSAULT_M4_SR16_LV1                     = 42 --  M4 SR-16 Lv1 (드럼 탄창, Steady Zoom)
WEAPON_NUM_ASSAULT_M4_SR16_LV2                     = 43 --  M4 SR-16 Lv2 (드럼 탄창, 스코프)
WEAPON_NUM_ASSAULT_M4_SR16_LV3                     = 44 --  M4 SR-16 Lv3 (드럼 탄창, 스코프, 유탄발사기)
WEAPON_NUM_ASSAULT_M4_SR16_FC                      = 45 --  M4 SR-16 F.C (드럼 탄창, 스코프, 유탄발사기, 레이저, 소음기)
WEAPON_NUM_ASSAULT_F2000_SILVER_PERIOD             = 46
WEAPON_NUM_ASSAULT_K2_IN_MODE                      = 47 -- 	돌격전 모드 전용 기본 소총
WEAPON_NUM_ASSAULT_MAX                             = 48
-- end enum --


-- enum WEAPON_NUM_SMG
WEAPON_NUM_SMG_UNKNOWN                             = 0
WEAPON_NUM_SMG_MP5K_SILENCER                       = 1 -- 	MP5K_Silencer		( Extension)
WEAPON_NUM_SMG_SPECTRE_STEADYAIM                   = 2 -- 	Spectre_SteadyAim	( Extension)
WEAPON_NUM_SMG_K1_ZOOM                             = 3 -- 	K1_Zoom				( Extension)
WEAPON_NUM_SMG_MP7_DOTSIGHT                        = 4 -- 	MP7_DOTSIGHT		( Extension)
WEAPON_NUM_SMG_MP5K                                = 5 -- WEAPON_NUM_SMG_MP5K				= 5,	//	MP5K	====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_SMG_K1                                  = 6 -- 	K1
WEAPON_NUM_SMG_MP5K_SERIF                          = 7 --  금장 MP5K
WEAPON_NUM_SMG_UMP45_DUALMAG                       = 8
WEAPON_NUM_SMG_SPECTRE_SE                          = 9
WEAPON_NUM_SMG_P90MC_DOTSIGHT                      = 10
WEAPON_NUM_SMG_P90_DOTSIGHT                        = 11
WEAPON_NUM_SMG_KRISSSUPERV_DUMMY                   = 12 --  쓰면 안됨.. 더미용
WEAPON_NUM_SMG_KRISSSUPERV                         = 13
WEAPON_NUM_SMG_MP5K_SILVER                         = 14 --  MP5K Silver
WEAPON_NUM_SMG_MP5K_WHITE                          = 15 --  MP5K White
WEAPON_NUM_SMG_SPECTRE_WHITE                       = 16 --  Spectre White
WEAPON_NUM_SMG_KRISSSUPERV_EVENT                   = 17 --  Event
WEAPON_NUM_SMG_SPECTRE_SILVER                      = 18
WEAPON_NUM_SMG_K1_SILVER                           = 19
WEAPON_NUM_SMG_MP7_SILVER                          = 20
WEAPON_NUM_SMG_UMP45_SILVER                        = 21
WEAPON_NUM_SMG_MP5K_SERIF_D                        = 22 --  MP5K Silver D
WEAPON_NUM_SMG_SPECTRE_SE_D                        = 23
WEAPON_NUM_SMG_KRISSSUPERV_GOLD                    = 24
WEAPON_NUM_SMG_P90MC_DOTSIGHT_CAMO                 = 25
WEAPON_NUM_SMG_KRISSSUPERV_GOLD_DUMMY              = 26 --  KRISSSUPERV_GOLD Dummy
WEAPON_NUM_SMG_P90_DOTSIGHT_D                      = 27
WEAPON_NUM_SMG_KRISSSUPERV_D_DUMMY                 = 28 --  쓰면 안됨.. 더미용
WEAPON_NUM_SMG_KRISSSUPERV_D                       = 29
WEAPON_NUM_SMG_P90MC_DOTSIGHT_D                    = 30
WEAPON_NUM_SMG_AKS74U_ZOOM                         = 31
WEAPON_NUM_SMG_M4_CQBR_LV1                         = 32 --  M4 CBQ-R Lv1 (소음기, 정조준)
WEAPON_NUM_SMG_M4_CQBR_LV2                         = 33 --  M4 CBQ-R Lv2 (소음기, 정조준, 레이저)
WEAPON_NUM_SMG_M4_CQBR_LV3                         = 34 --  M4 CBQ-R Lv3 (소음기, 정조준, 레이저, LSS)
WEAPON_NUM_SMG_MP7_SILVER_PERIOD                   = 35
WEAPON_NUM_SMG_MP7_CAMO                            = 36
WEAPON_NUM_SMG_MAX                                 = 37
-- end enum --


-- enum WEAPON_NUM_SNIPER
WEAPON_NUM_SNIPER_UNKNOWN                          = 0
WEAPON_NUM_SNIPER_DRAGUNOV                         = 1 -- 	SVD Dragunov
WEAPON_NUM_SNIPER_PSG1                             = 2 -- 	HK-PSG1
WEAPON_NUM_SNIPER_SSG69                            = 3 -- 	SSG69
WEAPON_NUM_SNIPER_SSG69_CAMO                       = 4 -- 	SSG69_CAMO
WEAPON_NUM_SNIPER_L115A1                           = 5 -- 	L115A1
WEAPON_NUM_SNIPER_DRAGUNOV_GOLD                    = 6
WEAPON_NUM_SNIPER_PSG1_S                           = 7
WEAPON_NUM_SNIPER_SSG69_SILVER                     = 8 -- 	SSG69 Silver
WEAPON_NUM_SNIPER_PSG1_SILVER                      = 9 -- 	HK-PSG1 Silver
WEAPON_NUM_SNIPER_DRAGUNOV_SILVER                  = 10 -- 	Dragunov Silver
WEAPON_NUM_SNIPER_DRAGUNOV_KING_COBRA_SILVER       = 11 -- 	Dragunov King Cobra Silver
WEAPON_NUM_SNIPER_DRAGUNOV_KING_COBRA_GOLD         = 12 -- 	Dragunov King Cobra Gold
WEAPON_NUM_SNIPER_L115A1_S_EXP_PT_20               = 13 -- 	L115A1 Special
WEAPON_NUM_SNIPER_DRAGUNOV_GOLD_D                  = 14
WEAPON_NUM_SNIPER_L115A1_GOLD                      = 15 -- 	L115A1 Gold
WEAPON_NUM_SNIPER_PSG1_S_D                         = 16
WEAPON_NUM_SNIPER_L115A1_D                         = 17
WEAPON_NUM_SNIPER_M4_SPR_LV1                       = 18 --  M4 SPR Lv1 (단발, 광학 스코프)
WEAPON_NUM_SNIPER_M4_SPR_LV2                       = 19 --  M4 SPR Lv2 (단발, 광학 스코프, 소음기)
WEAPON_NUM_SNIPER_M4_SPR_LV3                       = 20 --  M4 SPR Lv3 (단발, 광학 스코프, 소음기, 레이저)
WEAPON_NUM_SNIPER_RANGEMASTER_338                  = 21 --  Rangemaster .338
WEAPON_NUM_SNIPER_RANGEMASTER_762                  = 22 --  Rangemaster 7.62
WEAPON_NUM_SNIPER_RANGEMASTER_762_STBY             = 23 --  Rangemaster 7.62 STBY
WEAPON_NUM_SNIPER_PSG1_GOLD                        = 24
WEAPON_NUM_SNIPER_SSG69_IN_MODE                    = 25 -- 	저격전 모드 전용 기본 저격총
WEAPON_NUM_SNIPER_MAX                              = 26
-- end enum --


-- enum WEAPON_NUM_HANDGUN
WEAPON_NUM_HANDGUN_UNKNOWN                         = 0
WEAPON_NUM_HANDGUN_DESERTEAGLE                     = 1 -- 	Desert Eagle
WEAPON_NUM_HANDGUN_MK23_SILENCER                   = 2 -- 	MK23_Silencer		( Extension)
WEAPON_NUM_HANDGUN_K5                              = 3 -- 	K5
WEAPON_NUM_HANDGUN_MK23                            = 4 -- WEAPON_NUM_HANDGUN_MK23				= 4,	//	MK23	====================== 없어진 무기이므로 사용하지 마세요
WEAPON_NUM_HANDGUN_DESERTEAGLE_REF                 = 5 --  Desert Eagle S.
WEAPON_NUM_HANDGUN_P99                             = 6 --  ============ 쓰면 안됨. 더미용 CIC Dummy
WEAPON_NUM_HANDGUN_COLT_PYTHON                     = 7 -- 	C. Python
WEAPON_NUM_HANDGUN_DESERTEAGLE_GOLD                = 8 --  ============ 쓰면 안됨. 더미용 
WEAPON_NUM_HANDGUN_K5_DUAL_DUMMY                   = 9 --  Dual HandGun 더미용
WEAPON_NUM_HANDGUN_COLT_PYTHON_GOLD_EXP_PT_10      = 10 --  C. Python G + EXP & PT 10%
WEAPON_NUM_HANDGUN_GLOCK18                         = 11 --  Glock 18 (연발 권총)
WEAPON_NUM_HANDGUN_COLT_PYTHON_PERIOD              = 12
WEAPON_NUM_HANDGUN_TAURUS_454SS_2M                 = 13
WEAPON_NUM_HANDGUN_TAURUS_454SS_5M                 = 14
WEAPON_NUM_HANDGUN_TAURUS_454SS_8M                 = 15
WEAPON_NUM_HANDGUN_TAURUS_454SS_SCOPE              = 16
WEAPON_NUM_HANDGUN_MAX                             = 17
-- end enum --


-- enum WEAPON_NUM_SHOTGUN
WEAPON_NUM_SHOTGUN_UNKNOWN                         = 0
WEAPON_NUM_SHOTGUN_870MCS                          = 1 -- 	870MCS Remington
WEAPON_NUM_SHOTGUN_870MCS_EVENT                    = 2 --   강철중 샷건 ///기간제로 배포함....지우면 않됨.....
WEAPON_NUM_SHOTGUN_SPAS15                          = 3 -- 	SPAS-15
WEAPON_NUM_SHOTGUN_870MCS_W                        = 4 -- 	870MCS Remington W
WEAPON_NUM_SHOTGUN_M1887                           = 5 --   M1887
WEAPON_NUM_SHOTGUN_SPAS15_SILVER                   = 6
WEAPON_NUM_SHOTGUN_870MCS_IN_MODE                  = 7 -- 	샷건전 모드 전용 기본 샷건 (내구도 없음)
WEAPON_NUM_SHOTGUN_870MCS_SILVER                   = 8 -- 	870MCS Silver
WEAPON_NUM_SHOTGUN_SPAS15_SILVER_EXP_PT_20         = 9 --  경험치 & 포인트 20%
WEAPON_NUM_SHOTGUN_M1887_S                         = 10 --  M1887 Wooden
WEAPON_NUM_SHOTGUN_870MCS_W_D                      = 11 -- 	870MCS Remington W
WEAPON_NUM_SHOTGUN_SPAS15_D                        = 12
WEAPON_NUM_SHOTGUN_M26_LSS                         = 13 -- 	M4 CQB-R Lv3 에 장착된 LSS에서 사용합니다.
WEAPON_NUM_SHOTGUN_MAX                             = 14
-- end enum --


-- enum WEAPON_NUM_KNIFE
WEAPON_NUM_KNIFE_UNKNOWN                           = 0
WEAPON_NUM_KNIFE_M7                                = 1 -- 	M7 Knife
WEAPON_NUM_KNIFE_M9                                = 2 -- 	=========== 쓰면 안됨 더미용 M9 Knife
WEAPON_NUM_KNIFE_HAK                               = 3 --  ========== 쓰면 안됨 더미용 CIC Dummy
WEAPON_NUM_KNIFE_KUKRII                            = 4
WEAPON_NUM_KNIFE_KUKRII_EVENT                      = 5 -- WEAPON_NUM_KNIFE_KUKRII_EVENT	= 5,
WEAPON_NUM_KNIFE_MINIAXE_DUMMY                     = 6 --  ========== 쓰면 안됩니다 더미용 MiniAxe (실제 캐릭터가 손에 들고 던지는 무기)
WEAPON_NUM_KNIFE_MINIAXE                           = 7 --  캐릭터가 던지면 WEAPON_NUM_KNIFE_MINIAXE_DUMMY가 이것으로 변하므로 주의할 것. (순구씨한테 문의)
WEAPON_NUM_KNIFE_MINIAXE_EVENT                     = 8 --  이벤트
WEAPON_NUM_KNIFE_M7_GOLD                           = 9
WEAPON_NUM_KNIFE_HAK_SILVER                        = 10 --  ========== 쓰면 안됨 더미용 CIC Silver Dummy
WEAPON_NUM_KNIFE_KUKRII_D                          = 11
WEAPON_NUM_KNIFE_MINIAXE_D                         = 12
WEAPON_NUM_KNIFE_MINIAXE_DUMMY_D                   = 13 --  ========== 쓰면 안됩니다 더미용 MiniAxe
WEAPON_NUM_KNIFE_GH5007                            = 14 --  람보칼
WEAPON_NUM_KNIFE_MAX                               = 15
-- end enum --


-- enum WEAPON_NUM_THROWING
WEAPON_NUM_THROWING_UNKNOWN                        = 0
WEAPON_NUM_THROWING_K400                           = 1 -- 	Grenade
WEAPON_NUM_THROWING_SMOKE                          = 2 -- 	Smoke Grenade
WEAPON_NUM_THROWING_FLASHBANG                      = 3 -- 	Flash Bang
WEAPON_NUM_THROWING_C5                             = 4
WEAPON_NUM_THROWING_WP_SMOKE                       = 5
WEAPON_NUM_THROWING_WP_SMOKE_EVENT                 = 6 -- WEAPON_NUM_THROWING_WP_SMOKE_EVENT	= 6,		// Event
WEAPON_NUM_THROWING_C5_D                           = 7
WEAPON_NUM_THROWING_WP_SMOKE_D                     = 8
WEAPON_NUM_THROWING_K413_DUAL                      = 9
WEAPON_NUM_THROWING_MEDICAL_KIT                    = 10 -- 	WEAPON_NUM_THROWING_MEDICAL_KIT	= 9,
WEAPON_NUM_THROWING_MAX                            = 11
-- end enum --


-- enum C5_TYPE
C5_NORMAL                                          = 0
C5_D                                               = 1
NUM_C5_MAX                                         = 2
-- end enum --


-- enum WEAPON_NUM_ROCKET_LAUNCHER
WEAPON_NUM_ROCKET_LAUNCHER_UNKNOWN                 = 0
WEAPON_NUM_ROCKET_LAUNCHER_RPG7_OUTPOST            = 1
WEAPON_NUM_ROCKET_LAUNCHER_RPG7                    = 2
WEAPON_NUM_ROCKET_LAUNCHER_RPG7_BOSS               = 3
WEAPON_NUM_ROCKET_LAUNCHER_MAX                     = 4
-- end enum --


-- enum WEAPON_NUM_ON_OBJECT
WEAPON_NUM_ON_OBJECT_UNKNOWN                       = 0
WEAPON_NUM_ON_OBJECT_M197                          = 1
WEAPON_NUM_ON_OBJECT_MAX                           = 2
-- end enum --


-- enum WEAPON_NUM_ITEM
WEAPON_NUM_ITEM_UNKNOWN                            = 0
WEAPON_NUM_ITEM_MAX                                = 1
-- end enum --


-- enum WEAPON_NUM_MISSION
WEAPON_NUM_MISSION_UNKNOWN                         = 0
WEAPON_NUM_MISSION_C4                              = 1
WEAPON_NUM_MISSION_SHUTTLEX                        = 2
WEAPON_NUM_MISSION_MAX                             = 3
-- end enum --


-- enum WEAPON_NUM_MG
WEAPON_NUM_MG_UNKNOWN                              = 0
WEAPON_NUM_MG_MK46                                 = 1
WEAPON_NUM_MG_MK46_SILVER                          = 2
WEAPON_NUM_MG_MAX                                  = 3
-- end enum --


-- enum WEAPON_NUM_GRENADESHELL
WEAPON_NUM_GRENADESHELL_UNKNOWN                    = 0
WEAPON_NUM_GRENADESHELL_K201                       = 1
WEAPON_NUM_GRENADESHELL_K201_BOSS                  = 2
WEAPON_NUM_GRENADESHELL_RPG7                       = 3
WEAPON_NUM_GRENADESHELL_RPG7_FOR_DINO              = 4
WEAPON_NUM_GRENADESHELL_M4_SR16_LV3                = 5
WEAPON_NUM_GRENADESHELL_M4_SR16_FC                 = 6
WEAPON_NUM_GRENADESHELL_MAX                        = 7
-- end enum --


-- enum WEAPON_NUM_BOMBTRIGGER
WEAPON_NUM_BOMBTRIGGER_UNKNOWN                     = 0
WEAPON_NUM_BOMBTRIGGER_DEFAULT                     = 1
WEAPON_NUM_BOMBTRIGGER_MAX                         = 2
-- end enum --


-- enum WEAPON_NUM_CIC
WEAPON_NUM_CIC_UNKNOWN                             = 0
WEAPON_NUM_CIC_P99                                 = 1
WEAPON_NUM_CIC_P99_SILVER                          = 2
WEAPON_NUM_CIC_P99_D                               = 3
WEAPON_NUM_CIC_MAX                                 = 4
-- end enum --


-- enum WEAPON_NUM_DUALHANDGUN
WEAPON_NUM_DUALHANDGUN_UNKNOWN                     = 0
WEAPON_NUM_DUALHANDGUN_MK23_K5                     = 1
WEAPON_NUM_DUALHANDGUN_DESERTEAGLE                 = 2
WEAPON_NUM_DUALHANDGUN_DESERTEAGLE_EVENT           = 3 -- WEAPON_NUM_DUALHANDGUN_DESERTEAGLE_EVENT	= 3,		// 이벤트 무기 삭제
WEAPON_NUM_DUALHANDGUN_DESERTEAGLE_GOLD            = 4
WEAPON_NUM_DUALHANDGUN_MK23_K5_D                   = 5
WEAPON_NUM_DUALHANDGUN_DESERTEAGLE_D               = 6
WEAPON_NUM_DUALHANDGUN_MAX                         = 7
-- end enum --


-- enum WEAPON_NUM_DUALKNIFE
WEAPON_NUM_DUALKNIFE_UNKNOWN                       = 0
WEAPON_NUM_DUALKNIFE_M9                            = 1
WEAPON_NUM_DUALKNIFE_M9_D                          = 2
WEAPON_NUM_DUALKNIFE_MAX                           = 3
-- end enum --


-- enum WEAPON_NUM_DUALSMG
WEAPON_NUM_DUALSMG_UNKNOWN                         = 0
WEAPON_NUM_DUALSMG_KRISSSUPERV                     = 1
WEAPON_NUM_DUALSMG_KRISSSUPERV_GOLD                = 2
WEAPON_NUM_DUALSMG_KRISSSUPERV_D                   = 3
WEAPON_NUM_DUALSMG_UZI                             = 4
WEAPON_NUM_DUALSMG_UZI_MINI                        = 5
WEAPON_NUM_DUALSMG_UZI_MICRO                       = 6
WEAPON_NUM_DUALSMG_UZI_SILENCER                    = 7
WEAPON_NUM_DUALSMG_UZI_MINI_SILENCER               = 8
WEAPON_NUM_DUALSMG_UZI_MICRO_SILENCER              = 9
WEAPON_NUM_DUALSMG_MAX                             = 10
-- end enum --


-- enum WEAPON_NUM_DINO
WEAPON_NUM_DINO_UNKNOWN                            = 0
WEAPON_NUM_DINO_RAPTOR_BITE                        = 1
WEAPON_NUM_DINO_RAPTOR_SCRATCH                     = 2
WEAPON_NUM_DINO_TREX_BITE                          = 3
WEAPON_NUM_DINO_TREX_HOWL                          = 4
WEAPON_NUM_DINO_TREX_CRASH                         = 5
WEAPON_NUM_DINO_MAX                                = 6
-- end enum --

WEAPON_CLASS_NPC_ARROW                             =  		100

-- enum EQMIPEMENT_SLOT
EQMIPEMENT_SLOT_PRIM                               = 0
EQMIPEMENT_SLOT_SUB                                = 1
EQMIPEMENT_SLOT_MELEE                              = 2
EQMIPEMENT_SLOT_THROWING                           = 3
EQMIPEMENT_SLOT_ITEM                               = 4
EQMIPEMENT_SLOT_CHAR_RED                           = 5
EQMIPEMENT_SLOT_CHAR_BLUE                          = 6
EQMIPEMENT_SLOT_CHAR_HEAD                          = 7
EQMIPEMENT_SLOT_CHAR_ITEM                          = 8
-- end enum --


-- enum ITEM_CLASS_TYPE
ITEM_CLASS_UNKNOWN                                 = 0
ITEM_CLASS_ASSERT                                  = 1
ITEM_CLASS_SMG                                     = 2
ITEM_CLASS_SNIPER                                  = 3
ITEM_CLASS_SHOTGUN                                 = 4
ITEM_CLASS_MACHINE                                 = 5
ITEM_CLASS_HANDGUN                                 = 6
ITEM_CLASS_KNIFE                                   = 7
ITEM_CLASS_GRENADE                                 = 8
ITEM_CLASS_THROWING                                = 9
ITEM_CLASS_CHARA                                   = 10
ITEM_CLASS_HEAD                                    = 11
ITEM_CLASS_MAINTENANCE                             = 12
ITEM_CLASS_EXPENDABLE                              = 13
ITEM_CLASS_COUPON                                  = 14
ITEM_CLASS_POINT                                   = 15
ITEM_CLASS_TEMP                                    = 16
ITEM_CLASS_COUNT                                   = 17
-- end enum --


-- enum WEAPON_USAGE_TYPE
WEAPON_USAGE_UNKNOWN                               = 0
WEAPON_USAGE_ALL                                   = 1
WEAPON_USAGE_PRIMARY                               = 2 -- 	주무기
WEAPON_USAGE_SECONDARY                             = 3 -- 	보조무기
WEAPON_USAGE_MELEE                                 = 4 -- 	근접무기
WEAPON_USAGE_THROWING                              = 5 -- 	투척무기	
WEAPON_USAGE_ITEM                                  = 6 -- 	투척 아이템
WEAPON_USAGE_MISSION                               = 7 -- 	미션 아이템
WEAPON_USAGE_COUNT                                 = 8
-- end enum --


-- enum CASHITEM_USAGE_TYPE
CASHITEM_USAGE_UNKNOWN                             = 0
CASHITEM_USAGE_ALL                                 = 1
CASHITEM_USAGE_MAINTENANCE                         = 2 -- 	지속성 아이템
CASHITEM_USAGE_EXPENDABLES                         = 3 -- 	소모성 아이템
CASHITEM_USAGE_COUNT                               = 4
-- end enum --


-- enum HIT_CHARA_PART
HIT_CHARA_PART_NA                                  = 0
HIT_CHARA_PART_HEAD                                = 1
HIT_CHARA_PART_BODY                                = 2
HIT_CHARA_PART_ARM                                 = 3
HIT_CHARA_PART_LEG                                 = 4
HIT_CHARA_PART_WEAPON                              = 5
HIT_CHARA_PART_HELMET                              = 6
HIT_CHARA_PART_NECK                                = 7
HIT_CHARA_PART_VITAL                               = 8
HIT_CHARA_PART_COUNT                               = 9
-- end enum --


-- enum ACTION_ID
ACTION_ID_NA                                       = 0 --  정의되지 않음.
ACTION_ID_C4_PLANT                                 = 1 --  C4 설치하기
ACTION_ID_C4_DEFUSE                                = 2 --  C4 해체하기
ACTION_ID_HIT_HEAD_20                              = 3 --  머리 명중률 20% 이상
ACTION_ID_HIT_HEAD_30                              = 4 --  머리 명중률 30% 이상
ACTION_ID_HIT_CHEST_20                             = 5 --  가슴 명중률 20% 이상
ACTION_ID_HIT_CHEST_30                             = 6 --  가슴 명중률 30% 이상
ACTION_ID_HIT_ARM_20                               = 7 --  팔 명중률 20% 이상
ACTION_ID_HIT_ARM_30                               = 8 --  팔 명중률 30% 이상
ACTION_ID_HIT_LEG_20                               = 9 --  다리 명중률 20% 이상
ACTION_ID_HIT_LEG_30                               = 10 --  다리 명중률 30% 이상
ACTION_ID_STAGE_ENTER                              = 11 --  입장
ACTION_ID_STAGE_INTERCEPT                          = 12 --  난입
ACTION_ID_WIN                                      = 13 --  승리
ACTION_ID_DEFEAT                                   = 14 --  패배
ACTION_ID_KILL                                     = 15 --  Kill
ACTION_ID_DEATH                                    = 16 --  Death
ACTION_ID_SUICIDE                                  = 17 --  자살
ACTION_ID_ENFORCE_EXIT                             = 18 --  강제퇴장
ACTION_ID_RANK_1                                   = 19 --  최종 결과 순위 1
ACTION_ID_RANK_2                                   = 20 --  최종 결과 순위 2
ACTION_ID_RANK_3                                   = 21 --  최종 결과 순위 3
ACTION_ID_RANK_4                                   = 22 --  최종 결과 순위 4
ACTION_ID_RANK_5                                   = 23 --  최종 결과 순위 5
ACTION_ID_RANK_6                                   = 24 --  최종 결과 순위 6
ACTION_ID_RANK_7                                   = 25 --  최종 결과 순위 7
ACTION_ID_RANK_8                                   = 26 --  최종 결과 순위 8
ACTION_ID_HEADSHOT                                 = 27 --  Head shot 달성
ACTION_ID_DOUBLE_KILL                              = 28 --  Double Kill 달성
ACTION_ID_PIERCING                                 = 29 --  Piercing Kill 달성
ACTION_ID_TRIPLE_KILL                              = 30 --  Triple Kill 달성
ACTION_ID_MASS_KILL                                = 31 --  Mass Kill
ACTION_ID_HIT_RATE_40                              = 32 --  명중률 40%
ACTION_ID_HIT_RATE_50                              = 33 --  명중률 50%
ACTION_ID_HIT_RATE_60                              = 34 --  명중률 60%
ACTION_ID_KILL_RATE_40                             = 35 --  킬 비율 40%
ACTION_ID_KILL_RATE_50                             = 36 --  킬 비율 50%
ACTION_ID_KILL_RATE_60                             = 37 --  킬 비율 60%
ACTION_ID_HELMET_PROTECTION                        = 38 --  헬맷 방어
ACTION_ID_DESTROY                                  = 39 --  목표물 파괴
ACTION_ID_KILL_WEAPONCLASS                         = 40 --  특정클래스 무기 사용중인 유저 킬
ACTION_ID_DOUBLE_KILL_WEAPONCLASS                  = 41 --  특정클래스 무기 사용중인 유저 더블킬
ACTION_ID_TRIPLE_KILL_WEAPONCLASS                  = 42 --  특정클래스 무기 사용중인 유저 트리플킬
ACTION_ID_USE_WEAPON                               = 43 --  특정 무기 사용
ACTION_ID_CHAINKILLER                              = 44 --  체인킬
ACTION_ID_CHAINSLUGGER                             = 45 --  체인 슬러거
ACTION_ID_CHAINSTOPPER                             = 46 --  체인 스타퍼
ACTION_ID_CHAINHEADSHOT                            = 47 --  체인 헤드샷
ACTION_ID_PROTECT                                  = 48 --  오브젝트 보호
ACTION_ID_COUNT                                    = 49
-- end enum --

CHARACTER_TEAM_NONE                                =  		0x00
CHARACTER_TEAM_RED                                 =  		0x01
CHARACTER_TEAM_BLUE                                =  		0x02
NPC_TEAM_RED                                       =  			0x04
NPC_TEAM_BLUE                                      =  			0x08
CHARACTER_TEAM_RB                                  =  		(CHARACTER_TEAM_RED | CHARACTER_TEAM_BLUE)

-- enum CHARACTER_CLASS_TYPE
CHARACTER_CLASS_UNKNOWN                            = 0
CHARACTER_CLASS_ALL                                = 1
CHARACTER_CLASS_CHARA_TYPE                         = 2 -- 	캐릭터
CHARACTER_CLASS_HEAD                               = 3 -- 	헬멧
CHARACTER_CLASS_ITEM                               = 4 -- 	호칭 베레모
CHARACTER_CLASS_MASK                               = 5
CHARACTER_CLASS_EVENT                              = 6 -- 	이벤트 장비들
CHARACTER_CLASS_COUNT                              = 7
-- end enum --


-- enum CHARACTER_RES_ID
CHARACTER_RES_ID_UNKNOWN                           = 0
CHARACTER_RES_ID_MALEDEFAULT                       = 1 -- CHARACTER_RES_ID_MALEDEFAULT		= 1,	//남자 1셋
CHARACTER_RES_ID_FEMALEDEFAULT                     = 2 -- CHARACTER_RES_ID_FEMALEDEFAULT	= 2,	//여자 1셋
CHARACTER_RES_ID_FEMALE_RED                        = 3 --  Tarantula
CHARACTER_RES_ID_FEMALE_BLUE                       = 4 --  Keen Eyes
CHARACTER_RES_ID_MALE_RED                          = 5 --  Redbulls
CHARACTER_RES_ID_MALE_BLUE                         = 6 --  Acid Pol
CHARACTER_RES_ID_D_FOX                             = 7
CHARACTER_RES_ID_LEOPARD                           = 8
CHARACTER_RES_ID_FEMALE_HIDE                       = 9
CHARACTER_RES_ID_FEMALE_VIPERRED                   = 10
CHARACTER_RES_ID_REINFORCED_D_FOX                  = 11
CHARACTER_RES_ID_REINFORCED_LEOPARD                = 12
CHARACTER_RES_ID_REINFORCED_VIPERRED               = 13
CHARACTER_RES_ID_REINFORCED_HIDE                   = 14
CHARACTER_RES_ID_REINFORCED_COMBO_D_FOX            = 15
CHARACTER_RES_ID_REINFORCED_COMBO_LEOPARD          = 16
CHARACTER_RES_ID_REINFORCED_COMBO_VIPERRED         = 17
CHARACTER_RES_ID_REINFORCED_COMBO_HIDE             = 18
CHARACTER_RES_ID_REINFORCED_ACID_POL               = 19
CHARACTER_RES_ID_REINFORCED_KEEN_EYES              = 20
CHARACTER_RES_ID_REINFORCED_REDBULLS               = 21
CHARACTER_RES_ID_REINFORCED_TARANTULA              = 22
CHARACTER_RES_ID_DINO_TRex                         = 23
CHARACTER_RES_ID_DINO_Raptor                       = 24
MAX_CHARACTER_RES_ID                               = 25
-- end enum --


-- enum HEAD_RES_ID
HEAD_RES_ID_UNKNOWN                                = 0
HEAD_RES_ID_DEFAULT                                = 1 -- 	기본
HEAD_RES_ID_NORMAL                                 = 2 -- 	일반	
HEAD_RES_ID_REINFORCE                              = 3 -- 	강화
HEAD_RES_ID_HEAT                                   = 4
HEAD_RES_ID_RADAR                                  = 5
HEAD_RES_ID_TARGET                                 = 6
HEAD_RES_ID_STRENGTHENPLUS                         = 7
HEAD_RES_ID_SUPER                                  = 8
MAX_HEAD_RES_ID                                    = 9
HEAD_RES_ID_REINFORCE_EVENT                        = 10 -- HEAD_RES_ID_REINFORCE_EVENT = 7,	//  강화 헬멧 이벤트
-- end enum --


-- enum ITEM_RES_ID
ITEM_RES_ID_UNKNOWN                                = 0
ITEM_RES_ID_BERET_ASSAULT                          = 1 --  광폭한 맹수 베레모
ITEM_RES_ID_BERET_SMG                              = 2 --  교활한 침입자 베레모
ITEM_RES_ID_BERET_RIFLE                            = 3 --  은밀한 암살자 베레모
ITEM_RES_ID_BERET_SHOTGUN                          = 4 --  난폭한 파괴자 베레모
ITEM_RES_ID_BERET_HANDGUN                          = 5 --  예리한 명사수 베레모	
ITEM_RES_ID_BERET_BLACK                            = 6 --  블랙 베레모 / 이벤트용
ITEM_RES_ID_BERET_COUNT                            = 7
-- end enum --


-- enum MASK_ID
MASK_ID_UNKNOWN                                    = 0
MASK_ID_WHITE                                      = 1
MASK_ID_BLACK                                      = 2
MASK_ID_RUSSIAN_BLUE                               = 3
MASK_ID_ROK_MARINE                                 = 4
MASK_ID_FRENCH_DESERT                              = 5
MASK_ID_FLAME                                      = 6
MASK_ID_TWO_TONE_BR                                = 7
MASK_ID_IRON                                       = 8
MASK_ID_TARGET_MARK                                = 9
MASK_ID_PUMPKIN                                    = 10
MASK_ID_JEWEL_PINK                                 = 11
MASK_ID_SMILE_GOLD                                 = 12
MASK_ID_SKULL                                      = 13
MASK_ID_PIERROT                                    = 14
MASK_ID_ALIEN_BLUE_EYES                            = 15
MASK_ID_ALIEN_RED_EYES                             = 16
MASK_ID_CROSS_RED                                  = 17
MASK_ID_JASON                                      = 18
MASK_ID_PANDA                                      = 19
MASK_ID_EGG                                        = 20
MASK_ID_DEATH                                      = 21
MASK_ID_WORLDCUP_ARGENTINA                         = 22
MASK_ID_WORLDCUP_BRAZIL                            = 23
MASK_ID_WORLDCUP_ENGLAND                           = 24
MASK_ID_WORLDCUP_FRANCE                            = 25
MASK_ID_WORLDCUP_GERMANY                           = 26
MASK_ID_WORLDCUP_ITALIA                            = 27
MASK_ID_WORLDCUP_JAPAN                             = 28
MASK_ID_WORLDCUP_S_AFRICA                          = 29
MASK_ID_WORLDCUP_S_KOREA                           = 30
MASK_ID_WORLDCUP_SPAIN                             = 31
MASK_ID_TIGER                                      = 32
MASK_ID_JESTER_BW                                  = 33
MASK_ID_WRESTLING                                  = 34
MAX_MASK_ID                                        = 35
-- end enum --


-- enum EVENT_EQUIP_ID
EVENT_EQUIP_UNKNOWN                                = 0
EVENT_EQUIP_SANTA_HAT                              = 1
EVENT_EQUIP_CHINESE_HAT                            = 2
EVENT_EQUIP_HAIRBAND                               = 3
MAX_EVENT_EQUIP_ID                                 = 4
-- end enum --

MAX_USER_TITLE                                     =  					256
MAX_EQUIP_USER_TITLE                               =  			3
MAX_DEFAULT_USER_TITLE_COUNT                       =  	44	 --  기본 호칭 갯수

-- enum USER_TITLE_CATEGORY
UTC_NOTHING                                        = 0
UTC_ALL                                            = 1
UTC_ASSAULT                                        = 2
UTC_RIFLE                                          = 3
UTC_SMG                                            = 4
UTC_KNIFE                                          = 5
UTC_HANDGUN                                        = 6
UTC_SHOTGUN                                        = 7
UTC_COMPOSITION                                    = 8
-- end enum --


-- enum USER_TITLE_RIBBON_TYPE
UTR_NOTHING                                        = 0
UTR_RIBBON                                         = 1
UTR_ENSIGN                                         = 2
UTR_MEDAL                                          = 3
UTR_MASTER                                         = 4
-- end enum --

USER_TITLE_REQUIREMENT_COUNT                       = 			3
USER_TITLE_PRIORITY_COUNT                          =  			2
RAPTOR_TOTAL_CNT                                   =  	9
DINO_TOTAL_CNT                                     =  		(RAPTOR_TOTAL_CNT + 1)
UNION_TOTAL_CNT                                    =  		(SLOT_MAX_COUNT - DINO_TOTAL_CNT)
--SET_ROOM_INFO ( ent, bal )	                                      = 	( ((ent&0x00000001) << 7 ) | ((bal&0x00000001) << 5 ))
ROOM_INFO_FLAG_INTER_ENTER                         =  			0x80
ROOM_INFO_FLAG_OBSERVER                            =  				0x40
ROOM_INFO_FLAG_TEAM_BALANCE                        =  			0x20
ROOM_INFO_FLAG_REAL_IP                             =  				0x10
ROOM_INFO_FLAG_OBSERVER_MODE                       =  		0x08
--[[GET_ROOM_INFO_INTERENTER( state )                           =  		((state>>7) & 0x00000001)
GET_ROOM_INFO_OBSERVER( state )                             =  ((state>>6) & 0x00000001)
GET_ROOM_INFO_TEAMBALANCE( state )                          = ((state>>5) & 0x00000001)
GET_ROOM_INFO_REAL_IP( state )                             = ((state>>4) & 0x00000001)
GET_ROOM_INFO_OBSERVER_MODE( state )                       =  ((state>>3) & 0x00000001)
GET_ROOM_INFO_WEAPON_SHOTGUN( state )                      =  ((state>>6)	& 0x00000001)
GET_ROOM_INFO_WEAPON_SNIPER( state )                      =  ((state>>5)	& 0x00000001)
GET_ROOM_INFO_WEAPON_RPG7( state )                         =  ((state>>4)	& 0x00000001)
GET_ROOM_INFO_WEAPON_00( state )                            =  ((state>>3) & 0x00000001)
GET_ROOM_INFO_WEAPON_01( state )                            =  ((state>>2) & 0x00000001)
GET_ROOM_INFO_WEAPON_02( state )                           =  ((state>>1) & 0x00000001)
GET_ROOM_INFO_WEAPON_03( state )                           =  ((state   ) & 0x00000001)
--]]
RELAY_ENCRYPTKEY_DEFAULT                         =  		0xFFFFFFFF
INVALID_WAREDB_INDEX                               = 					0xFFFFFFFF
ITEM_ATTR_TYPE_BUY                                 =  			1			 -- 구입만한 아이템(기간제)
ITEM_ATTR_TYPE_AUTH                                =  			2			 -- 인증한 아이템
ITEM_ATTR_TYPE_BASIC                               =  		3			 -- 기본 지급 아이템
ITEM_ATTR_TYPE_PC_1                                =  			4			 -- PC방 아이템 1
ITEM_ATTR_TYPE_PC_2                                =  			5			 -- PC방 아이템 2
ITEM_ATTR_TYPE_SPECIAL                             =  		6			 -- 특별 이벤트

-- enum NAT_STATE
NAT_STATE_WITHOUT                                  = 0
NAT_STATE_FULL_CONE_NAT                            = 1
NAT_STATE_RESTRICTED_CONE_NAT                      = 2
NAT_STATE_PORT_RESTRICTED_CONE_NAT                 = 3
NAT_STATE_SYMMETRIC_NAT                            = 4
-- end enum --


-- enum SERVER_UDP_STATE
SERVER_UDP_STATE_NONE                              = 0
SERVER_UDP_STATE_RENDEZVOUS                        = 1
SERVER_UDP_STATE_CLIENT                            = 2
SERVER_UDP_STATE_RELAY                             = 3
SERVER_UDP_STATE_RELAYCLIENT                       = 4
-- end enum --

SLOT_ITEM_QUICK_CHANGE_WEAPON                      =  			0x8000
SLOT_ITEM_QUICK_CHANGE_MAGAZINE                    =  			0x4000
SLOT_ITEM_MEGA_HP10                                =  						0x2000
SLOT_ITEM_INCREASE_INVINCIBLE_TIME                 =  		0x1000
SLOT_ITEM_BULLET_PROOF_VEST                        =  				0x800
SLOT_ITEM_FULLMETALJACKETAMMO                      =  			0x400
SLOT_ITEM_HOLLOW_POINT_AMMO                        =  				0x200
SLOT_ITEM_C4_SPEED_KIT                             =  					0x100
SLOT_ITEM_INCREASE_GRENADE_SLOT                    =  			0x80
SLOT_ITEM_JACKETED_HELLOW_POINT_AMMO               =  	0x40
SLOT_ITEM_MEGA_HP5                                 =  						0x20
SLOT_ITEM_BULLET_PROOF_VEST_PLUS                   =  		0x10
SLOT_ITEM_HOLLOW_POINT_AMMO_PLUS                   =  		0x08
SLOT_ITEM_BULLET_PROOF_VEST_METAL                  =  		0x04
SLOT_ITEM_KETUPAT                                  =  								0x02		 --  르바란 이벤트 관련 ( 2010.09.07 ~ 2010.09.14 이벤트 기간 종료 후 삭제 )

-- enum DEATH_INFO_BIT_FLAG
DEATH_INFO_BIT_FLAG_INDEX                          = 0
DEATH_INFO_BIT_FLAG_DEATH_TYPE                     = 1
DEATH_INFO_BIT_FLAG_MESSAGE                        = 2
DEATH_INFO_BIT_FLAG_DEFENCE_SYSTEM                 = 3
-- end enum --
--[[
MAKE_FRIEND_STATE                                  =  (state,server,channel,room)	((((state) & 0x0000000F) << 28) | (((server) & 0x000000FF) << 20) | (((channel) & 0x000000FF) << 12) | ((room) & 0x00000FFF))
MAKE_FRIEND_MATCH_STATE                            =  (match,state,server,channel,room)	(((UINT64)(match) & 0x00000000FF) << 32) | ((((state) & 0x000000000F) << 28) | (((server) & 0x00000000FF) << 20) | (((channel) & 0x00000000FF) << 12) | ((room) & 0x0000000FFF))
GET_FRIEND_MATCH                                   =  (state)							(((state) >> 32) & 0x00000000000000FF)
GET_FRIEND_STATE                                   =  (state)							(((state) >> 28) & 0x0000000F)
GET_FRIEND_SERVER                                  =  (state)						(((state) >> 20) & 0x000000FF)
GET_FRIEND_CHANNEL                                 =  (state)						(((state) >> 12) & 0x000000FF)
GET_FRIEND_ROOMIDX                                 =  (state)						((state) & 0x00000FFF)
SET_FRIEND_MATCH                                   =  (state, match)					(state | (((UINT64)match & 0x00000000000000FF ) << 32))
CLEAR_FRIEND_MATCH                                 =  (state)						(state & 0xFFFFFF00FFFFFFFF)
--]]
-- enum FRIEND_STATE
FRIEND_STATE_REQUEST                               = 0
FRIEND_STATE_HOLD                                  = 1
FRIEND_STATE_OFFLINE                               = 2 -- 이하단은 친구 
FRIEND_STATE_ONLINE                                = 3
FRIEND_STATE_ROOM                                  = 4
FRIEND_STATE_MAX                                   = 5
-- end enum --


-- enum FRIEND_CHANGE_STATE
FRIEND_CHANGE_STATE_INSERT                         = 0
FRIEND_CHANGE_STATE_ACCEPT                         = 1
FRIEND_CHANGE_STATE_DELETE                         = 2
FRIEND_CHANGE_STATE_CHANGE                         = 3
-- end enum --
--[[
GET_ITEM_FLAG_CLASS                                =  (Itemflag)					(Itemflag / 100000000)
GET_ITEM_FLAG_USAGE                                =  (Itemflag)					((Itemflag % 100000000) / 1000000)
GET_ITEM_FLAG_TYPE                                 =  (Itemflag)					((Itemflag % 1000000) / 1000)
GET_ITEM_FLAG_NUMBER                               =  (Itemflag)					(Itemflag % 1000)
MAKE_ITEM_FLAG                                     =  (class,usage,classtype,number)	((class*100000000)+(usage*1000000)+(classtype*1000)+(number))
DEFAULT_WEAPON_ASSAULT                             =  							MAKE_ITEM_FLAG(ITEM_CLASS_ASSERT, WEAPON_USAGE_PRIMARY, WEAPON_CLASS_ASSAULT, WEAPON_NUM_ASSAULT_K2)
DEFAULT_WEAPON_SNIPER                              =  							MAKE_ITEM_FLAG(ITEM_CLASS_SNIPER, WEAPON_USAGE_PRIMARY, WEAPON_CLASS_SNIPER, WEAPON_NUM_SNIPER_SSG69)
DEFAULT_WEAPON_SMG                                 =  								MAKE_ITEM_FLAG(ITEM_CLASS_SMG, WEAPON_USAGE_PRIMARY, WEAPON_CLASS_SMG, WEAPON_NUM_SMG_MP5K_SILENCER)					
DEFAULT_WEAPON_SHOTGUN                             =  							MAKE_ITEM_FLAG(ITEM_CLASS_SHOTGUN, WEAPON_USAGE_PRIMARY, WEAPON_CLASS_SHOTGUN, WEAPON_NUM_SHOTGUN_870MCS)
DEFAULT_WEAPON_HANDGUN                             =  							MAKE_ITEM_FLAG(ITEM_CLASS_HANDGUN, WEAPON_USAGE_SECONDARY, WEAPON_CLASS_HANDGUN, WEAPON_NUM_HANDGUN_K5)
DEFAULT_WEAPON_KNIFE                               =  							MAKE_ITEM_FLAG(ITEM_CLASS_KNIFE, WEAPON_USAGE_MELEE, WEAPON_CLASS_KNIFE, WEAPON_NUM_KNIFE_M7)						
DEFAULT_WEAPON_THROWING                            =  							MAKE_ITEM_FLAG(ITEM_CLASS_THROWING, WEAPON_USAGE_THROWING, WEAPON_CLASS_THROWING, WEAPON_NUM_THROWING_K400)
DEFAULT_WEAPON_ITEM                                =  								MAKE_ITEM_FLAG(ITEM_CLASS_THROWING, WEAPON_USAGE_ITEM, WEAPON_CLASS_THROWING, WEAPON_NUM_THROWING_SMOKE)						
--]]
-- enum CASHITEM_GROUP_TYPE
CASHITEM_GROUP_UNKNOWN                             = 0
CASHITEM_GROUP_XP_PLUS_110                         = 1
CASHITEM_GROUP_XP_PLUS_130                         = 2
CASHITEM_GROUP_XP_PLUS_150                         = 3
CASHITEM_GROUP_PT_PLUS_130                         = 4
CASHITEM_GROUP_COLOR_CLAN                          = 5
CASHITEM_GROUP_COLOR_NICK                          = 6
CASHITEM_GROUP_SHORT_RESPAWN                       = 7
CASHITEM_GROUP_AMMO_UP                             = 8
CASHITEM_GROUP_DISGUISE_RANK                       = 9
CASHITEM_GROUP_DISGUISE_NICK                       = 10
CASHITEM_GROUP_FREE_MOVE                           = 11
CASHITEM_GROUP_CLAN_XP_PLUS_150                    = 12
CASHITEM_GROUP_CUSTOM_CROSSHAIR                    = 13
CASHITEM_GROUP_COLOR_CROSSHAIR                     = 14
CASHITEM_GROUP_COLOR_CHATTING                      = 15
CASHITEM_GROUP_BATTLEFIELD_MOVE                    = 16
CASHITEM_GROUP_GET_DROPPED_WEAPON                  = 17
CASHITEM_GROUP_XP_PLUS_X2_12PM                     = 18
CASHITEM_GROUP_XP_PLUS_X2_3PM                      = 19
CASHITEM_GROUP_XP_PLUS_X2_6PM                      = 20
CASHITEM_GROUP_XP_PLUS_X2_9PM                      = 21
CASHITEM_GROUP_PT_PLUS_X2_12PM                     = 22
CASHITEM_GROUP_PT_PLUS_X2_3PM                      = 23
CASHITEM_GROUP_PT_PLUS_X2_6PM                      = 24
CASHITEM_GROUP_PT_PLUS_X2_9PM                      = 25
CASHITEM_GROUP_QUICK_CHANGE_WEAPON                 = 26
CASHITEM_GROUP_QUICK_CHANGE_MAGAZINE               = 27
CASHITEM_GROUP_MEGA_HP10                           = 28
CASHITEM_GROUP_INCREASE_INVINCIBLE_TIME            = 29
CASHITEM_GROUP_BULLET_PROOF_VEST                   = 30
CASHITEM_GROUP_FULLMETALJACKETAMMO                 = 31
CASHITEM_GROUP_HOLLOW_POINT_AMMO                   = 32
CASHITEM_GROUP_ANTI_FLASHBANG_MASK                 = 33
CASHITEM_GROUP_C4_SPEED_KIT                        = 34
CASHITEM_GROUP_INCREASE_GRENADE_SLOT               = 35
CASHITEM_GROUP_JACKETED_HELLOW_POINT_AMMO          = 36
CASHITEM_GROUP_XP_PLUS_200                         = 37
CASHITEM_GROUP_PT_PLUS_200                         = 38
CASHITEM_GROUP_GIGA_BOMB                           = 39
CASHITEM_GROUP_MEGA_HP5                            = 40
CASHITEM_GROUP_DEFCON_1                            = 41
CASHITEM_GROUP_DEFCON_2                            = 42
CASHITEM_GROUP_DEFCON_3                            = 43
CASHITEM_GROUP_BULLET_PROOF_VEST_PLUS              = 44
CASHITEM_GROUP_WEAPON_CRATE_2                      = 45
CASHITEM_GROUP_MINIBOMB                            = 46
CASHITEM_GROUP_CHANGE_NICK                         = 47
CASHITEM_GROUP_CLR_HISTORY                         = 48
CASHITEM_GROUP_CLR_SCORE                           = 49
CASHITEM_GROUP_CLR_ESCAPE                          = 50
CASHITEM_GROUP_CHANGE_CLAN_NAME                    = 51
CASHITEM_GROUP_CHANGE_CLAN_MARK                    = 52
CASHITEM_GROUP_CLR_CLAN_HISTORY                    = 53
CASHITEM_GROUP_RECORDING_GAME                      = 54
CASHITEM_GROUP_CLAN_PERSON_PLUS_50                 = 55
CASHITEM_GROUP_CLAN_POINT_RESET                    = 56
CASHITEM_GROUP_CUSTOM_CROSSHAIR_MAKE               = 57
CASHITEM_GROUP_MEGA_BOMB                           = 58
CASHITEM_GROUP_WEAPON_CRATE                        = 59
CASHITEM_GROUP_SURVIVAL_KIT                        = 60
CASHITEM_GROUP_MEGABOMB_INDO                       = 61
CASHITEM_GROUP_XP_PLUS_200_0AM_6AM                 = 62
CASHITEM_GROUP_XP_PLUS_200_6AM_12PM                = 63
CASHITEM_GROUP_SHORT_RESPAWN_50                    = 64
CASHITEM_GROUP_BULLET_PROOF_VEST_GM                = 65
CASHITEM_GROUP_POINT_GACHAPON_2500                 = 66
CASHITEM_GROUP_POINT_GACHAPON_6000                 = 67
CASHITEM_GROUP_GIGA_BOX                            = 68
CASHITEM_GROUP_SWAT_KIT_ASSULT_7DAY                = 69
CASHITEM_GROUP_SWAT_KIT_ASSULT_30DAY               = 70
CASHITEM_GROUP_SWAT_KIT_SUPPORT_7DAY               = 71
CASHITEM_GROUP_SWAT_KIT_SUPPORT_30DAY              = 72
CASHITEM_GROUP_SWAT_KIT_INFILTRATION_7DAY          = 73
CASHITEM_GROUP_SWAT_KIT_INFILTRATION_30DAY         = 74
CASHITEM_GROUP_SWAT_KIT_COMBO_7DAY                 = 75
CASHITEM_GROUP_SWAT_KIT_COMBO_30DAY                = 76
CASHITEM_GROUP_SHORT_RESPAWN_20                    = 77
CASHITEM_GROUP_HOLLOW_POINT_AMMO_PLUS              = 78
CASHITEM_GROUP_BULLET_PROOF_VEST_METAL             = 79
CASHITEM_GROUP_SHORT_RESPAWN_100                   = 80
CASHITEM_GROUP_MEGABOMB_RUSSIA                     = 81
CASHITEM_GROUP_MASK_ITEM_BOX_1                     = 82
CASHITEM_GROUP_MASK_ITEM_BOX_2                     = 83
CASHITEM_GROUP_ANGPAO                              = 84
CASHITEM_GROUP_VIEW_OTHER_USER_ITEM_INFO           = 85
CASHITEM_GROUP_NEW_M4_SUPPLY_KIT                   = 86
CASHITEM_GROUP_GIFT_BOX                            = 87
CASHITEM_GROUP_RANGEMASTER_SUPPLY_KIT_1D           = 88
CASHITEM_GROUP_RAGINGBULL_454_SUPPLY_KIT           = 89
CASHITEM_GROUP_DUAL_UZI_SUPPLY_KIT                 = 90
CASHITEM_GROUP_KETUPAT                             = 91
CASHITEM_GROUP_RANDOM_MASK_BOX                     = 92
CASHITEM_GROUP_RANGEMASTER_SUPPLY_KIT_3D           = 93
CASHITEM_GROUP_RANGEMASTER_SUPPLY_KIT_7D           = 94
CASHITEM_GROUP_SPEEDUP_BOOTS                       = 95 -- CASHITEM_GROUP_SPEEDUP_BOOTS				= xx,	// 속도 향상 신발 (미적용)
CASHITEM_GROUP_SLIENT_FOOTSTEPS                    = 96 -- CASHITEM_GROUP_SLIENT_FOOTSTEPS			= xx,	// 발소리 줄이는 신발 (미적용)
CASHITEM_GROUP_MAX                                 = 97
-- end enum --

CASHITEM_DAY_1                                     = 				1
CASHITEM_DAY_3                                     = 				3
CASHITEM_DAY_7                                     = 				7
CASHITEM_DAY_10                                    = 				10
CASHITEM_DAY_30                                    = 				30
CASHITEM_DAY_90                                    = 				90
CASHITEM_DAY_NO                                    = 				0

-- enum AUTH_TYPE
AUTH_UNKNWON                                       = 0
AUTH_COUNT                                         = 1 --  개수제 인증
AUTH_SEC                                           = 2 --  기간제 인증
-- end enum --
--[[
BOUNDCHK                                           =  ( a, b)				I3ASSERT( ((a) >= 0) && ((a) < (b)))
CLAN_MENAGE_AUTHORITY                              =  (wr,in,de,ac)	((wr & 0x0000000F) << 3) | ((in & 0x0000000F) << 2) | ((de & 0x0000000F) << 1) | ((ac & 0x0000000F))
GET_CLAN_MENAGE_WRITE                              =  (state)		((state>>3) & 0x00000001)
GET_CLAN_MENAGE_INVITED                            =  (state)		((state>>2) & 0x00000001)
GET_CLAN_MENAGE_DEPORTATION                        =  (state)	((state>>1) & 0x00000001)
GET_CLAN_MENAGE_ACCEPT                             =  (state)		((state)	& 0x00000001)
--]]
-- enum CLAN_MENAGE_AUTHORITY_TYPE
CLAN_MENAGE_TYPE_WRITE                             = 0
CLAN_MENAGE_TYPE_INVITED                           = 1
CLAN_MENAGE_TYPE_DEPORTATION                       = 2
CLAN_MENAGE_TYPE_ACCEPT                            = 3
CLAN_MENAGE_TYPE_MAX                               = 4
-- end enum --


-- enum CLAN_MEMBER_LEVEL_TYPE
CLAN_MEMBER_LEVEL_UNKNOWN                          = 0
CLAN_MEMBER_LEVEL_MASTER                           = 1 --  클랜 마스터
CLAN_MEMBER_LEVEL_STAFF                            = 2 --  클랜 스탭
CLAN_MEMBER_LEVEL_REGULAR                          = 3 --  클랜 일반회원
CLAN_MEMBER_LEVEL_MAX                              = 4
-- end enum --


-- enum CLAN_RANK
CLAN_RANK_UNKNOWN                                  = 0
CLAN_RANK_NEW                                      = 1 -- 	신생
CLAN_RANK_A1                                       = 2 -- 	훈련 1단계
CLAN_RANK_A2                                       = 3 -- 	훈련 2단계
CLAN_RANK_B1                                       = 4 -- 	견습 1단계
CLAN_RANK_B2                                       = 5 -- 	견습 2단계
CLAN_RANK_C1                                       = 6 -- 	지원 1단계
CLAN_RANK_C2                                       = 7 -- 	지원 2단계
CLAN_RANK_C3                                       = 8 -- 	지원 3단계
CLAN_RANK_D1                                       = 9 -- 	우수 1단계
CLAN_RANK_D2                                       = 10 -- 	우수 2단계
CLAN_RANK_D3                                       = 11 -- 	우수 3단계
CLAN_RANK_D4                                       = 12 -- 	우수 4단계
CLAN_RANK_E1                                       = 13 -- 	전투 1단계
CLAN_RANK_E2                                       = 14 -- 	전투 2단계
CLAN_RANK_E3                                       = 15 -- 	전투 3단계
CLAN_RANK_E4                                       = 16 -- 	전투 4단계
CLAN_RANK_F1                                       = 17 -- 	선봉 1단계
CLAN_RANK_F2                                       = 18 -- 	선봉 2단계
CLAN_RANK_F3                                       = 19 -- 	선봉 3단계
CLAN_RANK_F4                                       = 20 -- 	선봉 4단계
CLAN_RANK_F5                                       = 21 -- 	선봉 5단계
CLAN_RANK_G1                                       = 22 -- 	기동 1단계
CLAN_RANK_G2                                       = 23 -- 	기동 2단계
CLAN_RANK_G3                                       = 24 -- 	기동 3단계
CLAN_RANK_G4                                       = 25 -- 	기동 4단계
CLAN_RANK_G5                                       = 26 -- 	기동 5단계
CLAN_RANK_H1                                       = 27 -- 	수색 1단계
CLAN_RANK_H2                                       = 28 -- 	수색 2단계
CLAN_RANK_H3                                       = 29 -- 	수색 3단계
CLAN_RANK_H4                                       = 30 -- 	수색 4단계
CLAN_RANK_H5                                       = 31 -- 	수색 5단계
CLAN_RANK_I1                                       = 32 -- 	특전 1단계
CLAN_RANK_I2                                       = 33 -- 	특전 2단계
CLAN_RANK_I3                                       = 34 -- 	특전 3단계
CLAN_RANK_I4                                       = 35 -- 	특전 4단계
CLAN_RANK_I5                                       = 36 -- 	특전 5단계
CLAN_RANK_J1                                       = 37 -- 	특공 1단계
CLAN_RANK_J2                                       = 38 -- 	특공 2단계
CLAN_RANK_J3                                       = 39 -- 	특공 3단계
CLAN_RANK_J4                                       = 40 -- 	특공 4단계
CLAN_RANK_J5                                       = 41 -- 	특공 5단계
CLAN_RANK_K1                                       = 42 -- 	특수 1단계
CLAN_RANK_K2                                       = 43 -- 	특수 2단계
CLAN_RANK_K3                                       = 44 -- 	특수 3단계
CLAN_RANK_K4                                       = 45 -- 	특수 4단계
CLAN_RANK_K5                                       = 46 -- 	특수 5단계
CLAN_RANK_L1                                       = 47 -- 	특무 1단계
CLAN_RANK_L2                                       = 48 -- 	특무 2단계
CLAN_RANK_L3                                       = 49 -- 	특무 3단계
CLAN_RANK_L4                                       = 50 -- 	특무 4단계
CLAN_RANK_L5                                       = 51 -- 	특무 5단계
CLAN_RANK_TOP                                      = 52
CLAN_RANK_MAX                                      = 53
-- end enum --

DF_CLAN_RANK_NEW                                   =  	0
DF_CLAN_RANK_A1                                    =  		24000
DF_CLAN_RANK_A2                                    =  		64000
DF_CLAN_RANK_B1                                    =  		112000
DF_CLAN_RANK_B2                                    =  		168000
DF_CLAN_RANK_C1                                    =  		240000
DF_CLAN_RANK_C2                                    =  		320000
DF_CLAN_RANK_C3                                    =  		440000
DF_CLAN_RANK_D1                                    =  		600000
DF_CLAN_RANK_D2                                    =  		720000
DF_CLAN_RANK_D3                                    =  		920000
DF_CLAN_RANK_D4                                    =  		1160000
DF_CLAN_RANK_E1                                    =  		1440000
DF_CLAN_RANK_E2                                    =  		1760000
DF_CLAN_RANK_E3                                    =  		2120000
DF_CLAN_RANK_E4                                    =  		2480000
DF_CLAN_RANK_F1                                    =  		2880000
DF_CLAN_RANK_F2                                    =  		3360000
DF_CLAN_RANK_F3                                    =  		3920000
DF_CLAN_RANK_F4                                    =  		4560000
DF_CLAN_RANK_F5                                    =  		5280000
DF_CLAN_RANK_G1                                    =  		5840000
DF_CLAN_RANK_G2                                    =  		6480000
DF_CLAN_RANK_G3                                    =  		7200000
DF_CLAN_RANK_G4                                    =  		8000000
DF_CLAN_RANK_G5                                    =  		8880000
DF_CLAN_RANK_H1                                    =  		9840000
DF_CLAN_RANK_H2                                    =  		11680000
DF_CLAN_RANK_H3                                    =  		12800000
DF_CLAN_RANK_H4                                    =  		14000000
DF_CLAN_RANK_H5                                    =  		15280000
DF_CLAN_RANK_I1                                    =  		16880000
DF_CLAN_RANK_I2                                    =  		18800000
DF_CLAN_RANK_I3                                    =  		20240000
DF_CLAN_RANK_I4                                    =  		22800000
DF_CLAN_RANK_I5                                    =  		25680000
DF_CLAN_RANK_J1                                    =  		28880000
DF_CLAN_RANK_J2                                    =  		32400000
DF_CLAN_RANK_J3                                    =  		36240000
DF_CLAN_RANK_J4                                    =  		40400000
DF_CLAN_RANK_J5                                    =  		44880000
DF_CLAN_RANK_K1                                    =  		49680000
DF_CLAN_RANK_K2                                    =  		54800000
DF_CLAN_RANK_K3                                    =  		60240000
DF_CLAN_RANK_K4                                    =  		66000000
DF_CLAN_RANK_K5                                    =  		72080000
DF_CLAN_RANK_L1                                    =  		78880000
DF_CLAN_RANK_L2                                    =  		86080000
DF_CLAN_RANK_L3                                    =  		93680000
DF_CLAN_RANK_L4                                    =  		94480000
DF_CLAN_RANK_L5                                    =  		103680000

-- enum CLAN_UNIT
CLAN_UNIT_UNKNOWN                                  = 0
CLAN_UNIT_SQUARD                                   = 1 -- 	분대
CLAN_UNIT_PLATOON                                  = 2 -- 	소대
CLAN_UNIT_COMPANY                                  = 3 -- 	중대
CLAN_UNIT_BATTALION                                = 4 -- 	대대
CLAN_UNIT_REGIMENT                                 = 5 -- 	연대
CLAN_UNIT_BRIGADE                                  = 6 -- 	여단
CLAN_UNIT_DIVISION                                 = 7 -- 	사단
CLAN_UNIT_CORPS                                    = 8 -- 	군단
CLAN_UNIT_TOP                                      = 9
CLAN_UNIT_MAX                                      = 10
-- end enum --


-- enum CLAN_ROOM_STATE
CLAN_ROOM_EMPTY                                    = 0 --  비어있는 팀
CLAN_ROOM_STAY                                     = 1 --  대기중인 팀 ( 전투 신청 받을 수 있는 상태 )
CLAN_ROOM_READY                                    = 2 --  매치 팀을 만나 게임 시작 준비중 ( 전투 신청 받을 수 없는 상태 )
CLAN_ROOM_PLAY                                     = 3 --  게임중인 팀
-- end enum --


-- enum CLAN_NOTE_CLASS
CLAN_NOTE_ALL                                      = 0 --  쪽지 전체 보내기
CLAN_NOTE_STAFF                                    = 1 --  쪽지 스텝에게 보내기
CLAN_NOTE_REGULAR                                  = 2 --  쪽지 일반원에게 보내기
-- end enum --


-- enum NOTE_MESSAGE_BASIC
NOTE_MESSAGE_CLAN_INVITE                           = 0 --  마스터가 보내는 클랜 초대 쪽지에 대한 코드
NOTE_MESSAGE_CLAN_INVITE_ACCEPT                    = 1 --  클랜 가입신청서에 대한 승락을 마스터가 보내는 코드
NOTE_MESSAGE_CLAN_INVITE_DENIAL                    = 2 --  클랜 가입신청서에 대한 거절을 마스터가 보내는 코드
NOTE_MESSAGE_CLAN_JOIN_ACCEPT                      = 3 --  클랜 가입 수락을 마스터에게 보내는 코드
NOTE_MESSAGE_CLAN_JOIN_DENIAL                      = 4 --  클랜 가입 거부를 마스터에게 보내는 코드
NOTE_MESSAGE_CLAN_SECESSION                        = 5 --  클랜 탈퇴를 쪽지로 보내는 코드
NOTE_MESSAGE_CLAN_DEPORTATION                      = 6 --  클랜 강제 제명 쪽지에 대한 코드
NOTE_MESSAGE_CLAN_MASTER                           = 7 --  클랜 마스터를 위임하는 쪽지에 대한 코드
NOTE_MESSAGE_CLAN_STAFF                            = 8 --  클랜 회원을 클랜 스텝으로 임명하는 쪽지에 대한 코드
NOTE_MESSAGE_CLAN_REGULAR                          = 9 --  클랜 스텝을 일반 회원으로 강등하는 쪽지에 대한 코드
NOTE_MESSAGE_MAX                                   = 10
-- end enum --

DF_CLAN_UNIT_SQUARD                                =  			1
DF_CLAN_UNIT_PLATOON                               =  		10
DF_CLAN_UNIT_COMPANY                               =  		30
DF_CLAN_UNIT_BATTALION                             =  		50
DF_CLAN_UNIT_REGIMENT                              =  		100
DF_CLAN_UNIT_BRIGADE                               =  		150
DF_CLAN_UNIT_DIVISION                              =  		200
DF_CLAN_UNIT_CORPS                                 =  			250
MAX_MINIATURE_COUNT                                =  		19
MAX_INSIGNIA_COUNT                                 =  		21
MAX_MEDAL_COUNT                                    =  			21
MAX_NORMAL_NOTE_COUNT                              =  			100						 --  최대 일반 쪽지 - 100개를 기준으로 1개당 1%씩 취급한다.
MAX_NOTE_LENGTH                                    =  					240						 --  한글 120자
MAX_NOTE_COUNT_PER_PAGE                            =  			25						 --  전송 페이지당 최대 쪽지 갯수
NET_NOTE_SIZE                                      =  					(MAX_NOTE_LENGTH + 1)	 --  널문자 포함
MAX_SEND_NOTE_LIMIT                                =  				100						 --  하루 전송 제한
REMAIN_DAY_FOR_READED_NOTE                         =  		7						 --  읽은 편지 삭제 기간 7일
REMAIN_DAY_FOR_UNREAD_NOTE                         =  		15						 --  안읽은 편지 삭제 기간 15일

-- enum NoteType
NT_NORMAL                                          = 0 --  일반 쪽지
NT_NORMAL_ASK                                      = 1 -- 	NT_NORMAL_ASK,		// 답장
NT_NOTICE                                          = 2 --  알림 쪽지
NT_GIFT                                            = 3 --  선물 쪽지
NT_WEB                                             = 4 --  웹구매 쪽지
NT_CLAN                                            = 5 --  클랜 쪽지
NT_CLAN_ASK                                        = 6 --  클랜 권유 쪽지
-- end enum --


-- enum NoteState
NS_READED                                          = 0 --  읽은 쪽지
NS_UNREAD                                          = 1 --  안읽은 쪽지
NS_NEW                                             = 2 --  새 쪽지 - 로그인 후 전달된 쪽지
-- end enum --

NT_GIFT_FLAG                                       =  		0x10000000		 -- 	note id 에 추가되며 선물 쪽지에 사용
EXPERIENCE_RATIO                                   =  	0.02
POINT_RATIO                                        =  		0.018
BOSS_MIDDLE_RATIO                                  =  	0.2
