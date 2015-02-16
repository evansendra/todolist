class Todo < Sequel::Model
	plugin :timestamps, :update_on_create => true

	def validate
		super
		validates_presence [:title, :author]
		validates_max_length 255, :title
		validates_max_length 255, :author
	end
end