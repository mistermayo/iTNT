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
    page.attach_file('spot[photo]', '/Users/Guest/Desktop/iTNT/spec/features/home-cat.jpg')
    click_on 'Create Spot'
    expect(page).to have_content 'successfully'
  end

  it "returns an error if no Location is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => ''
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    page.attach_file('spot[photo]', '/Users/Guest/Desktop/iTNT/spec/features/home-cat.jpg')
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end

  it "returns an error if no header is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'ssss'
    fill_in 'Header', :with => ''
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    page.attach_file('spot[photo]', '/Users/Guest/Desktop/iTNT/spec/features/home-cat.jpg')
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end

  it "returns an error if no Availability is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'sssss'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => ''
    page.attach_file('spot[photo]', '/Users/Guest/Desktop/iTNT/spec/features/home-cat.jpg')
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end

  it "returns an error if no Description is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'sssss'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => ''
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end

  it "returns an error if no Price is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'sssss'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => ''
    fill_in 'Details', :with => 'apartment'
    fill_in 'Availability', :with => 'never'
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end

  it "returns an error if no Details is entered" do
    visit "/"
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    click_on "List your Spot"
    fill_in 'Location', :with => 'sssss'
    fill_in 'Header', :with => 'Cool House'
    fill_in 'Description', :with => 'mega cool'
    fill_in 'Price', :with => '50'
    fill_in 'Details', :with => ''
    fill_in 'Availability', :with => 'no'
    click_on 'Create Spot'
    # save_and_open_page
    expect(page).to have_content 'error'
  end
end
