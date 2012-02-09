# Build Status

<img src="https://secure.travis-ci.org/daic-h/rack-var-dump.png"/>

# English

Writing now...

# Japanese

rack-var-dumpはphpのvar_dump()のようなデバッグ用のメソッドを提供します

Objectにvar_dumpメソッドを提供し、Rackがレスポンスを返すまでにModel,Controller,View,

その他コンテキストで実行されたvar_dump()のすべてのレシーバーをviewに自動的に出力します

出力には michaeldv / awesome_print を使用しています。

<img src="http://cdn-ak.f.st-hatena.com/images/fotolife/b/bunnyhop/20120208/20120208183913.png"/>

## Supported versions

* Ruby 1.8.7, 1.9.x

* Rackを利用しているアプリケーション全般 (rails, sinatra, padrino, etc...)

## Install

    $ gem install rack-var-dump

### Rails

Gemfileに追加

    gem 'rack-var-dump'

Bundle Install

    % bundle install

### Rails3.x以上の場合

config/application.rb等でRails用に用意されている

    require 'rails-var-dump'

をrequire

### その他Rackアプリケーション

rack/var_dumpをrequire

    require 'rack/var_dump'

Rack::VarDumpミドルウェアをuse

    use Rack::VarDump

## 使い方

rails-var-dumpもしくはrack/var_dumpをrequireしている場合、全てのオブジェクトに

    var_dump(subject = nil)

が提供されています

### 例

    @users = User.all.var_dump
    @users.var_dump("user.all")

var_dumpの返り値は常にselfのため、チェーンが途切れずに使用できます

    @first_name = User.find(3).var_dump('user.id(3)').first_name

引数にハッシュを与えることで、awesome_printのオプションを使用することができます。

    @users.var_dump("user.all")                 #=> 通常出力
    @users.var_dump("user.all", :plain => true) #=> plain text(obj.inspect)の出力
    @users.var_dump(:plain => true)             #=> subjectは省略してもok

## Copyright

Copyright (c) 2012 Daichi Hirata. See LICENSE for details.