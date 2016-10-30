RSpec.describe Tool, type: :model do
  let(:valid_attributes) do
    {
      name: "hammer",
      safety_level: "safe",
      portability: "need car",
      condition: "in good condtion",

    }
  end


  let(:missing_name) { valid_attributes.except(:name) }
  let(:missing_safety_level) { valid_attributes.except(:safety_level) }
  let(:missing_portability) { valid_attributes.except(:portability) }
  let(:missing_condition) { valid_attributes.except(:condition) }

  it "is valid when expected" do
    expect(Tool.new(valid_attributes)).to be_valid
  end

  it "is invalid without name" do
    expect(Tool.new(missing_name)).to be_invalid
  end

  it "is invalid without safety_level" do
    expect(Tool.new(missing_safety_level)).to be_invalid
  end

  it "is invalid without portability" do
    expect(Tool.new(missing_portability)).to be_invalid
  end

  it "is invalid without condition of tool" do
    expect(Tool.new(missing_condition)).to be_invalid
  end
end
