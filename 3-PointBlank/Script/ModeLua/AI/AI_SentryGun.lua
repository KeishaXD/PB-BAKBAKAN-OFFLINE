require "Script.ModeLua.AI.AI_Define"

---------------------------------
-- 센트리건 AI 구현
---------------------------------

-- 최초에 생성되기 전 능력치를 설정
function	OnCreate()
	-- '센트리건 캐릭터'를 장비
	SetCharacter( CHARACTER_ITEMID.SENTRYGUN_DEFAULT );
	-- 시야 범위 설정 (length, range_angle)
	-- 7m까지, 전방좌우 90도로 시야 설정
	SetEye( 60.0, 100, 90 );
	-- 속력 설정 (meter per second)
	SetFoot( 0.0, 0.0 );
end

function	OnUpdate()
		Attack( SLOT_TYPE_AI, GetRandomAISlotIdx() );
end

-- AI 진행 중 ( 일정시간 마다 호출되는 함수 )
function	OnUpdate__()
	-- 보이는 타겟 중 가장 가까이 있는 플레이어의 슬롯번호를 얻어온다.
	SlotIdx = GetVisibleUser( ATTRIBUTE["NEAR"] );
	-- 시야에 아무도 안보인다면
	if ( SlotIdx == -1 ) then
		-- 미처리
	else
		-- 슬롯번호를 얻어왔고 장착한 무기로 공격 가능한 사거리내에 있을시 공격합니다.
		if ( IsInRange( SlotIdx ) == true ) then
			Attack( SlotIdx );
		end
	end
end


-- 데미지를 받았을때( 데미지를 가한 유저 슬롯번호, 준 데미지, 데미지를 받아 죽었느냐(1) 살아있느냐(0)
function	OnDamaged__( SlotIdx, Damage, Killed )
	-- 사거리 안에 있다면
	if ( IsInRange( SlotIdx ) == true ) then
		-- 유저에게 반격합니다.
		Attack( SlotIdx );
	-- 사거리 안에 없다면
	end
end
