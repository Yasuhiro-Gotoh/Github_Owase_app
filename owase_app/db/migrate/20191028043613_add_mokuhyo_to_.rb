class AddMokuhyoTo < ActiveRecord::Migration[5.0]
  def change
    add_column :undos, :mokuhyo, :string
  end
end
