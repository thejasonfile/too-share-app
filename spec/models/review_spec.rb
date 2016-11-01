require 'rails_helper'

RSpec.describe Review, :type => :model do
  # let(:tool) {
  #   Tool.create(
  #
  #     :name => "hacksaw",
  #     :safety_level => "safe",
  #     :portability => "easy",
  #     :condition => "new",
  #     :availability => "Available"
  #   )
  # }
let(:lender) {FactoryGirl.create :lender}
let(:borrower) {FactoryGirl.create :borrower}
let(:tool) {FactoryGirl.create :tool, :lender_id => lender.id, :borrower_id => borrower.id }
let(:review) {FactoryGirl.create :review, :borrower_id => borrower.id, :tool_id => tool.id}


  it "is valid with a rating and content" do
    expect(review).to be_valid
  end

  it "is not valid without content" do
    expect(Review.new(rating: 4)).not_to be_valid
  end

  it "is not valid without rating" do
    expect(Review.new(content: "old")).not_to be_valid
  end

  it "belongs to one tool" do
    expect(tool.reviews).to include(review)
  end

  it "belongs to one borrower" do
    expect(borrower.reviews).to include(review)
  end

  it "has a method 'worth_borrowing?' that says if it's worth borrowing" do
    review = Review.create(:rating => 5, :content => "Did the job")
    expect(review.worth_borrowing?).to eq("Yep!")
  end

  it "has a method 'solid_review' that says if it is a thorough review" do
    review = Review.create(:rating => 5, :content => "Did the job well but not that well. Also I chopped my finger off by accident. But that just means the blade is sharp enough to the job. I still recommend it. Enough to spend all this time writing it. Good day!")
    expect(review.solid_review).to eq(true)
  end

  describe '.number_of_reviews' do
    it "should increment review count only if review is saved" do
      expect do
        Review.new(:rating => 5, :content => "Did the job")
      end.to change(Review, :number_of_reviews).by(0)
    end
  end

  describe '.number_of_reviews' do
    it "should increment review count if review is saved" do
      expect do
        Review.create(:rating => 5, :content => "Did the job", :tool => tool, :borrower => borrower)
      end.to change(Review, :number_of_reviews).by(1)
    end
  end

  describe '.number_of_solid_reviews' do
    it "should increment solid review count if solid review is saved" do
      expect do
        review = Review.create(:rating => 5, :content => "Did the job well but not that well. Also I chopped my finger off by accident. But that just means the blade is sharp enough to the job. I still recommend it. Enough to spend all this time writing it. Good day!", :tool => tool, :borrower => borrower)
      end.to change(Review, :number_of_solid_reviews).by(1)
    end
  end



end
