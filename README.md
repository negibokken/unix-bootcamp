# Unix bootcamp

## 目次

<!-- TOC -->

- [Unix bootcamp](#unix-bootcamp)
    - [目次](#目次)
    - [歴史の話](#歴史の話)
    - [シェル](#シェル)
    - [基本的なコマンドの使い方](#基本的なコマンドの使い方)
    - [正規表現](#正規表現)
    - [ユーザ/グループ](#ユーザグループ)
    - [.xshrc](#xshrc)
    - [エイリアス](#エイリアス)
    - [シェルスクリプト](#シェルスクリプト)
        - [シェバン](#シェバン)
        - [エンコーディング](#エンコーディング)
        - [環境変数](#環境変数)
            - [自作のプログラムをいつでも使えるように](#自作のプログラムをいつでも使えるように)
    - [ジョブ](#ジョブ)
        - [バックグラウンドジョブ](#バックグラウンドジョブ)
        - [リダイレクト](#リダイレクト)
        - [パイプ](#パイプ)
    - [主要な / 以下のディレクトリ](#主要な--以下のディレクトリ)
    - [ファイル](#ファイル)
        - [代表的なファイルディスクリプタ](#代表的なファイルディスクリプタ)
        - [ファイルディスクリプタの制限](#ファイルディスクリプタの制限)
    - [プロセス](#プロセス)
        - [フォアグラウンドとバックグラウンド](#フォアグラウンドとバックグラウンド)
        - [jobs コマンド](#jobs-コマンド)
    - [デーモン](#デーモン)
    - [ちょっと脱線](#ちょっと脱線)
        - [tmux](#tmux)
        - [vim](#vim)
    - [参考文献](#参考文献)

<!-- /TOC -->

## 歴史の話

歴史の話は飛ばす。興味のある人はネットで検索するなりしてください。
あと歴史とは別だが、Unix(あとLinux)哲学を学ぶにあたって「Unixという考え方」は必読の書。

変な癖が付く前の初心者にこそ読んで欲しい。

## シェル

* 今だと zsh か fish が良いと思う

## コマンドを調べる時

* man コマンドを参照すると良い
    * セクション 1: だれもが実行できるユーザーコマンド
    * セクション 2: システムコール(カーネルが提供する関数)
    * セクション 3: サブルーチン(C ライブラリ関数)

## 基本的なコマンドの使い方

* ls
* mkdir
* cd
* echo
* cat
* touch
    * ファイルの時刻属性の変更
    * 空ファイル作成にも使える
* wc
    * -c
    * -l
* rm
* uniq
* sort
* cut
* more
* head
* tail
* less
* diff
* date
* sleep
* clear
* du
* df
* file
* whereis
    * コマンドの実行形式と、ソース、リファレンスがあるディレクトリを検索してパスを表示
* which
    * 優先度が高いコマンドのパスのみを表示
* whatis
* sed
* awk
* tee
* ps
* top コマンド
* kill
* killall
* find
* grep
* xargs
    * `ls directory/*.rb | xargs head`

## 練習問題

* リンク先のファイルをゲットせよ
    * https://raw.githubusercontent.com/negibokken/unix-bootcamp/master/src/access.log.sample.gz
* リンク先のファイルを解凍せよ
* ログ全体・最初の15行・最後の15行を表示せよ
    * 発展: ログの15行目から末尾15行目を除いたログを表示せよ
* 21/Aug/2017:21:30:09 +0900 のアクセスログを見よ
* ログの ip/host 列だけを取り出し、別のファイルに保存せよ
* ログを集計し、一番多くアクセスしてきたホスト/IP を上位10件表示せよ
* 時間があればipをゼロパディングする

## 正規表現

* ipv4アドレスを表現する正規表現を書いてみる

## エイリアス

* コマンドに別の名前をつけられる
    * alias la='ls -la'

## .xshrc

* xshrc
* xshenv
* xshprofile
* xlogin

* 読み込み順序
    * xshenv,  xprofile, xshrc, xlogin

* 基本的には xshrc に設定ファイルを記述しておくと良い

## スクリプト
### シェバン

* スクリプトを読み込むインタプリタを指定する

```
#!/bin/sh
...
```

* Unix 標準ではないが、多くの人がやってるからデファクトスタンダードになってる

### エンコーディング

* ファイル中にエンコーディングを書いておいてインタプリタにエンコーディングを教える
    * Ruby 2.0 以前なんかだと必要だが、今はデフォルトで UTF-8 なのでいらない
    * Python
        * Python2では非ASCIIコードがあるのにこのマジックコメントがなかった場合にエラーになる
        * Python3ではこのエンコーディングの指定がなければUTF-8とみなされる

```
#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

puts 'hello world'
```

### 環境変数

* http_proxy
* HTTP_PROXY
* PATH

#### 自作のプログラムをいつでも使えるように

* chmod
    * 普通のファイルは644 (rw-r--r--) で、ディレクトリは 755 (rwxr-xr-x) にするのが UNIX 流 [1]
* chown
* chgrp
    * groups

### リダイレクト

* 標準入力のリダイレクト
    * cat < test.txt
* 標準出力のリダイレクト
    * cat test.txt > test2.txt
* 標準出力のリダイレクト（上書き）
    * cat test.txt >> test2.txt
* 標準エラー出力 (2>) と 標準出力 (1>)
    * command 1> success 2> error
    * command 1>&2 summary

* ヒアドキュメント

    ```
    cat << EOS
    hello world!
    EOS
    ```

### パイプ

* 実行結果を他のコマンドの入力として渡せる
    * cat test.txt | echo

## 主要な / 以下のディレクトリ

* /bin
    * 必要最低限のコマンド群
* /sbin
    * システム管理用のバイナリ、ブート時に必要なもの
* /dev
    * デバイスファイル（特殊ファイル）が置かれる
    * /dev/null, /dev/stdout, /dev/stdin, /dev/stderr なんかはよく使われる
* /tmp
    * 一時的なファイル、Cコンパイラなんかは中韓結果を置くために利用している
      * /tmp はシステムが落ちたら消えて良いもの、/var/tmp は システムが落ちてもなくならないものをおく(メールの書きかけなど)
* /var
    * 起動時には不要で実行中に変化するもの、複数のホストで共有できないもの
    * だいたいログは /var/log に書き出される
* /home
    * ユーザーのホームディレクトリ
* /usr
    * その昔ユーザーのホームディレクトリや、ユーザーが開発したプログラムをおいたりしてた
    * /usr/local は最初からシステムに標準でついてきたものではなく、ローカルサイトで独自に作ったもの を置く。emacs, gcc, X11 など。
* /opt
    * X11R6 などのOS以外の売り物のパッケージを置くためにしばしば使われる
* /etc
    * 重要なシステム管理用のコマンドやデータファイルがある。なければ起動できないものが多い。
    * mount, passwd, hosts
* /mnt
    * ルート以外のファイルシステムをマウントするために使う

## プロセス
### プロセスID

* ps
* `puts Process.pid`

### フォアグラウンドとバックグラウンド

* フォアグラウンド
    * `command`
    * bg でバックグラウンドへ
    * ctrl+cで停止, ctrl+z で suspend
* バックグラウンド
    * `command &`
    * fg でフォアグラウンドへ

### jobs コマンド

* バックグラウンドとフォアグラウンドで実行しているジョブを表示

## ファイル
### Unix の世界ではすべてがファイル

```ruby
passwd = File.open('/etc/passwd')
puts passwd.fileno
```

```ruby
null = File.open('/dev/null')
puts null.fileno
```

```
puts STDIN.fileno
puts STDOUT.fileno
puts STDERR.fileno
```

### リソースの制限

* ソフトリミットとハードリミットの違いはなんだろうか? ソフトリミットは本当の制 限ではない。ソフトリミット(前述の例だと 2560)を超えると例外が送出されるが、お 望みとあらばその値は変更できる。[2]

```ruby
p Process.getrlimit(:NOFILE)

Process.setrlimit(:NOFILE, 4096)
p Process.getrlimit(:NOFILE)

Process.setrlimit(:NOFILE, 100)
p Process.getrlimit(:NOFILE)
Process.setrlimit(:NOFILE, Process.getrlimit(:NOFILE)[1])
p Process.getrlimit(:NOFILE)
```

### 環境変数

```
ENV['MESSAGE'] = 'wing it' system "echo $MESSAGE"
```

* 本番環境、開発環境を分けたりする


## fork

* 試してみる

```ruby
if fork
  puts "entered the if block"
else
  puts "entered the else block"
end
```

* Process ID を見てみる

```ruby
puts "parents process pid is #{Process.pid}"
if fork
  puts "entered the if block from #{Process.pid}"
else
  puts "entered the else block from #{Process.pid}"
end
```

* よいやり方

```ruby
fork do
# 子プロセスで実行する処理をここに記述する
end
# 親プロセスで実行する処理をここに記述する
```

* CoW
    * それまでの間、親プロセスと子プロセスとはメモリ上の同じデータを物理的に共有して いる。親または子のいずれかで変更する必要が生じたときだけメモリをコピーすること で、両者のプロセスの独立性を保っている[2]

## プロセス
### 孤児プロセス

```ruby
fork do
  5.times do
sleep 1
    puts "I'm an orphan!"
  end
end
abort "Parent process died..."
```

* 待つ

```ruby
fork do
  5.times do
sleep 1
    puts "I am an orphan!"
  end
end
Process.wait
abort "Parent process died..."
```

* 待つ

```ruby
# 子プロセスを 3 つ生成する。 3.times do
fork do
# 各プロセス毎に 5 秒未満でランダムにスリープする。 sleep rand(5)
end end
3.times do
# 子プロセスそれぞれの終了を待ち、返ってきた pid を出力する。 puts Process.wait
end
```

* ゾンビプロセス

```ruby
# 1 秒後に終了する子プロセスを生成する。
pid = fork { sleep 1 }
# 終了した子プロセスの pid を出力する。
puts pid
# 親プロセスを sleep させる。
# こうしておけば子プロセスのステータスを調査できる
sleep 5
```

* ps -ho pid,state -p [ゾンビになったプロセスの pid]

## シグナル

* シグナルお試し

```ruby
puts Process.pid
sleep # シグナルを送信する時間を確保するため
```

```ruby
Process.kill(:INT, <上のコードで表示されたプロセスの番号>)
```

* シグナル改変

```ruby
puts Process.pid
trap(:INT) { print "Na na na, you can't get me" } sleep # シグナルを送信する時間を確保するため
#trap(:INT, "IGNORE")
```

### パイプ

```ruby
reader, writer = IO.pipe
writer.write("Into the pipe I go...")
writer.close
puts reader.read
```

* 子プロセスとの通信

```ruby
reader, writer = IO.pipe
fork do
  reader.close
10.times do # 力仕事
    writer.puts "Another one bites the dust"
  end
end
writer.close
while message = reader.gets
  $stdout.puts message
end
```

### デーモン

* オペレーティングシステムにとって特別重要なデーモンプロセスが一つある。前の章 で、すべてのプロセスは親プロセスがあることを説明した。これはあらゆるプロセスに あてはまる真実だろうか? システム上のまさに一番最初のプロセスについてはどうだろ うか。
これは古典的な「創造主を創造したのは誰か」問題であり、答えは簡単だ。カーネルは 起動時に init プロセスと呼ばれるプロセスを生成する。このプロセスの ppid は 0 であ り、「すべてのプロセスの始祖」である。init プロセスこそ最初のプロセスであり、先祖を 持たず、その pid は 1 だ。[2]

```ruby
exit if fork
Dir.chdir "/"
puts Process.pid
STDIN.reopen "/dev/null"
STDOUT.reopen "/dev/null", "a"
STDERR.reopen "/dev/null", "a"
```

1. プロセスを新しいセッションのセッションリーダーにする
2. プロセスを新しいプロセスグループのプロセスグループリーダーにする
3. プロセスから制御端末を外す

* プロセスグループ確認

```ruby
puts Process.pid
puts Process.getpgrp
fork {
  puts Process.pid
  puts Process.getpgrp
}
```

## ちょっと脱線しておすすめ開発環境tips
### tmux
### vim
### ghq
### peco

## 参考文献

* [1] 山口 和紀 (著), 古瀬 一隆 (著), "新 The UNIX Super Text 【上】"
* [2] Jesse Storimer, 島田浩二(翻訳), 角谷信太郎(翻訳), "なるほど UNIX プロセス Ruby で学ぶ Unix の基礎"
* [3] Mike Gancarz  (著), 芳尾 桂 (翻訳), "UNIXという考え方―その設計思想と哲学"
