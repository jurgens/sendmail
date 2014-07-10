require 'rails_helper'

RSpec.describe 'Home', :type => :feature do
  specify 'should have a page logo and title' do
    visit '/'
    within 'header' do
      expect(page).to have_content 'SendMail'
    end

    expect(page).to have_content 'Mailbox'
  end
end
