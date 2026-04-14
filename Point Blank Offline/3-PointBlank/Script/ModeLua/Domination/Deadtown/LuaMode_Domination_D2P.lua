function	OnPreStartRound_D2P()
	UserRespawnPosition[1] = GetRespawnObject("D2_C_Player_1");
	UserRespawnPosition[2] = GetRespawnObject("D2_C_Player_2");
	UserRespawnPosition[3] = GetRespawnObject("D2_C_Player_3");
	UserRespawnPosition[4] = GetRespawnObject("D2_C_Player_4");
end

function	OnStartRound_D2P()
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
end

-- 라운드 시간이 종료됐을떄 호출되는 함수
function	OnRoundTimeOut_D2P()
	FinishRound( TEAM["BOTH"], END_TYPE["TIMEOUT"] );
end

DAY_WAVE_FUNCTION_D2P = {
	OnPreStartRound_D2P,	--  1.PRESTARTROUNDFUNCTION
	OnStartRound_D2P,		--  2.STARTROUNDFUNCTION
	nil,					--  3.BATTLEUPDATEFUNCTION
	nil,					--  4.ENDROUNDFUNCTION
	OnRoundTimeOut_D2P,		--  5.ROUNDTIMEOUTFUNCTION
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
