
function sprintf(format,...) print(string.format(format,...)) end

function UnitTest( func , ... , expected )
	if func(...) == expected then
		print "Test passed"
	else
		sprintf("%s expected, get %s",expected,toString(func(...)))
	end
end

UnitTest(function(input)
	return "test"..input
end,1,"test1")
