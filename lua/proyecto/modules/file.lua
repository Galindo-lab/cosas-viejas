file = {
   save = function(table_)      
      local file = io.open("data.lua", "w")
      file:write(save_table(table_))
      return file:close()
   end,

   load_data = function()
      return require("data")
   end,

   db_error = function()
      file.save({error_data = "data error"})
   end
}

function save_table(table_)
   local carry = "return {\n"
   for key, value in pairs(table_) do
      carry = carry.."\t{"
      for key_2, value_2 in pairs(value) do
	 carry = ("%s%s = %q;"):format(carry,key_2,value_2)
      end
      carry = carry.."},\n"
   end
   carry = carry.."}\n"

   return carry
end
