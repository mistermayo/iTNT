require 'rails_helper'
include Warden::Test::Helpers

describe "the add a user process" do
  it "adds a new user" do
    visit "/"
    user = FactoryGirl.create(:user)
    save_and_open_page
    expect(page).to have_content 'successfully'
  end
end
