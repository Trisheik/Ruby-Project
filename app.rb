require "sinatra"
require_relative "authentication.rb"



#the following urls are included in authentication.rb
# GET /login
# GET /logout
# GET /sign_up

# authenticate! will make sure that the user is signed in, if they are not they will be redirected to the login page
# if the user is signed in, current_user will refer to the signed in user object.
# if they are not signed in, current_user will be nil
count = 1
check = 0
total = 0

get "/" do
	erb :index
end


get "/goal_track" do
	authenticate!
	erb :goaltrack

end

post "/check" do
	check = check + 1
	total = total + 1
	erb :goaltrack
end

post "/cross" do
	total = total + 1
	erb :goaltrack
end

post "/percentage" do
	percent = check/total
	erb :index
end
