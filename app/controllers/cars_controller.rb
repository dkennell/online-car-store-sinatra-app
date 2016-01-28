class CarsController < ApplicationController



  get '/cars' do
    error
    @cars = Car.all
    if logged_in?
      @user = User.find_by(session[:id])
      erb :'cars/cars'
    else
      redirect '/login'
    end
  end


  get '/cars/new' do
		error
    if logged_in?
      erb :'cars/new'
    else
			logged_out?
    end
  end

  post '/cars/new' do
    # Car.new is to user.cars.build
    # as Car.create is to user.cars.create
    if params["content"] != ""
      @car = current_user.cars.create(:name => params["name"], :brand => params["brand"], :make_year => params["make_year"], :price => params["price"])
      redirect to '/cars'
    else
      redirect '/cars/new'
    end
  end

  get '/cars/:id' do
    @car = Car.find(params[:id])
    error
    if logged_in?
      erb :'cars/show'
    else
      redirect to '/login'
    end
  end

  get '/cars/:id/edit' do
    if logged_in?
      begin
        @car = current_user.cars.find(params[:id])
      rescue
		    redirect '/cars?error=THAT IS NOT YOUR CAR'
      end
      erb :'cars/edit'
    else
      redirect to '/login'
    end
  end

  post '/cars/:id' do
    @car = Car.find(params[:id])
    if logged_in?
      if params["brand"] != "" && params["name"] != "" && params["make_year"] != "" && params["price"] != ""
        @car.update(:name => params["name"], :brand => params["brand"], :make_year => params["make_year"], :price => params["price"])
        @car.save
        redirect to '/cars'
      else
        redirect to "/cars/#{@car.id}/edit?error=Please Fill In All Forms"
      end
    else
      redirect to '/login'
    end
  end

  get '/cars/:id/delete' do
    @car = Car.find(params[:id])
    error
    if logged_in? && @car.user_id == current_user.id
      erb :'cars/delete'
    elsif logged_in?
      redirect "/cars/#{@car.id}?error=THAT IS NOT YOUR CAR"
    else
      redirect to '/login'
    end
  end

  post '/cars/:id/delete' do
    @car = Car.find(params[:id])
    @car.delete
    redirect to '/cars'
  end
end
