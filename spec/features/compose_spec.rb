require 'rails_helper'
require 'capybara/email/rspec'

RSpec.describe 'Composing', type: :feature do

  let(:mail_params) { { to: 'jurgen@kodolabs.com', subject: 'New mail', body: 'Hello, how are you doing?'} }

  context 'interface' do
    before do
      visit '/'
      within '.navbar' do
        click_link 'Compose'
      end
    end

    specify 'submit message with empty params' do
      fill_and_submit_mail_form to: '', subject: '', body: ''
      expect(page).to_not have_content 'successfully'
    end

    specify 'submit message with invalid email' do
      fill_and_submit_mail_form to: 'jurgen', subject: 'subject', body: 'body'
      expect(page).to_not have_content 'successfully'
    end

    specify 'compose new mail with valid params' do
      within '.page-header' do
        expect(page).to have_content 'Compose'
      end

      fill_and_submit_mail_form mail_params
      expect(page).to have_content 'successfully'
    end

    specify 'compose email with attachment' do
      fill_and_submit_mail_form to: 'jurgen@kodolabs.com',
                                subject: 'New mail',
                                body: 'Hello, how are you doing?',
                                attachment: 'spec/fixtures/file.zip'
      expect(page).to have_content 'successfully'
      expect(first('tr td.attachment')).to have_css('.glyphicon-paperclip')
    end
  end

  context 'send' do
    before do
      clear_emails
      visit new_message_path
      fill_and_submit_mail_form mail_params
      open_email 'jurgen@kodolabs.com'
    end

    specify 'should send an email' do
      expect(current_email).to have_content(mail_params[:body])
    end
  end

  context 'safe as draft' do
    before do
      clear_emails
      visit new_message_path
      fill_and_submit_mail_form mail_params.merge!(draft: true)
      open_email 'jurgen@kodolabs.com'
    end

    specify 'should not send an email' do
      expect(current_email).to be nil
    end
  end
end
