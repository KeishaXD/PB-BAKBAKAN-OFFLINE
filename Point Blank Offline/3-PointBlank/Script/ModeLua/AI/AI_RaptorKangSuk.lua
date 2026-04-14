require "Script.ModeLua.AI.AI_Define"

-- 최초에 생성되기 전 능력치를 설정
function	OnCreate()
	-- 시야 범위 설정 (length, range_angle)
	-- 20m까지, 전방 상하,좌우 160도로 시야 설정
	SetEye( 20, 160, 160);

	-- 속력 설정 (meter per second)
	SetFoot( 3, 7 );
	-- '공룡 캐릭터' 랩터를 장비
	SetCharacter( 1006003024 );
end

-------------------------------------------사용 가능한 함수-------------------------------------------
-- AI 진행 중 ( 일정시간 마다 호출되는 함수 )
function	OnUpdate()

	-- 보이는 타겟 중 가장 가까이 있는 플레이어의 슬롯번호를 얻어온다.
	SlotIdx = GetRandomUserSlotIdx();

	Rnd = math.random( 100 );

	-- (SEOK) AI수보다 유저가 많으면 도망 GetCountAI() 함수 제작 요청
	-- if ( GetCountVisibleUser() > GetCountAI() )
		-- Chase( LEVEL["E"], SlotIdx );
	-- end

	-- 슬롯번호를 얻어왔고 장착한 무기로 공격 가능한 사거리내에 있을시 공격합니다.
	if ( IsInRange( SlotIdx ) == true ) then
		Attack( SlotIdx );
		-- (SEOK) 사거리에 들어 온 유저를 추격한다. 이 때 공격 받으면 대응 후 목적지로 이동한다.
		-- (SEOK) 이렇게 하면 AI가 공격 받지 않은 이상, AI도 유저를 공격하지 않는다.
		--Chase( LEVEL["B"], SlotIdx );
	end

	-- (SEOK) 한 유저를 2개의 AI가 추격중이면 HP가 제일 높은 유저를 추격
	if ( GetChaseCount( SlotIdx ) > 2 ) then
		SlotIdx = GetVisibleUserSlotIdx();
		Chase( SlotIdx );
	end

	-- (SEOK) 1% 확률로 랜덤한 유저를 추격
	-- (SEOK) 업데이트 함수가 1초에 10번 호출 되기 때문에 1퍼센트로 설정
	if ( Rnd == 1 ) then
		Chase( GetVisibleUserSlotIdx() );
	end
end


-- 데미지를 받았을때( 데미지를 가한 유저 슬롯번호, 준 데미지, 데미지를 받아 죽었느냐(1) 살아있느냐(0)
function	OnDamaged( SlotIdx, Damage, Killed )

	-- 랜덤 설정
	--Rnd = math.random( 100 );

	-- 사거리안에 들어왔을 때 공격
	if ( IsInRange( SlotIdx ) == true ) then
		Attack( SlotIdx );

	-- 사거리안에 들어오지 않으면
	else
		-- (SEOK) 10% 확률로 유저를 추격하다가 또 다시 데미지를 받으면 원자리로 복귀
		-- (SEOK) 몰아서 한번에 잡기를 방지할 수 있을 것 같음.
		--if ( Rnd <= 10 )
			--Chase( LEVEL["E"], SlotIdx );

		-- (SEOK) 날 공격한 유저를 추격
		Chase( SlotIdx );
	end
end
