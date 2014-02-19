require 'spec_helper'

describe UsersController do

  context "#create" do
    it "should create a new user when passed valid parameters" do
      expect {
        post :create, :user => FactoryGirl.attributes_for(:user)
      }.to change { User.count }.by(1)
      expect(response).to be_redirect
    end
  end
end