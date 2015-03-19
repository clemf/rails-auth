require 'rails_helper'

describe User do
  it { should validate_confirmation_of :password }

  describe '.authenticate' do

    context 'when password matches hash' do
      it 'returns the user' do
        User.create(email: 'test@test.com', password: 'password')
        expect(User.authenticate('test@test.com', 'password')).not_to eq nil
      end
    end

    context 'when password does not match hash' do
      it 'returns nil' do
        User.create(email: 'test@test.com', password: 'password')
        expect(User.authenticate('test@test.com', 'notpassword')).to eq nil
      end
    end
    
  end
end
