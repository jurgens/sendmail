require 'rails_helper'

describe 'Messages' do
  let(:mail_params) { { to: 'jurgen@kodolabs.com', subject: 'New mail', body: 'Hello, how are you doing?'} }

  specify 'after sending a message it should appear in mailbox' do
    visit new_message_path
    fill_and_submit_mail_form mail_params
    expect(page).to have_content mail_params[:to]
    expect(page).to have_content mail_params[:subject]
  end

  specify 'should display paperclip if message has an attachment' do
    message = create :message, :with_attachment
    visit root_path
    expect(first('tr td')).to have_css('.glyphicon-paperclip')
  end
end
