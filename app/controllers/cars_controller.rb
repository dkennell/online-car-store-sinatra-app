class CarsController < ApplicationController



  get '/cars' do
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
    if params["content"] != ""
      @car = Car.create(:name => params["name"], :brand => params["brand"], :make_year => params["make_year"], :price => params["price"])
      @car.user = User.find(session[:id])
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
		error
    if logged_in?
      @car = Car.find(params[:id])
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

  post '/cars/:id/delete' do
		error
    @car = Car.find_by(params[:id])
    if logged_in?
      @car.delete
      redirect to '/cars'
    else
      redirect to '/login'
    end
  end
end
