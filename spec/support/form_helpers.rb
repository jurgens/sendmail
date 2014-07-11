def fill_and_submit_mail_form(params)
  fill_in 'To', with: params[:to]
  fill_in 'Subject', with: params[:subject]
  fill_in 'Body', with: params[:body]

  attach_file 'Attachment', File.expand_path(params[:attachment]) if params[:attachment].present?

  check 'Save as draft' if params[:draft]

  click_on 'Send'
end
