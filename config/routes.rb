Rails.application.routes.draw do


  # MVC routes:

  root 'main#index'

  get  'categories/:id'  =>  'main#categories',   as:  'categories'
  get  'add_comment'     =>  'main#add_comment',  as:  'add_comment'

  resources :users
  resources :ucomments

  resources :companies do
    get ''        =>  'companies#show'
    get 'review'  =>  'companies#review',  as:  'review'
  end

  ActiveAdmin.routes(self)
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'registrations'}, :path => 'auth'

  # AJAX routes:

  get 'ajax_get_negative_comments' => 'main#ajax_get_negative_comments', as: 'ajax_get_negative_comments'
  get 'ajax_get_positive_comments' => 'main#ajax_get_positive_comments', as: 'ajax_get_positive_comments'


  # UNDONE

  get 'new_reply' => 'ucomments#new_reply', as: 'reply_to_comment'

  get 'upd_subcategories' => 'companies#update_subcategories', as: 'upd_subcategories'

end
