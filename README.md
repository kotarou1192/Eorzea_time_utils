エオルゼアの時間を取得するクラスや天気を算出する関数。

使い方

```ruby
puts ET.new.to_s
```

こんな感じでゲーム内時間が何時何分何秒かが24時間表記で出る。コード読めば他のはわかるはず。  
ヌシ釣りサポートツールを作る場合は未来の時間が必要になってくるのでそのあたりで改修が必要だと思う。  

moduleに関しては天気テーブルなるものがあるのだが、そのテーブルには雨や雷等の閾値が記載してあり、moduleの関数出だした数字で天気がわかる。
