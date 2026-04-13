--[[
@file extract_enums.lua
@author excel96
@brief C++ 소스에서 열거값 데이터를 LUA 소스로 뽑아내기 위한 스크립트
--]]

-- 문자열에서 앞뒷쪽의 빈 공간을 날린다.
function strip(text)
    return string.gsub(text, "^[ \t\r\n]+|[ \t\r\n]+$", "")
end

-- 문자열에서 C++ identifier를 뽑아낸다.
-- "this_is_identifier = 0;" --> "this_is_identifier"
function extract_id(text)
    if text == nil then return "" end
    local b, e = string.find(text, "[a-zA-Z_][a-zA-Z0-9_]*")
    if b ~= nil then return strip(string.sub(text, b, e)) end
    return ""
end
    
-- 문자열에서 코멘트 문자열을 뽑아낸다. 
-- 원래 라인 주석은 "//" 뒤쪽의 모든 문자열이지만,
-- 현재 소스의 특수성(doxygen)을 고려하여 "///<"에 대한 처리도 집어넣었다.
-- "// this is comment" --> "this is comment"
-- "///< this is comment" --> "this is comment"
function extract_comment(text)
    local _, _, m1, m2 = string.find(text, "(//[/<]*)(.*)")
    if m2 ~= nil then return strip(m2) end
    return ""
end

-- 주어진 N개의 파일들에서 열거값을 뽑아내어,
-- 하나의 출력 파일에다 그 값들을 기록한다.
function generate(input_filenames, output_filename)
    -- 출력 파일을 연다.
    local output = assert(io.open(output_filename, "w"))
    
    -- 입력 파일 목록 모두를 열어서 열거값을 출력 파일에다 기록한다.
    for _, filename in pairs(input_filenames) do
    
        local bEnum = false -- 현재 열거값 내부를 처리 중인가?
        local count = 0 -- 열거값 처리 중이라면 현재 열거값의 실제 값은?
    
        for line in io.lines(filename) do
            -- 열거값 처리 중이라면...
            if bEnum then
                -- 열거값 구문의 끝에 도달했는지 체크한다.
                if string.find(line, "};") ~= nil then
                    output:write("-- end enum --\n\n")
                    bEnum = false
                -- 열거값 구문의 끝이 아니라면, 열거값과 그 값을 기록한다.
                else
                    local id = extract_id(line)
                    if string.len(id) > 0 then
                        local text = id .. " = " .. tostring(count)
                        
                        -- 열거값 뒤쪽에 붙은 주석을 처리한다.
                        local comment = extract_comment(line)
                        if string.len(comment) > 0 then
                            text = text .. " -- " .. comment
                        end
                        
                        output:write(text .. "\n")
                        count = count + 1
                    end
                end
            -- 열거값 구문이 새로 시작되는지 체크한다.
            elseif string.find(line, "^enum") ~= nil then
		output:write( "\n-- "..line .."\n")
                bEnum = true
                count = 0
	    elseif string.find(line, "#define") ~= nil then
		local text = string.gsub(line, "#define", "")
		local id = extract_id(text)
		
		text = strip( string.gsub(text, id, ""))
		
		local comment = extract_comment(text)
		text = strip(string.gsub(text, comment, ""))
		
		local value = strip( string.gsub(text, "(//[/<]*)(.*)", ""))
		
		if string.len(id) > 0 then
		-- 열거값 뒤쪽에 붙은 주석을 처리한다.
			if string.len(value) > 0 then
				text = id.." = "..value
				if string.len(comment) > 0 then
					text = text.." -- " .. comment
				end
			end
			output:write(text .. "\n")
		end
            end
        end
    end
    
    output:close()
end

-- 해당하는 파일의 들여쓰기를 예쁘게(-_-) 만든다.
function decorate(filename)
    local originals      = {}
    local seperator      = "="
    local comment        = "//"
    local lhs_max_length = 0
    
    for line in io.lines(filename) do
        local b, e = string.find(line, seperator)
        if b ~= nil then
            local lhs = strip(string.sub(line, 1, b-1))
            local rhs = strip(string.sub(line, b+1, string.len(line)))
            lhs_max_length = math.max(lhs_max_length, string.len(lhs))
        end
        table.insert(originals, line)
    end
    
    f = assert(io.open(filename, "w"))
        
    for _, line in pairs(originals) do
        local text = line

        local b, e = string.find(line, seperator)
        if b ~= nil then
            local lhs = strip(string.sub(line, 1, b-1))
            local rhs = strip(string.sub(line, b+1, string.len(line)))
            local needed_space = lhs_max_length - string.len(lhs)
            for i=1,needed_space do
                lhs = lhs .. " "
            end
            text = lhs .. seperator .. rhs .. "\n"
        else
            text = text .. "\n"
        end
            
        f:write(text)
    end
    
    f:close()
end

input_files = {
    "E:\\PointBlank\\Source_New\\CommonSource\\CommonDef.h",
}
        
generate(input_files, "E:\\PointBlank\\Media\\Script\\uiLuaString\\pbCommonDefine.lua")
decorate("E:\\PointBlank\\Media\\Script\\uiLuaString\\pbCommonDefine.lua")