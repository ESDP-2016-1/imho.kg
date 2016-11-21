Rails.application.routes.draw do


  # MVC routes:

  root 'main#index'

  get  'categories/:id'  =>  'main#categories',      as:  'categories'

  get  'add_comment'     =>  'main#add_comment',     as:  'add_comment'

  get  'users/:id'       =>  'users#show_foreign',   as: 'user'

  get  'profile'         =>  'users#show',           as: 'profile'
  get  'profile/edit'    =>  'users#edit',           as: 'edit_profile'

  resources :companies do
    get 'review'         =>  'companies#review',     as: 'review'
  end

  devise_for :users, path: '', skip: [:sessions, :registrations, :passwords, :confirmations]
  as :user do

    #SignIn/SignOut[Sessions]
    get     'sign_in'    => 'devise_sessions#new',      as: 'new_user_session'
    post    'sign_in'    => 'devise_sessions#create',   as: 'user_session'
    delete  'sign_out'   => 'devise_sessions#destroy',  as: 'destroy_user_session'

    #Registration
    get     'register'   => 'devise_registrations#new',    as: 'new_user_registration'
    post    'register'   => 'devise_registrations#create', as: 'user_registration'
    patch   'register'   => 'devise_registration#update'
    put     'register'   => 'devise_registration#update'
    delete  'register'   => 'devise_registration#destroy'

    #Confirmation
    get   'confirmation/new'    => 'devise_confirmations#new',      as: 'new_user_confirmation'
    get   'confirmation'        => 'devise_confirmations#show'
    post  'confirmation'        => 'devise_confirmations#create',   as: 'user_confirmation'

    #Password
    get   'recovery'                => 'devise_passwords#new',      as: 'new_user_password'
    get   'recovery/new_password'   => 'devise_passwords#edit',     as: 'edit_user_password'
    post  'recovery'                => 'devise_passwords#create',   as: 'user_password'
    patch 'recovery'                => 'devise_passwords#udpate'
    put   'recovery'                => 'devise_passwords#update'
  end

  # AJAX routes:

  get 'negative_comments' => 'main#ajax_get_negative_comments', as: 'ajax_get_negative_comments'
  get 'positive_comments' => 'main#ajax_get_positive_comments', as: 'ajax_get_positive_comments'


  # UNDONE



  resources :ucomments, path: "comments"



  get 'new_reply' => 'ucomments#new_reply', as: 'reply_to_comment'

  get 'upd_subcategories' => 'companies#update_subcategories', as: 'upd_subcategories'

  ActiveAdmin.routes(self)
end
