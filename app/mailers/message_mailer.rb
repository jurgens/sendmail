class MessageMailer < ActionMailer::Base

  default from: 'noreply@example.org'

  def send_message(message)
    @to       = message.to
    @subject  = message.subject
    @body     = message.body

    if message.has_attachment?
      attachments[message.attachment.identifier] = message.attachment
    end

    mail(subject: @subject, to: @to)
  end
end
