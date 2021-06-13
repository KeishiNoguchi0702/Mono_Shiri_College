class Article < ApplicationRecord

  #バリデーションを記述予定

  #アソシエーション
  belongs_to: user
  has_many: article_department_relations
  has_many: departments, through: article_department_relations
  has_many: article_tag_relations
  has_many: tags, through: article_tag_relations

end
