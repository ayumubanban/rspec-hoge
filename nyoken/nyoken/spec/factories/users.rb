FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TestUser#{n}" }
    sequence(:email) { |n| "Test#{n}@example.com" }
    # email { "a@a.com" }
    password {"i-am-test-user"}
  end
end
