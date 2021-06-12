class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  #在籍番号（数字6桁）
  validates :certificate_number, presence: true, uniqueness: { case_sensitive: false }, numericality: { only_integer: true }, length: { minimum: 6, maximum: 6 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  #メールアドレス
  validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/ }

  with_options presence: true do
    #氏名入力欄（全角ひらがな・カタカナ・漢字）
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: 'には全角ひらがな・カタカナ・漢字以外は入力できません' } do
      validates :last_name
      validates :first_name
    end

    #カナ入力（全角カタカナ）
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カタカナ以外は入力できません' } do
      validates :last_name_kana
      validates :first_name_kana
    end

    #学部学科、性別、在籍区分（初期値以外の選択必須）
    validates :department_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 24, message: 'を正しく選択してください' }
    validates :sex_id,        numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 2 , message: 'を正しく選択してください' }
    validates :position_id,   numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3 , message: 'を正しく選択してください' }
  end

  #プロフィール
  validates :profile, length: { maximum: 3000 }

  #アップロード可能な画像を指定（ファイル形式、サイズ、縦幅・横幅）
  validates :image, content_type: [:png, :jpg, :jpeg],
                    size: { less_than_or_equal_to: 10.megabytes }

  #active_storageとのアソシエーション
  has_one_attached :image
  
  #active_hashモジュールとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department
  belongs_to :sex
  belongs_to :position

end
