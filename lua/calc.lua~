function to_frac(num)
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
end

function print_frac(numer,denom)
   return string.format("%.14g/%d = %d/%d + %g", numer, denom, to_frac(numer/denom))
end

function reverse(t)
  local n = #t
  local i = 1
  while i < n do
    t[i],t[n] = t[n],t[i]
    i = i + 1
    n = n - 1
  end

  return t
end



function formula_general(a,b,c)
   --determina los numeradores de la divicion, retorna una lista con los valores
   -- sumados y restados
   local num = function(a,b,c)
      local root = function(a,b,c)
	 return math.sqrt(math.pow(b,2) - (4*a*c))
      end

      local ms = function(a,b)
	 return { a + b, a - b }
      end
      
      return ms(-b, root(a,b,c))
   end

   --divide los valores de la lista 
   local div = function(values,num)
      local res = {}
      
      for index,value in ipairs(values) do
	 table.insert(res , print_frac(value,num) )
      end

      return res
   end
   
   return div(num(a,b,c),2*a)
end

function pol_str(polinomio)
   local msg = ""
    
   for i,val in ipairs(polinomio) do
      if i==#polinomio then
	 msg = msg.." + "..val
      else  
	 msg = msg.." + "..val.."x^"..#polinomio-i
      end
   end
   return msg
end

function pol(polinomio, test)
   local res = 0
    
   for i,val in ipairs(polinomio) do
      if i==#polinomio then
	 res = res + val
      else  
	 res = res+(val*(test^(#polinomio-i)))
      end
   end
   
   return res 
end

function rango(poli,de,a,paso)
   for i=de,a,(paso or 1) do
      print("f("..i..") = "..pol(poli, i))
   end
end

function eval(polinomio,de,a,paso)
   print(pol_str(polinomio))
   print("-----------------")
   rango(polinomio,de,a,paso)
end

function cmp_pln(pol1,pol2,de,a,paso)
   print(" \t"..pol_str(pol1),pol_str(pol2))
   print("-------------------------")
   for i=de,a,(paso or 1) do
      print(string.format("%.2g\t|\t%.3g\t|\t%.3g",i,pol(pol1,i),pol(pol2,i)))
      --print(i.."\t| "..pol(pol1,i),pol(pol2,i))
   end
end
