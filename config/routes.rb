Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get:"/about", to: "pages#index"
  
  get:"/sign_up", to:"users#sign_up"
end
