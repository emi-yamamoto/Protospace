FactoryGirl.define do
  factory :prototype do
    title { Faker::Name.name }
    catch_copy { Faker::Name.name }
    concept { Faker::Lorem.sentence }
    main_image
    user
  end

  trait :prototype_with_comments do
    transient do
      comments_count 5
    end
    after(:create) do |prototype, evaluator|
      prototype.comments << create_list(:comment, evaluator.comments_count)
    end
  end

  trait :prototype_with_likes do
    transient do
      likes_count 5
    end
    after(:create) do |prototype, evaluator|
      prototype.likes << create_list(:like, evaluator.likes_count)
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
