class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :author_id, null: false
      t.integer :answer_choice_id, null: false
      t.timestamps
    end

    add_index :responses, [:author_id, :answer_choice_id], unique: true
    add_index :responses, :answer_choice_id, unique: true
  end
end
