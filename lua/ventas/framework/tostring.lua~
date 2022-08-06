function table_to_string(tbl)
   local result = "{"
   for k, v in pairs(tbl) do
      if type(k) == "string" then
	 result = result.."[\""..k.."\"]".."="
      end

      if type(v) == "table" then
	 result = result..table_to_string(v)
      elseif type(v) == "boolean" then
	 result = result..tostring(v)
      else
	 result = result.."\""..v.."\""
      end
      result = result..","
   end

   if result ~= "" then
      result = result:sub(1, result:len()-1)
   end
   return result.."}"
end
