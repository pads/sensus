require 'rails_helper'

RSpec.describe Feeling, :type => :model do
  it 'should not validate without a mood and a description' do
    feeling = Feeling.create()

    expect(feeling.valid?).to be false
  end

  it 'should not validate without a description' do
    feeling = Feeling.create(mood: :good)

    expect(feeling.valid?).to be false
  end
end
