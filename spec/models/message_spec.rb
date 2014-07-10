require 'rails_helper'

RSpec.describe Message, :type => :model do
  it { should validate_presence_of :to }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :body }
end
