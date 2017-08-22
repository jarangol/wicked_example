Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'articles#new'

  scope "articles/:article_id" do
   resources :article_steps
  end
end
