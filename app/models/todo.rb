class Todo < Sequel::Model
	plugin :timestamps, :update_on_create => true
	plugin :json_serializer

	def validate
		super
		validates_presence [:title]
		validates_max_length 255, :title
	end
end