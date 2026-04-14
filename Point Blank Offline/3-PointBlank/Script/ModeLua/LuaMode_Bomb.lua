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
iLimitKillPerRound		= 6
fLowKillFactor			= 2
fMidKillFactor			= 1.5
fHighKillFactor			= 1
iHeadshotMax			= 5
iHeadshotScore			= 1
iChainKillMax			= 5
iChainKillScore			= 1
iChainMeleeMax			= 5
iChainMeleeScore		= 1
fWinAllExp				= 1
fDrawAllExp				= 0
fLoseAllExp				= 0.7
fExpPerRound			= 1.7
fExpPerKill				= 3
fExpPerMission			= 2
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
iMissionBombMax			= 15
iMissionBombScore		= 5

-- 모드 설정 값
BOMB_TIMER_IDX		= 0
BOMB_TIME			= 42

MISSION_BOMB_ID		= 5009000

DATA_IDX_BOMB_INSTALL_COUNT_START	= 0
DATA_IDX_BOMB_INSTALL_COUNT_END		= 15
DATA_IDX_BOMB_UNINSTALL_COUNT_START	= 16
DATA_IDX_BOMB_UNINSTALL_COUNT_END	= 31
DATA_IDX_BOMB_INSTALL_USER			= 32
DATA_IDX_BOMB_UNINSTALL_USER		= 33

-- 배틀룸을 만들었을 때 호출되는 함수
function	OnStageConfig( type, id )
	-- 모드 데이터 초기화 (배틀)
	-- 폭탄 설치 횟수
	for i = DATA_IDX_BOMB_INSTALL_COUNT_START, DATA_IDX_BOMB_INSTALL_COUNT_END, 1 do
		SetModeData( i, 0 );
	end
	-- 폭탄 설치 횟수
	for i = DATA_IDX_BOMB_UNINSTALL_COUNT_START, DATA_IDX_BOMB_UNINSTALL_COUNT_END, 1 do
		SetModeData( i, 0 );
	end

	return true;
end

-- 유저 들어왔을 때 호출되는 함수
function	OnJoinPlayer( SlotIdx )
	-- 유저가 배틀에 참여 가능한지 여부를 판단
	AcceptJoinPlayer( SlotIdx );
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

	if( GetActivePlayerCount( TEAM["RED"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리
		FinishRound( TEAM["BLUE"], END_TYPE["ALLDEATH"] );
	elseif( GetActivePlayerCount( TEAM["BLUE"] ) == 0 ) then
		-- 지금 나간 유저의 팀에 남은 인원이 없으면 상대팀 승리
		FinishRound( TEAM["RED"], END_TYPE["ALLDEATH"] );
	end
end

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
end

-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound()
	-- 모드 데이터 초기화
	-- 폭탄 설치 유저
	SetModeData( DATA_IDX_BOMB_INSTALL_USER, UNKNOWN_SLOT_IDX );
	SetModeData( DATA_IDX_BOMB_UNINSTALL_USER, UNKNOWN_SLOT_IDX );
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
		end
	end

	-- 배틀 종료 여부 확인
	if( GetTeamScore( TEAM["RED"] ) == GetConfigRoundCount() ) then
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
			-- 폭탄 설치/해제 경험치
			local BombInstallDataIdx = DATA_IDX_BOMB_INSTALL_COUNT_START + i;
			local BombUninstallDataIdx = DATA_IDX_BOMB_UNINSTALL_COUNT_START + i;
			local BombMissionCount = GetModeData( BombInstallDataIdx) + GetModeData( BombUninstallDataIdx );
			RawExp = RawExp + ( iMissionBombScore * math.min(iMissionBombMax, BombMissionCount) );

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
	if( GetTimer( BOMB_TIMER_IDX ) < 10 ) then
		-- 폭탄 시간 10초 남음
	end
end

-- 유저 죽었을때
function	OnKillPlayer( SlotIdx, KillerIdx )
	if( GetActivePlayerCount( TEAM["RED"] ) == 0 ) then
		if( GetModeData( DATA_IDX_BOMB_INSTALL_USER ) == UNKNOWN_SLOT_IDX ) then
			-- 폭탄이 설치되지 않은 상태로 레드팀 남은 유저가 없으면 블루팀이 라운드 승리
			AddTeamScore( TEAM["BLUE"], 1 );
			FinishRound( TEAM["BLUE"], END_TYPE["ALLDEATH"] );
		end
	elseif( GetActivePlayerCount( TEAM["BLUE"] ) == 0 ) then
		-- 블루팀 남은 유저가 없으면 레드팀이 라운드 승리
		AddTeamScore( TEAM["RED"], 1 );
		FinishRound( TEAM["RED"], END_TYPE["ALLDEATH"] );
	end
end

-- 유저 리스폰 될 때 호출되는 함수
function	OnRespawnPlayer( SlotIdx )
end

function	OnTimeOut( timerIdx )
	if ( timerIdx == BOMB_TIMER_IDX ) then
		-- 폭탄 타이머 완료되면 레드팀 라운드 승리
		AddTeamScore( TEAM["RED"], 1 );
		FinishRound( TEAM["RED"], END_TYPE["BOMBFIRE"] );
	end
end

function	OnRoundTimeOut()
	-- 라운드 제한 시간이 완료되면 블루팀 라운드 승리
	AddTeamScore( TEAM["BLUE"], 1 );
	FinishRound( TEAM["BLUE"], END_TYPE["TIMEOUT"] );
end

function	OnInstall( SlotIdx, Weapon )
	if( Weapon == MISSION_BOMB_ID ) then
		if( GetModeData( DATA_IDX_BOMB_INSTALL_USER ) == UNKNOWN_SLOT_IDX ) then
			SetTimer( BOMB_TIMER_IDX, BOMB_TIME );

			-- 폭탄 설치 수행 횟수 기록
			BombInstallDataIdx = DATA_IDX_BOMB_INSTALL_COUNT_START + SlotIdx;
			AddModeData( BombInstallDataIdx, 1 );

			-- 폭탄 설치한 유저 기록
			SetModeData( DATA_IDX_BOMB_INSTALL_USER, SlotIdx );

			return true;
		end
	end

	return false;
end

function	OnUninstall( SlotIdx, Weapon )
	if( Weapon == MISSION_BOMB_ID ) then
		if( ( GetModeData( DATA_IDX_BOMB_UNINSTALL_USER ) == UNKNOWN_SLOT_IDX ) and
			( GetModeData( DATA_IDX_BOMB_INSTALL_USER ) > UNKNOWN_SLOT_IDX ) ) then
			KillTimer( BOMB_TIMER_IDX );

			-- 폭탄 해체 수행 횟수 기록
			BombUninstallDataIdx = DATA_IDX_BOMB_UNINSTALL_COUNT_START + SlotIdx;
			AddModeData( BombUninstallDataIdx, 1 );

			-- 폭탄 해체한 유저 기록
			SetModeData( DATA_IDX_BOMB_UNINSTALL_USER, SlotIdx );

			AddTeamScore( TEAM["BLUE"], 1 );
			FinishRound( TEAM["BLUE"], END_TYPE["UNINSTALL"] );

			return true;
		end
	end

	return false;
end
