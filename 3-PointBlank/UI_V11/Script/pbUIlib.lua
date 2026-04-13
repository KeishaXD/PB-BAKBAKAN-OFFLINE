--require 제거 버전
require "Script.uiLuaString.pbCommonDefine"
require "Script.uiLuaString.pbCommonStruct"
require "Script.uiLua.uiUtil"

---------------------------------------
--[BLOCK_START:imgList_Map]
class 'imgList_Map' (uiUser)

function imgList_Map:__init(id)
	uiUser.__init(self, id)

	self.current = 0
end

function imgList_Map:setImageIndex( index)
	uiCtrl_setVisibleShape( self.ctrlID, 0, -1)	-- shape을 invisible상태로..
	uiCtrl_setVisibleShape( self.ctrlID, 1, index)	-- index의 shape을 visible상태로
	self.current = index
end

--[BLOCK_END:imgList_Map]
---------------------------------------
--[BLOCK_START:imgList_Rank]
class 'imgList_Rank' (uiUser)

function imgList_Rank:__init(id)
	uiUser.__init(self, id)

	self.current = 0
end

function imgList_Rank:setImageIndex(...)
	local ctrlID, index = ...
	uiCtrl_setVisibleShape( ctrlID, 0, -1)	-- shape을 invisible상태로..
	uiCtrl_setVisibleShape( ctrlID, 1, index)	-- index의 shape을 visible상태로
	self.current = index
end
--[BLOCK_END:imgList_Rank]
---------------------------------------
--[BLOCK_START:imgList_MapMode]
class 'imgList_MapMode' (uiUser)

function imgList_MapMode:__init(id)
	uiUser.__init(self, id)

	self.current = 0
end

function imgList_MapMode:setImageIndex(index)
	uiCtrl_setVisibleShape( self.ctrlID, 0, -1)	-- shape을 invisible상태로..
	uiCtrl_setVisibleShape( self.ctrlID, 1, index)	-- index의 shape을 visible상태로
	self.current = index
end

--[BLOCK_END:imgList_MapMode]
---------------------------------------
--[BLOCK_START:simple_msgbox]
class 'simple_msgbox' (uiMessageBox)

function simple_msgbox:__init(id)
	uiMessageBox.__init(self, id)

	uiMB_setMessagePos(self.ctrlID, 13.0, 40.0)
	uiMB_setBottomSpace(self.ctrlID, 15.0)
end
--[BLOCK_END:simple_msgbox]
---------------------------------------
--[BLOCK_START:gray_msgbox]
class 'gray_msgbox' (uiMessageBox)

function gray_msgbox:__init(id)
	uiMessageBox.__init(self, id)

	uiMB_setMessagePos(self.ctrlID, 5.0, 5.0)
	uiMB_setBottomSpace( self.ctrlID, 5.0)
end
--[BLOCK_END:gray_msgbox]