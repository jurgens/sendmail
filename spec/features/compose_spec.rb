require 'rails_helper'

RSpec.describe 'Mail', type: :feature do

  before do
    visit '/'
    click_on 'Compose'
  end

  specify 'submit message with empty params' do
    fill_and_submit_mail_form to: '', subject: '', body: ''
    expect(page).to_not have_content 'Success'
  end

  specify 'compose new mail with valid params' do
    within '.page-header' do
      expect(page).to have_content 'Compose'
    end

    fill_and_submit_mail_form to: 'jurgen@kodolabs.com', subject: 'New mail', body: 'Hello, how are you doing?'
    expect(page).to have_content 'Success'
  end
end
