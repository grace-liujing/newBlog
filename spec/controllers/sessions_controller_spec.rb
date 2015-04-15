require 'spec_helper'
require 'rails_helper'

describe SessionsController do
  describe 'session' do
    it 'create session when user login' do
      allow(User).to receive(:authentication).and_return(double(id: 1,username:'grace'))
      post :create
      expect(session[:user_id]).to eq(1)
    end
  end
end