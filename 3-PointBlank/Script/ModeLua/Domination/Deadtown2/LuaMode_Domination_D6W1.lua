--------------------------------------------------
-- 라운드가 진행됨에 따라 자동으로 호출되는 함수들
--------------------------------------------------
-- 라운드 시작을 준비할 때 호출되는 함수
function	OnPreStartRound_D6W1()
end

-- 라운드 시작했을 때 호출되는 함수
function	OnStartRound_D6W1()
end

-- 라운드 진행 중 상태 확인하는 함수
function	OnBattleUpdate_D6W1()
end

-- 라운드를 종료했을 때 호출되는 함수
function	OnEndRound_D6W1()
end

-- 라운드 시간이 종료됐을떄 호출되는 함수
function	OnRoundTimeOut()
end

--------------------------------
-- 이벤트 발생시 호출되는 함수들
--------------------------------
-- 타이머 이벤트 사용시 타이머 만료됐을때 호출되는 함수
function	OnTimeOut_D6W1( timerIdx )
end

-- 오브젝트 설치 요청시 호출되는 함수
-- 설치를 허용하려면 true, 불허하려면 false 리턴
function	OnInstall_D6W1( SlotIdx, Weapon )
	return false;
end

-- 오브젝트 해체를 요청시 호출되는 함수
-- 해체를 허용하려면 true, 불허하려면 false 리턴
function	OnUninstall_D6W1( SlotIdx, Weapon )
	return false;
end

-- 오브젝트 사용을 요청시 호출되는 함수
-- 사용을 허용하려면 true, 불허하려면 false 리턴
function	OnUse_D6W1( SlotIdx, Weapon )
	return false;
end

-- 게임 오브젝트에 데미지를 입혔을 경우 호출되는 함수
function	OnDamageObject_D6W1( SlotIdx, ObjectIdx, Damage)
end

-- 게임 오브게트가 파괴됐을떄 호출되는 함수
function	OnDestroyObject_D6W1( SlotIdx, ObjectIdx )
end

-- 트리거 영역에 들어갔을때 호출되는 함수
function	OnEnterTrigger_D6W1( SlotType, SlotIdx, TriggerIdx )
end

-- 트리거 영역에서 나왔을떄 호출되는 함수
function	OnLeaveTrigger_D6W1( SlotType, SlotIdx, TriggerIdx )
end

-- 특수키 처리 요청이 들어왔을 때 호출되는 함수
function	OnKeyProc_D6W1( SlotIdx, Key )
	return EVENT_ERROR_FAIL;
end

-- 특정 그룹의 AI가 전멸했을때 호출되는 함수
function OnAnnihilateAIGroup_D6W1( GroupName )
end

DAY_WAVE_FUNCTION_D6W1 = {
	nil,	--  1.PRESTARTROUNDFUNCTION
	nil,	--  2.STARTROUNDFUNCTION
	nil,	--  3.BATTLEUPDATEFUNCTION
	nil,	--  4.ENDROUNDFUNCTION
	nil,	--  5.ROUNDTIMEOUTFUNCTION
	nil,	--  6.TIMEOUTFUNCTION
	nil,	--  7.INSTALLFUNCTION
	nil,	--  8.UNINSTALLFUNCTION
	nil,	--  9.USEFUNCTION
	nil,	-- 10.DAMAGEOBJECTFUNCTION
	nil,	-- 11.DESTROYOBJECTFUNCTION
	nil,	-- 12.ENTERTRIGGERFUNCTION
	nil,	-- 13.LEAVETRIGGERFUNCTION
	nil,		-- 14.KEYPROCFUNCTION
	nil,	-- 15.ANNIHILATEAIGROUPFUNCTION
}
