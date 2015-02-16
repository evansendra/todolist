Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:validation_helpers)
Sequel::Model.raise_on_save_failure = true # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("sqlite:///" + Padrino.root('db', "todolist_development.db"), :loggers => [logger])
  when :production  then Sequel.postgres('todonelist', :user=>'admin', :password=>'rkkncat2015')
  when :test        then Sequel.connect("sqlite:///" + Padrino.root('db', "todolist_test.db"),        :loggers => [logger])
end
