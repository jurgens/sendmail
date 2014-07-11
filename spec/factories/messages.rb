FactoryGirl.define do
  factory :message do
    to      { Faker::Internet.email }
    subject { Faker::Lorem.sentence 5 }
    body    { Faker::Lorem.paragraph 3 }

    trait :with_attachment do
      attachment { File.open(File.expand_path('spec/fixtures/file.zip')) }
    end
  end
end
