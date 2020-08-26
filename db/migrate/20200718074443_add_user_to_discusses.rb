class AddUserToDiscusses < ActiveRecord::Migration[5.1]
  def change
    add_column :discusses, :user_id, :integer
  end
end
