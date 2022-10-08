class SessionsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    #POST /login
    def create
    user = User.find_by(username:params[:username]) #Find the user by the username passed
    if user&.authenticate(params[:password]) #This means you check if the value of user is true and also you check whether the value of user.authenticate(params[:password]) is true
        session[:user_id] = user.id #Set the session equal to the value of the id of the user found
        render json: user, status: :created #Pass the logged in user to the frontend fro use
    else
        render json:{error:"Invalid username or password!"},status: :unauthorized #Eplicitly state that the password or 
    end
    end

    #authenticate is a function within rails that compares entered password and the one stored for the user in the db.It takes a paramater of the password entered by the user ans returns a boolean
    #The &. operator is called a

    #DELETE /logout
    def destroy
        session.delete :user_id
        head :no_content
    end
    
    def render_not_found
        render json: {errors:user.errors.full_messages}, status: :not_found
    end

end
