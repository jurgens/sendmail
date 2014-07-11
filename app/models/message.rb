class Message < ActiveRecord::Base
  validates :to, :subject, :body, presence: true
  validates :to, email: true

  scope :latest_first, -> { order(created_at: :desc) }

  mount_uploader :attachment, AttachmentUploader

  def has_attachment?
    attachment.file.present?
  end
end
