FactoryBot.define do
  factory :category do
    name { 'Name' }
    icon { 'Icon' }
    user
  end
end
