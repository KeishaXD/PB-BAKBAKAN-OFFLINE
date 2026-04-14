-- 클라이언트와 공유되어야 하는 데이터들
GOAL_OBJEcT = {
	DAY_PROLOGUE	= 0,
	INTERMISSION	= 1,
	SURVIVAL		= 2,
	DESTROY			= 3,
	DAY_EPILOGUE	= 4,
	RECOVERY		= 5,
	BOSS			= 6,
	DEFENCE			= 7,
	HOLDTHELINE		= 8,
}
WAVE_MISSION = {
	NONE			= 0,	-- 아무것도 아님
	TIMELIMIT		= 1,	-- 시간 제한(서바이벌)
	ELIMINATE		= 2,	-- 전멸하기(서바이벌).
	RECOVERY		= 3,	-- 회수 미션
	RECOVERY2		= 4,	-- 회수2(갔다놓기)
	DEFENCE			= 5,	-- 방어 미션
	DESTROY			= 6,	-- 파괴 미션
	BOMB			= 7,	-- 폭탄설치 미션
	BLOCK			= 8,	-- 저지 미션
}

-- SKILL
SKILL = {
	SUPPLYBASE	= 1,
	DUMMY 		= 2,
	SENTRYGUN	= 3,
	SPECIAL		= 4,
	COUNT		= 4,
}
-- SKILL SET COLUMN
SKILL_COOL	= 1
SKILL_OPEN	= 2
SKILL_USE	= 3
SKILL_ITEM	= 4


SKILL_MAX_LEVEL		= 4
SKILL_VALUE_COUNT	= 4

SupplyBaseSP = {
	{  4,  500,  200, "2006009003" },
	{  6, 1000,  300, "2006009004" },
	{  8, 34000,  500, "2006009005" },
	{ 10, 49000,  600, "2006009006" }
};
DummySP = {
	{   4,  500,  200, "8109007" },
	{   6, 1000,  300, "8109008" },
	{  8, 35000,  500, "8109009" },
	{ 10, 50000,  600, "8109010" }
};
SentryGunSP = {
	{   4,  500,  200, "8009011" },
	{   6, 1000,  300, "8009012" },
	{  8, 2000,  2000, "8009013" },
	{ 10, 3000,  3000, "8009014" }
};

SpecialSkillSP = {
	{   4,  500,  200, "-1" },
	{   6, 1000,  300, "-1" },
	{  8, 40000,  800, "-1" },
	{ 10, 55000, 1000, "-1" }
};
SKILL_SET = {
	SupplyBaseSP,
	DummySP,
	SentryGunSP,
	SpecialSkillSP,
}

-- 타이머 (MAX:10)
TIMER_IDX_SP_CHARGE		= 0
TIMER_IDX_COUNTDOWN		= 2
TIMER_IDX_GAMEOVERCOUNTDOWN = 5
-- 특정 웨이브에서만 사용하는 타이머는 다른 웨이브에서 중복해서 사용했으면 합니다.
-- 특정 웨이브에서만 사용하는 타이머는 5 이상의 값으로 할당합니다.

-- Day2 Wave1
TIMER_IDX_D1W3_ANALYSE 	= 6

-- Day2 Wave2
TIMER_IDX_D2W2_ANALYSE	= 6
--Day6 Wave5
TIMER_IDX_D6W5_BOMBCHANCE = 6
TIMER_IDX_D6W5_MOVIE_TIMEOUT = 7
TIMER_IDX_D6W5_BOSS_START = 8
TIMER_IDX_D6W5_BOSS_END = 9

-- 모드 데이터 공통 (MAX:150)
DATA_IDX_WAVE_GOAL				= 0		-- 웨이브 목표
DATA_IDX_DAY_NUMBER				= 1		-- 진행중일 DAY
DATA_IDX_WAVE_NUMBER			= 2		-- 진행중인 WAVE
DATA_IDX_USER_SCORE_START		= 3		-- 각 유저별 점수
DATA_IDX_USER_SCORE_END			= 18	-- 각 유저별 점수
DATA_IDX_USER_SP_START			= 19	-- 각 유저별 보유 SP
DATA_IDX_USER_SP_END			= 34	-- 각 유저별 보유 SP
DATA_IDX_RESPAWN_REMAIN_START	= 35	-- 각 유저별 남은 목숨
DATA_IDX_RESPAWN_REMAIN_END		= 50	-- 각 유저별 남은 목숨
DATA_IDX_REMAIN_DINO_COUNT		= 51
DATA_IDX_USER_SP_IS_ABS			= 52	-- 보내지는 SP 값이 절대값인지 체크플래그 (절대값일때 true)
DATA_IDX_USER_START_TIME_START	= 53	-- 유저가 게임에 참여한 시간
DATA_IDX_USER_START_TIME_END	= 68	-- 유저가 게임에 참여한 시간
DATA_IDX_WAVE_SET_TIME			= 69	-- 설정된 웨이브 진행시간(초)( 유저 진입시 남은 시간을 보내주므로, 원래 몇초동안 진행되는 웨이브인지 알아야 할 경우 사용)
DATA_IDX_USER_GAMEOVER			= 70	-- 라이프 다 소진하고 죽은 유저 플래그
DATA_IDX_USER_SUB_GOAL			= 71	-- 웨이브 진행중 중간 목표

-- 특정 웨이브에서만 사용하는 인덱스는 다른 웨이브에서 중복해서 사용했으면 합니다.
-- 특정 웨이브에서만 사용하는 인덱스는 100이상의 값으로 할당합니다.

	-- 인터미션
DATA_IDX_IM_USER_READY_FLAG		= 100

	-- Boss Flow
DATA_IDX_D6W5_BOSS_AISLOT_IDX	= 100	-- 보스 AI 슬롯 인덱스 (보스 나오기 전에는 -1)

	-- Wave
DATA_IDX_SET_AI_RESPAWN_OBJECT	= 101	-- AI 리스폰 오브젝트 표시
DATA_IDX_DEL_AI_RESPAWN_OBJECT	= 102	-- AI 리스폰 오브젝트 표시 제거



-- < Wave Mission Index >
	-- TIMELIMIT
	DATA_IDX_TIMELIMIT		= 110	-- 서바이벌 시간 제한의 시간 제공(초 단위)

	-- ELIMINATE
	DATA_IDX_DINO_SUM_COUNT = 110	-- 공룡의 총 마리수
	DATA_IDX_DINO_CRNT_COUNT = 111; -- 현재 잡은 공룡 마리수

	-- RECOVERY
	DATA_IDX_RECOVER_OBJ_COUNT		= 110	-- 회수임무 목표 오브젝트 수
	DATA_IDX_RECOVERY_COUNT			= 111	-- 회수임무 회수된 오브젝트 수
	DATA_IDX_COMPLETE_FLAG			= 112	-- 회수된 오브젝트 플래그 - 회수된 오브젝트는 1
	DATA_IDX_RECOVER_TARGET			= 113
	DATA_IDX_RECOVER_SHOW_TRIGGER 	= 114 	-- 모든 오브젝트 회수 후 트리거로 표시

	-- RECOVERY2
	DATA_IDX_D3W3_RECOVER_OBJ_COUNT	= 110	-- D3W2 회수임무 목표 오브젝트 수
	DATA_IDX_D3W3_RECOVERY_COUNT	= 111	-- D3W2 회수임무 회수된 오브젝트 수

	-- DEFENCE
	DATA_IDX_TARGET_SUM_COUNT			= 110	-- 방어 오브젝트 Count
	DATA_IDX_TARGET_OBJECT_TOTAL_COUNT	= 111
	DATA_IDX_TARGET_OBJECT				= 112	-- 현재 방어 할 오브젝트 idx
	DATA_IDX_TARGET_CRNT_COUNT			= 113	-- 방어 한 오브젝트 개수

	DATA_IDX_TARGET_START				= 114	-- 방어 오브젝트 활성화

	DATA_IDX_TARGET_OBJECT_0			= 115	-- 불투명 오브젝트 0
	DATA_IDX_TARGET_OBJECT_1  		 	= 116
	DATA_IDX_TARGET_OBJECT_2			= 117
	DATA_IDX_TARGET_OBJECT_3			= 118

	DATA_IDX_TARGET_NOTUSE_0			= 119	-- 투명 오브젝트 0
	DATA_IDX_TARGET_NOTUSE_1			= 120
	DATA_IDX_TARGET_NOTUSE_2			= 121
	DATA_IDX_TARGET_NOTUSE_3			= 122


	-- DESTROY
	DATA_IDX_EGG_SUM_COUNT			= 110	-- 전체 파괴 오브젝트 카운트
	DATA_IDX_EGG_CURRENT			= 111   -- 현재 파괴 오브젝트 인덱스
	DATA_IDX_EGG_DESTROY_COUNT 		= 112   -- 파괴한 오브젝트 카운트
	DATA_IDX_EGG_OBJECT_TOTAL_COUNT = 113	-- 파괴미션에 배치 된 총 오브젝트의 갯수

	DATA_IDX_EGG_OBJECT_0 		= 114   -- 오브젝트 인덱스
	DATA_IDX_EGG_OBJECT_1 		= 115
	DATA_IDX_EGG_OBJECT_2 		= 116
	DATA_IDX_EGG_OBJECT_3 		= 117
	DATA_IDX_EGG_OBJECT_4 		= 118
	DATA_IDX_EGG_OBJECT_5 		= 119


	-- HOLD THE LINE
	DATA_IDX_ALLOW_COUNT			= 110
	DATA_IDX_ESCAPE_COUNT			= 111

	DATA_IDX_START_POINT			= 112	-- 시작 시점 리스폰 오브젝트 idx
	DATA_IDX_AI_IN_TRIGGER			= 113
	DATA_IDX_DEST_POINT				= 114   -- 도착 지점 리스폰 오브젝트 idx
	DATA_IDX_AI_IN_ESCAPE_TRIGGER	= 115

	-- BOMB
	DATA_IDX_BOMB_SUM_COUNT		= 110	-- 폭탄 설치 전체 갯수
	DATA_IDX_BOMB_COUNT			= 111	-- 현재 폭탄 해체 갯수





SPSupplyTime				= 10;
SPSupplyAmount				= 10;
SPSUpplyAmountPerSec		= SPSupplyAmount/SPSupplyTime; -- 1초당 차는 SP양
SPMAXVALUE					= 6000;

SP_KILL						= 10

SPBoostSupplyAmount			= 70;
SPBoostSUpplyAmountPerSec	= SPBoostSupplyAmount/SPSupplyTime;
SPBoost_KILL				= 15

-- 이벤트 인덱스
EVENT_IDX_BOSS_DEATH_START	= 500
EVENT_IDX_BOSS_DEATH_END	= 501

  -- Flow Fade In/Out
EVENT_IDX_FLOW_FADE_OUT		= 550
EVENT_IDX_FLOW_FADE_IN		= 551

-- Sentry Gun HP
SENTRYGUN_MAX_HP_LV1		= 30;
SENTRYGUN_MAX_HP_LV2		= 50;
SENTRYGUN_MAX_HP_LV3		= 100;
SENTRYGUN_MAX_HP_LV4		= 100;

