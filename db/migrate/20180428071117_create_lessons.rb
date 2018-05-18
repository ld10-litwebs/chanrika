class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :lesson_name
      t.string :teacher_name
      t.text :detail
      t.string :attendance
      t.string :testorreport
      t.integer :score
      t.integer :easy
      t.integer :field_id
      t.timestamps null: false
    end
  end
end
