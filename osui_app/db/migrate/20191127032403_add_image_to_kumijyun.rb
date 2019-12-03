class AddImageToKumijyun < ActiveRecord::Migration[5.1]
  def change
    add_column :kumijyuns, :image, :string
  end
end
