def substrings string_args, dictionary
	substrings_hash = Hash.new(0)												#default count to 0
	string_array = string_args.downcase.split									#split words into array

	for word in string_array
		for find_word in dictionary
			if word.scan(find_word).empty? == false								#find atleast 1 match - dont want empty lists						
				substrings_hash[find_word] = substrings_hash[find_word] + word.scan(find_word).length 
				#add length of result array to default value, the scan method returns an array of matches
			end
		end
	end

	return substrings_hash
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
single_words = substrings("below", dictionary)
mulitple_words = substrings("Howdy partner, sit down! How's it going?", dictionary)

puts single_words
puts mulitple_words