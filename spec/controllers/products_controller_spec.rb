require 'rails_helper'

describe ProductsController, type: :controller do
  before do
    @product = FactoryBot.create(:product) 
    @user1 = FactoryBot.create(:user)
    @admin = FactoryBot.create(:admin)
  end

  context 'nobody is logged in' do
    it 'loads correct product site' do
      get :show, params: { id: @product.id }
      expect(response).to be_ok
      expect(assigns(:product)).to eq @product
    end

    it 'cannot access to new page' do
      get :new
      expect(response).to redirect_to(user_session_path)
    end

    it 'cannot access to edit page' do
      get :edit, params: { id: @product.id }
      expect(response).to redirect_to(user_session_path)
    end

    it 'cannot destroy a product' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to(user_session_path)
    end
  end

  context 'normal user is logged in' do
    before do
      sign_in @user1
    end

    it 'cannot access new page' do
      get :new
      expect(response).to redirect_to(root_path)
    end

    it 'cannot access edit page' do
      get :edit, params: { id: @product.id }
      expect(response).to redirect_to(root_path)
    end

    it 'cannot destroy a product' do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to(root_path)
    end
  end

  context 'admin is logged in' do
    before do
      sign_in @admin
    end

    it 'can access new page' do
      get :new
      expect(response).to be_ok
    end

    it 'can access edit page' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
    end

  end
end