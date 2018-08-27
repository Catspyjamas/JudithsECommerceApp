require "rails_helper"
describe Comment do
  context "writing a new comment" do

    it "is not valid without a rating" do
      comment = FactoryBot.build(:comment, rating: nil)
      expect(comment).to_not be_valid
    end

    it "is not valid without a body" do
      comment = FactoryBot.build(:comment, body:nil)
      expect(comment).to_not be_valid
    end
  end
end

