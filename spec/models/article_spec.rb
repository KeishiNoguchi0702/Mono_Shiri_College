require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '新規記事投稿' do
    context '記事投稿できるとき' do
      it '妥当なオブジェクト' do
        expect(@article).to be_valid
      end
    end

    context '記事投稿できないとき' do
      it 'タイトルが空では登録できない' do
        @article.title = ''
        expect(@article).not_to be_valid
      end

      it '投稿内容が空では登録できない' do
        @article.content = ''
        expect(@article).not_to be_valid
      end

      it '投稿内容が空では登録できない' do
        @article.user = nil
        expect(@article).not_to be_valid
      end
    end
  end
end
