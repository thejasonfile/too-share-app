RSpec.describe Listing, type: :model do
  let(:valid_attributes) do
    {
      name: "New Hammer",
      notes: "Be kind to my hammer please",
      tool_id: 1,

    }
  end


  let(:missing_name) { valid_attributes.except(:name) }
  let(:missing_notes) { valid_attributes.except(:safety_level) }

  it "is valid when expected" do
    expect(Listing.new(valid_attributes)).to be_valid
  end

  it "is invalid without name" do
    expect(Listing.new(missing_name)).to be_invalid
  end

  it "is invalid without notes" do
    expect(Listing.new(missing_safety_level)).to be_invalid
  end
end
