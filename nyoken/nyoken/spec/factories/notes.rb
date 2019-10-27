FactoryBot.define do
  factory :note do
    message { "MyText" }
    user_id { 1 }
    task_id { 1 }
    association :task
    association :user
    # user { task.user }
  end
end
