require "rails_helper"
describe Product do
  context "when the product has comments" do
    product = FactoryBot.create(:product)
    user = FactoryBot.create(:user)
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful mushroom!")
      product.comments.create!(rating: 3, user: user, body: "Ok mushroom!")
      product.comments.create!(rating: 5, user: user, body: "Great mushroom!")
    end
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
    it "is not valid without a name" do
      expect(Product.new(description: "Nice mushroom")).not_to be_valid
    end
  end
end





