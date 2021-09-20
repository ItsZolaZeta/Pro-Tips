class TipsController < ApplicationController

  include RolesHelper

  before_action :ensure_authenticated,        only: [:new, :create, :edit, :update, :destroy]
  before_action :set_tip,                     only: [:show, :edit, :update, :destroy]
  before_action :ensure_auth_to_edit_delete,  only: [:edit, :update, :destroy]

  def index
    # @tips = Tip.where('title LIKE ?', "%#{params[:q]}%").or(
    #   Tip.where('body LIKE ?', "%#{params[:q]}%"))
    
    @search_term = params[:q]
    logger.info("Search completed using #{@search_term}.")
    @tips = Tip.search(@search_term).page(params[:page]) 
  end

  def show
  end

  def new
    @tip = Tip.new
  end

  def edit
  end

  def create
    @tip = Tip.new(tip_params)
    @tip.user = current_user

    respond_to do |format|
      if @tip.save
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tip.update(tip_params)
        # In this format call, the flash message is being passed directly to
        # redirect_to().  It's a caonvenient way of setting a flash notice or
        # alert without referencing the flash Hash explicitly.
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tip.destroy
    respond_to do |format|
      # In this format call, the flash message is being passed directly to
      # redirect_to().  It's a caonvenient way of setting a flash notice or
      # alert without referencing the flash Hash explicitly.
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
    end
  end

  private

    def set_tip
      @tip = Tip.find(params[:id])
    end

    def ensure_auth_to_edit_delete
      redirect_to(tips_path) unless(can_edit?(@tip))  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:title, :body, :user_id)
    end
end
