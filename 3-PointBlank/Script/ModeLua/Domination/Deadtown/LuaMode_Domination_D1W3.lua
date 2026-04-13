D1W3_Trigger1EventEnable = false;
D1W3_Trigger2EventEnable = false;
D1W3_Trigger3EventEnable = false;
D1W3_Trigger4EventEnable = false;

--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D1W3()
	D1W3_Trigger1EventEnable = true;
	D1W3_Trigger2EventEnable = true;
	D1W3_Trigger3EventEnable = true;
	D1W3_Trigger4EventEnable = true;

	UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_17");
	UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_18");
	UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_19");
	UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_20");
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D1W3()
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

	SendEventAlarm( 12 );

	CreateAI( "D1_W3_1_Dino_1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_327"), 1 );
	CreateAI( "D1_W3_1_Dino_1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_316"), 1 );
	CreateAI( "D1_W3_1_Dino_1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_296"), 1 );
	CreateAI( "D1_W3_1_Dino_5 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_310"), 1 );
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D1W3( SlotType, SlotIdx, TriggerIdx )
	if( D1W3_Trigger1EventEnable == true and
		TriggerIdx == GetTriggerObject("D1_W3_1_Trigger_1") and
		SlotType == SLOT_TYPE_USER ) then
		SendEventAlarm( 12 );
		CreateAI( "D1_W3_1_Dino_2 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_297"), 1 );
		CreateAI( "D1_W3_1_Dino_3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_311"), 1 );
		CreateAI( "D1_W3_1_Dino_4 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_295"), 1 );
		CreateAI( "D1_W3_1_Dino_4 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_321"), 1 );
		CreateAI( "D1_W3_1_Dino_6 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_300"), 1 );
		CreateAI( "D1_W3_1_Dino_6 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_314"), 1 );
		CreateAI( "D1_W3_1_Dino_6 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_304"), 1 );
		CreateAI( "D1_W3_1_Dino_6 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_308"), 1 );
		D1W3_Trigger1EventEnable = false;
	elseif( D1W3_Trigger2EventEnable == true and
			TriggerIdx == GetTriggerObject("D1_W3_1_Trigger_2") and
			SlotType == SLOT_TYPE_USER ) then
		CreateAI( "D1_W3_1_Dino_7 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_338"), 1 );
		CreateAI( "D1_W3_1_Dino_9 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_298"), 1 );

		SendEventAlarm( 13 );
		CreateAI( "D1_W3_1_Dino_3 - ATTACK", AI_ENEMY, 2, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_294"), 1 );
		CreateAI( "D1_W3_1_Dino_4 - ATTACK", AI_ENEMY, 2, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_320"), 1 );
		CreateAI( "D1_W3_1_Dino_11 - ATTACK", AI_ENEMY, 2, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_327"), 1 );
		CreateAI( "D1_W3_1_Dino_11 - MANUAL", AI_ENEMY, 2, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_329"), 1 );
		D1W3_Trigger2EventEnable = false;
	elseif( D1W3_Trigger3EventEnable == true and
			TriggerIdx == GetTriggerObject("D1_W3_1_Trigger_3") and
			SlotType == SLOT_TYPE_USER ) then
		SendEventAlarm( 15 );
		CreateAI( "D1_W3_1_Dino_8 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_300"), 1 );
		CreateAI( "D1_W3_1_Dino_8 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_297"), 1 );
		CreateAI( "D1_W3_1_Dino_8 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_309"), 1 );
		CreateAI( "D1_W3_1_Dino_8 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_301"), 1 );
		CreateAI( "D1_W3_1_Dino_8 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_310"), 1 );

		CreateAI( "D1_W3_1_Dino_10 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_336"), 1 );
		CreateAI( "D1_W3_1_Dino_10 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_338"), 1 );
		CreateAI( "D1_W3_1_Dino_10 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_340"), 1 );

		CreateAI( "D1_W3_1_Dino_14 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_255"), 1 );
		CreateAI( "D1_W3_1_Dino_14 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_211"), 1 );
		CreateAI( "D1_W3_1_Dino_14 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_205"), 1 );
		CreateAI( "D1_W3_1_Dino_14 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_203"), 1 );
		CreateAI( "D1_W3_1_Dino_14 - DEFFENCE", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_336"), 1 );
		D1W3_Trigger3EventEnable = false;
	elseif( D1W3_Trigger4EventEnable == true and
			TriggerIdx == GetTriggerObject("D1_W3_1_Trigger_4") and
			SlotType == SLOT_TYPE_USER ) then
		SendEventAlarm( 16 );
		CreateAI( "D1_W3_1_Dino_12 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_205"), 1 );
		CreateAI( "D1_W3_1_Dino_12 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_210"), 1 );
		CreateAI( "D1_W3_1_Dino_12 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_193"), 1 );
		CreateAI( "D1_W3_1_Dino_13 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_189"), 1 );
		CreateAI( "D1_W3_1_Dino_13 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_182"), 1 );
		CreateAI( "D1_W3_1_Dino_13 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_192"), 1 );
		CreateAI( "D1_W3_1_Dino_15 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_195"), 1 );
		CreateAI( "D1_W3_1_Dino_15 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_209"), 1 );
		D1W3_Trigger4EventEnable = false;
	end

	-- 공룡을 다 죽이고 인터미션 지역에 들어오면 끝나도록 처리
	-- 인터미션 지역 안와도 끝나게 할지는 레벨팀에 확인
	local DinoRemainCount = GetModeData(DATA_IDX_REMAIN_DINO_COUNT);
	if( TriggerIdx == GetTriggerObject("D1_W3_IM") and
		SlotType == SLOT_TYPE_USER and
		D1W3_Trigger2EventEnable == false and
		D1W3_Trigger4EventEnable == false
--		and
--		DinoRemainCount <= 0
		) then
		WAVE_GOAL_COMPLETE = true;
		FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
	end
end

DAY_WAVE_FUNCTION_D1W3 = {
	OnPreStartRound_D1W3,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D1W3,		--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	nil,	--  6.TIMEOUTFUNCTION
	nil,	--  7.INSTALLFUNCTION
	nil,	--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	OnEnterTrigger_D1W3,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	nil,		-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
}

