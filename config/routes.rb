NasaHackathon::Application.routes.draw do
  root :to => "home#index", :as => :get

  match "api/sphere", :to => "api#sphere"
  match "api/crater", :to => "api#crater"
end
