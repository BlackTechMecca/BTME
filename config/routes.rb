  Rails.application.routes.draw do

  resources :blogs, only: [:index, :show, :new, :edit, :create]

  resources :job_posts

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:index, :show, :edit, :update]

  get 'activity', to: 'activities#index'

  # resources :events, only: [:show,:index,:create, :new]

  root 'home#index'

  get 'about' => 'home#about'

  get 'contact' => 'home#contact'

  devise_scope :user do
    get "signout", to: "users/sessions#destroy"
  end

end