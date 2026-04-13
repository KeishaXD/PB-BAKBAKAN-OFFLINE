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
	FinishBattle( GetWinTeam() );
end

-- 배틀을 종료했을 때 호출되는 함수
function	OnEndStage()
	local AllPlayerCount = GetPlayerCount( TEAM["BOTH"] );
	-------------------------------------------------------------
	-- 경험치 계산 ( 배틀 전체 누적 행외, 승패 결과 및 인원 비율)
	-------------------------------------------------------------
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

			RawExp = RawExp + ( math.min(iHeadshotMax, GetBattleHeadshotCount( i )) * iHeadshotScore );
			RawExp = RawExp + ( math.min(iChainKillMax, GetBattleChainKillCount( i )) * iChainKillScore );
			RawExp = RawExp + ( math.min(iChainMeleeMax, GetBattleChainSlugCount( i )) * iChainMeleeScore );

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
	if( GetTeamScore( TEAM["BLUE"] ) < GetTeamScore( TEAM["RED"] ) ) then
		FinishRound( TEAM["RED"], END_TYPE["MAX_KILL"] );
	elseif( GetTeamScore( TEAM["RED"] ) < GetTeamScore( TEAM["BLUE"] ) ) then
		FinishRound( TEAM["BLUE"], END_TYPE["MAX_KILL"] );
	else
		FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
	end
end
