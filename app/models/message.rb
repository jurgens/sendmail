class Message < ActiveRecord::Base
  validates :to, :subject, :body, presence: true
end
