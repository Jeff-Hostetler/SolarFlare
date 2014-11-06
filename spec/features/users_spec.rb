require "rails_helper"

feature "Users" do

  scenario "User signs up with valid info" do

    visit root_path
    click_on "Login"
    expect(page).to have_content("Not a registered yet?")
    click_on "Click here"
    expect(page).to have_content("New User Signup")
    click_on "SolarFlare"
    click_on "Optimize Your System"
    click_on "Create User Profile"
    expect(page).to have_content("New User Signup")
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Userguy"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "test"
    fill_in "Password confirmation", with: "test"
    check "Join mailing list"
    click_on "Sign Up"
    expect(page).to have_content("Hello, Test Userguy")

  end

  scenario "User tries to sign up with invalid info" do

    visit root_path
    click_on "Optimize Your System"
    click_on "Create User Profile"
    click_on "Sign Up"
    expect(page).to have_content("5 errors prohibited this user from being saved:")

    fill_in "First name", with: "Test"
    click_on "Sign Up"
    expect(page).to have_content("4 errors prohibited this user from being saved:")

    fill_in "Last name", with: "Test"
    click_on "Sign Up"
    expect(page).to have_content("3 errors prohibited this user from being saved:")

    fill_in "Email", with: "test@test.com"
    click_on "Sign Up"
    expect(page).to have_content("2 errors prohibited this user from being saved:")

    fill_in "Password", with: "Test"
    fill_in "Password confirmation", with: "test"
    click_on "Sign Up"
    expect(page).to have_content("1 error prohibited this user from being saved:")

  end

end
