require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:category2) { FactoryBot.create(:category, icon: '🍎', name: 'Food', user:) }
  subject { described_class.new(name: 'Apple', author: user, user:, category: category2) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject.author).to eq(user)
  end

  it 'has many categories' do
    expect(subject.categories).to eq([])
  end
end
