require 'rails_helper'

RSpec.describe Note, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "genrates associated data from a factory" do
    note = FactoryBot.create(:note)
    puts "This note's task is #{note.task.inspect}"
    puts "This note's user is #{note.user.inspect}"
  end
end
