def caeser_cipher string, shift
	
	alph_hash = {}

	uppercase = ('A'..'Z').to_a.join							#string A-Z
	lowercase = ('a'..'z').to_a.join							#string a-z
	encrypt_uppercase = ('A'..'Z').to_a.rotate(shift).join		#shifted string
	encrypt_lowercase = ('a'..'z').to_a.rotate(shift).join		#shifted string

	(0...26).each do |index|									#create hash with letter mappings to shift value
		alph_hash[uppercase[index]] = encrypt_uppercase[index]
		alph_hash[lowercase[index]] = encrypt_lowercase[index]
	end

	string.each_char do |char|
		if alph_hash.include?char then
			string.sub!(char, alph_hash[char])					#use the sub! method for each char in the string
		end
	end

	return string

end

puts caeser_cipher("What a string!", 5)