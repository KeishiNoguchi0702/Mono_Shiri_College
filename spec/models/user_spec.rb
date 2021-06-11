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

      it 'プロフィール画像はアップロードしていなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end

      it 'プロフィール欄が空欄でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      #在籍番号-----------------------------------------------------------------------
      it '在籍番号は一意でなければならない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.certificate_number = @user.certificate_number
        another_user.valid?
        expect(another_user.errors.full_messages).to include "在籍番号はすでに存在します"
      end
      
      it '在籍番号が空欄では登録できない' do
        @user.certificate_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号を入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（ひらがなの場合）' do
        @user.certificate_number = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（全角カタカナの場合）' do
        @user.certificate_number = 'アイウエオカ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（半角カタカナの場合）' do
        @user.certificate_number = 'ｱｲｳｴｵｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（漢字の場合）' do
        @user.certificate_number = '山田太郎三郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（全角数字の場合）' do
        @user.certificate_number = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（半角英字の場合）' do
        @user.certificate_number = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号は半角数値以外では登録できない（環境依存文字の場合）' do
        @user.certificate_number = '⌘⌘⌘⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は数値で入力してください"
      end

      it '在籍番号が6桁未満の場合は登録できない' do
        @user.certificate_number = '01234'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は6文字以上で入力してください"
      end

      it '在籍番号が6桁超の場合は登録できない' do
        @user.certificate_number = '0123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍番号は6文字以内で入力してください"
      end

      #メールアドレス-----------------------------------------------------------------------
      it 'メールアドレスは一意でなければならない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "メールアドレスはすでに存在します"
      end

      it 'メールアドレスが空欄では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end

      it 'メールアドレスに@が含まれていない場合は登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（ひらがなの場合）' do
        @user.email = 'こんにちは@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end
      
      it 'メールアドレスは半角英数字以外では登録できない（漢字の場合）' do
        @user.email = '今日@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（全角カタカナの場合）' do
        @user.email = 'コンニチハ@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（半角カタカナの場合）' do
        @user.email = 'ｺﾝﾆﾁﾊ@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（全角数字の場合）' do
        @user.email = '１２３@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（全角英字の場合）' do
        @user.email = 'ａｂｃ@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      it 'メールアドレスは半角英数字以外では登録できない（環境依存文字の場合）' do
        @user.email = '⌘⌘⌘⌘⌘@hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスは不正な値です"
      end

      #パスワード-----------------------------------------------------------------------
      it 'パスワードは空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'パスワードは半角英数以外では登録できない（ひらがなの場合）' do
        @user.password = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（漢字の場合）' do
        @user.password = '山田太郎三郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（全角カタカナの場合）' do
        @user.password = 'アイウエオカ'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（半角カタカナの場合）' do
        @user.password = 'ｱｲｳｴｵｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（全角数字の場合）' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（全角英字の場合）' do
        @user.password = 'ａｉｕｅｏｋ'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは半角英数以外では登録できない（環境依存文字の場合）' do
        @user.password = '⌘⌘⌘⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードには英字と数字の両方を含めて設定してください"
      end

      it 'パスワードは、確認用を含めて2回入力が必要' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'パスワードと確認用パスワードは値一致していなければならない' do
        @user.password_confirmation = 'aaaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      #苗字-----------------------------------------------------------------------
      it '苗字は空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（半角カタカナの場合）' do
        @user.last_name = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（全角数字の場合）' do
        @user.last_name = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（半角数字の場合）' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（全角英字の場合）' do
        @user.last_name = 'ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（半角英字の場合）' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '苗字はひらがな・全角カタカナ・漢字以外では登録できない（環境依存文字の場合）' do
        @user.last_name = '⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      #名前-----------------------------------------------------------------------
      it '名前は空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（半角カタカナの場合）' do
        @user.first_name = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（全角数字の場合）' do
        @user.first_name = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（半角数字の場合）' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（全角英字の場合）' do
        @user.first_name = 'ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（半角英字の場合）' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      it '名前はひらがな・全角カタカナ・漢字以外では登録できない（環境依存文字の場合）' do
        @user.first_name = '⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前には全角ひらがな・カタカナ・漢字以外は入力できません"
      end

      #苗字カナ-----------------------------------------------------------------------
      it '苗字カナは空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナを入力してください"
      end

      it '苗字カナは全角カタカナ以外では登録できない（ひらがなの場合）' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（漢字の場合）' do
        @user.last_name_kana = '山田太郎三郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（半角カタカナの場合）' do
        @user.last_name_kana = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（全角数字の場合）' do
        @user.last_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（半角数字の場合）' do
        @user.last_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（全角英字の場合）' do
        @user.last_name_kana = 'ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（半角英字の場合）' do
        @user.last_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      it '苗字カナは全角カタカナ以外では登録できない（環境依存文字の場合）' do
        @user.last_name_kana = '⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字カナには全角カタカナ以外は入力できません"
      end

      #名前カナ-----------------------------------------------------------------------
      it '名前カナは空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナを入力してください"
      end

      it '名前カナは全角カタカナ以外では登録できない（ひらがなの場合）' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（漢字の場合）' do
        @user.first_name_kana = '山田太郎三郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（半角カタカナの場合）' do
        @user.first_name_kana = 'ﾎｹﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（全角数字の場合）' do
        @user.first_name_kana = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（半角数字の場合）' do
        @user.first_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（全角英字の場合）' do
        @user.first_name_kana = 'ａｂｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（半角英字の場合）' do
        @user.first_name_kana = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      it '名前カナは全角カタカナ以外では登録できない（環境依存文字の場合）' do
        @user.first_name_kana = '⌘⌘⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前カナには全角カタカナ以外は入力できません"
      end

      #学部学科-----------------------------------------------------------------------
      it '学部学科はnilでは登録できない' do
        @user.department_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を入力してください"
      end

      it '学部学科は空白では登録できない' do
        @user.department_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を入力してください"
      end

      it '学部学科を選択しなければ登録できない' do
        @user.department_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(上限値を超えている数値の場合)' do
        @user.department_id = 25
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(ひらがなの場合)' do
        @user.department_id = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(漢字の場合)' do
        @user.department_id = '日本'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(全角カタカナの場合)' do
        @user.department_id = 'ア'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(半角カタカナの場合)' do
        @user.department_id = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(全角数字の場合)' do
        @user.department_id = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(全角英字の場合)' do
        @user.department_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(半角英字の場合)' do
        @user.department_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      it '存在しない学部学科を選択すると登録できない(環境依存文字の場合)' do
        @user.department_id = '⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "学部・学科を正しく選択してください"
      end

      #性別-----------------------------------------------------------------------
      it '性別はnilでは登録できない' do
        @user.sex_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を入力してください"
      end

      it '性別は空白では登録できない' do
        @user.sex_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を入力してください"
      end

      it '性別を選択しなければ登録できない' do
        @user.sex_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(上限値を超えている数値の場合)' do
        @user.sex_id = 3
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(ひらがなの場合)' do
        @user.sex_id = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(漢字の場合)' do
        @user.sex_id = '日本'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(全角カタカナの場合)' do
        @user.sex_id = 'ア'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(半角カタカナの場合)' do
        @user.sex_id = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(全角数字の場合)' do
        @user.sex_id = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(全角英字の場合)' do
        @user.sex_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(半角英字の場合)' do
        @user.sex_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      it '存在しない性別を選択すると登録できない(環境依存文字の場合)' do
        @user.sex_id = '⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "性別を正しく選択してください"
      end

      #在籍区分-----------------------------------------------------------------------
      it '在籍区分はnilでは登録できない' do
        @user.position_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を入力してください"
      end

      it '在籍区分は空白では登録できない' do
        @user.position_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を入力してください"
      end

      it '在籍区分を選択しなければ登録できない' do
        @user.position_id = 0
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(上限値を超えている数値の場合)' do
        @user.position_id = 4
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(ひらがなの場合)' do
        @user.position_id = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(漢字の場合)' do
        @user.position_id = '日本'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(全角カタカナの場合)' do
        @user.position_id = 'ア'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(半角カタカナの場合)' do
        @user.position_id = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(全角数字の場合)' do
        @user.position_id = '１'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(全角英字の場合)' do
        @user.position_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(半角英字の場合)' do
        @user.position_id = 'ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      it '存在しない在籍区分を選択すると登録できない(環境依存文字の場合)' do
        @user.position_id = '⌘'
        @user.valid?
        expect(@user.errors.full_messages).to include "在籍区分を正しく選択してください"
      end

      #画像-----------------------------------------------------------------------
      it '特定のファイル形式(PNG、JPG、JPEG)以外はアップロードできない（PDFファイルをアップロードした場合）' do
        @user.image.attach(io: File.open('app/assets/spectest/pdf.pdf'), filename: 'pdf.pdf')
        @user.valid?
        expect(@user.errors.full_messages).to include "画像は【png】【jpg】【jpeg】以外の形式ではアップロードできません"
      end

      #10MBの画像をディレクトリに格納するとGitプッシュに支障が出るため、ローカル環境のみで実行。普段はコメントアウト。
      #it 'ファイルサイズが10MBを超える画像はアップロードできない' do
      #  @user.image.attach(io: File.open('app/assets/spectest/100MB.png'), filename: '100MB.png')
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include "画像のファイルサイズが10MBを超えているため、アップロードできません"
      #end

    end  #新規登録できないとき
  end #ユーザ新規登録

end
