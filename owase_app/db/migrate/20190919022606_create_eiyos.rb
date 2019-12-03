class CreateEiyos < ActiveRecord::Migration[5.0]
  def change
    create_table :eiyos do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.text :eiyo1
      t.text :eiyo2
      t.text :eiyo3
      t.text :eiyo4
      t.text :eiyo5
      t.text :eiyo6
      t.text :eiyo7
      t.text :eiyo8
      t.text :eiyo9
      t.text :eiyo10

      t.timestamps
    end
  end
end
