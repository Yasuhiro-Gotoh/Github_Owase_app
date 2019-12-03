class AddSiryoToCourses < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :siryo, :string
  end
end
