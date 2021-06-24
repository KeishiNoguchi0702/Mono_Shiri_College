# アプリケーション名
Mono Siri College

# 概要
- 近未来のリモート主体の大学で使用するCMS（コンテンツマネジメントサービス）
- 記事投稿により学生どうしで知識やレジュメを共有する
<br>※ターゲットを「近未来」にすることで、開発者自身も常に近未来に近づく技術を目指していく誓いでもあります

# URL
http://13.230.22.136/
※Https通信に変更予定。変更次第、新しいURLを掲載します。

# テスト用アカウント	
- ID : test@test.com
- PW : test1234

# Basic認証
- ID : admin
- PW : monosiri1234

# 利用方法
1. まずはヘッダー右側の「SIGN_UP」からユーザ登録してください
2. ログイン後、各種記事をご覧になれます。
  - 試しに記事を投稿することもできます。ヘッダーの「ARTICLES」をマウスホバーし、「POST]をクリックしてください

# 目指した課題解決
- 教授視点
  - コロナ禍のため集団授業を開催できない
  - 既存の学生用Webサイトは事務手続きやイベント告知に特化しており、オンライン授業に不向き
  - 既存の学生用Webサイトはデザイン性が低く、若い学生の心をキャッチできずアクセス率が低い

- 学生視点
  - 授業に関する記事やレジュメを手早く検索したい
  - どうせならオシャレでかっこいいページで学習したい

# 要件定義
- ユーザ登録
- バリデーション機能
- ユーザ表示
- ユーザ編集
- ユーザ削除
- 記事投稿
- 記事一覧表示
- 記事詳細表示
- 記事削除
- Twitter埋め込み

# 要件定義
- ユーザ登録
[![Image from Gyazo](https://i.gyazo.com/62aaa53470f7ff5e80e8acd5a93f7e33.gif)](https://gyazo.com/62aaa53470f7ff5e80e8acd5a93f7e33)

- バリデーション機能
[![Image from Gyazo](https://i.gyazo.com/ea4455495c999e9c0d416cb3f36052a8.gif)](https://gyazo.com/ea4455495c999e9c0d416cb3f36052a8)

- ユーザ表示
[![Image from Gyazo](https://i.gyazo.com/8c15c2ceddf8bf56db6e11719af0312c.gif)](https://gyazo.com/8c15c2ceddf8bf56db6e11719af0312c)

- ユーザ編集
[![Image from Gyazo](https://i.gyazo.com/57d5dc9f0a8458085ac7f991314b1080.gif)](https://gyazo.com/57d5dc9f0a8458085ac7f991314b1080)

- ユーザ削除
[![Image from Gyazo](https://i.gyazo.com/b2952c2dfca41c6c28d2fa1a2c38a1a3.gif)](https://gyazo.com/b2952c2dfca41c6c28d2fa1a2c38a1a3)

- 記事投稿
[![Image from Gyazo](https://i.gyazo.com/8a6c262eea50870158dcc3440807f00e.gif)](https://gyazo.com/8a6c262eea50870158dcc3440807f00e)

- 記事一覧表示
- 記事詳細表示
[![Image from Gyazo](https://i.gyazo.com/752854ba7ffd9c8e6516beed1b4363fe.gif)](https://gyazo.com/752854ba7ffd9c8e6516beed1b4363fe)

- 記事削除
[![Image from Gyazo](https://i.gyazo.com/0fdf9a0312f9e9bf76e2c4f24f154b35.gif)](https://gyazo.com/0fdf9a0312f9e9bf76e2c4f24f154b35)

- Twitter埋め込み
[![Image from Gyazo](https://i.gyazo.com/3fc640a64a9dd25eada172b512cb961c.gif)](https://gyazo.com/3fc640a64a9dd25eada172b512cb961c)

# 実装予定の機能
当アプリのヘッダーにもリンクをつけている「ABOUT_US」をご覧ください
https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/ABOUT_US.pdf

# テーブル設計

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