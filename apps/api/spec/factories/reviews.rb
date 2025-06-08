FactoryBot.define do
  factory :review do
    status { "MyString" }
    overall_score { 1 }
    summary { "MyText" }
    pull_request { nil }
    reviewer { nil }
  end
end
