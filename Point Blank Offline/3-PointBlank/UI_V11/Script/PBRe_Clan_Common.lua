

-- 클래스에 종속되지 않아도 되므로, 함수로 바꿉니다. (11.06.30.수빈)
-- 단, i3UI관련 인클루드가 필요하므로, 쓸때 마지막에 인클루드시킵니다.

function	SetImageSetIndex( control, shape_idx)
	if shape_idx == -1 then
		uiCtrl_setEnable( control, false)
	else
		uiCtrl_setEnable( control, true)
		uiImageSet_setShape( control, shape_idx )
		uiImageSet_setViewOnly( control, true)
	end
end
