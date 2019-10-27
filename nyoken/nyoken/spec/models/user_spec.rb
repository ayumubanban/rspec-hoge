require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # before do
  #   @user = FactoryBot.build(:user)
  # end

  describe "Userバリデーションチェック" do
    it "nameが空欄の場合、User作成不可" do
      @user = FactoryBot.build(:user)
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    # * なんか上手く行かん
    it "emailが重複している場合、User作成不可" do
      @user = FactoryBot.create(:user)
      @other_user = FactoryBot.build(:user, email: "a@a.com")
      expect(@other_user.valid?).to eq(false)
    end
  end
end
