Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'authentication' do
    devise_for :users, controllers: {
      sessions: 'authentication/sessions',
      registrations: 'authentication/registrations',
      passwords: 'authentication/passwords',
      confirmations: 'authentication/confirmations'
    }
  end

  scope 'api', defaults: {format: :json} do
    resources :clients
    resources :client_tags
    resources :client_client_tags
    get '/current_user' => 'users#show_current_user'
  end
end
