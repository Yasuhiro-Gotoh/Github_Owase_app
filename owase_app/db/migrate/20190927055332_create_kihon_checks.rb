class CreateKihonChecks < ActiveRecord::Migration[5.0]
  def change
    create_table :kihon_checks do |t|
      t.integer :riyosyaId
      t.text :kirokuYmd
      t.string :kihon1
      t.string :kihon2
      t.string :kihon3
      t.string :kihon4
      t.string :kihon5
      t.string :kihon6
      t.string :kihon7
      t.string :kihon8
      t.string :kihon9
      t.string :kihon10
      t.string :kihon11
      t.string :kihon12
      t.string :kihon13
      t.string :kihon14
      t.string :kihon15
      t.string :kihon16
      t.string :kihon17
      t.string :kihon18
      t.string :kihon19
      t.string :kihon20
      t.string :kihon21
      t.string :kihon22
      t.string :kihon23
      t.string :kihon24
      t.string :kihon25

      t.timestamps
    end
  end
end
