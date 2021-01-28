class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.references :company,               null: false, foreign_key: true
      t.string     :name,                  null: false
      t.string     :address,               null: false
      t.date       :establishment,         null: false
      t.integer    :capacity,              null: false
      t.integer    :rooms,                 null: false
      t.string     :phone,                 null: false
      t.text       :explanation,           null: false
      t.integer    :category_id,           null: false
      t.integer    :prefecture_id,         null: false
      t.integer    :lump_sum_min,          null: false
      t.integer    :lump_sum_max,          null: false
      t.integer    :monthly_sum_min,       null: false
      t.integer    :monthly_sum_max,       null: false
      t.integer    :age_id,                null: false
      t.integer    :self_reliance,         null: false
      t.integer    :support_one,           null: false
      t.integer    :support_two,           null: false
      t.integer    :nursing_one,           null: false
      t.integer    :nursing_two,           null: false
      t.integer    :nursing_three,         null: false
      t.integer    :nursing_four,          null: false
      t.integer    :nursing_five,          null: false
      t.integer    :dementia,              null: false
      t.integer    :guarantor,             null: false
      t.integer    :welfare,               null: false
      t.integer    :take_care,             null: false
      t.integer    :care_food,             null: false
      t.integer    :liquid_food,           null: false
      t.integer    :rehabilitation,        null: false
      t.integer    :dm,                    null: false
      t.integer    :gastrostomy,           null: false
      t.integer    :tube_feeding,          null: false
      t.integer    :stoma,                 null: false
      t.integer    :home_oxygen_therapy,   null: false
      t.integer    :ventilator,            null: false
      t.integer    :bedsore,               null: false
      t.integer    :sputum_suction,        null: false
      t.integer    :dialysis,              null: false
      t.integer    :tracheostomy,          null: false
      t.integer    :ivh,                   null: false
      t.integer    :catheter,              null: false
      t.integer    :pacemaker,             null: false
      t.integer    :als,                   null: false
      t.integer    :aspiration_pneumonia,  null: false
      t.integer    :asthma,                null: false
      t.integer    :parkinson_disease,     null: false
      t.integer    :disuse_syndrome,       null: false
      t.integer    :clinical_depression,   null: false
      t.integer    :schizophrenia,         null: false
      t.integer    :rheumatism,            null: false
      t.integer    :osteoporosis,          null: false
      t.integer    :cerebral_infarction,   null: false
      t.integer    :myocardial_infarction, null: false
      t.integer    :cancer,                null: false
      t.timestamps
    end
  end
end
