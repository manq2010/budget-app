FactoryBot.define do
  factory :expense do
    name { "MyString" }
    amount { 10 }
    user { nil }
  end
end
