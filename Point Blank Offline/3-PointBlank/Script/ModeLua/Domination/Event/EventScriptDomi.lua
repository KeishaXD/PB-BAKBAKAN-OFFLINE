
--- 필수 포함 리콰이어문..
require "Script.ModeLua.Domination.Event.EventScriptModule"
---

--
--
--  레벨 작업자를 위한 설명..
--  
--  1. 와꾸 
--  
--  reg_evt
--  {
--		idx = 이벤트 정수값
--		func = function ()
--			... (작성공간)
--		end
--  }
--  
--  위와 같은 방식으로 이벤트 인덱스 당 하나씩 작성하면 됩니다.
--
--  2. func에 들어갈 내용.
--
--  add_img(start_time, img)
--	add_dlg(start_time, dlg)
--	add_snd(start_time, snd)
--	add_msg(start_time, msg)
--	clr_evt(start_time)
--
--	첫인수는 시작시간, 두번째인수는 파일명 혹은 텍스트 이름입니다..
--

-----------------
-- 실제 스크립트 소스
-----------------

-----------------
-- 트리거 제한
-----------------

reg_evt
{
	idx = 998, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}아직 남은 공룡들이 있어요, 모두 처리해야 해요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}모든 공룡을 처리하십시오.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 999, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공룡을 모두 처리한거 같아요, 앞으로 이동하죠.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}앞으로 이동하십시오.{/col}")
		clr_evt(6.5)
	end
}

----------------------
--BOSS
-----------------------
reg_evt
{
	idx = 500,	-- 연출 종료
	func = function ()

	end
}

reg_evt
{
	idx = 501,	--	등장
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_dlg(1, "{col:255, 0, 0, 255}뮤턴트 렉스 등장{/col}")
		clr_evt(5)
	end
}

reg_evt
{
	idx = 502,	--	폭파시작
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_dlg(1, "{col:255, 0, 0, 255}폭파시작{/col}")
		clr_evt(5)
	end
}

-----------------
-- Flow Fade In/Out
--0 : out
--1 : in
--99 : ready
-----------------
reg_evt
{
  idx = 550,            -- Fade Out
  func = function()
  add_fde(0, 99)
  add_fde(0, 0)
  end
}

reg_evt
{
  idx = 551,            --  Fade In          
  func = function()
  add_fde(0, 99)
  add_fde(0.7, 1)
  end
}

-----------------
-- Clear(효과음)
-----------------
reg_evt
{
	idx = 201,
	func = function()
		add_snd(0, "DinoMode_Clear.wav");
	end
}

-----------------
-- 임무 설명 내용
-----------------
reg_evt -- NULL
{
	idx = 200,
	func = function()
		add_msg( 0, " ");
	end
}

reg_evt -- 서바이벌 (타임어택)
{
	idx = 110,
	func = function()
		add_snd(2, "DinoMode_message.wav")
		add_msg(2, "{col:255, 255, 255, 255}제한 시간동안 살아남으시오. {/col}")
	end
}

reg_evt -- 서바이벌 (섬멸전)
{
	idx = 111,
	func = function()
		add_snd(2, "DinoMode_message.wav")
		add_msg(2, "{col:255, 255, 255, 255}모든 적을 섬멸하시오. {/col}")
	end
}

reg_evt -- 방어  
{
	idx = 112,
	func = function()
		add_snd(2, "DinoMode_message.wav")
		add_msg(2, "{col:255, 255, 255, 255}분석 장치를 가동시키시오. {/col}")
	end
}

reg_evt -- 방어  
{
	idx = 113,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}공룡으로부터 장치를 보호하시오. {/col}")
	end
}

reg_evt -- 파괴  
{
	idx = 114,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}공룡알을 파괴하시오. {/col}")
	end
}

reg_evt -- 저지  
{
	idx = 115,
	func = function()
		add_snd(2, "DinoMode_message.wav")
		add_msg(2, "{col:255, 255, 255, 255}다른 지역으로 이동하려는 공룡을 막으시오. {/col}")
	end
}

reg_evt -- 회수  
{
	idx = 116,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}DNA 샘플을 회수하시오. {/col}")
	end
}

reg_evt -- 회수 2 
{
	idx = 117,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}연료를 회수하시오. {/col}")
	end
}

reg_evt -- 보스
{
	idx = 118,
	func = function()
		add_snd(2, "DinoMode_message.wav")
		add_msg(2, "{col:255, 255, 255, 255}몰려오는 적을 섬멸하시오. {/col}")
	end
}

reg_evt -- 보스
{
	idx = 119,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}뮤턴트 렉스를 처치하시오. {/col}")
	end
}

reg_evt -- 보스
{
	idx = 120,
	func = function()
		add_snd(0, "DinoMode_message.wav")
		add_msg(0, "{col:255, 255, 255, 255}기둥에 폭탄을 설치하시오. {/col}")
	end
}

-----------------
-- Day 1
-----------------

reg_evt
{
	idx = 0, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}드디어 구조대가 도착했군요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}더 버티기는 힘들거라 생각했어요.{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}제가 무전으로 여러분을 도와드리겠어요.{/col}")
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}공룡들을 처리하고 도시를 구해주세요.{/col}")
		add_snd(7, "DinoMode_message.wav")
		add_msg(7, "{col:255, 255, 255, 255}데드 타운에 도착했습니다.{/col}")
		clr_evt(11)
	end
}

-----------------
-- Day 2
-----------------

reg_evt
{
	idx = 18,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}샘플 분석 장치는 마을 중앙에 있어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}마을 중앙까지 공룡 무리를 뚫고 이동해야겠어요.{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}장치까지 이동하도록 하죠.{/col}")
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}표시된 위치로 이동하십시오.{/col}")
		clr_evt(9.5)	
	end
}

reg_evt
{
	idx = 19, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}장치가 아직 작동되야 할텐데.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}조심하세요! 녀석들이 나타났어요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 20, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}얼마 남지 않았어요, 거의 도착했어요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 21,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}바로 다음 지역에 샘플 분석기가 있을거에요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}정비하고 다음 장소로 이동하도록 하죠.{/col}")				
		clr_evt(6.5)	
	end
}

reg_evt
{
	idx = 22,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}저 기계장치에요, 다행히 아직은 멀쩡한거 같네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}주의하세요, 기계의 동작음이 공룡을 자극하는거 같아요.{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}기계가 동작하면 신경이 날카로워진 공룡들이 기계를 파괴하려 할거에요{/col}")
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}분석이 끝날때까지 공격으로 부터 장치를 보호해야 해요.{/col}")
		add_snd(7, "DinoMode_message.wav")
		add_msg(7, "{col:255, 255, 255, 255}분석장치로 이동하세요.{/col}")
		clr_evt(11)	
	end
}

reg_evt
{
	idx = 23, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}버튼을 눌러 기계를 작동시키세요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}분석장치를 작동시키십시오.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 24,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이제 공룡들이 몰려올거에요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}분석이 완료될때까지 기계를 보호해주세요.{/col}")		
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡의 공격으로 부터 분석장치를 보호하십시오.{/col}")
		clr_evt(8)	
	end
}

reg_evt
{
	idx = 25, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조심하세요, 놈들이 나타났어요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 26,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}역시 녀석들이 반응을 보이기 시작했네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}곧 다음 공격이 올거에요.{/col}")				
		clr_evt(6.5)	
	end
}

reg_evt
{
	idx = 27, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공격이 다시 시작됬어요, 기계를 보호하세요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 28,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}분석에 꽤 시간이 걸리네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}공룡들이 다시 공격해 올테니 준비하세요.{/col}")				
		clr_evt(6.5)	
	end
}

reg_evt
{
	idx = 29, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}놈들이 더욱 사나워져가고 있어요, 공격에 대비하세요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 30,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}분석이 완료되가고 있어요. 조금만 더...{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}조금만 더 버텨주세요.{/col}")				
		clr_evt(6.5)	
	end
}

reg_evt
{
	idx = 31, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}놈들이에요, 기계를 보호애햐 해요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 32, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}샘플 분석이 거의 완료되었어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}하지만 아직 시간이 필요하니, 장치가 파괴되지 않도록 보호해주세요.{/col}")						
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 33, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}아마도 마지막 공격일거에요, 끝까지 기계를 보호하세요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 34, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}샘플 분석이 완료되었어요. 수고하셨어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}여러분의 활약으로 놈들의 약점을 파악하는데 좋은 자료를 얻었어요.{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}이제 다음 장소로 이동하도록 하죠.{/col}")			
		clr_evt(8)
	end
}

reg_evt
{
	idx = 35, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}분석 장치가 위험해요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}샘플을 완전히 분석할때까지 공격을 막아내야 해요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}분석 장치가 위험합니다.{/col}")
		clr_evt(8.5)
	end
}

reg_evt
{
	idx = 36, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이제 데이터를 가지고 이 도시를 탈출해야겠어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}다음 지역까지 이동해서 도시를 벗어날 방법을 찾아보도록 하죠.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}표시된 지점으로 이동하십시오.{/col}")			
		clr_evt(8)
	end
}

reg_evt
{
	idx = 37, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조심하세요, 여기에도 상당히 많은 숫자가 있어요!{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}분석 장치가 위험합니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 38, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조심하세요, 놈들이 나타났어요!{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 39, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}안전지역이 얼마 남지 않았어요, 힘내세요!{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 40, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이제 샘플과 데이터를 가지고 도시를 벗어나도록 하죠.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}여기서 재정비 후 다음지역으로 이동하세요.{/col}")		
		clr_evt(6.5)
	end
}

-----------------
-- Day 3
-----------------

reg_evt
{
	idx = 41, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}제 기억으로는...{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}그래요, 다음 지역에 사용할 수 있는 트럭이 있을거에요!{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}트럭을 이용해 이 도시를 벗어날 수 있을거에요.{/col}")
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}표시된 지점으로 이동하십시오.{/col}")				
		clr_evt(9.5)
	end
}

reg_evt
{
	idx = 42, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}앞을 조심하세요! 꽤 많은 숫자에요.{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 43, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}포위 당한거 같아요 조심하세요!{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 44, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}다음 지역의 트럭을 이용해 저를 구하러 와주시겠어요?{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}저도 도시를 벗어날 준비를 해야겠어요.{/col}")				
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 45, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}드디어 이 도시를 벗어날 때가 된 것 같아요!{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}표시된 지점까지 이동하시면 트럭이 있을거에요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}트럭이 있는 위치까지 이동하십시오.{/col}")		
		clr_evt(8)
	end
}


reg_evt
{
	idx = 46, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}앞이에요! 놈들이 공격해와요!{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 47, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}놈들이 우리가 탈출하려는 걸 알아챈걸까요?{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 48, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}저기, 트럭이 보이세요? 저 트럭을 사용해 탈출하도록 해요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}트럭이 있는 위치까지 이동하십시오.{/col}")		
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 49, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}음... 도시를 벗어나기엔 연료가 충분하지 않아 보이네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}주변에 연료가 있는것 같아요.{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}사용할 수 있는지 확인해보세요.{/col}")		
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}연료를 회수하여 트럭으로 운반하십시오.{/col}")		
		clr_evt(9.5)
	end
}

reg_evt
{
	idx = 50, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공룡들은 우리를 쉽게 보내줄 생각이 없어보이네요.{/col}")				
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}연료를 회수하여 트럭으로 옮기십시오.{/col}")
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 52, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}아직 연료가 부족해요.{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}트럭을 사용하려면 연료를 더 모아야 겠어요.{/col}")			
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}연료를 회수하여 트럭으로 옮기십시오.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 53, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}연료는 이제 충분하겠어요.{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}남은 공룡을 처리하고 도시를 벗어나도록 해요.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 54, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이제 드디어 이 지옥같은 도시를 벗어날 수 있겠네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}잠시만요...{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}이럴수가... 공룡들이 저 곳을 통해 도시로 들어왔군요.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 55, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}저 하수도는 다른 도시로 연결되어 있어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}이대로라면 다른 도시도 위험해요.{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}여러분이라면 이 상황을 해결해 주실 수 있을거라 믿어요.{/col}")
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}한번 더 여러분의 힘이 필요해요, 부탁드릴게요./col}")
		clr_evt(9.5)
	end
}

-----------------
-- Day 4
-----------------

reg_evt
{
	idx = 56, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공사중인 하수도 시설을 통해서{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}공룡들이 마을로 들어온거 같아요.{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}다른 도시까지 피해가 생기지 않도록.{/col}")
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}하수도 시설로 이동해 놈들을 처리해 주세요./col}")
		add_snd(7, "DinoMode_message.wav")
		add_msg(7, "{col:255, 255, 255, 255}표시된 위치로 이동하십시오.{/col}")
		clr_evt(11)
	end
}

reg_evt
{
	idx = 57, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조심하세요, 포위 당한거 같아요!{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 58, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}놈들의 수가 늘어났어요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 59, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}왼쪽을 조심하세요, 놈들이에요!{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 60, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}아직 많은 공룡들이 도시로 들어오고 있어요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 61, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}하수도 시설이 얼마남지 않았어요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 62, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}도시로 들어오는 공룡의 숫자가 상당했어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}하수도 시설은 매우 위험할지도 몰라요.{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}여기서 확실히 정비하고 이동하도록 하죠.{/col}")		
		clr_evt(8)
	end
}

reg_evt
{
	idx = 63, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}생각보다 조용하네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}언제 공룡들이 들이닥칠지 모르니 빠르게 이동하도록 하죠.{/col}")		
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}다음지점까지 이동해주세요.{/col}")
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}표시된 위치로 이동하십시오.{/col}")		
		clr_evt(9.5)
	end
}

reg_evt
{
	idx = 64, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이 곳을 통해 공룡들이 도시고 들어왔어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}공룡들이 더이상 도시로 들어올 수 없도록 막아내야 해요!{/col}")				
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}도시로 들어오는 공룡을 막아내십시오.{/col}")		
		clr_evt(8)
	end
}

reg_evt
{
	idx = 65, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}곧 공룡들이 도시로 몰려들거에요.{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}정신 바짝 차리세요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡의 공격에 대비하십시오.{/col}")					
		clr_evt(8.5)
	end
}

reg_evt
{
	idx = 66, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공격이 도시로 몰려들고 있어요!{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}더 이상 들어오지 못하도록 막아내야 해요!{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡을 처리하십시오.{/col}")					
		clr_evt(8.5)
	end
}

reg_evt
{
	idx = 67, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}잠시 후 다시 공격이 시작될거에요.{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}짧은 시간이지만, 준비하기엔 충분할거에요.{/col}")		
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 68, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}녀석들이 하수도에 보금자리를 마련한것 같네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}하수도를 통해 주변의 도시까지 간다면...{/col}")				
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}이 재앙이 다시 발생하는 것을 보고만 있을 수 는 없어요.{/col}")				
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}녀석들의 소굴로 들어가 놈들을 모두 처리해주세요.{/col}")						
		clr_evt(9.5)
	end
}

-----------------
-- Day 5
-----------------

reg_evt
{
	idx = 69, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}버려진 하수도 시설이 공룡들에게 번식하기 좋은 환경을 제공한 것 같네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}얼마나 많은 수의 공룡이 있을지 모르겠지만, 모두 제거해야 해요.{/col}")				
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}표시된 위치로 이동하면서 공룡을 제거하십시오.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 70, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공룡들이 하수도 구멍을 통해 나오고 있어요!{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 71, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공룡들이 하수구 안쪽에 보금자리를 마련한거 같네요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 72, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}앞을 조심하세요, 상당한 숫자에요!{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 73, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조금만 더 이동하면 다른 도시와 연결된 시설이 나올거에요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 74, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}얼마 안남았어요, 조금만 더 힘내주세요.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 75, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이 곳에 많은 수의 공룡이 자리를 잡은 것 같아요.{/col}")
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}모두 처치하면 공룡의 숫자를 꽤 줄일 수 있을 거에요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(8)
	end
}

reg_evt
{
	idx = 76, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이 시설은 다른 도시로 연결되어 있어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}공룡들이 이 시설을 벗어나면 다른 도시가 위험해져요.{/col}")	
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}공룡이 이 곳을 벗어나지 못하도록 최대한 막아야 해요.{/col}")
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}곧 공룡들이 이동할거에요, 준비해주세요!{/col}")				
		add_snd(7, "DinoMode_message.wav")
		add_msg(7, "{col:255, 255, 255, 255}공룡이 시설을 벗어나는 것을 저지하십시오.{/col}")
		clr_evt(11)
	end
}

reg_evt
{
	idx = 77, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}한 무리를 막아낸거 같아요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}하지만 이게 전부는 아닐거에요.{/col}")			
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}곧 공룡들이 이동할거에요, 준비해주세요!{/col}")				
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}공룡이 시설을 벗어나는 것을 저지하십시오.{/col}")
		clr_evt(9.5)
	end
}

reg_evt
{
	idx = 78, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}여러분 덕분에 이제 다른 도시는 안전해요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}하지만, 더 깊은 곳에 공룡들의 서식지가 있을거 같은 불길한 예감이 드네요.{/col}")			
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}재정비 후 마지막 구역으로 이동하도록 하죠.{/col}")						
		clr_evt(8)
	end
}

-----------------
-- Day 6
-----------------

reg_evt
{
	idx = 79, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}분석 결과가 틀리길 바랬는데...{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}알의 모양을 보니 변이가 이미 진행된 모양이에요.{/col}")			
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}더 이상 변이가 진행되면 사태를 겉잡을 수 없게 될거에요.{/col}")			
		add_snd(5.5, "DinoMode_dialog.wav")
		add_dlg(5.5, "{col:255, 255, 0, 255}알이 부화되기 전에 모두 처리해주세요!{/col}")			
		add_snd(7, "DinoMode_dialog.wav")
		add_dlg(7, "{col:255, 255, 0, 255}모든 공룡알을 제거하십시오.{/col}")						
		clr_evt(11)
	end
}

reg_evt
{
	idx = 80, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}알을 보호하려 공룡들이 몰려올거에요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 81, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}다른 알들도 파괴해야 해요, 앞으로 이동하세요.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 82, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}앞을 조심하세요, 공룡들이에요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 83, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}공룡들이 몰려올거에요, 알을 파괴하세요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 84, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}포위당한거 같아요, 조심하세요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 85, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}변종알은 이게 마지막 인것 같아요.{/col}")		
		add_snd(2.5, "DinoMode_Dinospawn1.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}이것만 처리하면 더 이상 공룡이 늘어나진 않겠죠.{/col}")		
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡이 습격해 옵니다.{/col}")					
		clr_evt(8)
	end
}

reg_evt
{
	idx = 86,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}녀석들의 소굴이 정리되었으니, 이제 더 이상 공룡의 위협은 없겠네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}다음 지역으로 이동하면 도시를 벗어날 수 있어요.{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}아직 남은 공룡이 있을지 모르니 재정비 후 이동해 주세요.{/col}")		
		clr_evt(8)	
	end
}

reg_evt
{
	idx = 87,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}알들을 모두 처리했으니 더 이상 공룡이 생겨나진 않을거에요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}이제 저 통로를 통해 밖으로 나가도록 하죠.{/col}")
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}표시된 위치로 이동하십시오.{/col}")
		clr_evt(8)	
	end
}

reg_evt
{
	idx = 88, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Dinospawn1.wav")
		add_dlg(1, "{col:255, 255, 0, 255}아직 생각보다 많은 공룡이 남아있네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}이 공룡들만 처리하면 도시는 안전해질거에요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}공룡이 공격해옵니다.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 89,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이게 무슨 소리죠? 느낌이 좋지 않네요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}뭔가 거대한 물체가 그곳으로 향하고 있어요.{/col}")		
		clr_evt(6.5)	
	end
}

reg_evt
{
	idx = 90,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_Boss.wav")
		add_dlg(1, "{col:255, 255, 0, 255}이럴 수가! 어떻게...이런 일이!{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}큰일이에요, 녀석들중에서 가장 위험한 T-Rex가 깨어난것 같아요!{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}T-Rex가 등장했습니다.{/col}")
		clr_evt(8)					
	end
}

reg_evt
{
	idx = 91, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}상황이 매우 좋지 않아요. 녀석은 너무 강해요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}녀석에게 물리거나 밟히면 치명적이니 난간을 이용해 피하세요.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}T-Rex를 제거하십시오.{/col}")
		clr_evt(8)
	end
}

reg_evt
{
	idx = 92, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}조심하세요 녀석의 공격에 난간이 끊어지고 있어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}떨어지지 않도록 조심하세요.{/col}")		
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 93,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}녀석은 너무 강해요... 일반적인 공격으로는 녀석을 처치하기 힘들거 같아요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}뭔가 좋은 방법이 없을까요?{/col}")		
		clr_evt(6.5)					
	end
}

reg_evt
{
	idx = 94,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}저 기둥을 폭파시켜 녀석에게 큰 피해를 줄 수 있지 않을까요?{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}다른 방법이 없어요. 한번 시도해 보도록 하죠.{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}기둥에 폭탄을 설치하십시오.{/col}")
		clr_evt(8)					
	end
}

reg_evt
{
	idx = 95, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}놈을 죽일 수 는 없겠지만 계속 공격하다보면 잠시 무력화 시킬 수 있을거에요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}4개의 기둥에 폭탄을 모두 설치하면 그 때 폭파시키세요.{/col}")		
		clr_evt(6.5)
	end
}

reg_evt
{
	idx = 96,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}좋아요, 이제 녀석이 가운데로 오는 순간이 기회에요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}조금만 더... 조금만더...{/col}")
		add_snd(4, "DinoMode_dialog.wav")
		add_dlg(4, "{col:255, 255, 0, 255}곧 폭탄이 터질거에요, 안전한 곳으로 이동하세요!{/col}")
		add_snd(5.5, "DinoMode_message.wav")
		add_msg(5.5, "{col:255, 255, 255, 255}안전한 곳으로 이동하십시오.{/col}")
		clr_evt(9.5)					
	end
}

reg_evt
{
	idx = 97,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}지금이에요! 기둥을 폭파시키세요!{/col}")
		clr_evt(5)					
	end
}

reg_evt
{
	idx = 98,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}해냈군요! 이제 이 곳을 벗어나도록 하죠.{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}표시된 지점으로 이동하십시오.{/col}")
		clr_evt(6.5)					
	end
}

reg_evt
{
	idx = 99,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}그 폭발에서도 살아남다니!{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}방법이 없어요, 놈은 너무 강해요! 도망치세요 어서!{/col}")				
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}표시된 지점으로 이동하십시오.{/col}")
		clr_evt(8)					
	end
}

reg_evt
{
	idx = 100, 
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}문을 파괴해야 앞으로 나아갈 수 있어요.{/col}")
		add_snd(2.5, "DinoMode_dialog.wav")
		add_dlg(2.5, "{col:255, 255, 0, 255}녀석이 다가오기 전에 빨리 문을 파괴하세요!{/col}")
		add_snd(4, "DinoMode_message.wav")
		add_msg(4, "{col:255, 255, 255, 255}문을 공격해 파괴하십시오.{/col}")		
		clr_evt(8)
	end
}

reg_evt
{
	idx = 101,
	func = function ()
		add_img(0, "info_portrait.i3i")
		add_snd(1, "DinoMode_dialog.wav")
		add_dlg(1, "{col:255, 255, 0, 255}군의 공격 헬기에요! 이거라면 녀석을 처치할 수 있을거에요!{/col}")		
		add_snd(2.5, "DinoMode_message.wav")
		add_msg(2.5, "{col:255, 255, 255, 255}헬리콥터를 이용해 T-Rex를 처리하십시오.{/col}")
		clr_evt(6.5)					
	end
}



----------------