function	OnPreStartRound_D1P()
	UserRespawnPosition[1] = GetRespawnObject("D1_C_Player_1");
	UserRespawnPosition[2] = GetRespawnObject("D1_C_Player_3");
	UserRespawnPosition[3] = GetRespawnObject("D1_C_Player_1");
	UserRespawnPosition[4] = GetRespawnObject("D1_C_Player_3");

	SendEventAlarm( 0 );
end

function	OnStartRound_D1P()
	for i = SLOT_IDX_START, SLOT_IDX_END, 1 do
		-- 모든 유저 부활
		if( IsBattlePlayer( i ) ) then
			RespawnPlayer( i , 1, UserRespawnPosition[UserNo[i]] );
		end
	end
end

-- 라운드 시간이 종료됐을떄 호출되는 함수
function	OnRoundTimeOut_D1P()
	FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
end

DAY_WAVE_FUNCTION_D1P = {
	OnPreStartRound_D1P,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D1P,		--  2.STARTROUNDFUNCTION
	nil,					--  3.BATTLEUPDATEFUNCTION
	nil,					--  4.ENDROUNDFUNCTION
	OnRoundTimeOut_D1P,		--  5.ROUNDTIMEOUTFUNCTION
	nil,					--  6.TIMEOUTFUNCTION
	nil,					--  7.INSTALLFUNCTION
	nil,					--  8.UNINSTALLFUNCTION
	nil,					--  9.USEFUNCTION
	nil,					-- 10.DAMAGEOBJECTFUNCTION
	nil,					-- 11.DESTROYOBJECTFUNCTION
	nil,					-- 12.ENTERTRIGGERFUNCTION
	nil,					-- 13.LEAVETRIGGERFUNCTION
	nil,						-- 14.KEYPROCFUNCTION
	nil,					-- 15.ANNIHILATEAIGROUPFUNCTION
}
