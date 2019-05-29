Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :gitcommits, except: [:show, :udate, :destroy]
      root to: 'gitcommits#index'
      get '/remove_all', to: 'gitcommits#remove_selected'
    end
  end
  root to: 'api/v1/gitcommits#index'
end
