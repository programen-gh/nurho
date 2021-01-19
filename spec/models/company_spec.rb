require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = FactoryBot.build(:company)
  end

  describe "ユーザー管理機能" do
    context "データの保存に成功" do
      it "全ての項目が存在する" do
        expect(@company).to be_valid
      end
    end
    context "データの保存に失敗" do
      it "nameが空" do
        @company.name = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("会社名を入力してください")
      end
      it "nameが31文字以上" do
        @company.name = "abcdefghijklmnopqrstuvwxyz12345"
        @company.valid?
        expect(@company.errors.full_messages).to include("会社名は30文字以内で入力してください")
      end
      it "emailが空" do
        @company.email = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "emailが重複" do
        @company.save
        another_company = FactoryBot.build(:company)
        another_company.email = @company.email
        another_company.valid?
        expect(another_company.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "emailに@がない" do
        @company.email = "testexample"
        @company.valid?
        expect(@company.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "passwordが空" do
        @company.password = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワードを入力してください")
      end
      it "passwordが5文字以下" do
        @company.password = "12345"
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "password_confirmationが空" do
        @company.password_confirmation = ""
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordとpassword_confirmationが不一致" do
        @company.password = "000000"
        @company.password_confirmation = "111111"
        @company.valid?
        expect(@company.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
    end
  end
end
