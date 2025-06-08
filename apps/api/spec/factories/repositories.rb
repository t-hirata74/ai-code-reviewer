FactoryBot.define do
  factory :repository do
    name { "MyString" }
    full_name { "MyString" }
    github_id { "MyString" }
    owner { nil }
    webhook_configured { false }
  end
end
