require 'rails_helper'

RSpec.describe "モデルテスト", type: :model do

  it "ユーザーを一つ作成（組織一つも自動に生成）" do
    FactoryBot.create(:user)
    user = User.first
    expect(user.organization).to be_present
  end

  it "一つの組織が複数のユーザーを持つ" do
    FactoryBot.create(:user)
    FactoryBot.create(:user, organization_id: 1)
    org = Organization.first
    expect(org.users.size).to eq 2
  end

  it "メールを持っているユーザーだけをフィルター" do
    user = FactoryBot.create(:user)
    FactoryBot.create(:user, :with_email)
    users = User.filter_users_with_email
    expect(users.size).to eq 1
  end

  it "ユーザーのメソッドself_intro" do
    FactoryBot.create(:user, name: "ルーター")
    user = User.first
    intro = user.self_intro
    expect(intro).to eq "私の名前はルーターです"
  end

end