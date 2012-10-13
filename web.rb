require 'sinatra'
require './confusion'
require './jugement'
require 'uuid'

get '/' do
  erb :index
end

post '/confusion' do
  confusion = Confusion.new()
  for i in 0..10
    date_des_faits = params["date_des_faits_#{i}"]
    date_du_jugement = params["date_du_jugement_#{i}"]
    if !date_des_faits.empty?
      puts "#{date_des_faits} & #{date_du_jugement}"
      jugement = Jugement.new(Fait.new(date_des_faits, "Braquage"), date_du_jugement)
      confusion + jugement
    end
  end
  uuid = UUID.new
  @filename = uuid.generate
  confusion.dessiner("public/#{@filename}.png")
  erb :index
end