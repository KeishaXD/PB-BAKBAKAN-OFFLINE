class 'RoomInfoBase'

function RoomInfoBase:__init(id)
	self._idx = 0
	self._title = ""
	self._StageID = 0
	self._State = 0
	self._PersonNow = 0
	self._PersonMax = 0
	self._Ping = 0
	self._Weaponflag = 0x0F
	self._InfoFlag = 0
	self._StageMask = 0
end