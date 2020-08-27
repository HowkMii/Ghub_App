class AddFieldsToIdea < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :key_word, :text
  end
end
