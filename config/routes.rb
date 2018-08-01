Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :gossips
  get 'gossips/:id/comment', to: 'gossips#comment', as: 'comment'
  post 'gossips/:id/comment', to: 'gossips#create_comment', as: 'create_comment'
  delete 'comment', to: 'gossips#delete_comment', as: 'delete_comment'
end
