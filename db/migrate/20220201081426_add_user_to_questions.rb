class AddUserToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :user, null: false, foreign_key: true, index: true
  end
end
