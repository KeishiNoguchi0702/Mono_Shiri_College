require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての情報が正しく入力れていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
    end
  end

end
