Rails.application.routes.draw do
  devise_for :user
  root to: "top#index" 
  resources :blogs
  get 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts' => 'contacts#index'              # 入力画面
  post 'contacts/confirm' => 'contacts#confirm'   # 確認画面
  post 'contacts/thanks' => 'contacts#thanks'     # 送信完了画面
  #devise_for :users, :controllers => {
  #:sessions      => "users/sessions",
  #:registrations => "users/registrations",
  #:passwords     => "users/passwords"
  #}
  
end
