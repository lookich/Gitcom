require 'rails_helper'

RSpec.describe Api::V1::GitcommitsController, type: :controller do
  before do

  end

  context 'POST gitcommits#create' do
    it 'the new commits' do
      expect { FactoryBot.create(:gitcommit) }.to change(Gitcommit, :count).by(1)
    end
  end

  context 'GET gitcommits#index' do
    it 'returns a success response' do
      gitcommit = FactoryBot.create(:gitcommit)
      get :index, params: { id: gitcommit }
      expect(response).to be_successful
    end
  end

  context 'GET gitcommits#remove_selected' do
    it 'to delete commits' do
      gitcommit = FactoryBot.create(:gitcommit)
      expect do
        get :remove_selected, params: { ids: gitcommit }
      end.to change(Gitcommit, :count).by(-1)
    end
  end

  context "JSON" do
    context 'when request sets accept => application/json' do
      it 'posts#index should return successful response' do
        request.accept = "application/json"
        get :index
        expect(response).to be_successful
      end
    end
  end
end
