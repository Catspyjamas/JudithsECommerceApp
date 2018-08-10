require "rails_helper"
describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "example mushroom", image_url: "https://static1.squarespace.com/static/5849c529d2b8574bec083c06/5849c55e414fb515730a1cf2/5849c6d5f7e0abea8fdf7359/1515024529125/slide_bg_2.jpg?format=1500w") }
    let(:user) { User.create!(email: "handsampf@urban.de", password: "123456") }
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





