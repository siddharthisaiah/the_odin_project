#write your code here

def add a, b
    return a + b
end

def subtract a, b
    return a - b
end

def sum arry
    return arry.inject(0, :+)
end

def multiply a, b
	return a * b
end

def power a, b
	return a ** b
end

def factorial n
	
	if n == 0
		return 0
	elsif n == 1
		return 1
	else
		return n * factorial(n-1)
	end

end
