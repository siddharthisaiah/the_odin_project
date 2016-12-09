#write your code here

def echo says
    return says
end

def shout something
    return something.upcase
end

def repeat something, times=2
   result = (something + ' ') * times
   return result.chop
end

def start_of_word word, letters
    return word[0,letters]
end

def first_word sentence
    return sentence.split[0]
end

def titleize sentence
       word_array = sentence.split
       result = []

       nocaps = ['a', 'an', 'and', 'in', 'of', 'the', 'over']

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

