class AddIdeaIdToDiscusses < ActiveRecord::Migration[5.1]
  def change
    add_column :discusses, :idea_id, :integer
  end
end
