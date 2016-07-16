FactoryGirl.define do
  factory :comment do
    prototype
    user
    text { Faker::Lorem.sentence }
  end
end
