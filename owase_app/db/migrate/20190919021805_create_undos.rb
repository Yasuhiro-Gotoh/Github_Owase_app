class CreateUndos < ActiveRecord::Migration[5.0]
  def change
    create_table :undos do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.text :undo1
      t.text :undo2
      t.text :undo3
      t.text :undo4
      t.text :undo5
      t.text :undo6
      t.text :undo7
      t.text :undo8
      t.text :undo9
      t.text :undo10

      t.timestamps
    end
  end
end
