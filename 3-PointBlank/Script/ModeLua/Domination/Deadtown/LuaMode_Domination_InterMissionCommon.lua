--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_IntermissionCommon()
	local Day = GetModeData(DATA_IDX_DAY_NUMBER);
	local Wave = GetModeData(DATA_IDX_WAVE_NUMBER);

	ScriptDebugMsg(" InterMission Day: " .. Day .. ", Wave: " .. Wave );

	if( Day == 1 and Wave == 1 ) then
		UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_5");
		UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_6");
		UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_7");
		UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_8");
	elseif( Day == 1 and Wave == 2 ) then
		UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_13");
		UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_14");
		UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_15");
		UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_16");
	elseif( Day == 1 and Wave == 3 ) then
		UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_21");
		UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_22");
		UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_23");
		UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_24");
	elseif( Day == 2 and Wave == 1 ) then
		UserRespawnPosition[1] = GetRespawnObject("D2_C_PLayer_5");
		UserRespawnPosition[2] = GetRespawnObject("D2_C_PLayer_6");
		UserRespawnPosition[3] = GetRespawnObject("D2_C_PLayer_7");
		UserRespawnPosition[4] = GetRespawnObject("D2_C_PLayer_8");
	elseif( Day == 2 and Wave == 2 ) then
		UserRespawnPosition[1] = GetRespawnObject("D2_C_PLayer_13");
		UserRespawnPosition[2] = GetRespawnObject("D2_C_PLayer_14");
		UserRespawnPosition[3] = GetRespawnObject("D2_C_PLayer_15");
		UserRespawnPosition[4] = GetRespawnObject("D2_C_PLayer_16");
	elseif( Day == 2 and Wave == 3 ) then
		UserRespawnPosition[1] = GetRespawnObject("D2_C_PLayer_21");
		UserRespawnPosition[2] = GetRespawnObject("D2_C_PLayer_22");
		UserRespawnPosition[3] = GetRespawnObject("D2_C_PLayer_23");
		UserRespawnPosition[4] = GetRespawnObject("D2_C_PLayer_24");
	end
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_IntermissionCommon()
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		if( IsBattlePlayer( i ) ) then
			if( IsActivePlayer( i ) ) then
				RespawnPlayer( i , 1, UserRespawnPosition[UserNo[i]] );
			else
				local UserRespawnRemainIdx = DATA_IDX_RESPAWN_REMAIN_START + i;
				if( GetModeData( UserRespawnRemainIdx ) > 0 ) then
					RespawnPlayer( i, 1, UserRespawnPosition[UserNo[SlotIdx]] );
				end
			end
		end
	end

	SetTimer( TIMER_IDX_SP_CHARGE, SPSupplyTime, true );
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		SPSupplyRemainTime[i] = SPSupplyTime;
	end
end

-- 라운드 시간이 종료됐을떄 호출되는 함수
function	OnRoundTimeOut_IntermissionCommon()
	FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 타이머 이벤트 사용시 타이머 만료됐을때 호출되는 함수
function	OnTimeOut_IntermissionCommon( timerIdx )
	if( timerIdx == TIMER_IDX_COUNTDOWN ) then
		FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
	end
end

-- 특수키 처리 요청이 들어왔을 때 호출되는 함수
function	OnKeyProc_IntermissionCommon( SlotIdx, Key )
	-- 인터미션에서 특수키를 누르면 레디 상태 토글 및 레디된 인원수 갱신
	if( Key == GAME_KEY_MAP.SPECIALACTION ) then
		if( ReadyUser[SlotIdx] == false ) then
			ReadyUser[SlotIdx] = true;
			ReadyUserCount = ReadyUserCount + 1;

			local ReadyFlag = GetModeData( DATA_IDX_IM_USER_READY_FLAG );
			ReadyFlag = SetFlag( ReadyFlag, SlotIdx, true );
			SetModeData( DATA_IDX_IM_USER_READY_FLAG, ReadyFlag );
		else
			ReadyUser[SlotIdx] = false;
			ReadyUserCount = ReadyUserCount - 1;

			local ReadyFlag = GetModeData( DATA_IDX_IM_USER_READY_FLAG );
			ReadyFlag = SetFlag( ReadyFlag, SlotIdx, false );
			SetModeData( DATA_IDX_IM_USER_READY_FLAG, ReadyFlag );
		end
	end

	-- 카운트 다운하고 있지 않은 상태에서 모두 레디 되면 카운트 다운 켬
	if( GetTimer( TIMER_IDX_COUNTDOWN ) == 0 and
		ReadyUserCount == UserCount ) then
		SetTimer( TIMER_IDX_COUNTDOWN, 10, true );
		return EVENT_ERROR_SUCCESS;
	-- 카운트 다운 하고 있을때 모든 유저가 레디하고 있지 않으면 카운트 다운 끔
	elseif ( GetTimer( TIMER_IDX_COUNTDOWN ) > 0 and
			ReadyUserCount < UserCount ) then
		KillTimer( TIMER_IDX_COUNTDOWN, true );
		return EVENT_ERROR_SUCCESS;
	end

	return EVENT_ERROR_FAIL;
end

DAY_WAVE_FUNCTION_INTERMISSIONCOMMON = {
	OnPreStartRound_IntermissionCommon,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_IntermissionCommon,	--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	OnRoundTimeOut_IntermissionCommon,	--  5.ROUNDTIMEOUTFUNCTION
	OnTimeOut_IntermissionCommon,	--  6.TIMEOUTFUNCTION
	nil,	--  7.INSTALLFUNCTION
	nil,	--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	nil,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	OnKeyProc_IntermissionCommon,		-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
}
