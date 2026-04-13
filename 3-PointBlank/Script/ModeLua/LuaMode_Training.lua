-- 상수 값
TEAM = {
	RED		= 0,
	BLUE	= 1,
	BOTH	= 2,
	COUNT	= 2,
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

SLOT_MAX_COUNT	= 16
SLOT_IDX_START	= 0
SLOT_IDX_END	= 15

-- 배틀룸을 만들었을 때 호출되는 함수
function	OnStageConfig( type, id )
	return true;
end

-- 유저 들어왔을 때 호출되는 함수
function	OnJoinPlayer( SlotIdx )
	-- 유저가 배틀에 참여 가능한지 여부를 판단
	AcceptJoinPlayer( SlotIdx );
	RespawnPlayer( SlotIdx, 1 );
end

-- 유저 나갔을 때 호출되는 함수
function	OnDetachPlayer( SlotIdx )
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
	--if( GetPlayerCount( TEAM["RED"] ) > 0 and GetPlayerCount( TEAM["BLUE"] ) > 0 ) then
		StartBattle();
	--end
end

-- 배틀을 시작했을 때 호출되는 함수
function	OnStartStage()
end

-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound()
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound()
	SetRoundTimer( GetConfigTime() );

	CreateAI( "SecondGroup", 15, "AI_NormalDino.lua", GetRespawnObject("W1_Player_Respawn_1"), 100 );
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) ) then
			RespawnPlayer( i , 1 );
		end
	end
end

-- 라운드를 종료했을 때 호출되는 함수
function	OnEndRound()
	FinishBattle( GetWinTeam() );
end

-- 배틀을 종료했을 때 호출되는 함수
function	OnEndStage()
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate()
end

-- 유저 죽었을때.....
function	OnKillPlayer( SlotIdx, KillerIdx )
	AddTeamScore( KillerIdx%TEAM["COUNT"], 1 );

	if( GetConfigEndKillCount() <= GetTeamScore( TEAM["RED"] ) ) then
		FinishRound( TEAM["RED"], END_TYPE["MAX_KILL"] );
	elseif( GetConfigEndKillCount() <= GetTeamScore( TEAM["BLUE"] ) ) then
		FinishRound( TEAM["BLUE"], END_TYPE["MAX_KILL"] );
	end

	RespawnPlayer( SlotIdx, 8 );
end

-- 유저 리스폰 될 때 호출되는 함수
function	OnRespawnPlayer( SlotIdx )
end

function	OnTimeOut( timerIdx )
end

function	OnRoundTimeOut()
	FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
end
