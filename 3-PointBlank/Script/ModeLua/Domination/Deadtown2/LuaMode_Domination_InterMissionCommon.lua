--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
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
	nil,	--  1.PRESTARTROUNDFUNCTION
	nil,	--  2.STARTROUNDFUNCTION
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
