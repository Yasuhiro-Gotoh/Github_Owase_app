class CreateKoukous < ActiveRecord::Migration[5.0]
  def change
    create_table :koukous do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.text :koukou1
      t.text :koukou2
      t.text :koukou3
      t.text :koukou4
      t.text :koukou5
      t.text :koukou6
      t.text :koukou7
      t.text :koukou8
      t.text :koukou9
      t.text :koukou10

      t.timestamps
    end
  end
end
