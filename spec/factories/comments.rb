FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "commentのtest #{n}" }
    association :user
    association :post
  end
end
