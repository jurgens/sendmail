def fill_and_submit_mail_form(params)
  fill_in 'To', with: params[:to]
  fill_in 'Subject', with: params[:subject]
  fill_in 'Body', with: params[:body]
  if params[:attachment].present?
    attach_file 'Attachment', File.expand_path(params[:attachment])
  end
  click_on 'Send'
end
