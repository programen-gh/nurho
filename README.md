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
![](https://i.gyazo.com/f844bbac58bf01c6ffbe3aee8f0182b3.jpg)

- 全国の介護サービスが一覧表示されている
- 介護サービス名をクリックすると詳細ページに遷移する
- アプリのアイコンをクリックするとトップページに遷移する
- 条件検索ボタンをクリックすると検索フォームが表示される
- 画面上部ユーザー用の管理ボタンをクリックすると各ページに遷移する
- 画面下部企業用の管理ボタンをクリックすると企業用の管理ページに遷移する

**検索画面**
![](https://i.gyazo.com/3deebcb9b3cc54b01f0edfbe4b2bd4cb.jpg)

- 条件を入力すると一致する介護サービスが一覧表示される

**詳細ページ**
![](https://i.gyazo.com/324b264a0b59fc091343a4bd3cd78f02.jpg)

- ハート型のアイコンをクリックするとユーザーのマイページに登録・解除される(ログインしないと表示されない)

**ユーザー用・企業用の新規登録・ログイン画面**
![](https://i.gyazo.com/7d46ab439eafa3f571313683b5ba02ad.png)

- 正しく入力が行われると新規登録・ログインが完了する
- 間違った入力が行われるとエラーメッセージが表示される

**企業用の管理ページ(未ログイン時)**
![](https://i.gyazo.com/fe97704b6c24cd3112cdd180f0da2f5a.png)

- 新規企業はEメールを送信すると画面中央に新規登録ボタンが表示され、クリックすると新規登録画面に遷移する
- ログインボタンからログイン画面に遷移する

**企業用の管理ページ(ログイン時)**
![](https://i.gyazo.com/9cad8e290d517f4e53eb34c76b2860c3.jpg)

- 自社が掲載した介護サービスが一覧表示される
- 新規掲載ボタンをクリックすると新規掲載ページに遷移する
- ログアウトボタンをクリックするとログアウトできる
- 編集ボタンをクリックすると編集ページに遷移する
- 掲載終了ボタンをクリックすると削除される

**新規掲載・編集ページ**

- 正しく入力が行われると新規掲載・編集が完了する
- 間違った入力が行われるとエラーメッセージが表示される

**ユーザーのマイページ**

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

- 肥大化したコードや冗長的なコードを整理して可読性の向上を行う
- 肥大化したservicesテーブルを切り分けてフォームオブジェクトでデータの受け渡しを行う
- お気に入り登録・解除ボタンをユーザーの状況によって分岐させる
- 検索条件の入力ごとに該当件数を表示させる

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