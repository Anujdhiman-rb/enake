require 'rails_helper'

RSpec.describe SettingsController, type: :controller do

  describe "GET #general" do
    it "returns http success" do
      get :general
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #business" do
    it "returns http success" do
      get :business
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_practitioner" do
    it "returns http success" do
      get :user_practitioner
      expect(response).to have_http_status(:success)
    end
  end

end
