# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin, only: [:index, :destroy]
  skip_before_action :authorize, only: [:new, :create, :edit, :confirm]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @info = "Регистрироваться в сообществе могут только сотрудники компании. 
    После регистрации на почтовый приходит специальное подтверждение."
  end

  # GET /users/confirm
  def confirm    
    if params[:id]
      @user = User.find(params[:id])
      if @user 
        if @user.confirm_hash = params[:hash]
          @user.status = 0
          @user.update(:status => 0)
          @message_text = "Учетная запись успешно подтверждена!"
        else
          @message_text = "Неверный код подтверждения"
        end
      else
        @message_text = "Неверные параметры запроса"
      end
    else
      @message_text = "Неверные параметры запроса"      
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    @user.status = -1
    @user.confirm_hash = @user.generate_confirm_hash

    respond_to do |format|
      #if User.find_by(name: @user.name)
      #  Пользователь с таким 
      #else        
        if @user.save        
          UserNotifier.confirmation(@user).deliver
          format.html { redirect_to login_url, notice: %{Ваша учетная запись успешно создана! 
            Для завершения регистрации перейдите по ссылке, указанной в письме. 
            Если не получили письмо, проверьте не попало ли оно в спам.}}
          format.json { render action: 'show', status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      #end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :office, :phone, :mail, :avatar)
    end
end
