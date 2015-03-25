require 'rails_helper'
include Warden::Test::Helpers

describe "the edit a spot process" do
  it "edits a new spot" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    spot = FactoryGirl.create(:spot)
    visit spot_path(spot)
    click_on 'Edit'
    fill_in 'Location', :with => 'San Francisco'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    click_on 'Update Spot'
    # save_and_open_page
    expect(page).to have_content 'Cool House'
  end
end
