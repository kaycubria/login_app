Rails.application.routes.draw do
    resources :users

    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'

    root 'sessions#new'

    match "/404", :to => "errors#not_found", :via => :all
    match "/500", :to => "errors#internal_server_error", :via => :all
end
