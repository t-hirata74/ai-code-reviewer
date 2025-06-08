FactoryBot.define do
  factory :review_comment do
    file_path { "MyString" }
    line_number { 1 }
    comment { "MyText" }
    severity { "MyString" }
    suggestion { "MyText" }
    review { nil }
  end
end
