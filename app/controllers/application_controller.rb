require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  #index
  get "/artists" do
    @artists = Artist.all
    erb :index
  end

  #new
  get "/artists/new" do
    erb :new
  end

  #create
  post "/artists" do
    @artist = Artist.create(params[:artist])
    binding.pry
    redirect to "/artists/#{@artist.id}"
  end

  #show
  get "/artists/:id" do
    find_artist
    erb :show
  end

  #edit
  get '/artists/:id/edit' do
    find_artist
    erb :edit
  end

  #update
  put "/artists/:id" do
    find_artist
    @artist.update(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end

  #destroy
  delete "/artists/:id" do
    find_artist
    @artist.destroy
    redirect to "/artists"
  end

  def find_artist
    @artist = Artist.find(params[:id])
  end

end
