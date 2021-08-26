require "./wordlist.rb"


test = BeautifulMagicWord.new
binary = Binary.new


puts("暗号化ならaを復号化ならhを押してください。")
whitchAnswer = gets.chomp!
if whitchAnswer == "a"
    puts("暗号化したい文字列は?")
    normalSentence = gets.chomp!
    puts("鍵は？")
    keySentence = gets.chomp!
    p sNormalNumber = binary.changeSWordToSNumber(normalSentence)
    p sKeyNumber = binary.changeSPasswordToSNumber(keySentence)
    iMagicNumber=("1" + sNormalNumber).to_i * sKeyNumber.to_i

    magicWord = test.changeSNumberToSKanji(iMagicNumber.to_s)
    puts("こちらが暗号文：#{magicWord}")
elsif whitchAnswer == "h"
    puts("復号化する文字列は?")
    magicSentence = gets.chomp!
    puts("鍵は？")
    keySentence = gets.chomp!
    sKeyNumber = binary.changeSPasswordToSNumber(keySentence)
    puts("keyのバイナリーコード：#{sKeyNumber}")
    normalSNumber = test.changeSKanjiToSNumber(magicSentence)
    puts("本来の暗号コード：#{normalSNumber}")
    if normalSNumber == "ERROR"
        puts("暗号コードがおかしいです")
    else
        if normalSNumber.to_i%sKeyNumber.to_i == 0
            sNormalNumber = (normalSNumber.to_i / sKeyNumber.to_i).to_s
            
            sNormalNumber.slice!(0)
            
            puts("平文のバイナリーデータ：#{sNormalNumber}")
            normalSentence = binary.changeSNumberToSWord(sNormalNumber)
            puts("こちらが平文：#{normalSentence}")
        else
            puts("鍵が違います")
        end
    end
else
    puts("エラー")
end