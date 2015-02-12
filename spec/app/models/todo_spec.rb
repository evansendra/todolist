require 'spec_helper'

RSpec.describe Todo do
	it "adds tasks with and without author" do
		Todo.create({:author=>'Evan', :title=>'rkkn task', :is_complete=>false})
		expect(Todo.all.count).to eq(1)
		Todo.create({:title=>'rkkn task again', :is_complete=>false})
		expect(Todo.all.count).to eq(2)
	end
end
