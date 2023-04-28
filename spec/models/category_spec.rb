require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { described_class.new(name: 'Bank', icon: '💳', user:) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'belongs to a user' do
    expect(subject.user).to eq(user)
  end

  it 'has many operations' do
    expect(subject.operations).to eq([])
  end
end
