class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :company,       null: false, foreign_key: true
      t.string     :name,          null: false
      t.string     :address,       null: false
      t.date       :establishment, null: false
      t.integer    :capacity,      null: false
      t.integer    :rooms,         null: false
      t.string     :phone,         null: false
      t.text       :explanation,   null: false
      t.timestamps
    end
  end
end
