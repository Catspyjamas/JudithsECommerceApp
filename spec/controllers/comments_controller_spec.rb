require 'rails_helper'

describe CommentsController, type: :controller do
  before do
    @product = FactoryBot.create(:product) 
    @user1 = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
    @comment = FactoryBot.create(:comment)
  end

  context 'user is logged in' do
    before do
      sign_in @user1
    end

    it 'creates a new comment' do
      post :create , params: {  :comment => FactoryBot.attributes_for(:comment),
        :user_id => @user1.id,
        :product_id => @product.id}
        expect(flash[:notice]).to eq "Review was created successfully."
    end

    it 'cannot delete a comment' do
      delete :destroy, params: {product_id: @product.id,  id: @comment.id }
      expect(flash[:alert]).to eq "Admins only!"
    end
  end

  context 'admin is signed in' do
    before do
      sign_in @admin
    end

    it 'can delete a comment' do
      delete :destroy, params: {product_id: @product.id,  id: @comment.id }
      expect(flash[:notice]).to eq "Review was destroyed successfully."
    end
  end

end