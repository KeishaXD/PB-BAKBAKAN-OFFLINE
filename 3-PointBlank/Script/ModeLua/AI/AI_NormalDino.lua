-- 01. RandomAISlotIdx() : 자신을 제외한 다른 AI중 한개의 슬롯번호를 리턴한다.

-- 02. Communicate( string Message, int SlotIdx ) : SlotIdx에게 Message를 보낸다.

-- 03. GetHP( int SlotIdx ) : 체력을 확인합니다.
------ 리턴값1: int HP - 잔여체력
------ 리턴값2: float fRatio - 전체체력대비 잔여체력의 백분율값 ( 0.0[0%] ~ 1.0[100%] )

-- 04. Chase( int SlotIdx, int Level ) : 지정한 SlotIdx쪽으로 이동합니다. Level은 이동 중 공격받았을때의 대응을 설정합니다. SlotIdx를 -1로 주면 랜덤한 장소로 이동합니다. GetChaseCount의 해당 유저값이 +1증가됩니다.
------ Level A - 이동 중 공격받아도 무시하고 목적지로 이동한다.
------ Level B - 이동 중 공격받으면 대응후 목적지로 이동한다.
------ Level C - 이동 중 공격받으면 대응후 멈춘다.
------ Level D - 이동 중 공격받으면 대응후 원자리로 이동한다.
------ Level E - 이동 중 공격받으면 원자리로 도망간다.

-- 05. GetVisibleUser( int Attribute ) : 보이는 타겟 중 지정한 속성에 맞는 플레이어의 슬롯번호를 리턴합니다.
------ Attribute NEAR - 가장 가까이 있는 플레이어
------ Attribute FAR - 가장 멀리 있는 플레이어
------ Attribute RANDOM - 무작위의 플레이어
------ Attribute HPMIN - 가장 체력이 적은 플레이어
------ Attribute HPMAX - 가장 체력이 많은 플레이어

-- 06. IsInRange( int SlotIdx ) : 슬롯번호의 유저가 내가 장착한 무기의 사거리안에 들어와있는지 판별합니다.

-- 07. Reload() : 재장전합니다.

-- 08. GetNumberVisibleUser() : 시야에 보이는 유저의 수를 리턴합니다.

-- 09. GetRotate( int SlotIdx ) : 해당 슬롯의 방향을 얻어옵니다.
------ 리턴값1: float fValue - 슬롯의 방향 각도

-- 10. SetRotate( float fAngle ) : 자신을 지정한 방향으로 지정합니다.

-- 11. ChangeWeapon() : 보유한 무기중 잔탄이 0인 무기를 제외하고 랜덤하게 변경합니다.

-- 12. GetChaseCount( int SlotIdx ) : 지정한 유저를 쫗아가고 있는 아군이 몇 기인지 파악합니다.

-- 13. SetEye( float Length, float Range ) : 시력을 설정합니다.

-- 14. SetEar( float Length ) : 청력을 설정합니다. ( 청력은 방향이 없으므로 범위가 필요없습니다. )

-- 15. SetFoor( float Speed ) : 속도를 설정합니다.

-- 16. SetWeapon( int ItemID ) : 해당 ItemID에 해당하는 장비를 설정합니다.

------------ 상수 ---------------
fPI		= 3.141592

---------------------------------
-- 일반 디노AI 구현
---------------------------------

-- 최초에 생성되기 전 능력치를 설정
function	OnCreate()
	-- 시야 범위 설정 (length, range_angle)
	-- 20m까지, 전방좌우 60도로 시야 설정
	SetEye( 20, fPI / 3);
	-- 청력 설정 (length)
	-- 구의 반지름 30m까지 청력 설정
	SetEar( 30 );
	-- 속력 설정 (meter per second)
	SetFoot( 10 );
	-- 무기 설정
	SetWeapon( 1002004332 );
	SetWeapon( 2002004032 );
	SetWeapon( 3026006331 );
	SetWeapon( 6002037700 );
end

-- AI 진행 중 ( 일정시간 마다 호출되는 함수 )
function	OnUpdate( AISlotIdx )

	-- 유저가 파괴 임무를 진행중인 경우엔 파괴 오브젝트를 방어하기 위한 특수 처리를 추가합니다.
	if ( GetModeData() == EVENT_ROUND["DESTROY"] ) then
		Chase( DATA_IDX_DESTROY_TARGET_OBJECT_IDX );
	-- 유저가 방어 임무를 진행중인 경우엔 파괴 오브젝트를 공격하기 위한 특수 처리를 추가합니다.
	elseif ( GetModeData() == EVENT_ROUND["DEFENCE"] ) then
		Rnd = math.random( 100 );
		-- 7%의 확률로
		if ( Rnd <= 7 ) then
			-- 쫓고 있는 아군이 15기 미만이면
			if ( GetChaseCount( DATA_IDX_DEFENCE_TARGET_OBJECT_IDX ) < 15 )
				-- 파괴오브젝트로 갑니다.
				Chase( DATA_IDX_DEFENCE_TARGET_OBJECT_IDX );
				return;
			end
		-- 11%의 확률로
		elseif ( Rnd <= 7 + 11 ) then

		end
	end

	-- 보이는 타겟 중 가장 가까이 있는 플레이어의 슬롯번호를 얻어온다.
	SlotIdx = GetVisiblePlayer( ATTRIBUTE["NEAR"] );
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

	if ( IsInRange( SlotIdx ) == true ) then
		Attack( SlotIdx );
	else
		Chase( SlotIdx );
	end
end

-- 탄창을 다 소진해서 리로드를 하거나 Reload함수를 호출했을때. 총알을 다 소진했을때는 호출되지 않습니다.
function	OnReload()
	-- 자신의 시야에 보이는 유저중 가장 가까운 유저의
	SlotIdx = GetVisibleUser( ATTRIBUTE["NEAR"] );
	if ( SlotIdx == -1 ) then

	else
		-- 방향을 획득해서 그 방향과 180도 반대로
		fValue = GetRotate( SlotIdx ) + fPI;
		-- 자신을 위치시킵니다. 즉, 그 유저와 마주서게 됩니다.
		SetRotate( fValue );
		-- 5m 뒤로 이동하면서 리로드를 합니다.
		MoveBack( 5 );
	end
end

-- 총알을 다 소진했을때
function	OnAmmoZero()
	ChangeWeapon();
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
				Chase( SlotIdx );
			end
		-- 13%의 확률로
		elseif ( Rnd <= 24 + 13 ) then
			-- 해당유저와 마주보도록 방향을 바꿉니다.
			SetRotate( GetRotate( SlotIdx ) + fPI );
		end
	end
end

-- 유저 혹은 오브젝트가 시야에서 사라졌을때
function	OnDisappearFromSight( SlotIdx )
	-- 그 유저가 사라짐으로서 더 이상 시야에 아무도 보이지 않는다면
	if ( GetNumberVisibleUser == 0 ) then
		-- 사라진 유저를 쫓아갑니다.
		Chase( SlotIdx );
	end
end

