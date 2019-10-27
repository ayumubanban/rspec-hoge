FactoryBot.define do
  factory :user do
    sequence(:name) { |i| "test_#{i}_san"}

    trait :with_email do
      email { "test_trait@test.co.jp" }
    end

    # organization_id { "MyString" }
    association :organization # * モデルでアソシエーション指定しとかんときかん。外部キーも自動的に設定される
  end
end
