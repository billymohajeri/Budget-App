require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Billy', email: 'one@gmail.com', password: '123456') }

  before { subject.save }

  it 'name should not be present' do
    subject.name = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:name]).to include("can't be blank")
  end

  after { subject.destroy }

  after { subject.save }

  it 'name should be present' do
    subject.name = 'Billy'
    expect(subject).to be_valid
  end
end
