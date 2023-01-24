# KanjiCryptographic
## About
共通鍵暗号で生成された暗号を漢字に変換するプログラムです。
## How to use

```
git clone git@github.com:nanikasi/KanjiCryptographic.git
ruby main.rb
```

## What benefit
従来の暗号文の多くは数字とアルファベットの計37文字から構成されるため、暗号文が長くなります。
KanjiCryptographicはUTF-8で定義される22,223文字の漢字で変換しているため、従来の暗号文を短くすることができます。

これにより、文字数制限がある短文投稿サイト(Twitter)などで、暗号を投稿することができます。
