# アプリケーション名
Mono Siri College

# 概要
- 近未来のリモート主体の大学で使用するCMS（コンテンツマネジメントサービス）
- 記事投稿により学生どうしで知識やレジュメを共有する

# URL
http://13.230.22.136/
※Https通信に変更予定。変更次第、新しいURLを掲載します。

# テスト用アカウント	
- ID : example@example.com
- PW : example1234

# 利用方法
編集中

# 目指した課題解決
- 教授視点
  - コロナ禍のため集団授業を開催できない
  - 既存の学生用Webサイトは事務手続きやイベント告知に特化しており、オンライン授業に不向き
  - 既存の学生用Webサイトはデザイン性が低く、若い学生の心をキャッチできずアクセス率が低い

- 学生視点
  - 授業に関する記事やレジュメを手早く検索したい
  - どうせならオシャレでかっこいいページで学習したい

# 要件定義
- ユーザ登録機能
  -



# TABLE DESIGN

## users table
| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| certificate_number | string  | null: false, uniqueness: true |
| email              | string  | null: false                   |
| encrypted_password | string  | null: false                   |
| last_name          | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_name_kana     | string  | null: false                   |
| first_name_kana    | string  | null: false                   |
| department_id      | integer | null: false                   |
| sex_id             | integer | null: false                   |
| position_id        | integer | null: false                   |
| profile            | text    |                               |

- has_many :articles

## articles
| Columns | Type       | Options           |
| ------- | ---------- | ----------------- |
| title   | string     | null: false       |
| user    | references | foreign_key: true |

- belongs_to: user
- has_many: article_department_relations
- has_many: departments, through: article_department_relations
- has_many: article_tag_relations
- has_many: tags, through: article_tag_relations

## article_department_relations
| Columns    | Type       | Options           |
| ---------- | ---------- | ----------------- |
| article    | references | foreign_key: true |
| department | references | foreign_key: true |

- belongs_to: article
- belongs_to: department

## departments
| Columns    | Type   | Options     |
| ---------- | ------ | ----------- |
| department | string | null: false |

- has_many: article_department_relations
- has_many: articles, through: article_department_relations

## article_tag_relations
| Columns    | Type       | Options           |
| ---------- | ---------- | ----------------- |
| article    | references | foreign_key: true |
| tag        | references | foreign_key: true |

- belongs_to: article
- belongs_to: tag

## tags
| Columns    | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |

- has_many: article_tag_relations
- has_many: articles, through: article_tag_relations