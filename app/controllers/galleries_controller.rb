class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # after_action :create_gallery_log, only: [:create]

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @galleries = Gallery.order(:created_at).all
  end

  # GET /galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.user_id = current_user.id

    respond_to do |format|
      if @gallery.save
       puts @gallery.user.job_logs
       puts @gallery.title
      # @gallery.user.job_logs.create(user_id: current_user.id, action: "Create", gallery_name: @gallery.title)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        # @gallery.user.job_logs.create(user_id: current_user.id, action: "Update", gallery_name: @gallery.title)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      # @gallery.user.job_logs.create(user_id: current_user.id, action: "Delete", gallery_name: @gallery.title)
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def create_emoji
    emoji.create
    redirect_to :back
  end
  
  def state_update
    @emoji = emoji.find(params[:id])
    @emoji.update(state: params[:state])
  end
  
  def destroy_img
    @image.destroy
    redirect_to galleries_url, flash: {success: 'image was successfully destroyed.'}
  end
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:title, :description)
    end
    
end
