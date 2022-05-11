Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :companies do 
    resources :job_offers, only: [:create, :update, :destroy]
  end
  resources :job_offers, except: [:create, :update, :destroy]
  resources :candidates
  resources :job_applications, except: [:create] do
    member do
      post :apply
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
