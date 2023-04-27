FactoryBot.define do
  factory :operation do
    name { 'Name' }
    amount { '13.14' }
    category { '🍎' }
    user
  end
end
