Rails.application.routes.draw do
  resources :webhooks, only: [:index]

  root 'webhooks#index'

  post '/webhooks' => 'webhooks#receive', as: :receive_webhooks

end
