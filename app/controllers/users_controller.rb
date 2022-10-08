class UsersController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    #POST /users
    def create
        user = User.create(user_params)  #Creates the user with the username and password that were sent from the frontend and where the password has been encrypted by Bcrypt and confirmed
        if user.valid? #This goes here to handle the error that is raised of the passwords passed by the user do not match.The active record exception will handle validation for attributes.
            session[:user_id] = user.id #Then creates the user a session meaning that the user is created and logged in at the same time
            render json:user, status: :created
        else
            render json: {error:user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    #GET /users/:id
    def show
        user = User.find(session[:user_id])
        render json: user
    end

    private
    def user_params
        params.permit(:username,:password,:password_confirmation)  #This password is being hashed at some point by bcrypt and the confirmation being done
    end

    #Handle invalid record
    def render_invalid(invalid)
        render json:{errors:invalid.records.errors.full_messages},status: :unprocessable_entity
    end
    
    #Handle record not found
    def render_not_found(user)
        render json: {errors:"User not found"},status: :unauthorized
    end

end
