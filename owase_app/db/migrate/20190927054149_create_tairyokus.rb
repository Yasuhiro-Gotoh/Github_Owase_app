class CreateTairyokus < ActiveRecord::Migration[5.0]
  def change
    create_table :tairyokus do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.text :tairyoku1
      t.text :tairyoku2
      t.text :tairyoku3
      t.text :tairyoku4
      t.text :tairyoku5
      t.text :tairyoku6
      t.text :tairyoku7
      t.text :tairyoku8
      t.text :tairyoku9
      t.text :tairyoku10

      t.timestamps
    end
  end
end
