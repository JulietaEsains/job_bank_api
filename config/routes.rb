Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :companies do 
    resources :job_offers, only: [:create]
  end
  resources :job_offers, except: [:create]
  resources :candidates do 
    resources :job_applications, only: [:create]
  end
  resources :job_applications, except: [:create] do
    member do
      post :apply
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
