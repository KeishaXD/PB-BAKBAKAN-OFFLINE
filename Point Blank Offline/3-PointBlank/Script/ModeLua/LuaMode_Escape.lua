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
iRoundScore				= 170
iLimitKillPerRound		= 80
fLowKillFactor			= 2
fMidKillFactor			= 1.5
fHighKillFactor			= 1
iHeadshotMax			= 10
iHeadshotScore			= 2
iChainKillMax			= 10
iChainKillScore			= 2
iChainMeleeMax			= 10
iChainMeleeScore		= 2
fWinAllExp				= 1
fDrawAllExp				= 0.8
fLoseAllExp				= 0.7
fExpPerRound			= 1
fExpPerKill				= 2
fExpPerMission			= 1
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

-- 타이머 인덱스
TIMER_IDX_BLOCK			= 0

-- 트리거 인덱스
TRIGGER_IDX_INTERCEPT			= 0
TRIGGER_IDX_TOUCHDOWN			= 1

-- 모드 데이터 인덱스
DATA_IDX_TOUCHDOWN_COUNT_START	= 0
DATA_IDX_TOUCHDOWN_COUNT_END	= 15
DATA_IDX_INTERCEPT_COUNT_START	= 16
DATA_IDX_INTERCEPT_COUNT_END	= 31
DATA_IDX_INTERCEPT_POSITION_START	= 32
DATA_IDX_INTERCEPT_POSITION_END		= 47
DATA_IDX_DINOSLOT_TREX				= 48
DATA_IDX_DINOSLOT_RAPTOR_START		= 49
DATA_IDX_DINOSLOT_RAPTOR_END		= 64

-- 배틀룸을 만들었을 때 호출되는 함수
function	OnStageConfig( type, id )
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
	-- 나가는 유저가 TREX 였으면 TREX를 미정으로 변경
	if( GetModeData(DATA_IDX_DINOSLOT_TREX) == SlotIdx ) then
		SetModeData( DATA_IDX_DINOSLOT_TREX, -1 );
	end

	if( GetPlayerCount( TEAM["RED"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리
		FinishBattle( TEAM["BLUE"] );
	elseif( GetPlayerCount( TEAM["BLUE"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리
		FinishBattle( TEAM["RED"] );
	end
end

-- 배틀 시작 가능한 인원이 들어왔는지 확인.
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
	-- 라운드 시작 전이기 때문에 라운드 수가 증가하기 전입니다.
	-- 1라운드 공룡 설정시 GetRoundCount()가 0일 때,
	-- 2라운드 공룡 설정시 GetRoundCount()가 1일 때 입니다.
	local i = 0;
	for i = 0, 15, 1 do
		local DinoSlotIdx = DATA_IDX_DINOSLOT_RAPTOR_START+i;
		if( (GetRoundCount()%2) == (i%2) ) then
			SetModeData( DinoSlotIdx, 1 );
		else
			SetModeData( DinoSlotIdx, 0 );
		end
	end

	if( GetRoundCount()%2 == TEAM["RED"] ) then
		if( GetPlayerCount( TEAM["RED"] ) > 1 ) then
			SetModeData( DATA_IDX_DINOSLOT_TREX, math.floor(math.random(0,7))*2 );
		else
			SetModeData( DATA_IDX_DINOSLOT_TREX, -1 );
		end
	else
		if( GetPlayerCount( TEAM["BLUE"] ) > 1 ) then
			SetModeData( DATA_IDX_DINOSLOT_TREX, 1+(math.floor(math.random(0,7))*2));
		else
			SetModeData( DATA_IDX_DINOSLOT_TREX, -1 );
		end
	end
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound()
	SetRoundTimer( GetConfigTime() );

	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) ) then
			RespawnPlayer( i , 1 );
		end
	end
end

-- 라운드를 종료했을 때 호출되는 함수
function	OnEndRound()
	-- 배틀 종료 여부 확인 (2라운드 종료되면 게임 끝)
	if( GetRoundCount() == 2 ) then
		if( GetTeamScore( TEAM["RED"] ) > GetTeamScore( TEAM["BLUE"] ) ) then
			FinishBattle( TEAM["RED"] );
		elseif( GetTeamScore( TEAM["RED"] ) < GetTeamScore( TEAM["BLUE"] ) ) then
			FinishBattle(  TEAM["BLUE"] );
		else
			FinishBattle( TEAM["DRAW"] );
		end
	end
end

-- 배틀을 종료했을 때 호출되는 함수
function	OnEndStage()
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate()
end

-- 유저 죽었을때.....
function	OnKillPlayer( SlotIdx, KillerIdx )
	-- 인터셉트 처리
	local DeathUserPositionIdx = DATA_IDX_INTERCEPT_POSITION_START + SlotIdx;
	if( GetModeData( DeathUserPositionIdx ) == TRIGGER_IDX_INTERCEPT ) then
		local UserInterceptIdx = DATA_IDX_INTERCEPT_COUNT_START + KillerIdx;
		AddModeData( UserInterceptIdx, 1 );

		AddTeamScore( KillerIdx%TEAM["COUNT"], 2 );
	end

	AddTeamScore( SlotIdx%TEAM["COUNT"], 1 );
	RespawnPlayer( SlotIdx, 8 );
end

-- 유저 리스폰 될 때 호출되는 함수
function	OnRespawnPlayer( SlotIdx )
	if( (GetRoundCount()+1)%2 == TEAM["RED"] ) then
		if( (GetModeData(DATA_IDX_DINOSLOT_TREX) == -1) and
			(GetPlayerCount( TEAM["RED"] ) > 1 ) ) then
			SetModeData( DATA_IDX_DINOSLOT_TREX, SlotIdx );
		end
	else
		if( (GetModeData(DATA_IDX_DINOSLOT_TREX) == -1) and
			(GetPlayerCount( TEAM["BLUE"] ) > 1 ) ) then
			SetModeData( DATA_IDX_DINOSLOT_TREX, SlotIdx );
		end
	end
end

function	OnTimeOut( timerIdx )
	if( timerIdx == TIMER_IDX_BLOCK ) then
		if( (GetRoundCount()%2) == 1 ) then
			-- 홀수 라운드는 블루 방어
			AddTeamScore( TEAM["BLUE"], 5 );
		else
			-- 짝수 라운드는 레드 방어
			AddTeamScore( TEAM["RED"], 5 );
		end
	end
end

function	OnRoundTimeOut()
	FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
end

function	OnEnterTrigger( SlotIdx, triggerIdx )
	if( triggerIdx == TRIGGER_IDX_INTERCEPT ) then
		local UserPositionIdx = DATA_IDX_INTERCEPT_POSITION_START + SlotIdx;
		SetModeData( UserPositionIdx, 1 );
	end

	if( triggerIdx == TRIGGER_IDX_TOUCHDOWN ) then
		AddTeamScore( SlotIdx%TEAM["COUNT"], 5 );

		local UserTouchdownIdx = DATA_IDX_TOUCHDOWN_COUNT_START + SlotIdx;
		AddModeData( UserTouchdownIdx, 1 );

		SetTimer( TIMER_IDX_BLOCK, 30 );
	end
end

function	OnLeaveTrigger( triggerIdx )
	if( triggerIdx == TRIGGER_IDX_INTERCEPT ) then
		local UserPositionIdx = DATA_IDX_INTERCEPT_POSITION_START + SlotIdx;
		SetModeData( UserPositionIdx, 0 );
	end
end
