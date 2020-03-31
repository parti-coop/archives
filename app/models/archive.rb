class Archive < ApplicationRecord
  belongs_to :user
  has_many :documents, class_name: 'ArchiveDocument', dependent: :destroy
  has_many :all_categories, class_name: 'ArchiveCategory', dependent: :destroy
  has_many :categories, -> { where parent: nil }, class_name: 'ArchiveCategory'
  has_many :subcategories, -> { where.not parent: nil }, class_name: 'ArchiveCategory'
  has_many :bulk_tasks, dependent: :destroy

  accepts_nested_attributes_for :categories, allow_destroy: true

  # mount_uploader :cover_image, ImageUploader
  # mount_uploader :social_image, ImageUploader

  has_one_attached :cover_image
  has_one_attached :sns_image

  validates :title, presence: true
  validates :body, presence: true
  validates :cover_image, presence: true

  default_scope { order('updated_at DESC') }

  # def contributors
  #   (documents.collect{|d| d.user} + [user]).uniq
  # end

  def category_by_slug(slug)
    all_categories.find_by(slug: slug)
  end
end
