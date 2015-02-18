require 'spec_helper'

RSpec.describe Todo do
	it "adds tasks with a title and defaults rest of params" do
		count = Todo.all.count
		Todo.create({:title=>'rkkn task'})
		expect(Todo.all.count).to eq(count + 1)
	end

	it "denies tasks without title" do
		count = Todo.all.count
		expect { Todo.create({}) }.to raise_error
		expect(Todo.all.count).to eq(count)
	end

	context "with attributes title, is_complete, created_at, updated_at in @todos table" do
		def setup
			@t = "a whole new task" 
			@todo = Todo.create({:title=>@t})
		end

		before { setup }

		after { @todo.destroy }

		it "adds is_complete as false, created_at, updated_at by default for us" do
			expect(@todo[:title]).to be_truthy
			expect(@todo[:created_at]).to be_truthy
			expect(@todo[:updated_at]).to be_truthy
			expect(@todo[:is_complete]).to be false
		end

		it "maintains the title" do
			expect(@todo[:title]).to eq(@t)
		end

		it "makes created_at & updated_at the same" do
			expect(@todo[:created_at]).to eq(@todo[:updated_at])
		end

		it "updates time when todo is updated" do
			@todo.update({:title => "like a boss"})
			expect(@todo[:updated_at]).not_to eq(@todo[:created_at])
		end
	end
end
