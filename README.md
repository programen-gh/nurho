# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :favorites
- has_many :services, through: :favorites

## companiesテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :services

## favoritesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| service | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :service

## servicesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| company               | references | null: false, foreign_key: true |
| name                  | string     | null: false                    |
| address               | string     | null: false                    |
| establishment         | date       | null: false                    |
| capacity              | integer    | null: false                    |
| rooms                 | integer    | null: false                    |
| phone                 | string     | null: false                    |
| explanation           | text       | null: false                    |
| category_id           | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| lump_sum_min          | integer    | null: false                    |
| lump_sum_max          | integer    | null: false                    |
| monthly_sum_min       | integer    | null: false                    |
| monthly_sum_max       | integer    | null: false                    |
| age_id                | integer    | null: false                    |
| self_reliance         | integer    | null: false                    |
| support_one           | integer    | null: false                    |
| support_two           | integer    | null: false                    |
| nursing_one           | integer    | null: false                    |
| nursing_two           | integer    | null: false                    |
| nursing_three         | integer    | null: false                    |
| nursing_four          | integer    | null: false                    |
| nursing_five          | integer    | null: false                    |
| dementia              | integer    | null: false                    |
| guarantor             | integer    | null: false                    |
| welfare               | integer    | null: false                    |
| take_care             | integer    | null: false                    |
| care_food             | integer    | null: false                    |
| liquid_food           | integer    | null: false                    |
| rehabilitation        | integer    | null: false                    |
| dm                    | integer    | null: false                    |
| gastrostomy           | integer    | null: false                    |
| tube_feeding          | integer    | null: false                    |
| stoma                 | integer    | null: false                    |
| home_oxygen_therapy   | integer    | null: false                    |
| ventilator            | integer    | null: false                    |
| bedsore               | integer    | null: false                    |
| sputum_suction        | integer    | null: false                    |
| dialysis              | integer    | null: false                    |
| tracheostomy          | integer    | null: false                    |
| ivh                   | integer    | null: false                    |
| catheter              | integer    | null: false                    |
| pacemaker             | integer    | null: false                    |
| als                   | integer    | null: false                    |
| aspiration_pneumonia  | integer    | null: false                    |
| asthma                | integer    | null: false                    |
| parkinson_disease     | integer    | null: false                    |
| disuse_syndrome       | integer    | null: false                    |
| clinical_depression   | integer    | null: false                    |
| schizophrenia         | integer    | null: false                    |
| rheumatism            | integer    | null: false                    |
| osteoporosis          | integer    | null: false                    |
| cerebral_infarction   | integer    | null: false                    |
| myocardial_infarction | integer    | null: false                    |
| cancer                | integer    | null: false                    |

### Association

- belongs_to :company
- has_many :favorites, dependent: :destroy
- has_many :users, through: :favorites
- has_many_attached :images, dependent: :destroy
- belongs_to :category
- belongs_to :prefecture
- belongs_to :age