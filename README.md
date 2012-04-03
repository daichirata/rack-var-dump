# Build Status

<img src="https://secure.travis-ci.org/daic-h/rack-var-dump.png"/>

# Rack var_dump

rack-var-dump provides a method for debugging, such as var_dump() of php.

The receiver output automatically to view all of the var_dump() was executed Model, Controller, View,
in the context var_dump other methods to provide the Object, to return a response Rack. 

The output uses a michaeldv / awesome_print.



## Supported versions

* Ruby 1.8.7, 1.9.x 

* Applications that use the Rack (rails, sinatra, padrino, etc...)


## Install

Add to Gemfile

    gem 'rack-var-dump'

### If more than Rails3.x

    require 'rails-var-dump'


### Other

    require 'rack/var_dump'

and

    use Rack::VarDump

## Usage

If you require a rack/var_dump, has been provided 

    var_dump(subject = nil)
    
to all objects or rails-var-dump

### Example

    @users = User.all.var_dump

The return value of var_dump because of the self, the chain can be used.

    @first_name = User.find(3).var_dump('user.id(3)').first_name

By giving an argument, you can use the option of awesome_print.

    @users.var_dump("user.all")                 #=> normal print
    @users.var_dump("user.all", :plain => true) #=> plain text
    @users.var_dump(:plain => true)             #=> subject can be omitted
    
<img src="http://cdn-ak.f.st-hatena.com/images/fotolife/b/bunnyhop/20120208/20120208183913.png"/>

## Copyright

Copyright (c) 2012 Daichi Hirata. See LICENSE for details.