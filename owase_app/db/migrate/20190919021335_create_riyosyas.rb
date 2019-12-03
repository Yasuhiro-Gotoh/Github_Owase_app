class CreateRiyosyas < ActiveRecord::Migration[5.0]
  def change
    create_table :riyosyas do |t|
      t.integer :riyosyaId
      t.text :simei
      t.text :birthYmd
      t.text :seibetsu
      t.text :zyusyo
      t.text :syasin
      t.text :tiku
      t.text :rireki
      t.text :kenko
      t.text :biko

      t.timestamps
    end
  end
end
