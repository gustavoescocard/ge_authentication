class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to root_path, notice: "Logado com sucesso!"
    else
      redirect_to login_path, alert: "Email ou Senha incorretos"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Deslogado com sucesso!"
  end
end
