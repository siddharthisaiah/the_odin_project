#write your code here

def translate word_string
    vowels = ['a', 'e', 'i', 'o', 'u']
    word_array = word_string.split()
    
    result = ''

    word_array.each do |word|

        first_letter = word[0]
        second_letter = word[1]
        third_letter = word[2]

        # word begins with a vowel
        if vowels.include?(first_letter)
            result = result + (" #{word}ay")
        # word begins with a 'QU'
        elsif word[0..1] == 'qu'
            result = result + (" #{word[2..-1]}#{word[0..1]}ay")
        # word begins with a "CONSONANT+QU" eg: 'square'
        elsif vowels.include?(first_letter) == false && word[1..2] == 'qu'
            result = result + (" #{word[3..-1]}#{word[0..2]}ay")
        # first letter CONSONANT second letter vowel eg: 'banana'
        elsif vowels.include?(first_letter) == false && vowels.include?(second_letter) == true
            result = result + (" #{word[1..-1]}#{word[0]}ay")
        # first three letter are CONSONANTS eg: 'three'
        elsif vowels.include?(first_letter) == false && vowels.include?(second_letter) == false && vowels.include?(third_letter) == false
            result = result + (" #{word[3..-1]}#{word[0..2]}ay")
        # first two letters are CONSONANTS eg: 'cherry'
        elsif vowels.include?(first_letter) == false && vowels.include?(second_letter) == false
            result = result + ( " #{word[2..-1]}#{word[0..1]}ay")
        end

    end

    return result.lstrip
end
