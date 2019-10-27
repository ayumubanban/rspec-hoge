FactoryBot.define do
  factory :user do
    # name { "MyString" }
    # email { "MyString" }
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
  end
end
