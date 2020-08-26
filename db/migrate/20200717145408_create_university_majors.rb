class CreateUniversityMajors < ActiveRecord::Migration[5.1]
  def change
    create_table :university_majors do |t|
      t.string :name

      t.timestamps
    end
  end
end
