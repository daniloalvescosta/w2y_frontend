require 'rails_helper'

RSpec.describe Session, type: :model do
  it 'has a valid factory' do
    session = FactoryBot.build(:session)
    expect(session).to be_valid
  end

  it 'is invalid without a token' do
    session = FactoryBot.build(:session, token: nil)
    expect(session).not_to be_valid
  end

  it 'is invalid without an email' do
    session = FactoryBot.build(:session, email: nil)
    expect(session).not_to be_valid
  end

  it 'is invalid with an invalid email' do
    session = FactoryBot.build(:session, email: 'invalid_email')
    expect(session).not_to be_valid
  end
end
