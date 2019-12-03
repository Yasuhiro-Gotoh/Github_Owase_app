class CreateSankas < ActiveRecord::Migration[5.0]
  def change
    create_table :sankas do |t|
      t.integer :courseId
      t.integer :riyosyaId
      t.string :sankaFlg
      t.text :riyu
      t.text :biko
      t.string :vital1
      t.string :vital2
      t.string :vital3
      t.string :vital4
      t.string :vital5
      t.string :vital6
      t.string :vital7
      t.string :vital8
      t.string :vital9
      t.string :vital10

      t.timestamps
    end
  end
end
