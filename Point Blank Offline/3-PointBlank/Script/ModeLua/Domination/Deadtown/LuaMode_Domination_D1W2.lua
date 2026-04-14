D1W2_RecoverObjIdx = 0;

-- 회수오브젝트별 위치
D1W2_RecoverObjectInfo = {};
D1W2_DinoTrigger_Enable = { false, false, false, false };
D1W2_RecoverTarget = 0;
D1W2_RecoverEnd = { false, false, false, false };
D1W2_UserInTrigger = {0, 0, 0, 0};

--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D1W2()
	math.randomseed (os.clock());
	UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_9");
	UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_10");
	UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_11");
	UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_12");

	-- 회수 오브젝트 위치 및 연결할 트리거 설정
	D1W2_RecoverObjectInfo[1] = { 10, 2, 10, GetTriggerObject("D1_W2_1_Trigger_1") };
	D1W2_RecoverObjectInfo[2] = { 10, 2, 0, GetTriggerObject("D1_W2_1_Trigger_2") };
	D1W2_RecoverObjectInfo[3] = { 0, 2, 0, GetTriggerObject("D1_W2_1_Trigger_3") };
	D1W2_RecoverObjectInfo[4] = { 0, 2, 10, GetTriggerObject("D1_W2_1_Trigger_4") };

	SetModeData( DATA_IDX_D1W2_RECOVER_OBJ_COUNT, 4 );
	SetModeData( DATA_IDX_D1W2_RECOVERY_COUNT, 0 );
	SetModeData( DATA_IDX_D1W2_COMPLETE_FLAG, 0 );

	-- 첫번째 회수 목표 설정
	D1W2_RecoverTarget = math.random(1, GetModeData(DATA_IDX_D1W2_RECOVER_OBJ_COUNT) );
	SetModeData( DATA_IDX_D1W2_RECOVER_TARGET, D1W2_RecoverTarget-1 );
	D1W2_DinoTrigger_Enable[D1W2_RecoverTarget] = true;
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D1W2()
	-- 고정 서플라이베이스 및 회수 목표물 설치
 	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
 		if( IsBattlePlayer( i ) ) then
 			UsedSkillItem[i+1] = SupplyBaseHP;
 			D1W1_SupplyBaseHPIdx = InstallObject( i, SupplyBaseHP, -4.5, 1.8, -105 );
 			UsedSkillItem[i+1] = SupplyBaseAMMO;
 			D1W1_SupplyBaseAMMOIdx = InstallObject( i, SupplyBaseAMMO, -8.5, 1.8, -95 );
 			UsedSkillItem[i+1] = D1W2_RecoveryObject;
 			D1W2_RecoverObjIdx = InstallObject( i, D1W2_RecoveryObject, D1W2_RecoverObjectInfo[D1W2_RecoverTarget][1], D1W2_RecoverObjectInfo[D1W2_RecoverTarget][2], D1W2_RecoverObjectInfo[D1W2_RecoverTarget][3] );
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

	SendEventAlarm( 8 );

	CreateAI( "D1_W2_1_Dino_1 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_130"), 1 );
	CreateAI( "D1_W2_1_Dino_2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_067"), 1 );
	CreateAI( "D1_W2_1_Dino_3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_052"), 1 );
	CreateAI( "D1_W2_1_Dino_5 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_124"), 1 );
	CreateAI( "D1_W2_1_Dino_7 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_138"), 1 );
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D1W2( SlotType, SlotIdx, TriggerIdx )
	if( TriggerIdx == D1W2_RecoverObjectInfo[1][4] and
		SlotType == SLOT_TYPE_USER ) then
		D1W2_UserInTrigger[UserNo[SlotIdx]] = TriggerIdx;
		if( D1W2_DinoTrigger_Enable[1] == true ) then
			CreateAI( "D1_W2_1_Dino_4_T1 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_052"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_067"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_121"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T1 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_046"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_113"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_142"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T1 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_134"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_124"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T1 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_244"), 100 );
			SendEventAlarm( 9 );
			D1W2_DinoTrigger_Enable[1] = false;
		end
	elseif( TriggerIdx == D1W2_RecoverObjectInfo[2][4] and
			SlotType == SLOT_TYPE_USER ) then
		D1W2_UserInTrigger[UserNo[SlotIdx]] = TriggerIdx;
		if( D1W2_DinoTrigger_Enable[2] == true ) then
			CreateAI( "D1_W2_1_Dino_4_T2 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_244"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_121"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_132"), 100 );
			CreateAI( "D1_W2_1_Dino_9_T2 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_291"), 100 );
			CreateAI( "D1_W2_1_Dino_9_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_134"), 100 );
			CreateAI( "D1_W2_1_Dino_9_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_063"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T2 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_067"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_080"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T2 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_122"), 100 );
			SendEventAlarm( 9 );
			D1W2_DinoTrigger_Enable[2] = false;
		end
	elseif( TriggerIdx == D1W2_RecoverObjectInfo[3][4] and
			SlotType == SLOT_TYPE_USER ) then
		D1W2_UserInTrigger[UserNo[SlotIdx]] = TriggerIdx;
		if( D1W2_DinoTrigger_Enable[3] == true ) then
			CreateAI( "D1_W2_1_Dino_6_T3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_134"), 100 );
			CreateAI( "D1_W2_1_Dino_6_T3 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_131"), 100 );
			CreateAI( "D1_W2_1_Dino_6_T3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_052"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_138"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T3 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_287"), 100 );
			CreateAI( "D1_W2_1_Dino_8_T3 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_144"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T3 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_242"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T3 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_148"), 100 );
			CreateAI( "D1_W2_1_Dino_11_T3 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_291"), 100 );
			SendEventAlarm( 9 );
			D1W2_DinoTrigger_Enable[3] = false;
		end
	elseif( TriggerIdx == D1W2_RecoverObjectInfo[4][4] and
			SlotType == SLOT_TYPE_USER ) then
		D1W2_UserInTrigger[UserNo[SlotIdx]] = TriggerIdx;
		if( D1W2_DinoTrigger_Enable[4] == true ) then
			CreateAI( "D1_W2_1_Dino_4_T4 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_132"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_244"), 100 );
			CreateAI( "D1_W2_1_Dino_4_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_291"), 100 );
			CreateAI( "D1_W2_1_Dino_6_T4 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_039"), 100 );
			CreateAI( "D1_W2_1_Dino_6_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_052"), 100 );
			CreateAI( "D1_W2_1_Dino_6_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_061"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T4 - ATTACK", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_121"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_076"), 100 );
			CreateAI( "D1_W2_1_Dino_10_T4 - MANUAL", AI_ENEMY, 1, "AI_RaptorA.lua", GetRespawnObject("Dino_Spawn_065"), 100 );
			SendEventAlarm( 9 );
			D1W2_DinoTrigger_Enable[4] = false;
		end
	end
end

function	OnLeaveTrigger_D1W2( SlotType, SlotIdx, TriggerIdx )
	if( SlotType == SLOT_TYPE_USER ) then
		if( TriggerIdx == D1W2_RecoverObjectInfo[1][4] or
			TriggerIdx == D1W2_RecoverObjectInfo[2][4] or
			TriggerIdx == D1W2_RecoverObjectInfo[3][4] or
			TriggerIdx == D1W2_RecoverObjectInfo[4][4] ) then
			D1W2_UserInTrigger[UserNo[SlotIdx]] = 0;
		end
	end
end

function	OnInstall_D1W2( SlotIdx, Weapon )
	if( Weapon == D1W2_RecoveryObject ) then
		return true;
	end
end

function	OnUninstall_D1W2( SlotIdx, Weapon )
	if( D1W2_RecoveryObject == Weapon ) then
		SendEventAlarm(10)

		-- 회수 완료에 대한 처리
		AddModeData( DATA_IDX_D1W2_RECOVERY_COUNT, 1 );				-- 회수 완료된 개수
		local Flag = GetModeData( DATA_IDX_D1W2_COMPLETE_FLAG );
		Flag = SetFlag( Flag, D1W2_RecoverTarget-1 );
		SetModeData( DATA_IDX_D1W2_COMPLETE_FLAG, Flag );			-- 회수된 타겟 플래그 체크
		D1W2_RecoverEnd[D1W2_RecoverTarget] = true;

		-- 다음 타겟 지정
		local existTarget = false;
		local RemainTargetCount = GetModeData(DATA_IDX_D1W2_RECOVER_OBJ_COUNT) - GetModeData(DATA_IDX_D1W2_RECOVERY_COUNT);
		local randomTarget = math.random(1, RemainTargetCount);	-- 중간에서 뽑아서 진행했기 때문에 남은 타겟중 몇번째 타겟을 지정할지 구함
		for i = 1, RemainTargetCount, 1 do	-- 진행된 타겟은 뛰어넘으면서 n번째 타겟 찾기
			if( randomTarget == 1 ) then
				if( D1W2_RecoverEnd[i] == false ) then
					D1W2_RecoverTarget = i;
					existTarget = true;
					break;
				end
			else
				randomTarget = randomTarget - 1;
			end
		end

		if( existTarget == true ) then
			-- 다음 타겟이 있으면
			SetModeData( DATA_IDX_D1W2_RECOVER_TARGET, D1W2_RecoverTarget-1 );
			D1W2_DinoTrigger_Enable[D1W2_RecoverTarget] = true;

 			D1W2_RecoverObjIdx = InstallObject( SlotIdx, D1W2_RecoveryObject, D1W2_RecoverObjectInfo[D1W2_RecoverTarget][1], D1W2_RecoverObjectInfo[D1W2_RecoverTarget][2], D1W2_RecoverObjectInfo[D1W2_RecoverTarget][3] );

			-- 다음 타겟 활성화되는 시점에 해당 트리거에 유저가 이미 있으면 바로 이벤트 동작
			for i = 1, 4, 1 do
				if( D1W2_RecoverObjectInfo[D1W2_RecoverTarget][4] == D1W2_UserInTrigger[i] ) then
					-- 트리거 진입 이벤트를 다시 발생시켜서 처리.. 트리거 이벤트 코드가 변경되면 다시 생각해봐야함
					local UserSlotIdx = 0;
					for j = 0, 15, 1 do
						if (UserNo[j] == i) then UserSlotIdx = j; break; end		-- 해당 유저넘버를 가진 유저의 슬롯 인덱스를 구하고 for문에서 나간다.
					end
					OnEnterTrigger_D1W2( SLOT_TYPE_USER, UserSlotIdx, D1W2_UserInTrigger[i] );
				end
			end
		else
			-- 다음 타겟이 없으면 완료이벤트
			SendEventAlarm(11);
			WAVE_GOAL_COMPLETE = true;
			FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
		end

		return true;
	end
end

DAY_WAVE_FUNCTION_D1W2 = {
	OnPreStartRound_D1W2,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D1W2,		--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	nil,	--  6.TIMEOUTFUNCTION
	OnInstall_D1W2,			--  7.INSTALLFUNCTION
	OnUninstall_D1W2,		--  8.UNINSTALLFUNCTION
	nil,				--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	OnEnterTrigger_D1W2,	-- 12.ENTERTRIGGERFUNCTION
	OnLeaveTrigger_D1W2,	-- 13.LEAVETRIGGERFUNCTION
	nil,	-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
	nil,	-- 16.OnGameObjUse
}

