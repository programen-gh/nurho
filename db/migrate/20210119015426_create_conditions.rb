class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.references :service,      null: false, foreign_key: true
      t.integer :category_id,     null: false
      t.integer :prefecture_id,   null: false
      t.integer :lump_sum_min,    null: false
      t.integer :lump_sum_max,    null: false
      t.integer :monthly_sum_min, null: false
      t.integer :monthly_sum_max, null: false
      t.integer :age_id,          null: false
      t.integer :self_reliance,   null: false
      t.integer :support_one,     null: false
      t.integer :support_two,     null: false
      t.integer :nursing_one,     null: false
      t.integer :nursing_two,     null: false
      t.integer :nursing_three,   null: false
      t.integer :nursing_four,    null: false
      t.integer :nursing_five,    null: false
      t.integer :dementia,        null: false
      t.integer :guarantor,       null: false
      t.integer :welfare,         null: false
      t.integer :take_care,       null: false
      t.timestamps
    end
  end
end
