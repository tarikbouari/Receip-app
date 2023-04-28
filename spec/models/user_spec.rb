require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'ben',
      email: 'bensmith@gmail.com',
      password: '12345678'
    )
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end
