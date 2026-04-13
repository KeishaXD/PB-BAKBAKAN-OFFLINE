-- 웨이브 구성 설정 및 웨이브 구현 파일을 불러옵니다.
require "ModeLua.Domination.Deadtown.LuaMode_Domination_InterMissionCommon"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D1P"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D1W1"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D1W2"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D1W3"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D1E"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D2P"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D2W1"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D2W2"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D2W3"
require "ModeLua.Domination.Deadtown.LuaMode_Domination_D2E"

-- {Day No., Wave No., Goal object, Time, KillCount}
-- unused column is -1
DAY_WAVE_LIST = {
	-- Day 1
	{ 1, 1, GOAL_OBJEcT.DAY_PROLOGUE, 	10, -1 },
	{ 1, 1, GOAL_OBJEcT.SURVIVAL,		-1,	-1 },
	{ 1, 1, GOAL_OBJEcT.INTERMISSION,	60,	-1 },
	{ 1, 2, GOAL_OBJEcT.RECOVERY,		-1,	-1 },
	{ 1, 2, GOAL_OBJEcT.INTERMISSION,	60,	-1 },
	{ 1, 3, GOAL_OBJEcT.SURVIVAL,		-1,	-1 },
	{ 1, 3, GOAL_OBJEcT.INTERMISSION,	60,	-1 },
	{ 1, 3, GOAL_OBJEcT.DAY_EPILOGUE, 	10, -1 },
	{ 2, 1, GOAL_OBJEcT.DAY_PROLOGUE, 	10, -1 },
	{ 2, 1, GOAL_OBJEcT.SURVIVAL, 		-1, -1 },
	{ 2, 1, GOAL_OBJEcT.INTERMISSION, 	10, -1 },
	{ 2, 2, GOAL_OBJEcT.DEFENCE, 		-1, -1 },
	{ 2, 2, GOAL_OBJEcT.INTERMISSION, 	10, -1 },
	{ 2, 3, GOAL_OBJEcT.SURVIVAL, 		-1, -1 },
	{ 2, 3, GOAL_OBJEcT.INTERMISSION, 	10, -1 },
	{ 2, 3, GOAL_OBJEcT.DAY_EPILOGUE, 	10, -1 },
	{ -1, -1, -1 },	-- end mode
}

DAY_WAVE_FUNCTION = {
	DAY_WAVE_FUNCTION_D1P,
	DAY_WAVE_FUNCTION_D1W1,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
	DAY_WAVE_FUNCTION_D1W2,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
 	DAY_WAVE_FUNCTION_D1W3,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
	DAY_WAVE_FUNCTION_D1E,
	DAY_WAVE_FUNCTION_D2P,
	DAY_WAVE_FUNCTION_D2W1,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
	DAY_WAVE_FUNCTION_D2W2,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
	DAY_WAVE_FUNCTION_D2W3,
	DAY_WAVE_FUNCTION_INTERMISSIONCOMMON,
	DAY_WAVE_FUNCTION_D2E,
}

-----------------------
-- 스크립트의 전역 변수
-----------------------
UserCount = 0;
UserNo = {};
ReadyUser = {};
ReadyUserCount = 0;

-- SP 지급까지 남은시간
--(도중에 SP지급시 그 시간까지 지급됐을 양을 파악하고
-- 다음 지급시 얼만큼을 추가 지급해야되는지 계산하는데 사용됨)
SPSupplyRemainTime = {};

-- 리스폰 위치
UserRespawnPosition = { -1, -1, -1, -1 };

-- 사용한 스킬
UsedSkillItem = {}

-- 사용 가능한 스킬
SkillAvailable = {};

-- 스킬 글로벌 쿨타임 (다음 스킬 사용 가능한 시간)
SkillAvailableTime = {};

-- 시작시간(게임, 데이, 웨이브)
START_TIME_GAME	= 0;
START_TIME_DAY	= 0;
START_TIME_WAVE	= 0;

LifeSpendInGame	= {};
LifeSpendInDay	= {};
LifeSpendInWave	= {};
SPSpendInWave	= {};

WAVE_GOAL_COMPLETE = false;		-- 웨이브를 정상 종료하는지 확인

-- 파워업 해제 처리
DisableTime_PowerUp = {};
-- 스피드업 해제 처리
DisableTime_SpeedUp = {};

------------
-- 소스 코드
------------
-- 배틀룸을 만들었을 때 호출되는 함수
function	OnStageConfig( type, id )
	--math.randomseed(os.time());		-- 이후 math.random()을 위해 미리 난수 초기화해둠

	SetBattleResultTime( 0 );
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		local UserRespawnRemainIdx = DATA_IDX_RESPAWN_REMAIN_START + i;
		SetModeData( UserRespawnRemainIdx, RESPAWN_MAX );

		UserNo[i] = UNKNOWN_SLOT_IDX;
		ReadyUser[i] = false;
		SPSupplyRemainTime[i] = 0;
		UsedSkillItem[i] = -1;

		SkillAvailable[i] = {0, 0, 0, 0};
		SkillAvailableTime[i] = 0;

		LifeSpendInGame[i]	= 0;
		LifeSpendInDay[i]	= 0;
		LifeSpendInWave[i]	= 0;
		SPSpendInWave[i]	= 0;

		DisableTime_PowerUp[i] = 0;
		DisableTime_SpeedUp[i] = 0;
	end

	return true;
end

-- 유저 들어왔을 때 호출되는 함수
function	OnJoinPlayer( SlotIdx )
	-- 유저가 배틀에 참여 가능한지 여부를 판단
	if( UserCount < USER_COUNT_MAX ) then
		UserCount = UserCount + 1;
		UserNo[SlotIdx] = UserCount;
		AcceptJoinPlayer( SlotIdx );

		-- 배틀 시작 전에는 들어온 유저 리스폰 하지 않는다.
		if( GetRoundCount() <= 0 ) then return end

		local DayWaveCount = GetRoundCount();
		if( DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] == GOAL_OBJEcT.INTERMISSION ) then
			RespawnPlayer( SlotIdx, 1, UserRespawnPosition[UserNo[SlotIdx]] );
		end
	end
end

-- 유저 나갔을 때 호출되는 함수
function	OnDetachPlayer( SlotIdx )
	if( UserCount > 0 ) then
		UserNo[SlotIdx] = UNKNOWN_SLOT_IDX;
		UserCount = UserCount - 1;
	end

	if( GetPlayerCount( TEAM["BOTH"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리
		FinishBattle( TEAM["DRAW"] );
	end
end

-- 배틀 시작 가능한 인원이 들어왔는지 확인.
function	CheckPreStartStageCondition()
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if ( IsStartPlayer( i ) == true and IsBattlePlayer( i ) == false ) then
			-- 모든 시작 유저가 배틀 진입상태가 되어있지 않으면
			return;
		end
	end

	StartBattle();
end

-- 배틀을 시작했을 때 호출되는 함수
function	OnStartStage()
	START_TIME_GAME = GetGameTime();
end

-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound()
	local DayWaveCount = GetRoundCount();

	-- 데이 시작
	if( GetModeData( DATA_IDX_DAY_NUMBER ) < DAY_WAVE_LIST[DayWaveCount][DAY_NUMBER] ) then
		--시간 기록 (이전에 진행한 Day보다 이번에 진행하는 라운드의 Day가 증가했으면 새로 시작하는 날로 판단)
		START_TIME_DAY = GetGameTime();

		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			LifeSpendInDay[i] = 0;
		end
	end
	-- 웨이브 시작
	if( GetModeData( DATA_IDX_WAVE_NUMBER ) < DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER] ) then
		-- 시간 기록
		START_TIME_WAVE = GetGameTime();

		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			LifeSpendInWave[i]			= 0;
			SPSpendInWave[i]	= 0;
		end
	end

	WAVE_GOAL_COMPLETE = false;

	SetModeData( DATA_IDX_WAVE_GOAL, DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] );
	SetModeData( DATA_IDX_DAY_NUMBER, DAY_WAVE_LIST[DayWaveCount][DAY_NUMBER] );
	SetModeData( DATA_IDX_WAVE_NUMBER, DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER] );

	-- 준비상태 초기화 (인터미션에서 준비상태 체크에 사용합니다)
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		ReadyUser[i] = false;
	end
	ReadyUserCount = 0;

	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][PRESTARTROUNDFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][PRESTARTROUNDFUNCTION]();
	end
end

function OnAnnihilateAIGroup( GroupName )
	local DayWaveCount = GetRoundCount();
	-- FirstGroup 그룹의 AI가 전멸했을시
	if ( GroupName == "FirstGroup" ) then
		-- "AI_RaptorA.lua"파일을 지능으로 사용하는 AI 8기를 SecondGroup이라는 그룹명으로 AI 생성합니다.
		CreateAI( "SecondGroup", AI_ENEMY, 8, "AI_RaptorA.lua", GetRespawnObject("D1_W1_1_Dino_1"), 2 );
	-- SecondGroup 그룹의 AI가 전멸했을시
	elseif ( GroupName == "SecondGroup" ) then
		-- "AI_RaptorA.lua"파일을 지능으로 사용하는 AI 12기를 ThirdGroup이라는 그룹명으로 AI 생성합니다.
		CreateAI( "ThirdGroup", AI_ENEMY, 12, "AI_RaptorA.lua", GetRespawnObject("D1_W1_1_Dino_1"), 2 );
	end

	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][ANNIHILATEAIGROUPFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][ANNIHILATEAIGROUPFUNCTION](GroupName);
	end
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound()
	local DayWaveCount = GetRoundCount();
	-- 종료 시간이 있는 WAVE는 라운드 시간 설정
	if( DAY_WAVE_LIST[DayWaveCount][WAVE_TIME] >= 0 ) then
		SetRoundTimer( DAY_WAVE_LIST[DayWaveCount][WAVE_TIME] );
	end

	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][STARTROUNDFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][STARTROUNDFUNCTION]();
	end
end

-- 라운드를 종료했을 때 호출되는 함수
function	OnEndRound()
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][ENDROUNDFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][ENDROUNDFUNCTION]();
	end

	-- 점수 계산
	-- 데이 끝
	local DayClearBonus = 0;
	local remainDayTimebonus = 0;
	local LifeSpendInDaybonus = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; LifeSpendInDaybonus[0] = 0;	-- Lua는 기본배열이 1부터 시작하여 인덱스 0은 따로 초기화 필요함
	if( WAVE_GOAL_COMPLETE == true and
		DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] == GOAL_OBJEcT.DAY_EPILOGUE ) then
		DayClearBonus = SCORE_DAY_CLEAR;
		remainDayTimebonus = (600 - (GetGameTime() - START_TIME_DAY))*SCORE_DAY_REMAIN_TIME;

		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			if ( IsBattlePlayer( i ) == true ) then
				if( LifeSpendInDay[i] == 0 ) then LifeSpendInDaybonus[i] = SCORE_DAY_NO_USE_LIFE end
			end
		end
	end
	-- 웨이브 끝
	local WaveClearBonus = 0;
	local remainWaveTimebonus = 0;
	local LifeSpendInWavebonus = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; LifeSpendInWavebonus[0] = 0;
	local SPSpendInWavebonus = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}; SPSpendInWavebonus[0] = 0;
	if( WAVE_GOAL_COMPLETE == true and
		DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] ~= GOAL_OBJEcT.DAY_PROLOGUE and
		DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] ~= GOAL_OBJEcT.INTERMISSION and
		DAY_WAVE_LIST[DayWaveCount][WAVE_GOAL] ~= GOAL_OBJEcT.DAY_EPILOGUE 	) then
		WaveClearBonus = SCORE_WAVE_CLEAR;
		remainWaveTimebonus = (180 - (GetGameTime() - START_TIME_WAVE))*SCORE_WAVE_REMAIN_TIME;

		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			if ( IsBattlePlayer( i ) == true ) then
				if( LifeSpendInWave[i]	== 0 ) then LifeSpendInWavebonus[i]	= SCORE_WAVE_NO_USE_LIFE;	end
				if( SPSpendInWave[i] 	== 0 ) then SPSpendInWavebonus[i]	= SCORE_WAVE_NO_USE_SP;		end
			end
		end
	end

	-- 점수 반영
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if ( IsBattlePlayer( i ) == true ) then
			local UserScoreIdx = DATA_IDX_USER_SCORE_START + i;
			-- Day
			if( DayClearBonus			> 0 ) then AddModeData( UserScoreIdx, DayClearBonus );				ScriptDebugMsg( " SCORE(" .. i .. ") - DayClearBonus: " .. DayClearBonus );	end
			if( remainDayTimebonus		> 0 ) then AddModeData( UserScoreIdx, remainDayTimebonus );			ScriptDebugMsg( " SCORE(" .. i .. ") - remainDayTimebonus: " .. remainDayTimebonus );	end
			if( LifeSpendInDaybonus[i]	> 0 ) then AddModeData( UserScoreIdx, LifeSpendInDaybonus[i] );		ScriptDebugMsg( " SCORE(" .. i .. ") - LifeSpendInDaybonus: " .. LifeSpendInDaybonus[i] );	end
			-- Wave
			if( WaveClearBonus			> 0 ) then AddModeData( UserScoreIdx, WaveClearBonus );				ScriptDebugMsg( " SCORE(" .. i .. ") - WaveClearBonus: " .. WaveClearBonus );	end
			if( remainWaveTimebonus		> 0 ) then AddModeData( UserScoreIdx, remainWaveTimebonus );		ScriptDebugMsg( " SCORE(" .. i .. ") - remainWaveTimebonus: " .. remainWaveTimebonus );	end
			if( LifeSpendInWavebonus[i]	> 0 ) then AddModeData( UserScoreIdx, LifeSpendInWavebonus[i] );	ScriptDebugMsg( " SCORE(" .. i .. ") - LifeSpendInWavebonus: " .. LifeSpendInWavebonus[i] );	end
			if( SPSpendInWavebonus[i]	> 0 ) then AddModeData( UserScoreIdx, SPSpendInWavebonus[i] );		ScriptDebugMsg( " SCORE(" .. i .. ") - SPSpendInWavebonus: " .. SPSpendInWavebonus[i] );	end
		end
	end

	-- 실패로 끝났거나(WAVE_GOAL_COMPLETE == false) 다음 라운드 설정이 없으면 배틀 종료
 	if( --WAVE_GOAL_COMPLETE == false or
		DAY_WAVE_LIST[GetRoundCount()+1] == nil or
		DAY_WAVE_LIST[GetRoundCount()+1][WAVE_GOAL] == -1 ) then
		FinishBattle( TEAM["BOTH"] );
	end
end

-- 배틀을 종료했을 때 호출되는 함수
function	OnEndStage()
	-- 점수 계산
	if(  WAVE_GOAL_COMPLETE == true ) then
		local remainGameTimebonus = (3600 - (GetGameTime() - START_TIME_GAME))*SCORE_GAME_REMAIN_TIME;
		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			if ( IsBattlePlayer( i ) == true ) then
				local LifeSpendInGameBonus = 0;
				if( LifeSpendInGame[i] == 0 ) then
					LifeSpendInGameBonus = SCORE_GAME_NO_USE_LIFE;
				elseif( LifeSpendInGame[i] < RESPAWN_MAX ) then
					LifeSpendInGameBonus = ( RESPAWN_MAX - LifeSpendInGame[i] ) * SCORE_GAME_REMAIN_LIFE;
				end

				local KillCount = GetBattleKillCount( i );
				local KillCountBonus = 0;
				if( KillCount >  10 ) then KillCountBonus = KillCountBonus + SCORE_GAME_DINO_KILL_10;	end
				if( KillCount >  50 ) then KillCountBonus = KillCountBonus + SCORE_GAME_DINO_KILL_50;	end
				if( KillCount > 100 ) then KillCountBonus = KillCountBonus + SCORE_GAME_DINO_KILL_100;	end
				if( KillCount > 200 ) then KillCountBonus = KillCountBonus + SCORE_GAME_DINO_KILL_200;	end
				if( KillCount > 300 ) then KillCountBonus = KillCountBonus + SCORE_GAME_DINO_KILL_300;	end

				local UserScoreIdx = DATA_IDX_USER_SCORE_START + i;
				AddModeData( UserScoreIdx, SCORE_GAME_CLEAR );
				if( remainGameTimebonus		> 0 ) then AddModeData( UserScoreIdx, remainGameTimebonus );	ScriptDebugMsg( " SCORE(" .. i .. ") - remainGameTimebonus: " .. remainGameTimebonus );	end
				if( LifeSpendInGameBonus	> 0 ) then AddModeData( UserScoreIdx, LifeSpendInGameBonus );	ScriptDebugMsg( " SCORE(" .. i .. ") - LifeSpendInGameBonus: " .. LifeSpendInGameBonus );	end
				if( KillCount				> 0 ) then AddModeData( UserScoreIdx, KillCount );				ScriptDebugMsg( " SCORE(" .. i .. ") - KillCount: " .. KillCount );	end
			end
		end
	end
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate()
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][BATTLEUPDATEFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][BATTLEUPDATEFUNCTION]();
	end

	local currentTime = GetGameTime();
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( DisableTime_PowerUp[i] ~= 0 and
			DisableTime_PowerUp[i] < currentTime ) then
			-- Disable Powerup
			local Effects = {
				{EFFECT_TYPE.DAMAGE, nil, 0},
			};
			SetGameEffect(i, 1, Effects);
			DisableTime_PowerUp[i] = 0;
		end

		if( DisableTime_SpeedUp[i] ~= 0 and
			DisableTime_SpeedUp[i] < currentTime ) then
			-- Disable Speedup
			local Effects = {
				{EFFECT_TYPE.SPEED, nil, 0},
			};
			SetGameEffect(i, 1, Effects);
			DisableTime_SpeedUp[i] = 0;
		end
	end

	local UserSP = {}
	-- 스킬 사용 가능한 SP가 되었는지 확인
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if ( IsBattlePlayer( i ) == true ) then
			local UserSPIdx = DATA_IDX_USER_SP_START + i;
			UserSP[i] = GetModeData( UserSPIdx );

			-- 각 스킬별로 SP 양 확인해서 사용 가능한 스킬 레벨 기록해둠
			for j = 1, SKILL["COUNT"], 1 do
				-- 4레벨
				if( SKILL_SET[j][4][SKILL_OPEN] <= UserSP[i] ) then
					SkillAvailable[i][j] = 4;
				-- 3레벨
				elseif( SKILL_SET[j][3][SKILL_OPEN] <= UserSP[i] ) then
					SkillAvailable[i][j] = 3;
				-- 2레벨
				elseif( SKILL_SET[j][2][SKILL_OPEN] <= UserSP[i] ) then
					SkillAvailable[i][j] = 2;
				-- 1레벨
				elseif( SKILL_SET[j][1][SKILL_OPEN] <= UserSP[i] ) then
					SkillAvailable[i][j] = 1;
				-- 사용 못함
				else
					SkillAvailable[i][j] = 0;
				end
			end
			--ScriptDebugMsg( "User" .. i .. " - SP:" .. UserSP[i] .. " - SkillLevel: " .. SkillAvailable[i][1] .. ", " .. SkillAvailable[i][2] .. ", " .. SkillAvailable[i][3] .. ", " .. SkillAvailable[i][4] )
		end
	end

	bNeedSync = false;

	-- SP가 스킬 사용 가능한 양이 되었을때는 강제로 동기화할 필요가 있다.
	local SupplyRemainTime = GetTimer( TIMER_IDX_SP_CHARGE );
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if ( IsBattlePlayer( i ) == true ) then
			local UserSPIdx = DATA_IDX_USER_SP_START + i;
			local SupplyAmount = SPSUpplyAmountPerSec * (SPSupplyRemainTime[i] - SupplyRemainTime);

			--ScriptDebugMsg( "User" .. i .. " - UserSPIdx:" .. UserSPIdx .. ", SP:" .. UserSP[i] .. ", SupplyRemainTime:" .. SupplyRemainTime .. ", SupplyAmount:" .. SupplyAmount )

			for j = 1, SKILL["COUNT"], 1 do
				local NextLevel = SkillAvailable[i][j]+1;
				--ScriptDebugMsg( "NextLevel:" .. NextLevel .. " <= " .. SKILL["COUNT"] .. " is " .. tostring(NextLevel <= SKILL["COUNT"]) )
				if( NextLevel <= SKILL["COUNT"] ) then
					local CheckSP = UserSP[i] + SupplyAmount;
					--ScriptDebugMsg( "CheckSP:" .. CheckSP .. " >= " .. SKILL_SET[j][NextLevel][SKILL_OPEN] .. " is " .. tostring(CheckSP >= SKILL_SET[j][NextLevel][SKILL_OPEN]) )
					-- 지금 시간까지 늘어난 SP양이 스킬 사용 가능한 양이 되었으면
					if( CheckSP >= SKILL_SET[j][NextLevel][SKILL_OPEN] ) then
						-- SP 양을 공유한다.
						AddModeData( UserSPIdx, SupplyAmount );
						local Flag = GetModeData( DATA_IDX_USER_SP_IS_ABS );
						Flag = SetFlag( Flag, i, true );
						ScriptDebugMsg( "SPup (update) - Slot:" .. i .. ", SupplyAmount" .. GetModeData(UserSPIdx) .. "(+" .. SupplyAmount .. "), Flag:" .. GetModeData( DATA_IDX_USER_SP_IS_ABS ) .. " -> " .. Flag );
						SetModeData( DATA_IDX_USER_SP_IS_ABS, Flag );
						SPSupplyRemainTime[i] = GetTimer( TIMER_IDX_SP_CHARGE );
						bNeedSync = true;
					end
				end
			end
		end
	end

	if( bNeedSync == true ) then
		SyncModeData();
	end
end

-- 유저 or AI 죽었을때.....
function	OnKillPlayer( SlotIdx, KillerIdx )
	-- 죽은 대상이 유저일 경우( 킬러는 100% AI 일수밖에 없음 )
	if ( SlotIdx < 100 ) then
		--AddTeamScore( KillerIdx%TEAM["COUNT"], 1 );

		-- 유저일 경우
		local UserRespawnRemainIdx = DATA_IDX_RESPAWN_REMAIN_START + SlotIdx;
		if( GetModeData( UserRespawnRemainIdx ) > 0 ) then
			AddModeData ( UserRespawnRemainIdx, -1 );
			RespawnPlayer( SlotIdx, 8, UserRespawnPosition[UserNo[SlotIdx]] );
			LifeSpendInGame[SlotIdx] = LifeSpendInGame[SlotIdx] + 1;
			LifeSpendInDay[SlotIdx] = LifeSpendInDay[SlotIdx] + 1;
			LifeSpendInWave[SlotIdx] = LifeSpendInWave[SlotIdx] + 1;
		end
	-- 죽은 대상이 AI일 경우( 킬러는 유저일수도 AI일수도 있음 )
	else
		-- 킬러가 유저일 경우는 [유저가 공룡을 죽인 상황]
		if ( KillerIdx < 100 ) then
			AddModeData( DATA_IDX_REMAIN_DINO_COUNT, -1 );

			-- SP 증가
			local UserSPIdx = DATA_IDX_USER_SP_START + KillerIdx;
			local SupplyAmount = SP_KILL;
			if( GetModeData( UserSPIdx ) + SupplyAmount > SPMAXVALUE ) then
				SupplyAmount = SPMAXVALUE - GetModeData( UserSPIdx );
			end
			AddModeData( UserSPIdx, SupplyAmount );
			local Flag = GetModeData( DATA_IDX_USER_SP_IS_ABS );
			Flag = SetFlag( Flag, KillerIdx, true );
			ScriptDebugMsg( "SPup (kill) - Slot:" .. KillerIdx .. ", SupplyAmount" .. GetModeData(UserSPIdx) .. "(+" .. SupplyAmount .. "), Flag:" .. GetModeData( DATA_IDX_USER_SP_IS_ABS ) .. " -> " .. Flag );
			SetModeData( DATA_IDX_USER_SP_IS_ABS, Flag );

			-- Score 증가
			local UserScoreIdx = DATA_IDX_USER_SCORE_START + KillerIdx;
			AddModeData( UserScoreIdx, SCORE_KILL_RAPTER );
			ScriptDebugMsg( " SCORE(" .. KillerIdx .. ") - SCORE_KILL_RAPTER: " .. SCORE_KILL_RAPTER );

			-- WAVE 에 킬 카운트가 설정된 경우
			if( DAY_WAVE_LIST[GetRoundCount()][WAVE_KILLCOUNT] >= 0 ) then
				if( DAY_WAVE_LIST[GetRoundCount()][WAVE_KILLCOUNT] <= GetTeamScore( TEAM["RED"] ) + GetTeamScore( TEAM["BLUE"] ) ) then
					FinishRound( TEAM["BOTH"], END_TYPE["MAX_KILL"] );
				end
			end
		-- 킬러가 AI인 경우는 [공룡이 센트리건을 죽인 상황 or 센트리건이 공룡을 죽인 상황]
		else

		end
	end
end

-- 유저나 AI가 리스폰 될 때 호출되는 함수
function	OnRespawnPlayer( SlotIdx )
	-- AI면
	if ( 100 <= SlotIdx and SlotIdx < 200 ) then
		AddModeData( DATA_IDX_REMAIN_DINO_COUNT, 1 );
	end
end

function	OnTimeOut( timerIdx )
	-- SP 충전
	if( timerIdx == TIMER_IDX_SP_CHARGE ) then
		local Flag = GetModeData( DATA_IDX_USER_SP_IS_ABS );
		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			if ( IsBattlePlayer( i ) == true ) then
				local UserSPIdx = DATA_IDX_USER_SP_START + i;
				local SupplyAmount = SPSUpplyAmountPerSec * SPSupplyRemainTime[i];
				if( GetModeData( UserSPIdx ) + SupplyAmount > SPMAXVALUE ) then
					SupplyAmount = SPMAXVALUE - GetModeData( UserSPIdx );
				end
				if( SupplyAmount ~= 0 ) then
					AddModeData( UserSPIdx, SupplyAmount );
					Flag = SetFlag( Flag, i, false );
					ScriptDebugMsg( "SPup (Timeout) - Slot:" .. i .. ", SupplyAmount" .. GetModeData(UserSPIdx) .. "(+" .. SupplyAmount .. "), Flag:" .. GetModeData( DATA_IDX_USER_SP_IS_ABS ) .. " -> " .. Flag );
				end
			end
		end
		SetModeData( DATA_IDX_USER_SP_IS_ABS, Flag);
		SetTimer( TIMER_IDX_SP_CHARGE, SPSupplyTime, true );
		for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
			SPSupplyRemainTime[i] = SPSupplyTime;
		end
	end

	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][TIMEOUTFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][TIMEOUTFUNCTION]( timerIdx );
	end
end

function	OnRoundTimeOut()
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][ROUNDTIMEOUTFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][ROUNDTIMEOUTFUNCTION]();
	end
end

function	OnInstall( SlotIdx, Weapon )
	if( UsedSkillItem[SlotIdx+1] == Weapon ) then
		ScriptDebugMsg( "OnInstall success( " .. SlotIdx .. " ) - " .. Weapon)
		UsedSkillItem[SlotIdx+1] = -1;
		return true;
	end

	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][INSTALLFUNCTION] ~= nil ) then
		return DAY_WAVE_FUNCTION[DayWaveCount][INSTALLFUNCTION]( SlotIdx, Weapon );
	end

	-- 스크립트에서 강제로 설치시
	if( SlotIdx == UNKNOWN_SLOT_IDX ) then
		ScriptDebugMsg( "OnInstall success( " .. SlotIdx .. " ) - " .. Weapon)
		return true;
	end

	ScriptDebugMsg( "OnInstall fail( " .. SlotIdx .. " ) - " .. Weapon)
	-- 설치 테스트를 위해 모든 설치 행위 성공으로 처리
	--return true;
	return false;
end

function	OnUninstall( SlotIdx, Weapon )
	if( (SKILL_SET[SKILL["SUPPLYBASE"]][1][SKILL_ITEM]+0) <= Weapon	and
		(Weapon <= SKILL_SET[SKILL["SUPPLYBASE"]][4][SKILL_ITEM]+0) ) then	-- 스킬 서플라이베이스
		return true;
	elseif( (SKILL_SET[SKILL["DUMMY"]][1][SKILL_ITEM]+0) <= Weapon and
			(Weapon <= SKILL_SET[SKILL["DUMMY"]][4][SKILL_ITEM]+0) ) then	-- 더미
		return true;
	elseif( (SKILL_SET[SKILL["SENTRYGUN"]][1][SKILL_ITEM]+0) <= Weapon and
			(Weapon <= SKILL_SET[SKILL["SENTRYGUN"]][4][SKILL_ITEM]+0) ) then	-- 더미
		return true;
	end

	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][UNINSTALLFUNCTION] ~= nil ) then
		return DAY_WAVE_FUNCTION[DayWaveCount][UNINSTALLFUNCTION]( SlotIdx, Weapon );
	end

	-- 설치 테스트를 위해 모든 설치 행위 성공으로 처리
	--return true;
	return false;
end

function	OnUse( SlotIdx, Weapon )
	if( SupplyBaseHP == Weapon ) then
		return true;
	elseif( SupplyBaseHP == Weapon ) then
		return true;
	elseif( (SKILL_SET[SKILL["SUPPLYBASE"]][1][SKILL_ITEM]+0) <= Weapon	and
		Weapon <= (SKILL_SET[SKILL["SUPPLYBASE"]][4][SKILL_ITEM]+0) ) then	-- 스킬 서플라이베이스

		-- 사용 효과
		if( Weapon == (SKILL_SET[SKILL["SUPPLYBASE"]][1][SKILL_ITEM]+0) ) then
			local Effects = {
				{EFFECT_TYPE.HP, nil, 30},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.PRIMARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.SECONDARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.THROWING, 100},
			};
			SetGameEffect(0, 4, Effects);
		elseif( Weapon == (SKILL_SET[SKILL["SUPPLYBASE"]][2][SKILL_ITEM]+0) ) then
			local Effects = {
				{EFFECT_TYPE.HP, nil, 30},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.PRIMARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.SECONDARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.THROWING, 100},
			};
			SetGameEffect(0, 4, Effects);
		elseif( Weapon == (SKILL_SET[SKILL["SUPPLYBASE"]][3][SKILL_ITEM]+0) ) then
			local Effects = {
				{EFFECT_TYPE.HP, nil, 30},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.PRIMARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.SECONDARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.THROWING, 100},
			};
			SetGameEffect(0, 4, Effects);
		elseif( Weapon == (SKILL_SET[SKILL["SUPPLYBASE"]][4][SKILL_ITEM]+0) ) then
			local Effects = {
				{EFFECT_TYPE.HP, nil, 30},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.PRIMARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.SECONDARY, 100},
				{EFFECT_TYPE.AMMO, WEAPON_USAGE.THROWING, 100},
			};
			SetGameEffect(0, 4, Effects);
		end
		return true;
	elseif( (SKILL_SET[SKILL["DUMMY"]][1][SKILL_ITEM]+0) <= Weapon and
			Weapon <= (SKILL_SET[SKILL["DUMMY"]][4][SKILL_ITEM]+0) ) then	-- 더미
		return true;
	elseif( (SKILL_SET[SKILL["SENTRYGUN"]][1][SKILL_ITEM]+0) <= Weapon and
			Weapon <= (SKILL_SET[SKILL["SENTRYGUN"]][4][SKILL_ITEM]+0) ) then	-- 더미
		return true;
	end

	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][USEFUNCTION] ~= nil ) then
		return DAY_WAVE_FUNCTION[DayWaveCount][USEFUNCTION]( SlotIdx, Weapon );
	end

	-- 설치 테스트를 위해 모든 설치 행위 성공으로 처리
	--return true;
	return false;
end

function	OnGameObjUse( SlotIdx, GameObjIdx )
--~ 	if( GameObjIdx == GetGameObject("오브젝트 이름") ) then
--~ 	end
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][GAMEOBJUSEFUNCTION] ~= nil ) then
		return DAY_WAVE_FUNCTION[DayWaveCount][GAMEOBJUSEFUNCTION]( SlotIdx, GameObjIdx );
	end

	-- 사용 테스트를 위해 일단 다 성공 리턴
	return true;
end

function	OnDamageObject( SlotIdx, ObjectIdx, Damage)
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][DAMAGEOBJECTFUNCTION] ~= nil ) then
		return DAY_WAVE_FUNCTION[DayWaveCount][DAMAGEOBJECTFUNCTION]( SlotIdx, ObjectIdx, Damage);
	end

	return false;
end

function	OnDestroyObject( SlotIdx, ObjectIdx )
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][DESTROYOBJECTFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][DESTROYOBJECTFUNCTION]( SlotIdx, ObjectIdx );
	end
end

function	OnEnterTrigger( SlotType, SlotIdx, TriggerIdx )
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][ENTERTRIGGERFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][ENTERTRIGGERFUNCTION](SlotType, SlotIdx, TriggerIdx);
	end
end

function	OnLeaveTrigger( SlotType, SlotIdx, TriggerIdx )
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][LEAVETRIGGERFUNCTION] ~= nil ) then
		DAY_WAVE_FUNCTION[DayWaveCount][LEAVETRIGGERFUNCTION]( SlotType, SlotIdx, TriggerIdx );
	end
end

function	OnKeyProc( SlotIdx, Key )
	local DayWaveCount = GetRoundCount();
	-- 스테이지별 실행
	if( DAY_WAVE_FUNCTION[DayWaveCount] == nil ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( DAY_WAVE_FUNCTION[DayWaveCount][KEYPROCFUNCTION] ~= nil ) then
		local Ret, Arg0 = DAY_WAVE_FUNCTION[DayWaveCount][KEYPROCFUNCTION]( SlotIdx, Key );
		if( Ret == EVENT_ERROR_SUCCESS) then
			return Ret, Arg0;
		end
	end

	ScriptDebugMsg( "OnKeyProc ( " .. SlotIdx .. Key .. " ) " )

	-- 기본 스킬 처리
	ScriptDebugMsg( "Skill CoolTime Check - " .. SkillAvailableTime[SlotIdx] .. " > " .. GetGameTime() );
	if( SkillAvailableTime[SlotIdx] > GetGameTime() ) then
		-- 글로벌 쿨타임
		return EVENT_ERROR_FAIL, 0;
	end

	local SkillIdx;
	if( Key == GAME_KEY_MAP.CHANGEWEAPON_7 ) then
		SkillIdx = SKILL["SUPPLYBASE"];
	elseif( Key == GAME_KEY_MAP.CHANGEWEAPON_8 ) then
		SkillIdx = SKILL["DUMMY"];
	elseif( Key == GAME_KEY_MAP.CHANGEWEAPON_9 ) then
		SkillIdx = SKILL["SENTRYGUN"];
	elseif( Key == GAME_KEY_MAP.SPECIAL_MISSION ) then
		SkillIdx = SKILL["SPECIAL"];
	end

	local UserSPIdx = DATA_IDX_USER_SP_START + SlotIdx;
	local UserSP = GetModeData( UserSPIdx );

	local SkillLevel = SkillAvailable[SlotIdx][SkillIdx];

	ScriptDebugMsg( "UserSPIdx:" .. UserSPIdx .. ", UserSP:" .. UserSP .. ", SkillLevel:" .. SkillLevel );

	if( 0 == SkillLevel ) then
		return EVENT_ERROR_FAIL, SkillLevel;
	end

	local NeedSP = SKILL_SET[SkillIdx][SkillLevel][SKILL_OPEN];
	local UseSP = SKILL_SET[SkillIdx][SkillLevel][SKILL_USE];

	ScriptDebugMsg( "NeedSP:" .. NeedSP .. ", UseSP:" .. UseSP );

	if( UserSP < NeedSP ) then
		return EVENT_ERROR_FAIL, SkillLevel;
	end

	UsedSkillItem[SlotIdx+1] = SKILL_SET[SkillIdx][SkillLevel][SKILL_ITEM]+0;

	ScriptDebugMsg( "UsedSkillItem:" .. UsedSkillItem[SlotIdx+1] .. "(Type:" .. type(UsedSkillItem[SlotIdx+1]) .. ")" );

	if( SkillIdx == SKILL["SPECIAL"] ) then
		if( SkillLevel == 1 ) then
			local Effects = {
				{EFFECT_TYPE.DAMAGE, nil, 30},
			};
			SetGameEffect(SlotIdx, 1, Effects);
			DisableTime_PowerUp[SlotIdx] = GetGameTime() + SKILL_DAMAGEUP_DURATION;
		elseif( SkillLevel == 2 ) then
			local Effects = {
				{EFFECT_TYPE.SPEED, nil, 30},
			};
			SetGameEffect(SlotIdx, 1, Effects);
			DisableTime_SpeedUp[SlotIdx] = GetGameTime() + SKILL_SPEEDUP_DURATION;
		end
	end

	SkillAvailableTime[SlotIdx] = GetGameTime() + SKILL_SET[SkillIdx][SkillLevel][SKILL_COOL];
	-- SP 감소
	AddModeData( UserSPIdx, (UseSP * -1) );
	local Flag = GetModeData( DATA_IDX_USER_SP_IS_ABS );
	Flag = SetFlag( Flag, SlotIdx, true );
	ScriptDebugMsg( "SPdown (SkillUse) - Slot:" .. SlotIdx .. ", SupplyAmount" .. GetModeData(UserSPIdx) .. "(-" .. UseSP .. "), Flag:" .. GetModeData( DATA_IDX_USER_SP_IS_ABS ) .. " -> " .. Flag );
	SetModeData( DATA_IDX_USER_SP_IS_ABS, Flag );
	SyncModeData();

	SPSpendInWave[SlotIdx] = SPSpendInWave[SlotIdx] + 1;

	return EVENT_ERROR_SUCCESS, SkillLevel;
end

function	OnIngameItemUse( SlotIdx, ItemID, ItemArg )
	ScriptDebugMsg( "OnIngameItemUse - SlotIdx:" .. SlotIdx .. ", ItemID:" .. ItemID .. ", ItemArg:" .. ItemArg )
end
