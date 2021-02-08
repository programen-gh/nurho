# アプリ名
nurho
# 概要
全国の介護サービスを様々な条件から検索できるアプリケーションです。
# 本番環境

[https://nurho.herokuapp.com/]

**ログイン情報（テスト用）**

basic認証

- ID：admin33071
- パスワード：2468

ユーザー側

- Eメール：user@test.com
- パスワード：testuser1

企業側

- Eメール：company@test.com
- パスワード：testcompany1

# 制作背景(意図)
介護サービスを探す際の問題点

- 施設やサービスの種類が多すぎてよくわからない
- 実際に問い合わせてみると満室で入居できない
- 利用条件が複雑で調べる利用者の家族の負担が大きい
- 施設やサービスが決まるまでの期間の利用者の負担が大きい

上記全ての問題を解決できるような簡潔でわかりやすい検索サイトを実現したかった。
# DEMO
**トップページ**

![nurho_toppage](https://user-images.githubusercontent.com/75558619/107203704-19025800-6a3f-11eb-9907-b01f3495cafd.jpg)

- 全国の介護サービスが一覧表示されている
- 介護サービス名をクリックすると詳細ページに遷移する
- アプリのアイコンをクリックするとトップページに遷移する
- 条件検索ボタンをクリックすると検索フォームが表示される
- 画面上部ユーザー用の管理ボタンをクリックすると各ページに遷移する
- 画面下部企業用の管理ボタンをクリックすると企業用の管理ページに遷移する

**検索画面**
![nurho_search](https://user-images.githubusercontent.com/75558619/107204133-a80f7000-6a3f-11eb-856e-5b522684ec41.jpg)

- 条件を入力すると一致する介護サービスが一覧表示される

**詳細ページ**
![nurho_details](https://user-images.githubusercontent.com/75558619/106734133-06121100-6656-11eb-9128-5fb0841d18ac.jpeg)

- ハート型のアイコンをクリックするとユーザーのマイページに登録・解除される(ログインしないと表示されない)

**ユーザー用・企業用の新規登録・ログイン画面**
<img width="1380" alt="nurho_signup" src="https://user-images.githubusercontent.com/75558619/106734590-8afd2a80-6656-11eb-9b6e-0964fcbd41e3.png">

- 正しく入力が行われると新規登録・ログインが完了する
- 間違った入力が行われるとエラーメッセージが表示される

**企業用の管理ページ(未ログイン時)**
<img width="1372" alt="nurho_company_not_signed_in" src="https://user-images.githubusercontent.com/75558619/106734700-a831f900-6656-11eb-9390-6fe4a3cd6d0e.png">

- 新規企業はEメールを送信すると画面中央に新規登録ボタンが表示され、クリックすると新規登録画面に遷移する
- ログインボタンからログイン画面に遷移する

**企業用の管理ページ(ログイン時)**
![nurho_company_signed_in](https://user-images.githubusercontent.com/75558619/106734883-e5968680-6656-11eb-8fc6-bb35fceadcec.jpeg)

- 自社が掲載した介護サービスが一覧表示される
- 新規掲載ボタンをクリックすると新規掲載ページに遷移する
- ログアウトボタンをクリックするとログアウトできる
- 編集ボタンをクリックすると編集ページに遷移する
- 掲載終了ボタンをクリックすると削除される

**新規掲載・編集ページ**
<img width="1373" alt="nurho_post" src="https://user-images.githubusercontent.com/75558619/106735039-124a9e00-6657-11eb-9789-c78cf29e28ec.png">

- 正しく入力が行われると新規掲載・編集が完了する
- 間違った入力が行われるとエラーメッセージが表示される

**ユーザーのマイページ**
![nurho_mypage](https://user-images.githubusercontent.com/75558619/106735127-2f7f6c80-6657-11eb-9049-1ed6a8c2850f.jpg)

- お気に入り登録した介護サービスが一覧表示される

# 工夫したポイント

- deviseを用いた複数モデルのユーザー管理
- modal windowを応用して検索フォームを非同期通信で表示
- scopeを利用することで複数の検索条件に対応
- エラーメッセージの日本語化と個別に表示
- お気に入りの登録・削除メッセージをアニメーションで消去
- 目に優しい落ち着いた配色

# 使用技術(開発環境)
## バックエンド
Ruby,Ruby on Rails
## フロントエンド
HTML,CSS,JavaScript
## データベース
MySQL,SequelPro
## インフラ
AWS(S3)
## クラウド・アプリケーション・プラットフォーム(本番環境)
heroku
## ソース管理
GitHub,GitHubDesktop
## テスト
RSpec
## エディタ
VSCode
# 課題や今後実装したい機能

- serviceモデルの単体テストを行う
- 結合テストを行う
- 検索条件の選択ごとに該当件数が変化する機能

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