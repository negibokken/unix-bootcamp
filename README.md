# Unix bootcamp

## 歴史の話

歴史の話は飛ばす。興味のある人はネットで検索するなりしてください。
あと歴史とは別だが、Unix(あとLinux)哲学を学ぶにあたって「Unixという考え方」は必読の書。

変な癖が付く前の初心者にこそ読んで欲しい。

## シェル

* zsh か fish の二択

## 基本的なコマンドの使い方

* ls
* cd
* echo
* cat
* mkdir
* rm
* uniq
* sort
* cut
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
* where
* which
* sed
* awk
* tee
* ln
* ps
* kill
* killall

## ユーザ/グループ

## .xshrc

* xshrc
* xshenv
* xshprofile
* xlogin

* 読み込み順序
  * xshenv,  xprofile, xshrc, xlogin

* 基本的には xshrc に設定ファイルを記述しておくと良い

## シェルスクリプト
### シェバン
### エンコーディング

### 環境変数

* http_proxy
* HTTP_PROXY
* PATH

#### 自作のプログラムをいつでも使えるように

* chmod

## ディレクトリ構造

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

## ファイルディスクリプタ
### 代表的なファイルディスクリプタ
### ファイルディスクリプタの制限

## プロセス

## デーモン

## ちょっと脱線
### tmux

### vim

## 参考文献

* 新 The UNIX Super Text 【上】
* なるほど UNIX プロセス Ruby で学ぶ Unix の基礎
