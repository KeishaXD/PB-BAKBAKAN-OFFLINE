-- 상수 값
TEAM = {
	RED		= 0,
	BLUE	= 1,
	BOTH	= 2,
	COUNT	= 2,
	DRAW	= 2
}
END_TYPE = {
	TYPE_NONE			= 0,
	TIMEOUT				= 1,
	BOMBFIRE			= 2,
	UNINSTALL			= 3,
	ALLDEATH			= 4,
	GENERATOR_DESTROY	= 5,			-- 파괴 미션 오브젝트 파괴
	DEFENCE_DESTROY		= 6,			-- 방어 미션 오브젝트 파괴
	TUTORIAL_COMPLETE	= 7,			-- 튜토리얼 임무 완료
	MAX_KILL			= 8,			-- 데스매치에서 목표 킬카운트 달성
}

UNKNOWN_SLOT_IDX		= -1
SLOT_MAX_COUNT			= 16
SLOT_IDX_START			= 0
SLOT_IDX_END			= 15

-- 기본 경험치 보상공식 상수 값
iRoundScore				= 30
iLimitKillPerRound		= 20
fLowKillFactor			= 1.5
fMidKillFactor			= 1
fHighKillFactor			= 0.8
iHeadshotMax			= 5
iHeadshotScore			= 1
iChainKillMax			= 5
iChainKillScore			= 1
iChainMeleeMax			= 5
iChainMeleeScore		= 1
fWinAllExp				= 1
fDrawAllExp				= 0
fLoseAllExp				= 0.7
fExpPerRound			= 1.5
fExpPerKill				= 2
fExpPerMission			= 1.5
iMemberMaxVal			= 16
fMemberMaxRate			= 1
iMemberRangeStart		= 15
iMemberRangeEnd			= 6
fMemberRangeRate		= 0.9
iMemberMinVal			= 5
fMemberMinRate			= 0.3

-- 포인트 보상 공식 상수 값
iSecondPerPoint		= 4
fWinPoint			= 0.8
fDrawPoint			= 0.75
fLosePoint			= 0.7
iRankPoint			= {10.00, 9.00, 7.00, 6.50, 6.00, 5.50, 5.00, 4.50, 4.00, 3.50, 3.00, 2.50, 2.00, 1.50, 1.00, 0.50}
iMemberPoint		= {1.6, 1.6, 3.2, 3.2, 4.8, 4.8, 6.4, 6.4, 8, 8, 9.6, 9.6, 11.2, 11.2, 12.8, 12.8}
iHeadshotPoint		= 5
iChainKillPoint		= 4
iMeleePoint			= 2
iMaxPoint			= 20

-- 모드 미션 경험치 보상 공식 상수 값
iMissionDamageMax		= 500
iMissionDamageScore		= 0.1
iMissionDefenseMax		= 10
iMissionDefenseScore	= 10
iMissionHpMax			= 500
iMissionHpScore			= 0.5

-- 모드 데이터 인덱스
DATA_IDX_TARGET_0_OBJECT		= 0
DATA_IDX_TARGET_1_OBJECT		= 1
DATA_IDX_TARGET_0_OBJECT_HP		= 2
DATA_IDX_TARGET_1_OBJECT_HP		= 3
DATA_IDX_ACC_USER_DAMAGE_START	= 4
DATA_IDX_ACC_USER_DAMAGE_END	= 19
DATA_IDX_USER_DAMAGE_START		= 20
DATA_IDX_USER_DAMAGE_END		= 35
DATA_IDX_DEFENSE_COUNT_START	= 36
DATA_IDX_DEFENSE_COUNT_END		= 51
DATA_IDX_REMAIN_HP				= 52

-- 배틀룸을 만들었을 때 호출되는 함수
function	OnStageConfig( type, id )
	-- 파괴 오브젝트 설정
	local Target0Idx = 0
	local Target1Idx = 0
	if( id == 39) then		-- 블랙펜저
		Target0Idx = GetGameObject("armerd_Tank");
		Target1Idx = GetGameObject("normal_Tank");
	else
		-- 파괴 미션 맵이 아님 - 바로 종료
		return false;
	end

	SetModeData( DATA_IDX_TARGET_0_OBJECT, Target0Idx );
	SetModeData( DATA_IDX_TARGET_1_OBJECT, Target1Idx );
	SetModeData( DATA_IDX_TARGET_0_OBJECT_HP, GetGameObjectHP(Target0Idx) );
	SetModeData( DATA_IDX_TARGET_1_OBJECT_HP, GetGameObjectHP(Target1Idx) );

	-- 모드 데이터 초기화
	for i = DATA_IDX_ACC_USER_DAMAGE_START, DATA_IDX_ACC_USER_DAMAGE_END, 1 do
		SetModeData( i, 0 );
	end
	for i = DATA_IDX_USER_DAMAGE_START, DATA_IDX_USER_DAMAGE_END, 1 do
		SetModeData( i, 0 );
	end
	for i = DATA_IDX_DEFENSE_COUNT_START, DATA_IDX_DEFENSE_COUNT_END, 1 do
		SetModeData( i, 0 );
	end

	return true;
end

-- 유저 들어왔을 때 호출되는 함수
function	OnJoinPlayer( SlotIdx )
	-- 유저가 배틀에 참여 가능한지 여부를 판단
	AcceptJoinPlayer( SlotIdx );

	if( GetRoundTimer() > 0 ) then
		RespawnPlayer( SlotIdx, 0 );
	end
end

-- 유저 나갔을 때 호출되는 함수
function	OnDetachPlayer( SlotIdx )
	if( GetPlayerCount( TEAM["RED"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리로 배틀 종료
		FinishBattle( TEAM["BLUE"] );
	elseif( GetPlayerCount( TEAM["BLUE"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리로 배틀 종료
		FinishBattle( TEAM["RED"] );
	end
end

function	CheckPreStartStageCondition()
	if( GetPlayerCount( TEAM["RED"] ) > 0 and GetPlayerCount( TEAM["BLUE"] ) > 0 ) then
		StartBattle();
	end
end

-- 배틀을 시작했을 때 호출되는 함수
function	OnStartStage()
end

-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound()
	for i = DATA_IDX_USER_DAMAGE_START, DATA_IDX_USER_DAMAGE_END, 1 do
		SetModeData( i, 0 );
	end
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound()
	SetRoundTimer( GetConfigTime() );

	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) ) then
			RespawnPlayer( i , 0 );
		end
	end
end

-- 라운드를 종료했을 때 호출되는 함수
function	OnEndRound()
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) == true ) then
			-- 라운드 결과 경험치 계산
			local RawExp = 0;
			local RoundKillCount = math.min( iLimitKillPerRound, GetRoundKillCount( i ) );
			local LowRangeKillCount = iLimitKillPerRound*0.3;
			local MidRangeKillCount = (iLimitKillPerRound*0.7) - LowRangeKillCount;
			local HighRangeKillCount = iLimitKillPerRound - (LowRangeKillCount + MidRangeKillCount);

			-- 라운드 점수
			RawExp = RawExp + ( iRoundScore );

			-- 라운드당 킬 경험치
			if( RoundKillCount > 0 ) then
				RawExp = RawExp + ( math.min(RoundKillCount, LowRangeKillCount)*fLowKillFactor );
				RoundKillCount = RoundKillCount - LowRangeKillCount;
			end
			if( RoundKillCount > 0 ) then
				RawExp = RawExp + ( math.min(RoundKillCount, MidRangeKillCount)*fLowKillFactor );
				RoundKillCount = RoundKillCount - MidRangeKillCount;
			end
			if( RoundKillCount > 0 ) then
				RawExp = RawExp + ( math.min(RoundKillCount, HighRangeKillCount)*fLowKillFactor );
				RoundKillCount = RoundKillCount - HighRangeKillCount;
			end

			AddBattleExp( i, RawExp );

			-- 미션 수행 횟수 기록
			local UserDamageIdx = DATA_IDX_USER_DAMAGE_START + i;
			local UserAccDamageIdx = DATA_IDX_ACC_USER_DAMAGE_START + i;
			local UserDamage = GetModeData( UserDamageIdx );
			local DestroyCountIdx = DATA_IDX_DEFENSE_COUNT_START + i;
			if( UserDamage > 0 ) then
				AddModeData( DestroyCountIdx, 1 );
				AddModeData( UserAccDamageIdx, UserDamage );
			end

			local Target0HP = GetGameObjectHP( GetModeData( DATA_IDX_TARGET_0_OBJECT ) );
			local Target1HP = GetGameObjectHP( GetModeData( DATA_IDX_TARGET_1_OBJECT ) );

			AddModeData( DATA_IDX_REMAIN_HP, Target0HP );
			AddModeData( DATA_IDX_REMAIN_HP, Target1HP );
		end
	end

	-- 배틀 종료 여부 확인
	if( ( GetTeamScore( TEAM["RED"] ) == GetConfigRoundCount() ) and ( GetTeamScore( TEAM["BLUE"] ) == GetConfigRoundCount() ) ) then
		FinishBattle( TEAM["DRAW"] );
	elseif( GetTeamScore( TEAM["RED"] ) == GetConfigRoundCount() ) then
		FinishBattle( TEAM["RED"] );
	elseif( GetTeamScore( TEAM["BLUE"] ) == GetConfigRoundCount() ) then
		FinishBattle( TEAM["BLUE"] );
	end
end

-- 배틀을 종료했을 때 호출되는 함수
function	OnEndStage()
	local AllPlayerCount = GetPlayerCount( TEAM["BOTH"] );
	-------------------------------------------------------------
	-- 경험치 계산 ( 배틀 전체 누적 행외, 승패 결과 및 인원 비율)
	-------------------------------------------------------------
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) == true ) then
			local RawExp = 0;
			-- 미션 점수 (공통)
			RawExp = RawExp + ( math.min(iHeadshotMax, GetBattleHeadshotCount( i )) * iHeadshotScore );
			RawExp = RawExp + ( math.min(iChainKillMax, GetBattleChainKillCount( i )) * iChainKillScore );
			RawExp = RawExp + ( math.min(iChainMeleeMax, GetBattleChainSlugCount( i )) * iChainMeleeScore );

			-- 미션 점수 (모드)
			local DefenseCountIdx = DATA_IDX_DEFENSE_COUNT_START + i;
			RawExp = RawExp + ( math.min( iMissionDefenseMax, GetModeData( DefenseCountIdx ) ) * iMissionDefenseScore );

			local UserAccDamageIdx = DATA_IDX_ACC_USER_DAMAGE_START + i;
			RawExp = RawExp + ( math.min( iMissionDamageMax, GetModeData( UserAccDamageIdx ) ) * iMissionDamageScore );

			RawExp = RawExp + ( math.min( iMissionHpMax, GetModeData( DATA_IDX_REMAIN_HP ) ) * iMissionHpScore );

			-- 배틀내 행위에 의한 경험치만 RawExp로 반영
			AddBattleExp( i, RawExp );

			-- 획득 경험치에 배틀 승패 및 인원 결과 반영 (EndExp)
			local EndExp = GetBattleExp( i );
			-- 승패 가중치
			if( GetWinTeam() == TEAM["DRAW"] ) then
				-- 무승부일때
				EndExp = EndExp * fDrawAllExp;
			elseif( i%TEAM["COUNT"] == GetWinTeam() ) then
				-- 이겼을때
				EndExp = EndExp * fWinAllExp;
			else
				-- 졌을때
				EndExp = EndExp * fLoseAllExp;
			end

			-- 인원 가중치
			if( AllPlayerCount == iMemberMaxVal ) then
				EndExp = EndExp * fMemberMaxRate;
			elseif( iMemberRangeStart >= AllPlayerCount and AllPlayerCount >= iMemberRangeEnd ) then
				EndExp = EndExp * fMemberRangeRate;
			else
				EndExp = EndExp * fMemberMinRate;
			end

			SetBattleEndExp( i, EndExp );
		end
	end

	--------------
	-- 포인트 계산
	--------------
	Ranking = GetRanking();
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) == true ) then
			local EndPoint = 0;

			-- 플레이 타임
			EndPoint = EndPoint + (GetPlayTime( i ) / iSecondPerPoint);

			-- 승패 점수
			if( GetWinTeam() == TEAM["DRAW"] ) then
				-- 무승부일때
				EndPoint = EndPoint * fDrawPoint;
			elseif( i%TEAM["COUNT"] == GetWinTeam() ) then
				-- 이겼을때
				EndPoint = EndPoint * fWinPoint;
			else
				-- 졌을때
				EndPoint = EndPoint * fLosePoint;
			end

			-- 등수 점수
			EndPoint = EndPoint + iRankPoint[ Ranking[i] ];

			-- 인원 점수
			EndPoint = EndPoint + iMemberPoint[ AllPlayerCount ];

			-- 미션 점수
			EndPoint = EndPoint + ( math.min(iMaxPoint, GetBattleHeadshotCount(i)) * iHeadshotPoint );
			EndPoint = EndPoint + ( math.min(iMaxPoint, GetBattleChainKillCount(i)) * iChainKillPoint );
			EndPoint = EndPoint + ( math.min(iMaxPoint, GetBattleSlugCount(i)) * iMeleePoint );

			SetBattleEndPoint( i, EndPoint );
		end
	end
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate()
end

-- 유저 죽었을때
function	OnKillPlayer( SlotIdx, KillerIdx )
	-- 방어 수행 횟수 기록
	if( GetDeathUserState( SlotIdx ) == CHARA_DEATH_ENEMY_STATE_DEFENCE ) then
		local DefenseCountIdx = DATA_IDX_DEFENSE_COUNT_START + SlotIdx;
		AddModeData( DefenseCountIdx, 1 );
	end

	RespawnPlayer( SlotIdx, 8 );
end

-- 유저 리스폰 될 때 호출되는 함수
function	OnRespawnPlayer( SlotIdx )
end

function	OnRoundTimeOut()
	AddTeamScore( TEAM["RED"], 1 );
	FinishRound( TEAM["RED"], END_TYPE["TIMEOUT"] );
end

function	OnDamageObject( SlotIdx, ObjectIdx, Damage)
	local Target0Idx = GetModeData(DATA_IDX_TARGET_0_OBJECT);
	local Target1Idx = GetModeData(DATA_IDX_TARGET_1_OBJECT);
	if( (ObjectIdx == Target0Idx )
		or
		(ObjectIdx == Target1Idx )
	) then
		local UserIdx = DATA_IDX_USER_DAMAGE_START + SlotIdx;

		AddModeData( UserIdx, Damage );

		SetModeData( DATA_IDX_TARGET_0_OBJECT_HP, GetGameObjectHP(Target0Idx) );
		SetModeData( DATA_IDX_TARGET_1_OBJECT_HP, GetGameObjectHP(Target1Idx) );

		SyncModeData();
	end

	return true;
end

function	OnDestroyObject( SlotIdx, ObjectIdx )
	if( (ObjectIdx == GetModeData(DATA_IDX_TARGET_0_OBJECT) )
		or
		(ObjectIdx == GetModeData(DATA_IDX_TARGET_1_OBJECT) )
	) then
		local Target0ObjectHP = GetGameObjectHP( GetModeData(DATA_IDX_TARGET_0_OBJECT) ) / GetGameObjectMaxHP( GetModeData(DATA_IDX_TARGET_0_OBJECT) );
		local Target1ObjectHP = GetGameObjectHP( GetModeData(DATA_IDX_TARGET_1_OBJECT) ) / GetGameObjectMaxHP( GetModeData(DATA_IDX_TARGET_1_OBJECT) );

		if( (Target0ObjectHP + Target1ObjectHP) <= 0 ) then
			AddTeamScore( TEAM["BLUE"], 1 );
			FinishRound( TEAM["BLUE"], END_TYPE["GENERATOR_DESTROY"] );
		end
	end
end
