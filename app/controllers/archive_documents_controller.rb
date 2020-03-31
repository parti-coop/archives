class ArchiveDocumentsController < ApplicationController
  load_and_authorize_resource

  def show
    @archive = @archive_document.archive
    @documents = params[:tag].present? ? @archive.documents.tagged_with(params[:tag]) : @archive.documents
    @documents = @documents.page(params[:page])
  end

  def new
    @archive ||= Archive.find(params[:archive_id])
    @archive_document.archive = @archive
  end

  def create
    @archive_document.user = current_user
    if @archive_document.save
      redirect_to archive_path(@archive_document.archive)
    else
      errors_to_flash_now(@archive_document)
      @archive = @archive_document.archive
      render :new
    end
  end

  def edit
    @archive = @archive_document.archive
  end

  def update
    if @archive_document.update(archive_document_params)
      redirect_to @archive_document
    else
      errors_to_flash_now(@archive_document)
      render :edit
    end
  end

  def destroy
    @archive_document.destroy
    redirect_to archive_path(@archive_document.archive)
  end

  def download
    send_data @archive_document.content.download, filename: @archive_document.content.filename, content_type: @archive_document.content.content_type, disposition: 'attachment', stream: 'true', buffer_size: '4096'
  end

  private

  def archive_document_params
    params.require(:archive_document).permit(
      :archive_id,
      :title, :body, :tag_list,
      :content_creator, :content_created_date, :content_created_time,
      :content_source, :content_recipients,
      :content, :media_type, :remove_content,
      :category_slug, :donor, :is_secret_donor
    )
  end
end
