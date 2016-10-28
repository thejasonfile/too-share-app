require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {FactoryGirl.create :user}

end


  # let(:user) { FactoryGirl.create :user }
  # lazy loading
  # def user
    # User.new(name: 'bob')
  # end
  # describe '#name' do

  #   it 'capitalizes the name' do
  #     expect(user.name).to eq('bob') #test, expectation
  #   end
  #   # teardown
  # end

  # describe 'save' do
  #   let(:user) { FactoryGirl.build :user, name: ''}
  #   it 'requires a name' do
  #     expect(user.valid?).to eq(false)
  #   end
  # end

  # describe '#age' do
  #   it 'calculates the correct age' do
  #     expect(user.age).to eq(23) #test, expectation
  #   end
  # end

  # describe '.all_users_named_bob' do
  #   # let(:user) { User.create(name: 'fred')}
  #   # def user
  #   # User.create(name: 'fred')
  #   # end
  #   before do
  #     # User.create(name: 'fred')
  #     FactoryGirl.create(:user, name: 'fred')
  #   end

  #   it 'excludes all users not named bob' do
  #     expect(User.all_users_named_bob.map(&:name)).to_not include('fred')
  #   end
  # end


# end
