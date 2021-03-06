require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def logout!
      session.clear
    end

    def current_user
      User.find(session[:id])
    end
  end
end
