class Article < ApplicationRecord

  #バリデーション
  validates :title, presence: true
  validate :content_required

  #アソシエーション
  belongs_to :user
  has_many :article_department_relations
  has_many :departments, through: :article_department_relations
  has_many :article_tag_relations
  has_many :tags, through: :article_tag_relations
  has_rich_text :content

  private
  def content_required
    errors.add(:content, "を入力してください") unless content.body.present?
  end

end
