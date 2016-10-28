require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create(name: 'niti')}
  describe '#name' do
    it 'capitalizes the name' do
      expect(user.name).to eq("Niti")
    end

    it 'confirms a new user in the database' do
      expect(User.last.name).to eq('niti')
    end
  end
end
