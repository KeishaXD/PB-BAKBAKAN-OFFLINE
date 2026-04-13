crrequire "Script.ModeLua.AI.AI_Define"

---------------------------------
-- 랩터A 지능 구현
---------------------------------

-- 최초에 생성되기 전 능력치를 설정
function	OnCreate()
	-- '공룡 캐릭터' 랩터를 장비
	SetCharacter( CHARACTER_ITEMID.RAPTOR );

	-- 시야 범위 설정 (length, range_angle)
	-- 20m까지, 전방좌우 60도, 전방상하 80도로 시야 설정
	SetEye( 20, 60, 80 );

	-- 속력 설정 (m/s) 걷기 1초에 3미터, 달리기 1초에 5.6미터로.
	SetFoot( 3, 5.6 );
end

function OnUpdate()
	-- 20%의 확률로
	if ( math.random(5) == 3 ) then
		-- 플레이 중인 유저를 쫓습니다.
		Chase(SLOT_TYPE_USER, 0);--GetVisibleUserSlotIdx());
	-- 10%의 확률로
	--elseif ( math.random(10) == 7 ) then
		-- 플레이 중인 유저를 공격시도합니다.
		--Attack(SLOT_TYPE_USER, GetRandomUserSlotIdx());
	end
end

-- AI 진행 중 ( 일정시간 마다 호출되는 함수 )
function	OnUpdateaa()
	local Rnd;
	-- 유저가 파괴 임무를 진행중인 경우엔 파괴 오브젝트를 방어하기 위한 특수 처리를 추가합니다.
	if ( GetModeData() == EVENT_ROUND["DESTROY"] ) then
		Rnd = math.random( 100 );
		-- 14%의 확률로
		if ( Rnd <= 14 ) then
			-- 가고 있는 아군이 9기 미만이면
			if ( GetChaseCount( DATA_IDX_DESTROY_TARGET_OBJECT_IDX ) < 9 ) then
				-- 방어하기 위해 파괴 오브젝트를 향해 갑니다.
				Chase( DATA_IDX_DESTROY_TARGET_OBJECT_IDX );
				return;
			end
		end
	-- 유저가 방어 임무를 진행중인 경우엔 파괴 오브젝트를 공격하기 위한 특수 처리를 추가합니다.
	elseif ( GetModeData() == EVENT_ROUND["DEFENCE"] ) then
		Rnd = math.random( 100 );
		-- 7%의 확률로
		if ( Rnd <= 7 ) then
			-- 쫓고 있는 아군이 15기 미만이면
			if ( GetChaseCount( DATA_IDX_DEFENCE_TARGET_OBJECT_IDX ) < 15 ) then
				-- 파괴오브젝트로 갑니다.
				Chase( DATA_IDX_DEFENCE_TARGET_OBJECT_IDX );
				return;
			end
		-- 11%의 확률로
		elseif ( Rnd <= 7 + 11 ) then
			-- 다른 행동
		end
	end

	-- 보이는 타겟 중 가장 가까이 있는 플레이어의 슬롯번호를 얻어온다.
	SlotIdx = GetVisibleUser( ATTRIBUTE["NEAR"] );
	-- 시야에 아무도 안보인다면
	if ( SlotIdx == -1 ) then
		-- 4가지의 행동패턴을 랜덤하게 결정합니다.
		Ran = math.random( 1, 20 );
		if ( Ran == 1 ) then
			-- 랜덤한 아군과 통신합니다.
			Communicate( "HELLO", RandomAISlotIdx() );
		elseif ( Ran == 2 ) then
			-- 랜덤한 장소로 이동합니다.
			Chase( -1, LEVEL["C"] );
		elseif ( Ran == 3 ) then
			-- 랜덤하게 무기를 변경합니다.
			ChangeWeapon();
		else
			-- 4부터 20일 경우에는 아무 행동도 하지 않습니다.
		end
	else
		-- 슬롯번호를 얻어왔고 장착한 무기로 공격 가능한 사거리내에 있을시 공격합니다.
		if ( IsInRange( SlotIdx ) == true ) then
			Attack( SlotIdx );
		end
	end
end

-- 리스폰 되었을때
function	OnRespawn()
end

-- 다른 AI로부터 통신이 들어왔을때
function	OnReceive( Message, SenderSlotIdx )
	-- 안부메세지를 받았을때
	if ( Message == "HELLO" ) then
		-- 자신의 체력이 20 미만이면 도와달라는 메세지를 보낸다.
		if ( GetMyHP() < 20 ) then
			Communicate( "HELP_ME", SenderSlotIdx );
		end
	-- 도와달라는 메세지를 받았을때
	elseif ( Message == "HELP_ME" ) then
		-- 메세지를 보낸 AI가 있는 곳으로 갑니다.
		Chase( SenderSlotIdx, LEVEL["B"] );
	-- 따라오라는 메세지를 받았을때
	elseif ( Message == "FOLLOW_ME" ) then
		-- 메세지를 보낸 AI가 있는 곳으로 갑니다.
		Chase( SenderSlotIdx, LEVEL["C"] );
	-- 자기 있는 곳이 안전하다는 메세지를 받았을때
	elseif ( Message == "HERE_IS_SAFE" ) then
		-- 메세지를 보낸 AI가 있는 곳으로 갑니다.
		Chase( SenderSlotIdx, LEVEL["D"] );
	end
end

-- 데미지를 받았을때( 데미지를 가한 유저 슬롯번호, 준 데미지, 데미지를 받아 죽었느냐(1) 살아있느냐(0)
function	OnDamaged( SlotIdx, Damage, Killed )
	-- 사거리 안에 있다면
	if ( IsInRange( SlotIdx ) == true ) then
		-- 유저에게 반격합니다.
		Attack( SlotIdx );
	-- 사거리 안에 없다면
	else
		-- 유저를 쫓아갑니다. 그리고
		Chase( SlotIdx );
		Rnd = math.random( 1, 2 );
		-- 30%의 확률로
		if ( Rnd == 2 ) then
			-- 포효하는 액션을 취합니다.
			DoCustomAction( CUSTOM["HOWL"] );
		end
	end
end

-- 탄창을 다 소진해서 리로드를 하거나 Reload함수를 호출했을때. 총알을 다 소진했을때는 호출되지 않습니다.
function	OnReload()
	-- 자신의 시야에 보이는 유저중 가장 가까운 유저의
	SlotIdx = GetVisibleUser( ATTRIBUTE["NEAR"] );
	if ( SlotIdx == -1 ) then
		-- 시야에 유저가 아무도 없다면 그냥 제자리에서 리로드합니다.
	else
		-- 방향을 획득해서 그 방향과 180도 반대로
		fValue = GetRotate( SlotIdx ) + fPI;
		-- 자신을 위치시킵니다. 즉, 그 유저와 마주서게 됩니다.
		SetRotate( fValue );
		-- 5m 뒤로 이동하면서 리로드를 합니다.
		MoveBack( 5 );
	end
end

-- 유저 혹은 오브젝트가 시야에 들어왔을때
function	OnAppearFromSight( SlotIdx )
	-- 소유무기 사거리내에 있으면 공격합니다.
	if ( IsInRange( SlotIdx ) == true ) then
		Attack( SlotIdx );
	else
		-- 24%의 확률로
		Rnd = math.random( 1, 100 );
		if ( Rnd <= 24 ) then
			-- 그 유저를 쫓아가고 있는 아군(AI)가 4기 미만이어야 쫓아갑니다.
			if ( GetChaseCount( SlotIdx ) < 4 ) then
				ChaseTo( SlotIdx );
			end
		-- 33%의 확률로
		elseif ( Rnd <= 24 + 33 ) then
			-- 해당유저와 마주보도록 방향을 바꿉니다.
			SetRotate( GetRotate( SlotIdx ) + fPI );
		end
	end
end

-- 유저에 의해 죽었을때
function	OnDeath( SlotIdx )
end

-- 유저 혹은 오브젝트가 시야에서 사라졌을때
function	OnDisappearFromSight( SlotIdx )
	-- 그 유저가 사라짐으로서 더 이상 시야에 아무도 보이지 않는다면
	if ( GetNumberVisibleUser == 0 ) then
		-- 25%의 확률로
		Rnd = math.random( 1, 4 )
		if ( Rnd == 4 ) then
			-- 사라진 유저를 쫓아갑니다.
			Chase( SlotIdx );
		end
	end
end
