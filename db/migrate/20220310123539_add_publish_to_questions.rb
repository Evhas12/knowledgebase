class AddPublishToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :publish, :boolean
  end
end
