--
--
--  UI 프로그래머를 위한 설명.
-- 1. 콜백함수 등록...
--  reg_callback_img(fun)   : 이미지 파일 이름 인수 함수 등록.
--  reg_callback_dlg(fun)   : 다이알로그 텍스트 인수 함수 등록.
--  reg_callback_snd(fun)   : 사운드 파일 이름 인수 함수 등록.
--  reg_callback_msg(fun)   : 메세지 텍스트 인수 함수 등록.
--  reg_callback_fde(fun)   : 페이드 인/아웃 인수 함수 등록.
--  reg_callback_clr(fun)   : 종료 함수 등록으로 인수없음.
--  위 5개함수는 콜백함수등록으로, 콜백함수를 직접 만들어서 위 함수들에 넣은뒤 전역으로 호출하면 됩니다..
--
--  2. proc_evt(evt_idx)
--  콜루아쪽 함수.  서버로부터 이벤트 인덱스를 받으면 기존 UI 콜루아 함수로 인덱스를 넘기고, 이 함수를 내부에서 호출하면 됨..
--  유효한 이벤트라면 true, 그렇지 않다면 false를 리턴함..
--
--  3. is_empty_seg()
--  콜루아 함수.  이벤트세그먼트가 남아 있는지 true/false 질의함.  기존UI콜루아 함수에서 이걸 호출하게 합니다..
--  남아 있는게 없으면 나머지 세그먼트 처리를 하지 않도록 합니다.
--  4. pop_seg_time()
--  콜루아 함수.  현재 주어진 세그먼트 시간을 pop하고 리턴함.  기존 UI콜루아함수에서 이걸 호출하게 합니다..
--  이 시간을 가지고, C++의 타이머업데이트 경과시간과 비교하면 됩니다..
--  (주의) is_empty_seg()가 false인 경우에 사용.
--  5. run_seg()
--  콜루아 함수.  C++쪽 타이머값이 pop했던 세그먼트 시간에 도달하면 이 함수를 호출하게 합니다.
--  (주의) is_empty_seg()가 false인 경우에 사용해야하는데, pop_seg_time()으로 얻은값이 유효값이면 될것임..
--
-- 5번 루틴까지 진행되면, 3번부터 계속 반복처리하여 세그먼트가 모두 없어질때까지 하면 됨...
--


f_print_img = function (name) end
f_print_dlg = function (txt) end
f_print_snd = function (name) end
f_print_msg = function (txt) end
f_print_fde = function (val) end
f_print_clr = function () end

function reg_callback_img(f)	f_print_img = f		end
function reg_callback_dlg(f)	f_print_dlg = f		end
function reg_callback_snd(f)	f_print_snd = f		end
function reg_callback_msg(f)	f_print_msg = f		end
function reg_callback_fde(f)  f_print_fde = f   end
function reg_callback_clr(f)	f_print_clr = f		end

class 'seg'
function seg:__init(time)
	self.start_time = time
end

class 'seg_img' (seg)
function seg_img:__init(time, name)
	seg.__init(self, time)
	self.img = name
end

function seg_img:call()
	f_print_img(self.img)
end

class 'seg_dlg' (seg)
function seg_dlg:__init(time, txt)
	seg.__init(self, time)
	self.dlg = txt
end

function seg_dlg:call()
	f_print_dlg(self.dlg)
end

class 'seg_snd' (seg)
function seg_snd:__init(time, name)
	seg.__init(self, time)
	self.snd = name
end

function seg_snd:call()
	f_print_snd(self.snd)
end

class 'seg_msg' (seg)
function seg_msg:__init(time, txt)
	seg.__init(self, time)
	self.msg = txt
end

function seg_msg:call()
	f_print_msg(self.msg)
end

class 'seg_fde' (seg)
function seg_fde:__init(time, val)
  seg.__init(self, time)
  self.fde = val;
end

function seg_fde:call()
  f_print_fde(self.fde)
end

class 'seg_clr' (seg)
function seg_clr:__init(time)
	seg.__init(self, time)
end

function seg_clr:call()
	f_print_clr()
end

progress_idx = 0
command_seg  = {}				----  이벤트가 끝날때마다 리셋해주는게 좋겠다..
evt_table = {}

function add_img(start_time, img)
	table.insert(command_seg, seg_img( start_time, img) )
end

function add_dlg(start_time, dlg)
	table.insert(command_seg, seg_dlg( start_time, dlg) )
end

function add_snd(start_time, snd)
	table.insert(command_seg, seg_snd( start_time, snd) )
end

function add_msg(start_time, msg)
	table.insert(command_seg, seg_msg( start_time, msg) )
end

function add_fde(start_time, val)
  table.insert(command_seg, seg_fde( start_time, val) )
end

function clr_evt(start_time)
	table.insert(command_seg, seg_clr( start_time) )
end

function reset_seg()
	command_seg = {}
	progress_idx = 0
end

function sort_seg()
	table.sort( command_seg, function (a,b) return (a.start_time < b.start_time ) end )
end


----- proc_evt는 call_lua대상임..
function proc_evt(evt_idx)
	local tbl_size = table.maxn(evt_table)
	if evt_idx >= tbl_size then return false end

	local fn = evt_table[evt_idx + 1]
	if fn == nil then return false end

	reset_seg()
	fn()
	sort_seg()

	return true
end

function reg_evt( input )
	evt_table[input.idx + 1] = input.func
end

function is_empty_seg()
	return progress_idx >= #command_seg
end

function pop_seg_time()
	progress_idx = progress_idx + 1
	local my_seg = command_seg[progress_idx]
	return my_seg.start_time
end

---- 해당 시간이 되면, 이벤트를 뿌리는데, 이때 플레이시간이 같은것끼리 묶어서 한꺼번에 처리한다.
function run_seg()

	local curr_seg = command_seg[progress_idx]
	curr_seg:call()

	local curr_time = curr_seg.start_time

	local tbl_size = #command_seg

	for i = progress_idx + 1, tbl_size do
		local next_seg = command_seg[i]
		local time_diff = next_seg.start_time - curr_time

		if  time_diff > 0.001 then
			progress_idx = i - 1
			return
		end

		progress_idx = i
		next_seg:call()
	end

end

