class Message < ActiveRecord::Base
  validates :to, :subject, :body, presence: true
  validates :to, email: true

  scope :latest_first, -> { order(created_at: :desc) }

end
