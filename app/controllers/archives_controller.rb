class ArchivesController < ApplicationController
  before_action :set_archive, only: [:show, :edit, :update, :destroy]
  def index
    @archives = Archive.page(params[:page])
  end

  def show
  end

  def new
    @archive = Archive.new
  end

  def create
    @archive = Archive.new(archive_params)
    @archive.user = current_user

    if @archive.save
      redirect_to @archive
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @archive.update(archive_params)
      redirect_to @archive
    else
      render "edit"
    end
  end

  def update_categories
    if @archive.update(archive_params)
      redirect_to @archive
    else
      errors_to_flash(@archive)
      render 'edit_categories'
    end
  end

  def destroy
    @archive.destroy
    redirect_to archives_path
  end

  private

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    params.require(:archive).permit(
      :title, :body, :cover_image, :sns_image,
      categories_attributes: [ :id, :slug, :name, :desc, :_destroy, children_attributes: [ :archive_id, :id, :slug, :name, :desc, :_destroy ] ] )
    )
  end
end