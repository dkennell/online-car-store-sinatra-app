class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to '/cars'
    else
      erb :'users/user_signup'
    end
  end

  post '/signup' do
    if params.values.include?("")
      redirect to '/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect '/cars'
    end
  end

  get '/login' do
		error
    if logged_in?
      redirect to '/cars'
    else
       erb :'users/user_login'
    end
  end

  post '/login' do
    if params[:username] == nil || params[:password == nil]
      redirect "/login"
    else
      @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        redirect "/cars"
      else
        redirect "/login"
      end
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
    end
    redirect '/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user.logged_in?
      erb :'cars/show'
    else
      redirect to '/login'
    end
  end

end
