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