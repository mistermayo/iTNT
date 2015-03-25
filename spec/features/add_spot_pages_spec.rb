require 'rails_helper'
include Warden::Test::Helpers

describe "the add a spot process" do
  it "adds a new spot" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'San Francisco'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'successfully'
  end
end
