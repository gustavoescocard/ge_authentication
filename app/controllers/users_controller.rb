class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      login(@user)
      redirect_to root_path, notice: "Usuário cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
