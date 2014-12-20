require "rails_helper"

feature "Users" do

  scenario "User signs up with valid info" do

    visit root_path
    click_on "Login"
    expect(page).to have_content("Not a registered yet?")
    click_on "Sign Up"
    expect(page).to have_content("New User Sign Up")
    click_on "SolarFlare"
    click_on "Optimize your system"
    click_on "Sign Up"
    expect(page).to have_content("New User Sign Up")
    fill_in "First name", with: "Test"
    fill_in "Last name", with: "Userguy"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "testers"
    fill_in "Password confirmation", with: "testers"
    check "Join mailing list"
    click_on "Sign Up"
    expect(page).to have_content("Thank you. Your account has been created")

  end

  scenario "User tries to sign up with invalid info" do

    visit root_path
    click_on "Optimize your system"
    click_on "Sign Up"
    expect(page).to have_content("6 errors prohibited this user from being saved:")

    fill_in "First name", with: "Test"
    click_on "Sign Up"
    expect(page).to have_content("5 errors prohibited this user from being saved:")

    fill_in "Last name", with: "Test"
    click_on "Sign Up"
    expect(page).to have_content("4 errors prohibited this user from being saved:")

    fill_in "Email", with: "test@test.com"
    click_on "Sign Up"
    expect(page).to have_content("3 errors prohibited this user from being saved:")

    fill_in "Password", with: "Testers"
    fill_in "Password confirmation", with: "testers"
    click_on "Sign Up"
    expect(page).to have_content("1 error prohibited this user from being saved:")

  end
  scenario "admin can see index and all users in list" do
    admin = create_admin
    user = create_user
    log_user_in(admin)

    visit users_path

    expect(page).to have_content("Admin Interface")
    expect(page).to have_content(user.full_name)
  end
end
