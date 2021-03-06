# -*- encoding : utf-8 -*-
class AdvertsController < ApplicationController
  before_action :set_advert, only: [:show, :edit, :update, :destroy]  
  before_action :authorize_admin, only: [:index]

  # GET /adverts
  # GET /adverts.json
  def index
    @adverts = Advert.all
  end

  # GET /adverts/1
  # GET /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @action_name = 'Создать объявление'
    @advert = Advert.new
  end

  # GET /adverts/1/edit
  def edit
    @action_name = 'Обновить'
  end

  # POST /adverts
  # POST /adverts.json
  def create
    @advert = Advert.new(advert_params)
    @advert.user_id = session[:user_id]
    @advert.status = 1

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: 'Объявление успешно обновлено.' }
        format.json { render action: 'show', status: :created, location: @advert }
      else
        format.html { render action: 'new' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1
  # PATCH/PUT /adverts/1.json
  def update
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: 'Объявление успешно обновлено.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1
  # DELETE /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advert_params
      params.require(:advert).permit(:title, :description, :image_url, :price, :user_id, :status, :photo)
    end
end
