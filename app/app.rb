module Todolist
  class App < Padrino::Application
  	register ScssInitializer
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Cache
    enable :caching
    set :cache, Padrino::Cache.new(:File, :dir => Padrino.root('public/tmpls')) 
    enable :sessions

    get '/' do
      File.read(File.join('public', 'index.html'))
    end

    error 404 do
      File.read(File.join('public', '404.html'))
    end
  end
end
