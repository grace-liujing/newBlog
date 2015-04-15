require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  describe 'login' do
    it 'create session when user login' do
      allow(User).to receive(:authentication).and_return(double(id: 1,username:'grace'))
      post :create
      expect(session[:user_id]).to eq(1)
    end

    it 'return to login when user login fails' do
      allow(User).to receive(:authentication).and_return(false)
      post :create
      response.should redirect_to new_session_path
    end
  end

  describe 'logout' do
    it 'return to login when user logout success' do
      delete :destroy, id: 1
      expect(session[:user_id]).to be_nil
      response.should redirect_to new_session_path
    end
  end
end