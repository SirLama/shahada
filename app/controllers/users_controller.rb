class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "Congrats!! Your have successfully signed up!!!"
    else
      render 'new'
      flash[:nasty]="OOPSSS !!Check your inputs and try again"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit( :reg_no, :f_name, :l_name, :email,
                                 :phone, :school, :password, :password_confirmation )
  end
end
