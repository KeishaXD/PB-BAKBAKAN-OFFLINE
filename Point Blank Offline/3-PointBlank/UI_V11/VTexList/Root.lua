
---------------------------------------
--[BLOCK_START:ButtonImageSet_Ready]
require "Script.uiLua.uiUtil"
 
class 'ButtonImageSet_Ready' (uiButtonImageSet)

function ButtonImageSet_Ready:__init(id)
	ButtonImageSet_Ready.__init(self, id)
	self.current = 0
end

function ButtonImageSet_Ready:setImageIndex( pCtrl, index)
	local nIdx = tonumber( index)
	if nIdx == nil then
		uiImageSet_setShapeByString( pCtrl, index)
	else
		uiImageSet_setShape( pCtrl, index)
	end
end

function ButtonImageSet_Ready:getShapeCount( )
	return uiCtrl_getShapeCount( self.ctrlID)
end

--[BLOCK_END:ButtonImageSet_Ready]
---------------------------------------
--[BLOCK_START:ButtonImageSet_Ping_A]
require "Script.uiLua.uiUtil"
 
class 'ButtonImageSet_Ping_A' (uiButtonImageSet)

function ButtonImageSet_Ping_A:__init(id)
	ButtonImageSet_Ping_A.__init(self, id)
	self.current = 0
end

function ButtonImageSet_Ping_A:setImageIndex( pCtrl, index)
	local nIdx = tonumber( index)
	if nIdx == nil then
		uiImageSet_setShapeByString( pCtrl, index)
	else
		uiImageSet_setShape( pCtrl, index)
	end
end

function ButtonImageSet_Ping_A:getShapeCount( )
	return uiCtrl_getShapeCount( self.ctrlID)
end

--[BLOCK_END:ButtonImageSet_Ping_A]

---------------------------------------
--[BLOCK_START:User_MessageList]
require "Script.uiLua.uiUtil"

class "User_MessageList" (uiUser)

function User_MessageList:__init(id)
	uiUser.__init(self,id)
end

function User_MessageList:setText(txt1,txt2)
	local ctrl = uiCtrl_getChild(self.ctrlID, 0)
	uiCaption_setText(ctrl,txt1)

	ctrl = uiCtrl_getChild(self.ctrlID, 1)
	uiCaption_setText(ctrl,txt2)
end

--[BLOCK_END:User_MessageList]