class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :zissiYmd
      t.string :syasin1
      t.string :syasin2
      t.text :course1
      t.text :course2
      t.text :course3
      t.text :course4
      t.text :course5
      t.text :course6
      t.text :course7
      t.text :course8
      t.text :course9
      t.text :course10

      t.timestamps
    end
  end
end
