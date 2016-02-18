require 'spec_helper'

describe Api::V1::AuthController, type: :request do
  describe "GET #hello" do
    it "returns 401 error" do
      get '/api/v1/auth/hello', {}
      expect(response).to have_http_status(:unauthorized)

      headers = { "X-Driver-Token": "FAKE" }
      get '/api/v1/auth/hello', {}, headers
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns 200 ok" do
      driver = create(:driver)
      headers = { "X-Driver-Token": driver.authentication_token }
      get '/api/v1/auth/hello', {}, headers
      expect(response).to be_success
    end
  end

  describe "POST #send_code" do
    it "creates new driver and send sms" do
      expect(SendCodeJob).to receive(:perform_later).once 
      post '/api/v1/auth/send_code', { phone: '+79999808630' }
      expect(Driver.count).to eql(1)
    end
  end

#   describe "POST #bonjour" do
#     context "with new credential" do
#       it "creates a traveler" do
#         headers = { "X-Traveler-Device": "UUID" }
#         post '/api/v1/bonjour', {}, headers
#         expect(response).to have_http_status(:created)
#         expect(Traveler.find_by(device_token: "UUID")).to be_kind_of(Traveler)
#       end
#     end
#
#     context "with an existing traveler" do
#       it "regenerates a token" do
#         traveler = create(:traveler)
#         headers = { "X-Traveler-Device": traveler.device_token,
#                     "X-Traveler-Token": "INVALID TOKEN" }
#         expect do
#           post '/api/v1/bonjour', {}, headers
#           traveler.reload
#         end.to change(traveler, :authentication_token)
#         expect(response).to be_success
#
#         headers = { "X-Traveler-Device": traveler.device_token,
#                     "X-Traveler-Token": traveler.authentication_token }
#         get '/api/v1/bonjour/check', {}, headers
#         expect(response).to be_success
#       end
#     end
#   end
end
