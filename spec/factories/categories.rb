FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "test_name_#{n}" }

    trait :engineer do
      name { 'Engineer' }
    end

    trait :writer do
      name { 'Writer' }
    end

    trait :gamer do
      name { 'Gamer' }
    end
  end
end
