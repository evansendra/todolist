Sequel.migration do
  up do
    create_table :todos do
      primary_key :id
      String :title
      String :author
      Boolean :is_completed
			DateTime :created_at
			DateTime :updated_at
    end
  end

  down do
    drop_table :todos
  end
end
