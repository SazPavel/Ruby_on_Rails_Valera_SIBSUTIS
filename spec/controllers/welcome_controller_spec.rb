require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:welcome) {create :welcome}
  describe 'GET #index' do
    subject {get :index}
    it "should get index" do
      expect(subject).to have_http_status(:success)
    end
  end
end
