require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
	  set :views, 'app/views'
	  enable :sessions
	  set :session_secret, "carcollection"
	end


  helpers do

		def logged_out?
			if !logged_in?
				redirect '/login?error=Please LOG IN to view that content'
			end
		end

  	def logged_in?
  		!!session[:id]
  	end

  	def current_user
  		User.find(session[:id])
  	end

		def error
			@error_message = params[:error]
		end
  end

  get '/' do
		error
    erb :index
  end


end
