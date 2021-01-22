require 'rails_helper'

RSpec.describe ServiceToMedicalSystem, type: :model do
  before do
    @company = FactoryBot.create(:company)
    @service_to_medical_system = FactoryBot.build(:service_to_medical_system, company_id: @company.id)
  end

  describe "投稿機能" do
    context "データの保存に成功" do
      it "全ての項目が正しく存在する" do
        expect(@service_to_medical_system).to be_valid
      end
      it "imagesが複数存在する" do
        images_arr = []
        images_arr << Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test_image.png'))
        images_arr << Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/test_image2.png'))
        @service_to_medical_system.images = images_arr
        expect(@service_to_medical_system).to be_valid
      end
      it "imagesが空" do
        @service_to_medical_system.images = nil
        expect(@service_to_medical_system).to be_valid
      end
    end
    context "データの保存に失敗" do
      it "nameが空" do
        @service_to_medical_system.name = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("施設・サービス名を入力してください")
      end
      it "nameが51文字以上" do
        @service_to_medical_system.name = "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあ"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("施設・サービス名は50文字以内で入力してください")
      end
      it "addressが空" do
        @service_to_medical_system.address = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("住所を入力してください")
      end
      it "capacityが空" do
        @service_to_medical_system.capacity = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("定員を入力してください")
      end
      it "capacityが浮動小数" do
        @service_to_medical_system.capacity = "1.5"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("定員は整数で入力してください")
      end
      it "roomsが空" do
        @service_to_medical_system.rooms = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("居室数を入力してください")
      end
      it "roomsが浮動小数" do
        @service_to_medical_system.rooms = "1.5"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("居室数は整数で入力してください")
      end
      it "phoneが空" do
        @service_to_medical_system.phone = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("電話番号を入力してください")
      end
      it "phoneが10桁未満" do
        @service_to_medical_system.phone = "123456789"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it "phoneが12桁以上" do
        @service_to_medical_system.phone = "123456789012"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it "phoneにハイフンを含む" do
        @service_to_medical_system.phone = "12345-6789"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it "phoneが大文字" do
        @service_to_medical_system.phone = "１２３４５６７８９０"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("電話番号を正しく入力してください")
      end
      it "explanationが空" do
        @service_to_medical_system.explanation = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("説明を入力してください")
      end
      it "explanationが201文字以上" do
        @service_to_medical_system.explanation = "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあ"
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("説明は200文字以内で入力してください")
      end
      it "category_idが未選択（1)" do
        @service_to_medical_system.category_id = 1
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("施設の種類を選択してください")
      end
      it "prefecture_idが未選択（1)" do
        @service_to_medical_system.prefecture_id = 1
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("都道府県を選択してください")
      end
      it "lump_sum_minが空" do
        @service_to_medical_system.lump_sum_min = nil
        @service_to_medical_system.lump_sum_max = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("入居費用の最低額を入力してください")
      end
      it "lump_sum_minがlump_sum_maxより大きい" do
        @service_to_medical_system.lump_sum_min = 2
        @service_to_medical_system.lump_sum_max = 1
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("入居費用の最低額を正しく入力してください")
      end
      it "lump_sum_maxが空" do
        @service_to_medical_system.lump_sum_max = nil
        @service_to_medical_system.lump_sum_min = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("入居費用の最高額を入力してください")
      end
      it "lump_sum_maxがlump_sum_minより小さい" do
        @service_to_medical_system.lump_sum_max = 1
        @service_to_medical_system.lump_sum_min = 2
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("入居費用の最高額を正しく入力してください")
      end
      it "monthly_sum_minが空" do
        @service_to_medical_system.monthly_sum_min = nil
        @service_to_medical_system.monthly_sum_max = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("月額の最低額を入力してください")
      end
      it "monthly_sum_minがmonthly_sum_maxより大きい" do
        @service_to_medical_system.monthly_sum_min = 2
        @service_to_medical_system.monthly_sum_max = 1
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("月額の最低額を正しく入力してください")
      end
      it "monthly_sum_maxが空" do
        @service_to_medical_system.monthly_sum_max = nil
        @service_to_medical_system.monthly_sum_min = nil
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("月額の最高額を入力してください")
      end
      it "monthly_sum_maxがmonthly_sum_minより小さい" do
        @service_to_medical_system.monthly_sum_max = 1
        @service_to_medical_system.monthly_sum_min = 2
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("月額の最高額を正しく入力してください")
      end
      it "age_idが未選択（1)" do
        @service_to_medical_system.age_id = 1
        @service_to_medical_system.valid?
        expect(@service_to_medical_system.errors.full_messages).to include("年齢制限を選択してください")
      end
    end
  end
end
