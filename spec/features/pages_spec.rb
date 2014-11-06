require "rails_helper"

feature "Page" do

  scenario "navigate main info pages" do

    visit root_path
    click_on "Solar Flare"
    expect(page).to have_content"Optimize Your System"
    

  end

end
