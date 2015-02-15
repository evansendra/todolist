Sequel.migration do
  up do
    create_table :todos do
      primary_key :id
      String :title, :null => false
      String :author
      Boolean :is_complete, :default => false, :null => false
      DateTime :created_at, :null => false
      DateTime :updated_at, :null => false
    end
  end

  down do
    drop_table :todos
  end
end
