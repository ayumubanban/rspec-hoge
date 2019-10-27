class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.text :message
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end
end
