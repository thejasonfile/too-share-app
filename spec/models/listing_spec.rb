RSpec.describe Listing, type: :model do
  let(:valid_attributes) do
    {
      name: "New Hammer",
      notes: "Be kind to my hammer please",
      tool_id: 1,
    }
  end


  let(:lender) {FactoryGirl.create :lender}
  let(:borrower) {FactoryGirl.create :borrower}
  let(:tool) {FactoryGirl.create :tool, :lender_id => lender.id, :borrower_id => borrower.id }
  let(:listing) {FactoryGirl.create :listing, :tool_id => tool.id}


  let(:missing_name) { valid_attributes.except(:name) }
  let(:missing_notes) { valid_attributes.except(:notes) }

  it "is valid when expected" do
    expect(listing).to be_valid
  end

  it "is invalid without name" do
    expect(Listing.new(missing_name)).to be_invalid
  end

  it "is invalid without notes" do
    expect(Listing.new(missing_notes)).to be_invalid
  end

  it "belongs to one tool" do
    expect(listing.tool).to eq(tool)
  end
end
