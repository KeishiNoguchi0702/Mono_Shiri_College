class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :certificate_number, uniqueness: true
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    # アクティブハッシュ使用欄は初期値以外の選択を強制
    with_options numericality: { greater_than_equal_to: 1 } do
      validates :department_id
      validates :sex_id
      validates :position_id
    end
  end

  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department
  belongs_to :sex
  belongs_to :position
end
