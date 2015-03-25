require 'rails_helper'

describe Spot do
  it { should validate_presence_of :location }
  it { should validate_presence_of :header }
  it { should validate_presence_of :details }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_presence_of :availability }
  it { should belong_to :user }
end
