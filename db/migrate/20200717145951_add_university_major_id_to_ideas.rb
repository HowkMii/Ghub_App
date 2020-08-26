class AddUniversityMajorIdToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :university_major_id, :integer
  end
end
