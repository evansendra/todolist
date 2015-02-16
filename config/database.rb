Sequel::Model.plugin(:schema)
Sequel::Model.plugin(:validation_helpers)
Sequel::Model.raise_on_save_failure = true # Do not throw exceptions on failure
Sequel::Model.db = case Padrino.env
  when :development then Sequel.connect("sqlite:///" + Padrino.root('db', "todolist_development.db"), :loggers => [logger])
  when :production  then Sequel.postgres(:host => 'ec2-23-23-210-37.compute-1.amazonaws.com', 'd5uf67kfnh2cur', :user=>'kmcdsfluyjnflu', :password=>'ZinURed_EdW6XSAJxZLCWGMex7', :port => 5432)
  when :test        then Sequel.connect("sqlite:///" + Padrino.root('db', "todolist_test.db"),        :loggers => [logger])
end
