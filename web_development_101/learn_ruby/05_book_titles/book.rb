class Book
# write your code here

    def title=(title)
        @title = titleize(title)
    end
    
    def title

        return @title
    end

    def titleize sentence
    	word_array = sentence.split
    	result = []

    	nocaps = ['a', 'an', 'and', 'in', 'of', 'the']

    	word_array.each do |word|
        	if nocaps.include?(word)
            	result.push(word.downcase)
        	else
            	result.push(word.capitalize)
        	end
    	end
        
    	result[0] = result[0].capitalize    
    	newStr = result.join(" ")
    	return newStr
	end

end
