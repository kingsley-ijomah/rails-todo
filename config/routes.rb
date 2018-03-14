Rails.application.routes.draw do
  resources :tasks, except: [:show] do
    put 'done', on: :member
  end
end
