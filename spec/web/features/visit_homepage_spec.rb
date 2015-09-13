require 'features_helper'

describe 'Visiting the homepage' do
  it 'has the correct title' do
    visit '/'

    page.title.must_include 'Sensus'
  end

  it 'has the copyright notice' do
    visit '/'

    page.body.must_include 'Copyright &copy; 2015 Ben Paddock'
  end
end
