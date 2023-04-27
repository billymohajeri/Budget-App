FactoryBot.define do
  factory :user do
    name { 'Name' }
    sequence :email do |n|
      "user#{n}@aol.com"
    end
    password { 'password' }
  end
end
