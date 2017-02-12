require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it { should validate_uniqueness_of(:email) }

    it { should allow_value("user@appuser.com").for(:email) }
    it { should_not allow_value("thisisnotan@email").for(:email) }
  end

  describe 'after_initialization' do
    it 'calls to set a defualt role' do
        expect_any_instance_of(User).to receive(:set_default_role)
        User.new
    end
    it 'sets default role to user' do
        user = User.new
        expect(user.role).not_to be_nil
        expect(user.role).to eq('user')
    end
  end

end