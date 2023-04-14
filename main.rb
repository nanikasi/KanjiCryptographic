require "./wordlist.rb"

def main
	print("Press E for encryption and D for decryption: ")
	input = gets.chomp!
	if (input == 'E' || input == 'e')
		encrypt
	elsif (input == 'D' || input == 'd')
		decrypt
	else
		puts("Try again.")
	end
end

def encrypt
	print("plaintext : ")
    plaintext = gets.chomp!
    print("key       : ")
    key = gets.chomp!
	binary = Binary.new
	beautifulMagicWord = BeautifulMagicWord.new
    sNormalNumber = binary.changeSWordToSNumber(plaintext)
    sKeyNumber = binary.changeSPasswordToSNumber(key)
    iMagicNumber=("1" + sNormalNumber).to_i * sKeyNumber.to_i

    magicWord = beautifulMagicWord.changeSNumberToSKanji(iMagicNumber.to_s)
    puts("ciphertext: #{magicWord}")
end

def decrypt
	print("ciphertext: ")
    magicSentence = gets.chomp!
    print("key       : ")
    keySentence = gets.chomp!
	binary = Binary.new
	test = BeautifulMagicWord.new
    sKeyNumber = binary.changeSPasswordToSNumber(keySentence)
    normalSNumber = test.changeSKanjiToSNumber(magicSentence)
    if normalSNumber == "ERROR" || normalSNumber.to_i%sKeyNumber.to_i != 0
        puts("Error. Try again.")
		return
	end
	sNormalNumber = (normalSNumber.to_i / sKeyNumber.to_i).to_s
	
	sNormalNumber.slice!(0)
	normalSentence = binary.changeSNumberToSWord(sNormalNumber)
	puts("plaintext : #{normalSentence}")
end

main