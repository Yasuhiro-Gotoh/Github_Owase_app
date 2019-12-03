class CreateNintis < ActiveRecord::Migration[5.0]
  def change
    create_table :nintis do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.text :ninti1
      t.text :ninti2
      t.text :ninti3
      t.text :ninti4
      t.text :ninti5
      t.text :ninti6
      t.text :ninti7
      t.text :ninti8
      t.text :ninti9
      t.text :ninti10

      t.timestamps
    end
  end
end
