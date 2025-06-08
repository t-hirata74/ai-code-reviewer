FactoryBot.define do
  factory :pull_request do
    number { 1 }
    title { "MyString" }
    state { "MyString" }
    github_id { "MyString" }
    repository { nil }
    author { nil }
    head_sha { "MyString" }
    base_sha { "MyString" }
  end
end
