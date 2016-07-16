FactoryGirl.define do
  factory :image do
    name { fixture_file_upload("spec/fixtures/img/sample.jpg", 'image/jpg') }

    factory :main_image, class: Image do
      status  :main
    end

    factory :sub_image, class: Image do
      status  :sub
    end
  end
end
