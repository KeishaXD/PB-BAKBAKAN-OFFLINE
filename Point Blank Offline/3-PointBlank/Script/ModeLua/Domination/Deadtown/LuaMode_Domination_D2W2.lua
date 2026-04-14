-- 여러개의 웨이브로 나눠서 진행되도록 기획되어있지만,
-- 라운드가 넘어가면 게임오브젝트들이 초기화 되어버리므로 한 라운드 내에서 처리해야 합니다.
-- 한 라운드에서 웨이브만 바뀌는것처럼 리스폰 시키고 할 수 있으나
-- 클라이언트에서 현재 웨이브와 목표 보여주는 UI 출력을 할수 없습니다;;
-- EventAlarm 으로 출력되는 내용에 강제로 현재 웨이브 목표를 보여주게 한다면 가능할듯.
D2W2_Trigger1EventEnable = false;

D2W2_DefenceMissionStart = false;

D2W2_AnalyseCount		 = 0;

D2W2_TargetHP50_EventEnable	 = false;

--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D2W2()
	-- 한번 발생하는 트리거 이벤트 체크를 위한 플래그
	D2W2_Trigger1EventEnable = true;
	D2W2_TargetHP50_EventEnable = true;

	UserRespawnPosition[1] = GetRespawnObject("D2_C_PLayer_9");
	UserRespawnPosition[2] = GetRespawnObject("D2_C_PLayer_10");
	UserRespawnPosition[3] = GetRespawnObject("D2_C_PLayer_11");
	UserRespawnPosition[4] = GetRespawnObject("D2_C_PLayer_12");

	Target0Idx = GetGameObject("D2_W2_Defense_Obj_1");
	SetModeData( DATA_IDX_D2W2_TARGET_0_OBJECT, 	Target0Idx );
	SetModeData( DATA_IDX_D2W2_TARGET_0_OBJECT_HP,	GetGameObjectHP(Target0Idx) );
	SetModeData( DATA_IDX_D2W2_TARGET_0_REMAIN_HP,	GetGameObjectHP(Target0Idx) );
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D2W2()
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

	-- 게임 오브젝트 사용 기능이 구현되어있지 않아 테스트를 위해 바로 사용한 상태로 시작
	SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
	D2W2_DefenceMissionStart = true;
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
function	OnTimeOut_D2W2( timerIdx )
	if( TIMER_IDX_D2W2_ANALYSE == timerIdx ) then
		D2W2_AnalyseCount = D2W2_AnalyseCount + 1;

		local DinoRemainCount = GetModeData( DATA_IDX_REMAIN_DINO_COUNT );

		if( D2W2_AnalyseCount == 1 ) then
			if( DinoRemainCount > 0 ) then		-- 이전 공룡 전멸 못시키고 시간이 지났을떄
				SendEventAlarm( 26 );
			end

			-- 웨이브 넘어간것으로 처리
			SetModeData( DATA_IDX_WAVE_NUMBER, DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER]+D2W2_AnalyseCount );
			-- 리스폰도 필요함?

			-- Event 3 Dino 생성
			SendEventAlarm( 27 );
			SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
		elseif( D2W2_AnalyseCount == 1 ) then
			if( DinoRemainCount > 0 ) then		-- 이전 공룡 전멸 못시키고 시간이 지났을떄
				SendEventAlarm( 28 );
			end

			-- 웨이브 넘어간것으로 처리
			SetModeData( DATA_IDX_WAVE_NUMBER, DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER]+D2W2_AnalyseCount );
			-- 리스폰도 필요함?

			-- Event 4 Dino 생성
			SendEventAlarm( 29 );
			SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
		elseif( D2W2_AnalyseCount == 1 ) then
			if( DinoRemainCount > 0 ) then		-- 이전 공룡 전멸 못시키고 시간이 지났을떄
				SendEventAlarm( 30 );
			end

			-- 웨이브 넘어간것으로 처리
			SetModeData( DATA_IDX_WAVE_NUMBER, DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER]+D2W2_AnalyseCount );
			-- 리스폰도 필요함?

			-- Event 5 Dino 생성
			SendEventAlarm( 31 );
			SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
		elseif( D2W2_AnalyseCount == 1 ) then
			if( DinoRemainCount > 0 ) then		-- 이전 공룡 전멸 못시키고 시간이 지났을떄
				SendEventAlarm( 32 );
			end

			-- 웨이브 넘어간것으로 처리
			SetModeData( DATA_IDX_WAVE_NUMBER, DAY_WAVE_LIST[DayWaveCount][WAVE_NUMBER]+D2W2_AnalyseCount );
			-- 리스폰도 필요함?

			-- Event 6 Dino 생성
			SendEventAlarm( 33 );
			SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
		else
			-- 방어 임무 완료
			SendEventAlarm( 34 );
			WAVE_GOAL_COMPLETE = true;
			FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
		end
	end
end

function OnAnnihilateAIGroup_D2W2( GroupName )
	local DinoRemainCount = GetModeData( DATA_IDX_REMAIN_DINO_COUNT );

	if ( DinoRemainCount == 0 ) then
		if( D2W2_AnalyseCount == 1 ) then
			SendEventAlarm( 26 );
		elseif( D2W2_AnalyseCount == 1 ) then
			SendEventAlarm( 28 );
		elseif( D2W2_AnalyseCount == 1 ) then
			SendEventAlarm( 30 );
		elseif( D2W2_AnalyseCount == 1 ) then
			SendEventAlarm( 32 );
		end
	end
end

-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D2W2( SlotType, SlotIdx, TriggerIdx )
	if( D2W2_Trigger1EventEnable == true and
		TriggerIdx == GetTriggerObject("D2_W2_1_Trigger_1") and
		--TriggerIdx == 1 and
		SlotType == SLOT_TYPE_USER ) then
		SendEventAlarm( 23 );
		D2W2_Trigger1EventEnable = false;
	end
end

function	OnDamageObject_D2W2( SlotIdx, ObjectIdx, Damage)
	local Target0Idx = GetModeData(DATA_IDX_D2W2_TARGET_0_OBJECT)
	ScriptDebugMsg("OnDamageObject - ObjectIdx : " .. ObjectIdx .. ", Damage : " .. Damage );
	if( D2W2_DefenceMissionStart == true and
		ObjectIdx == Target0Idx ) then
		local TargetMaxHP = GetModeData( DATA_IDX_D2W2_TARGET_0_OBJECT_HP );
		local TargetHP = GetGameObjectHP(Target0Idx) - Damage;
		ScriptDebugMsg("OnDamageObject - TargetMaxHP : " .. TargetMaxHP .. ", TargetHP : " .. TargetHP );
		if( TargetHP < 0 ) then TargetHP = 0; end
		SetModeData( DATA_IDX_D2W2_TARGET_0_REMAIN_HP, TargetHP );
		SyncModeData();

		local HPRate = (TargetHP*100) / TargetMaxHP;
		if( D2W2_TargetHP50_EventEnable == true and
			HPRate < 50 ) then
			SendEventAlarm( 35 );
			D2W2_TargetHP50_EventEnable = false;
		end

		return true;
	end

	return false;
end

function	OnDestroyObject_D2W2( SlotIdx, ObjectIdx )
	if( ObjectIdx == GetModeData(DATA_IDX_D2W2_TARGET_0_OBJECT) ) then
		ScriptDebugMsg("OnDestroyObject_D2W2 - ObjectIdx : " .. ObjectIdx  );
		WAVE_GOAL_COMPLETE = false;
		FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
	end
end

-- 특수키 처리 요청이 들어왔을 때 호출되는 함수
function	OnKeyProc_D2W2( SlotIdx, Key )
	if( Key == GAME_KEY_MAP.SPECIALACTION ) then
		-- 방어 임무 시작
		SendEventAlarm( 24 );
		SetTimer( TIMER_IDX_D2W2_ANALYSE, 60 );
		D2W2_DefenceMissionStart = true;

		-- Event 2 Dino 생성

		-- 연달아 발생하는 이벤트 맞나?
		SendEventAlarm( 25 );
	end
end

DAY_WAVE_FUNCTION_D2W2 = {
	OnPreStartRound_D2W2,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D2W2,		--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	OnTimeOut_D2W2,	--  6.TIMEOUTFUNCTION
	nil,	--  7.INSTALLFUNCTION
	nil,	--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	OnDamageObject_D2W2,	-- 10.DAMAGEOBJECTFUNCTION
	OnDestroyObject_D2W2,	-- 11.DESTROYOBJECTFUNCTION
	OnEnterTrigger_D2W2,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	OnKeyProc_D2W2,	-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
	nil,	-- 16.GAMEOBJECTUSEFUNCTION
}

