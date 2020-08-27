class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal,  null: false
      t.integer :prefectures_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone, null: false
      t.references :delivery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
