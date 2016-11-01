require 'rails_helper'

RSpec.describe User, type: :model do

  let(:lender) {FactoryGirl.create :lender}
  let(:tool) {FactoryGirl.create :tool, :lender_id => lender.id}
  let(:listing) {FactoryGirl.create :listing, :tool_id => tool.id}

  it 'is a valid user' do
    expect(lender).to be_valid
  end

  it 'has many tools' do
    expect(lender.tools).to include(tool)
  end

  it 'has many listings' do
    expect(lender.listings).to include(listing)
  end

end
