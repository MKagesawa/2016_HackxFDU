Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'locations/get_photo'
  get 'locations/get_nearby'
  get 'locations/get_info'
  get 'locations/get_min'
  get 'locations/get_record'
  get 'locations/get_passed'
  post 'locations/user_passed'
end
