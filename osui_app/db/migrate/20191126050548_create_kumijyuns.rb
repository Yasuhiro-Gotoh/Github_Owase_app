class CreateKumijyuns < ActiveRecord::Migration[5.1]
  def change
    create_table :kumijyuns do |t|
      t.string :bango
      t.string :kumi
      t.string :han
      t.string :setai
      t.string :check
      t.string :banti
      t.string :denwa1
      t.string :denwa2
      t.text :kanrisya
      t.text :hosyu
      t.string :teisyutu
      t.string :kanai
      t.string :tyosa
      t.string :tosyo
      t.string :saisyu
      t.text :siteki

      t.timestamps
    end
  end
end
