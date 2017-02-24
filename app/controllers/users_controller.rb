class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    render json: User.includes(:posts).all
    # @users = User.all
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save!
      # session[:user_id] = user.id
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update!(user_params)
      render json: @user, status: 200
    else
      render json: @user.errors, status: 500
    end
  end

  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      new_hash={}
      if params[:data]&&params[:data][:attributes]
        user_data=params[:data][:attributes]
      else
        user_data=params[:user]
      end

      user_data.each do |key,value|
        new_hash[key.gsub("-","_")]=value
      end

      new_params=ActionController::Parameters.new(new_hash)
      new_params.permit(:username, :first_name, :last_name, :email, :password_digest)
    end
end
