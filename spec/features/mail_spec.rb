require 'rails_helper'

RSpec.describe 'Mail', type: :feature do
  specify 'compose new mail' do
    visit '/'
    click_on 'Compose'

    within '.page-header' do
      expect(page).to have_content 'Compose'
    end

    fill_and_submit_mail_form to: 'jurgen@kodolabs.com', subject: 'New mail', body: 'Hello, how are you doing?'
    expect(page).to have_content 'success'
  end
end
