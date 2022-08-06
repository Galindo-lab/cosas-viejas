docx =[[
   _____       _      
  / ____|     | |     
 | |  __  __ _| | ___ 
 | | |_ |/ _` | |/ __|
 | |__| | (_| | | (__ 
  \_____|\__,_|_|\___|
                        
  
 ==== Documentacion ====


 value = {
   toFraccion: 
    @param  num         numero a convertir en fraccion.
    @return numerador   numerador de la fraccion.
    @return denominador denominador de la fraccion.
    @return error       error en la fraccion.

  toFraccionString:
    @param  numerador   numerador de la fraccion.
    @param  denominador denominador de la fraccion.
    @return string      fraccion en string.
 }

 formula = {
  general:
    @param  a            variable a
    @param  b            variable b
    @param  c            variable c
    @return resultado_1  
    @return resultado_2  
 }
]]

print(docx)

math.isnan = function(value)
   return value ~= value
end

value = {
   toFraccion = function(num)
      local W = math.floor(num)
      local F = num - W
      local pn, n, N = 0, 1
      local pd, d, D = 1, 0
      local x, err, q, Q
      repeat
	 x = x and 1 / (x - q) or F
	 q, Q = math.floor(x), math.floor(x + 0.5)
	 pn, n, N = n, q*n + pn, Q*n + pn
	 pd, d, D = d, q*d + pd, Q*d + pd
	 err = F - N/D
      until math.abs(err) < 1e-15
      return N + D*W, D, err
   end,

   toFractionString = function(numer,denom)
      return string.format("%.14g/%d = %d/%d + %g", numer, denom, value.toFraccion(numer/denom))
   end
}

formula = {
   general = function(a,b,c)
      local root = function(a,b,c)
	 return math.sqrt(b^2 + (4*a*c))
	 
      end

      local div = function(vl,num)
	 if num == 0 then
	    return "ERROR: El numerador es 0."
	 else
	    return
	       value.toFractionString(vl[1],num),
	    value.toFractionString(vl[2],num)
	 end
	 
      end

      local sumnsub = function(a,b)
	 if math.isnan(b) then
	    return "ERROR: raiz irracional."
	 else
	    return { a+b, a-b }
	 end
	 
      end
      
      return div(sumnsub(-b,root(a,b,c)),2*a)
   end,
   
}

pol = {
   eval = function(pol, test)
      local res = 0
      
      for i,val in ipairs(pol) do
	 if i==#pol then
	    res = res + val
	 else  
	    res = res+(val*(test^(#pol-i)))
	 end
      end
   
      return res
   end,

   --[[eval = function(p,t,carry)
      if #p == 1 then
	 return carry + table.remove(p,1)
      else
	 return
	    pol.eval(p,t,(carry or 0) + table.remove(p,1)*(t^(#p)))
      end
      end,]]

   pols = function(a)
      local b = a
      return b[1]
   end,

   rango = function(p,de,a,paso,faction)
      for i=de,a,(paso or 1) do
	 if faction then
	    print(value.toFraccion(pol.eval(p,i)))
	 else
	   print(string.format("%.5g\t|\t%g",i,pol.eval(p,i) ) )
	 end
      end
   end
   
}


