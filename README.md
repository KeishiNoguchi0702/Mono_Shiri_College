# アプリケーション名
Mono Siri College

# 概要
- 近未来のリモート主体の大学で使用するCMS（コンテンツマネジメントサービス）
- 記事投稿により学生どうしで知識やレジュメを共有する
<br>※ターゲットを「近未来」にすることで、開発者自身も常に近未来に近づく技術を目指していく誓いでもあります

# URL
https://mono-siri-college.com/

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
※新しいアカウントでの登録、記事等投稿などはご自由にお試しください。<br>
※ただし、運用保守のために予告なくデータ削除する場合がありますので、あらかじめご了承ください。

# 目指した課題解決
- 教授視点
  - コロナ禍のため集団授業を開催できない
  - 既存の学生用Webサイトは事務手続きやイベント告知に特化しており、オンライン授業に不向き
  - 既存の学生用Webサイトはデザイン性が低く、若い学生の心をキャッチできずアクセス率が低い

- 学生視点
  - 学生同士で授業内容や知識を共有したい
  - どうせならオシャレでかっこいいページで学習したい

# 機能一覧
- ユーザ一覧表示
- ユーザ登録バリデーション
- ユーザ一覧表示
- ユーザ詳細表示
- ユーザ編集
- ユーザ削除（退会）
- 記事投稿
- 記事一覧表示
- 記事詳細表示
- 記事削除
- 埋め込みTwitterによる更新状況のお知らせ

# 工夫した点・苦労した点
セキュリティの観点から、ユーザ登録時のバリデーション機能の実装を考え抜きました。該当のコードは下記URLからご覧ください。<br>
<br>
https://github.com/KeishiNoguchi0702/Mono_Shiri_College/blob/master/app/models/user.rb
<br>※2021年7月現時点では、メールドメインが存在しないものでも登録できてしまうので、解消予定。

# サンプル画面
- ユーザ登録
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E7%99%BB%E9%8C%B2.gif" alt="ユーザ登録" title="サンプル">

- ユーザ登録バリデーション
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E7%99%BB%E9%8C%B2%E3%83%8F%E3%82%99%E3%83%AA%E3%83%86%E3%82%99%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3.gif" alt="ユーザ登録バリデーション" title="サンプル">

- ユーザ一覧表示
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E4%B8%80%E8%A6%A7%E8%A1%A8%E7%A4%BA.gif" alt="ユーザ一覧表示" title="サンプル">

- ユーザ詳細表示
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E8%A9%B3%E7%B4%B0%E8%A1%A8%E7%A4%BA.gif" alt="ユーザ詳細表示" title="サンプル">

- ユーザ編集
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E7%B7%A8%E9%9B%86%E6%A9%9F%E8%83%BD.gif" alt="ユーザ編集" title="サンプル">

- ユーザ削除（退会）
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E3%83%A6%E3%83%BC%E3%82%B5%E3%82%99%E9%80%80%E4%BC%9A%E6%A9%9F%E8%83%BD.gif" alt="ユーザ削除" title="サンプル">

- 記事投稿
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E8%A8%98%E4%BA%8B%E6%8A%95%E7%A8%BF.gif" alt="記事投稿" title="サンプル">

- 記事一覧表示
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E8%A8%98%E4%BA%8B%E4%B8%80%E8%A6%A7%E8%A1%A8%E7%A4%BA.gif" alt="記事一覧表示" title="サンプル">

- 記事詳細表示
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E8%A8%98%E4%BA%8B%E8%A9%B3%E7%B4%B0%E8%A1%A8%E7%A4%BA.gif" alt="記事詳細表示" title="サンプル">

- 記事削除
<img src="https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/Sample/%E8%A8%98%E4%BA%8B%E5%89%8A%E9%99%A4.gif" alt="記事削除" title="サンプル">

# 実装予定の機能
当アプリのヘッダーにもリンクをつけている「ABOUT_US」をご覧ください
https://mono-shiri-college.s3.ap-northeast-1.amazonaws.com/ABOUT_US.pdf

# 使用言語・技術
- Ruby2.6.5
- Ruby on Rails
- HTML/SCC
- SCSS
- JavaScript
- jQuery
- Capstrano
- MySQL
- AWS: EC2(Linux, Rack, Unicorn, Nginx, MySQL), ELB, ACM(https), S3 )

# 使用したGem
- Kaminari
- ActionText
- ActiveStorage
- ActiveSrorageValidations
<br>上記以外は、下記URLからご確認ください。
<br>https://github.com/KeishiNoguchi0702/Mono_Shiri_College/blob/master/Gemfile

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