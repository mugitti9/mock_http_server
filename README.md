## これは何
post送信やget送信のテストをしたいときに使う、モックサーバを起動するためのレポジトリです。

## 何してくれるの
立ち上がったmockサーバに対してリクエストを送ると

- post送信の場合は、リクエストパラメータの中にあるパラメータを全部

- getの場合はクエリパラメータをjsonの形にして全部

変換して、返却します。

## ポートを変えたい場合
main.pyのportの変数をいじってください。
