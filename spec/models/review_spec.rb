require 'rails_helper'

RSpec.describe Review, :type => :model do
  let(:tool) {
    Tool.create(
      :id => 1,
      :name => "hacksaw",
      :safety_level => "safe",
      :portability => "easy",
      :condition => "new"
    )
  }

  let(:review) {
    Review.create(
    # id: 1,
    rating: 4,
    content: "great",
    tool_id: 1
    )
  }

  # it "is valid with a rating and content" do
  #   expect(Review.new(rating:4, content: "good", tool_id: 4)).to be_valid
  # end

  it "is not valid without content" do
    expect(Review.new(rating: 4)).not_to be_valid
  end

  it "is not valid without rating" do
    expect(Review.new(content: "old")).not_to be_valid
  end

  it "belongs to one tool" do
    expect(tool.reviews).to eq(review)
  end
  #
  # it "belongs to one user" dorev
  #   expect(ride.user).to eq(user)
  # end
end
