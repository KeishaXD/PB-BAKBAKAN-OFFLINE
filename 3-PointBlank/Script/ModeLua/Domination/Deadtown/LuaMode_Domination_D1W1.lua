D1W1_TriggerEventEnable		= {};
D1W1_TriggerEventEndTime	= {};
D1W1_TriggerEventAIGrpCnt	= {};
D1W1_EventHasAIGrp			= {};

D1W1_SupplyBaseHPIdx = 0;
D1W1_SupplyBaseAMMOIdx = 0;
D1W1_RecoverObjIdx = 0;
--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D1W1()
		-- 한번 발생하는 트리거 이벤트 체크를 위한 플래그
		D1W1_TriggerEventEndTime[0]		= 0;
		D1W1_TriggerEventAIGrpCnt[0]	= 0;
		for i = 1, 4, 1 do
			D1W1_TriggerEventEnable[i]		= true;
			D1W1_TriggerEventEndTime[i]		= 0;
			D1W1_TriggerEventAIGrpCnt[i]	= 0;
		end

		D1W1_TriggerEventEnable[3] = false;

		UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_1");
		UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_2");
		UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_3");
		UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_4");

		GetPlayerPosition(0);
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D1W1()
 	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
 		if( IsBattlePlayer( i ) ) then
 			UsedSkillItem[i+1] = SupplyBaseHP;
 			D1W1_SupplyBaseHPIdx = InstallObject( i, SupplyBaseHP, -4.5, 1.8, -105 );
 			UsedSkillItem[i+1] = SupplyBaseAMMO;
 			D1W1_SupplyBaseAMMOIdx = InstallObject( i, SupplyBaseAMMO, -8.5, 1.8, -95 );

 			D1W1_RecoverObjIdx = InstallObject( i, D1W2_RecoveryObject, -4.5, 1.8, -95 );
 			break;
 		end
 	end

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

	SendEventAlarm( 1 );
	SendEventAlarm( 2 );

	---------------------------------------기본 배치 AI ---------------------------------------------

	CreateAI( "D1_W1_0_2_A", AI_ENEMY, 1, "AI_RaptorB.lua", GetRespawnObject("Dino_Spawn_015"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_2_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_3_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_016"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_3_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_4_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_017"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_4_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_5_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_051"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_5_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_6_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_058"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_6_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_7_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_057"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_7_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_8_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_086"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_8_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_9_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_087"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_9_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_10_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_088"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_10_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_11_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_113"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_11_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_12_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_114"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_12_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_13_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_115"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_13_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;

	CreateAI( "D1_W1_0_14_A", AI_ENEMY, 1, "AI_W1_Basic_VISIBLE.lua", GetRespawnObject("Dino_Spawn_116"), 1 );
	D1W1_EventHasAIGrp["D1_W1_0_14_A"] = 0;
	D1W1_TriggerEventAIGrpCnt[0] = D1W1_TriggerEventAIGrpCnt[0] + 1;


	-------------------------------------------------------------------------------------------------
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate_D1W1()
	local currentTime = GetGameTime();
	for i = 1, 4, 1 do
		if( D1W1_TriggerEventEnable[i] == true ) then
			if( D1W1_TriggerEventEndTime[i-1] ~= 0 and
				D1W1_TriggerEventEndTime[i-1] + 10 < currentTime ) then
				ScriptDebugMsg( " Hurry up (" .. i .. ") - PrevTime: " .. D1W1_TriggerEventEndTime[i-1] .. ", currentTime: " .. currentTime );
				SendEventAlarm(999);
				D1W1_TriggerEventEndTime[i-1] = currentTime;	-- 다시 10초후 메시지
			end
			break;	-- 순차적으로 실행되므로 첫번쨰 트리거만 확인
		end
	end
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D1W1( SlotType, SlotIdx, TriggerIdx )
	if( D1W1_TriggerEventEnable[1] == true and
		TriggerIdx == GetTriggerObject("D1_W1_1_Trigger_1") and
		SlotType == SLOT_TYPE_USER ) then

		SendEventAlarm( 3 );

		CreateAI( "D1_W1_1_0_A", AI_ENEMY, 1, "AI_W1_Trigger1_NEAR.lua", GetRespawnObject("Dino_Spawn_000"), 1 );
		D1W1_EventHasAIGrp["D1_W1_1_0_A"] = 1;
		D1W1_TriggerEventAIGrpCnt[1] = D1W1_TriggerEventAIGrpCnt[1] + 1;

		CreateAI( "D1_W1_1_1_A", AI_ENEMY, 1, "AI_W1_Trigger1_FAR.lua", GetRespawnObject("Dino_Spawn_001"), 1 );
		D1W1_EventHasAIGrp["D1_W1_1_1_A"] = 1;
		D1W1_TriggerEventAIGrpCnt[1] = D1W1_TriggerEventAIGrpCnt[1] + 1;

		CreateAI( "D1_W1_1_2_A", AI_ENEMY, 1, "AI_W1_Trigger1_HPMIN.lua", GetRespawnObject("Dino_Spawn_019"), 1 );
		D1W1_EventHasAIGrp["D1_W1_1_2_A"] = 1;
		D1W1_TriggerEventAIGrpCnt[1] = D1W1_TriggerEventAIGrpCnt[1] + 1;

		D1W1_TriggerEventEnable[1] = false;

	elseif( D1W1_TriggerEventEnable[2] == true and
			TriggerIdx == GetTriggerObject("D1_W1_1_Trigger_2")  and
			SlotType == SLOT_TYPE_USER ) then
		if( D1W1_TriggerEventEndTime[1] > 0 ) then

		CreateAI( "D1_W1_2_0_A", AI_ENEMY, 1, "AI_W1_Trigger2_NEAR.lua", GetRespawnObject("Dino_Spawn_054"), 1 );
		D1W1_EventHasAIGrp["D1_W1_2_0_A"] = 2;
		D1W1_TriggerEventAIGrpCnt[2] = D1W1_TriggerEventAIGrpCnt[2] + 1;

		CreateAI( "D1_W1_2_1_A", AI_ENEMY, 1, "AI_W1_Trigger2_FAR.lua", GetRespawnObject("Dino_Spawn_022"), 1 );
		D1W1_EventHasAIGrp["D1_W1_2_1_A"] = 2;
		D1W1_TriggerEventAIGrpCnt[2] = D1W1_TriggerEventAIGrpCnt[2] + 1;

		CreateAI( "D1_W1_2_2_A", AI_ENEMY, 1, "AI_W1_Trigger2_HPMIN.lua", GetRespawnObject("Dino_Spawn_002"), 1 );
		D1W1_EventHasAIGrp["D1_W1_2_2_A"] = 2;
		D1W1_TriggerEventAIGrpCnt[2] = D1W1_TriggerEventAIGrpCnt[2] + 1;

		D1W1_TriggerEventEnable[2] = false;

		else
			SendEventAlarm(998);
		end

	------------------현재 사용 X---------------------------
	elseif( D1W1_TriggerEventEnable[3] == true and
			TriggerIdx == GetTriggerObject("D1_W1_1_Trigger_3")  and
			SlotType == SLOT_TYPE_USER ) then
		if( D1W1_TriggerEventEndTime[2] > 0 ) then
			SendEventAlarm( 5 );

			D1W1_TriggerEventEnable[3] = false;
		else
			SendEventAlarm(998)
		end
	---------------------------------------------------------
	elseif( D1W1_TriggerEventEnable[4] == true and
			TriggerIdx == GetTriggerObject("D1_W1_1_Trigger_4")  and
			SlotType == SLOT_TYPE_USER ) then
		if( D1W1_TriggerEventEndTime[2] > 0 ) then
			SendEventAlarm( 6 );

			CreateAI( "D1_W1_4_0_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMIN.lua", GetRespawnObject("Dino_Spawn_106"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_0_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			CreateAI( "D1_W1_4_1_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMAX.lua", GetRespawnObject("Dino_Spawn_107"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_1_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			CreateAI( "D1_W1_4_2_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMIN2.lua", GetRespawnObject("Dino_Spawn_057"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_2_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			CreateAI( "D1_W1_4_3_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMAX2.lua", GetRespawnObject("Dino_Spawn_058"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_3_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			CreateAI( "D1_W1_4_4_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMIN3.lua", GetRespawnObject("Dino_Spawn_015"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_4_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			CreateAI( "D1_W1_4_5_A", AI_ENEMY, 1, "AI_W1_Trigger4_HPMAX3.lua", GetRespawnObject("Dino_Spawn_017"), 1 );
			D1W1_EventHasAIGrp["D1_W1_4_5_A"] = 4;
			D1W1_TriggerEventAIGrpCnt[4] = D1W1_TriggerEventAIGrpCnt[4] + 1;

			D1W1_TriggerEventEnable[4] = false;
		else
			SendEventAlarm(998);
		end
	end
end

-- 특정 그룹의 AI가 전멸했을때 호출되는 함수
function OnAnnihilateAIGroup_D1W1( GroupName )
	local EventHasAIGrp = D1W1_EventHasAIGrp[GroupName];
	if( EventHasAIGrp ~= nil ) then
		local EventAIGrpCnt = D1W1_TriggerEventAIGrpCnt[EventHasAIGrp];
		EventAIGrpCnt = EventAIGrpCnt - 1;
		if( EventAIGrpCnt == 0 ) then
			D1W1_TriggerEventEndTime[EventHasAIGrp] = GetGameTime();

			if( EventHasAIGrp == 4 ) then
				WAVE_GOAL_COMPLETE = true;
				FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
			end
		end

		D1W1_TriggerEventAIGrpCnt[EventHasAIGrp] = EventAIGrpCnt;
	end
end

function	OnInstall_D1W1( SlotIdx, Weapon )
	if( Weapon == D1W2_RecoveryObject ) then
		return true;
	end
end

function	OnUninstall_D1W1( SlotIdx, Weapon )
	if( Weapon == D1W2_RecoveryObject ) then
		return true;
	end
end

DAY_WAVE_FUNCTION_D1W1 = {
	OnPreStartRound_D1W1,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D1W1,		--  2.STARTROUNDFUNCTION
	OnBattleUpdate_D1W1,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	nil,	--  6.TIMEOUTFUNCTION
	OnInstall_D1W1,			--  7.INSTALLFUNCTION
	OnUninstall_D1W1,		--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	OnEnterTrigger_D1W1,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	nil,	-- 14.KEYPROCFUNCTION
	OnAnnihilateAIGroup_D1W1,	-- 15.ANNIHILATEAIGROUPFUNCTION
}
