class AddUniqIndexOnSlug < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :slug, unique: true
    add_index :categories, :title, unique: true
    add_index :questions, :slug, unique: true
    add_index :questions, :topic, unique: true
  end
end
