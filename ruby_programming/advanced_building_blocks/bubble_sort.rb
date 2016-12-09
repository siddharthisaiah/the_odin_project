#!/usr/bin/env ruby

# A bubble sort method
def bubble_sort(arr)
	(0...arr.length-1).each do
		(0...arr.length-1).each do |current|
			if arr[current] > arr[current + 1]
				arr[current], arr[current+1] = arr[current+1], arr[current]
			end
		end
	end
	return arr
end

# A bubble sort methods that accepts a block
def bubble_sort_by(arr)
	(0...arr.length-1).each do
		(0...arr.length-1).each do |current|
			if yield(arr[current], arr[current + 1]) > 0
				arr[current], arr[current+1] = arr[current+1], arr[current]
			end
		end
	end
	return arr
end

numbers_list = [4, 3, 78, 2, 0, 2]
puts "#bubble_sort on #{numbers_list}"
sorted_numbers_list = bubble_sort(numbers_list)
puts "Result is #{sorted_numbers_list}"

puts "*" * 20

str_array = ["hi", "smelly", "giraffe", "hello","hey"]
puts "#bubble_sort_by on #{str_array}"
sorted = bubble_sort_by(str_array) do |left, right|
	left.length - right.length
end
puts "Result is #{sorted}"


