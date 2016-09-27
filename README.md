# my-vim-setting

・mac用の`.vimrc` の構成をメモ
・`Neobundle`を使用するため先にインストールしておく
```
$ mkdir -p ~/.vim/bundle
$ git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```

vimを起動すると、`NeoBundleCheck`の記述があるので、インストールできていないプラグインを自動でチェックしてくれて、インストールを促される。
そのまま`y`を入力して、プラグインのインストールを完了させる。

## ctagsのインストール

```
$ brew install ctags
```
ctagsの実行（カレントディレクトリに`tagsファイル`を生成）
```
$ ctags -R
```
