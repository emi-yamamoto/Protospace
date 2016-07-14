FactoryGirl.define do
  factory :prototype do
    title { Faker::Lorem.words }
    catch_copy { Faker::Lorem.words }
    concept { Faker::Lorem.sentence }
  end

  trait :prototype_with_comments do
    transient do
      comments_count 5
    end
    after(:create) do |prototype, evaluator|
      evaluator.comments_count.times do
        prototype.comments.create!
      end
    end
  end

  trait :prototype_with_likes do
    transient do
      likes_count 5
    end
    after(:create) do |prototype, evaluator|
      evaluator.likes_count.times do
        prototype.likes.create!
      end
    end
  end

  trait :with_sub_images do
    transient do
      sub_images 3
    end
    after(:create) do |prototype, evaluator|
      prototype.images << create_list(:sub_image, evaluator.sub_images)
    end
  end
end
