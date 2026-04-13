-- 01. RandomAISlotIdx() : 자신을 제외한 다른 AI중 한개의 슬롯번호를 리턴한다.

-- 02. Communicate( string Message, int SlotIdx ) : SlotIdx에게 Message를 보낸다.

-- 03. GetMyHP() : 자신의 체력을 확인한다.

-- 04. Chase( int SlotIdx, int Level ) : 지정한 SlotIdx쪽으로 이동합니다. Level은 이동 중 공격받았을때의 대응을 설정합니다. SlotIdx를 -1로 주면 랜덤한 장소로 이동합니다.
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
------ 리턴값1: float 슬롯의 방향 각도

-- 10. SetRotate( float fAngle ) : 자신을 지정한 방향으로 지정합니다.

-- 11. ChangeWeapon() : 보유한 무기중 잔탄이 0인 무기를 제외하고 랜덤하게 변경합니다.

-- 상수 --
fPI		= 3.141592

---------------------------------
-- 일반 휴먼AI 구현
---------------------------------

-- AI 진행 중 ( 일정시간 마다 호출되는 함수 )
function	OnUpdate( AISlotIdx )
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
			InsertQueue( OP_MOVE, 0, 0 );
			InsertQueue( OP_FIRE, 0, 0 );
			InsertQueue( OP_STOP, 1, 0 );
			InsertQueue( OP_ATTACK, 0, 0 );
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
	-- 방향을 획득해서 그 방향과 180도 반대로
	fValue = GetRotate( SlotIdx ) + fPI;
	-- 자신을 위치시킵니다. 즉, 그 유저와 마주서게 됩니다.
	SetRotate( fValue );
	-- 5m 뒤로 이동하면서 리로드를 합니다.
	MoveBack( 5 );
end

-- 총알을 다 소진했을때
function	OnAmmoZero()
	ChangeWeapon();
end

-- 유저가 시야에 들어왔을때
function	OnAppearFromSight( SlotIdx )
	-- 소유무기 사거리내에 있으면 공격합니다.
	if ( IsInRange( SlotIdx ) == true ) then
		Attack( SlotIdx );
	end
end

-- 유저가 시야에서 사라졌을때
function	OnDisappearFromSight( SlotIdx )
	-- 그 유저가 사라짐으로서 더 이상 시야에 아무도 보이지 않는다면
	if ( GetNumberVisibleUser == 0 ) then
		-- 사라진 유저를 쫓아갑니다.
		Chase( SlotIdx );
	end
end

