require 'rails_helper'

feature "Sensors" do
  scenario "allows admin to see all the data" do
    user = create_user
    sensor = create_sensor(user)
    admin = create_admin

    log_user_in(admin)
    visit user_current_reading_path(user)

    expect(page).to have_no_content("You have not entered your sensor port")
    expect(page).to have_content("Current Readings")
  end
  scenario "allows user to see sensor data on current" do
    user = create_user
    sensor = create_sensor(user)

    log_user_in(user)
    visit user_current_reading_path(user)

    expect(page).to have_no_content("You have not entered your sensor port")
    expect(page).to have_content("Current Readings")
  end
  scenario "does not allow user to see another users data" do
    user = create_user
    user2 = create_user2
    sensor = create_sensor(user2)

    log_user_in(user)
    visit user_current_reading_path(user2)

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
