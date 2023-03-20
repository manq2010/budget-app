FactoryBot.define do
  factory :expense do
    name { "MyString" }
    amount { false }
    user { nil }
    group { nil }
  end
end
