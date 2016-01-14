require './config/environment'

class ApplicationController < Sinatra::Base

	set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "carcollection"


  helpers do
  	def logged_in?
  		!!session[:id]
  	end

  	def current_user
  		User.find(session[:id])
  	end
  end

  get '/' do 
    erb :index
  end

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
    if logged_in?   
      redirect to '/cars'
    else
       erb :'users/user_login'
    end
  end

  get '/cars' do 
    @cars = Car.all
    if logged_in?
      @user = User.find_by(session[:id])
      erb :'cars/cars'
    else
      redirect '/login'
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

  get '/cars/new' do 
    if logged_in?
      erb :'cars/new'
    else
      redirect to '/login'
    end
  end

  post '/cars/new' do 
    if params["content"] != ""
      @car = Car.create(:name => params["name"], :brand => params["brand"], :make_year => params["make_year"])
      @car.user_id = User.find(session[:id])
      @car.save
      redirect to '/cars'
    else
      redirect '/cars/new'
    end
  end

  get '/cars/:id' do
    @car = Car.find(params[:id])
    if logged_in?
      erb :'cars/show'
    else
      redirect to '/login'
    end
  end

  get '/cars/:id/edit' do
    if logged_in?
      @car = Car.find(params[:id])
      erb :'cars/edit'
    else 
      redirect to '/login'
    end
  end

  post '/cars/:id' do
    @car = Car.find_by(params[:id])
    if logged_in?
      if params["brand"] != "" && params["name"] != "" && params["make_year"] != ""
        @car.brand = params[:brand]
        @car.name = params[:name]
        @car.make_year = params[:make_year]
        @car.save
        redirect to '/cars'
      else 
        redirect to "/cars/#{@car.id}/edit"
      end
    else
      redirect to '/login'
    end
  end

  post '/cars/:id/delete' do
    @car = Car.find_by(params[:id])
    if logged_in?
      @car.delete
      redirect to '/cars'
    else
      redirect to '/login'
    end
  end
end