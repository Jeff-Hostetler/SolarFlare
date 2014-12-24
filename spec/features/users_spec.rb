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
  scenario "user cannot see the users index" do
    user = create_user
    log_user_in(user)

    visit users_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  scenario "admin sees Users link in nav bar in private index" do
    admin = create_admin
    user = create_user
    log_user_in(admin)

    visit user_path(admin)

    click_on "Users"

    expect(page).to have_content("Admin Interface")
  end
  scenario "admin sees pivotal projects on user index" do
    admin = create_admin
    user = create_user
    log_user_in(admin)

    visit user_path(admin)

    click_on "Users"

    expect(page).to have_content("Pivotal Tracker for SolarFlare")
  end
  scenario "user does not see users index link in nav bar" do
    user = create_user
    log_user_in(user)

    visit users_path(user)

    expect(page).to have_no_content("Users")
  end
  scenario "user can see the tutorial" do
    user = create_user
    log_user_in(user)

    visit user_path(user)
    first(:link, "Tutorial").click

    expect(page).to have_content("Before you use this site")
  end
  scenario "user can see the edit thier info page" do
    user = create_user
    log_user_in(user)

    visit user_path(user)
    click_on "Edit your info"

    expect(page).to have_content("We use your address in our software to monitor")
  end
end
