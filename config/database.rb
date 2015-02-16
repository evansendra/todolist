Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:validation_helpers)
Sequel::Model.raise_on_save_failure = true # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.postgres('todonelist', :user => 'rkkn', :password => 'admin', :host => 'localhost', :port => 5432)
  when :production  then Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
  when :test        then Sequel.postgres('todonelist', :user => 'rkkn', :password => 'admin', :host => 'localhost', :port => 5432)
end