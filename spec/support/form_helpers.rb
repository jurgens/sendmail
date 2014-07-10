def fill_and_submit_mail_form(params)
  fill_in 'To', with: params[:to]
  fill_in 'Subject', with: params[:subject]
  fill_in 'Body', with: params[:body]
  click_on 'Send'
end
