require_relative 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  get '/gossips/:id' do
    "Voici le numéro du potin que tu veux : #{params['id']} !"
  end

  get '/gossips/:id' do
    @gossip = Gossip.find(params['id'])
    erb :show
  end

  post '/gossips/new/' do
    erb :new_gossip
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
end
