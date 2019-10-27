FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    user_id { 1 }
    association :user
  end
end
