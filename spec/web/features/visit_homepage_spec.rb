require 'features_helper'

describe 'Visiting the homepage' do
  it 'has the correct title' do
    visit '/'

    page.title.must_include 'Sensus'
  end
end
