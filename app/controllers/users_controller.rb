class UsersController < ApplicationController
  before_action :set_user,              only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin,          only: [:index, :edit, :destroy]
  before_action :ensure_admin_or_owner, only: [:update]

  def index
    @users = User.all.page(params[:page]) 
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if(@user == current_user)
        if @user.update(edit_account_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        else
          format.html { redirect_to @user, notice: 'We had a small problem...' }
        end
      end
      if(is_admin?)
        if @user.update(edit_user_params)
          # In this format call, the flash message is being passed directly to
          # redirect_to().  It's a caonvenient way of setting a flash notice or
          # alert without referencing the flash Hash explicitly.
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  def destroy
    @user.destroy
    # respond_to do |format|
    #   format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    # end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def edit_user_params
      params.require(:user).permit(:email, :name, :avatar, :role)
    end

    def edit_account_params
      params.require(:user).permit(:email, :name, :avatar)
    end

    def ensure_admin
      if(current_user.role == 'admin')
        return
      end
      redirect_to root_path
    end

    def ensure_admin_or_owner 
      if(current_user.role == 'admin' || current_user == @user)
        return
      end
      redirect_to root_path
    end
end
