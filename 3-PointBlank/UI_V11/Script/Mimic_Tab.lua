

class 'Mimic_Tab'

function Mimic_Tab:__init( ctrl_array )
	self.ctrl_array = ctrl_array
	self.curr_index = 1
	self.curr_ctrlID  = self.ctrl_array[1].ctrlID

	local table_size = #self.ctrl_array
	for i = 1, table_size, 1 do
		local ctrl_name = uiCtrl_getClass( ctrl_array[i].ctrlID )
		
		if	ctrl_name == "i3UIButtonComposed3" then
			uiButtonComposed3_skipUnselect(ctrl_array[i].ctrlID, true)
		elseif ctrl_name == "i3UIButton" then
			uiButton_skipUnselect(ctrl_array[i].ctrlID, true)
		end
	end
	
	self:SelectTab_Index(1)
	
end

function Mimic_Tab:SelectTab_Index( array_index )
	uiCtrl_setSelected( self.curr_ctrlID, false)
	
	self.curr_index = array_index
	self.curr_ctrlID = self.ctrl_array[array_index].ctrlID
	
	uiCtrl_setSelected( self.curr_ctrlID, true)
end

function Mimic_Tab:ToggleTab_Index( array_index )

	if self.ctrl_array[array_index].ctrlID ~= self.curr_ctrlID then
		self:SelectTab_Index(array_index)
	else
		self:ClearSelect()	
	end
end



function Mimic_Tab:SelectTab_Control( ctrl )		-- ctrlID가 아님.
	
	local table_size = #self.ctrl_array
	
	for i = 1, table_size, 1 do
		if self.ctrl_array[i].ctrlID == ctrl.ctrlID then
			self:SelectTab_Index(i)
			return
		end	
	end
end


function Mimic_Tab:ToggleTab_Control( ctrl )		-- ctrlID가 아님.
	
	local table_size = #self.ctrl_array
	
	for i = 1, table_size, 1 do
		if self.ctrl_array[i].ctrlID == ctrl.ctrlID then
			self:ToggleTab_Index(i)
			return
		end	
	end
end


function Mimic_Tab:ClearSelect()
	uiCtrl_setSelected( self.curr_ctrlID, false)
	self.curr_ctrlID = nil
end

function Mimic_Tab:RestoreSelect()
	self.curr_ctrlID = self.ctrl_array[self.curr_index].ctrlID
	uiCtrl_setSelected( self.curr_ctrlID, true)
end

function Mimic_Tab:setEnableAll( bEnable )
	local table_size = #self.ctrl_array
	for i = 1, table_size, 1 do
		self.ctrl_array[i]:setEnable(bEnable)		
	end
	
	if bEnable == true then
		self:SelectTab_Index( self.curr_index )
	else
		self:ClearSelect()
	end
end

function Mimic_Tab:GetCurrIndex()
	return self.curr_index
end



