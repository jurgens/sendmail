require 'rails_helper'

RSpec.describe 'Mail', type: :feature do

  before do
    visit '/'
    within '.navbar' do
      click_link 'Compose'
    end
  end

  specify 'submit message with empty params' do
    fill_and_submit_mail_form to: '', subject: '', body: ''
    expect(page).to_not have_content 'Success'
  end

  specify 'submit message with invalid email' do
    fill_and_submit_mail_form to: 'jurgen', subject: 'subject', body: 'body'
    expect(page).to_not have_content 'Success'
  end

  specify 'compose new mail with valid params' do
    within '.page-header' do
      expect(page).to have_content 'Compose'
    end

    fill_and_submit_mail_form to: 'jurgen@kodolabs.com', subject: 'New mail', body: 'Hello, how are you doing?'
    expect(page).to have_content 'Success'
  end

  specify 'compose email with attachment' do
    fill_and_submit_mail_form to: 'jurgen@kodolabs.com',
                              subject: 'New mail',
                              body: 'Hello, how are you doing?',
                              attachment: 'spec/fixtures/file.zip'
    expect(page).to have_content 'Success'
    expect(first('tr td')).to have_css('.glyphicon-paperclip')
  end
end
