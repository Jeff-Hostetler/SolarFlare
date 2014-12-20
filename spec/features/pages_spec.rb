require "rails_helper"

feature "Page" do

  scenario "navigate main info pages" do
    visit root_path
    click_on "SolarFlare"
    expect(page).to have_content("Optimize your system")
    click_on "About Us"
    expect(page).to have_content("SolarFlare is a project developed by Jeff Hostetler.")
    click_on "Products"
    expect(page).to have_content("Using sensor data")
  end

end
