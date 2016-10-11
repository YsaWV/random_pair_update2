require 'sinatra'
require_relative 'random_pair.rb'
require_relative 'formatter.rb'

get '/' do
    erb :get_class_size
    #erb :get_names
end

post '/class_size' do
 	students_n = params[:students]
 	redirect '/names?students=' + students_n
end

get '/names' do
	class_size = params[:students]
	
	erb :get_names, :locals => {:class_size => class_size}
end



post '/names' do
    names = params[:user_names]
    random_names_array = randomizer(names)
    name_pairs = fix(random_names_array)
    erb :get_names_again, :locals => {:name_pairs => name_pairs}
end