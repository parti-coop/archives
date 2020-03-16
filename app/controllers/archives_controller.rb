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

  def destroy
    @archive.destroy
    redirect_to archives_path
  end

  private

  def set_archive
    @archive = Archive.find(params[:id])
  end

  def archive_params
    params.require(:archive).permit(:title, :body, :cover_image, :sns_image)
  end
end