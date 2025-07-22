Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "welcome#index"

  resources :payloads do
    scope module: :payloads do
      resources :cnn_heatmaps, only: %i[index new create]
    end

    member do
      post :compare_matching
    end
  end
end
