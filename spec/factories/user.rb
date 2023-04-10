FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test_#{n}" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password              { "111111" }
    password_confirmation { "111111" }

    after(:build) do |user|
      user.avatar.attach(io: File.open(Rails.root.join('spec/fixtures/image/sample_icon.jpeg')),
      filename: 'sample_icon.jpeg',
      content_type: 'image/jpeg')
    end
  end
end
