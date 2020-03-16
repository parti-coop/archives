class ArchiveDocumentsController < ApplicationController
  def show
    @archive = @archive_document.archive
    @documents = params[:tag].present? ? @archive.documents.tagged_with(params[:tag]) : @archive.documents
    @documents = @documents.page(params[:page])
    render_show
  end

  def new
    @archive ||= Archive.find(params[:archive_id])
    @archive_document.archive = @archive
    @current_organization = @archive.organization
    render_new
  end

  def create
    @archive_document.user = current_user
    if @archive_document.save
      redirect_to archive_path(@archive_document.archive)
    else
      errors_to_flash(@archive_document)
      @archive = @archive_document.archive
      render_new
    end
  end

  def edit
    @archive = @archive_document.archive
    render_edit
  end

  def update
    if @archive_document.update(archive_document_params)
      redirect_to @archive_document
    else
      render 'edit'
    end
  end

  def destroy
    @archive_document.destroy
    redirect_to archive_path(@archive_document.archive)
  end

  private

  def archive_document_params
    params.require(:archive_document).permit(
      :archive_id,
      :title, :body, :tag_list,
      :content_creator, :content_created_date, :content_created_time,
      :content_source, :content_recipients,
      :content, :media_type, :content_cache, :remove_content,
      :category_slug, :donor, :is_secret_donor,
      additional_attributes: [:id, :sub_region, :address, :zipcode, :homepage, :tel, :fax, :leader, :leader_tel, :email, :business_area, :open_year, :members_count, :workers_count, :finance]
    )
  end
end
