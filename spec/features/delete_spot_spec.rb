require 'rails_helper'

describe "delete a spot" do
  it "delete a spot" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    spot = FactoryGirl.create(:spot)
    visit spot_path(spot)
    click_on 'Delete'
    expect(page).to have_no_content 'Rad Pad'
  end

end
