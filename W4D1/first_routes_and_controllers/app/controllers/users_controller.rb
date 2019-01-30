class UsersController < ApplicationController
    def index
        users = User.all
        if users
            render json: users
        else
            render plain: "bitch, ain't no users!"
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user
            user.update(user_params)
            render json: user
        else
            render plain: "bitch this dont exist"
        end
    end

    def destroy
        user = User.find(params[:id])
        if user
            user.destroy
            render json: user
        else
            render plain: "bitch it already gone"
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email)
    end
end