D2W1_Trigger1EventEnable = false;
D2W1_Trigger2EventEnable = false;
D2W1_Trigger3EventEnable = false;
D2W1_Trigger4EventEnable = false;

--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D2W1()
		-- 한번 발생하는 트리거 이벤트 체크를 위한 플래그
		D2W1_Trigger1EventEnable = true;
		D2W1_Trigger2EventEnable = true;
		D2W1_Trigger3EventEnable = true;
		D2W1_Trigger4EventEnable = true;

		UserRespawnPosition[1] = GetRespawnObject("D2_C_Player_1");
		UserRespawnPosition[2] = GetRespawnObject("D2_C_Player_2");
		UserRespawnPosition[3] = GetRespawnObject("D2_C_Player_3");
		UserRespawnPosition[4] = GetRespawnObject("D2_C_Player_4");
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D2W1()
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

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D2W1( SlotType, SlotIdx, TriggerIdx )
	if( D2W1_Trigger1EventEnable == true and
		TriggerIdx == GetTriggerObject("D2_W1_1_Trigger_1") and
		--TriggerIdx == 1 and
		SlotType == SLOT_TYPE_USER ) then
		D2W1_Trigger1EventEnable = false;
	elseif( D2W1_Trigger2EventEnable == true and
			TriggerIdx == GetTriggerObject("D2_W1_1_Trigger_2")  and
			--TriggerIdx == 2 and
			SlotType == SLOT_TYPE_USER ) then
		D2W1_Trigger2EventEnable = false;
	elseif( D2W1_Trigger3EventEnable == true and
			TriggerIdx == GetTriggerObject("D2_W1_1_Trigger_3")  and
			--TriggerIdx == 3 and
			SlotType == SLOT_TYPE_USER ) then
		D2W1_Trigger3EventEnable = false;
	elseif( D2W1_Trigger4EventEnable == true and
			TriggerIdx == GetTriggerObject("D2_W1_1_Trigger_4")  and
			--TriggerIdx == 4 and
			SlotType == SLOT_TYPE_USER ) then
		D2W1_Trigger4EventEnable = false;
	end
end

DAY_WAVE_FUNCTION_D2W1 = {
	OnPreStartRound_D2W1,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D2W1,		--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	nil,	--  6.TIMEOUTFUNCTION
	nil,	--  7.INSTALLFUNCTION
	nil,	--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	OnEnterTrigger_D2W1,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	nil,	-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
}

