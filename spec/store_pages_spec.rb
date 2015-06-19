require("capybara/rspec")
require("./app")
require("launchy")
require("pry")
Capybara.app = Sinatra::Application



describe("path back to index", {:type => :feature}) do
  it("shows the list of stores and allows you to add stores.") do

    visit("/")
    click_link("Add a new store")
    fill_in("name", :with => "underground")
    click_button("Add store")
    expect(page).to have_content("Underground")
  end
end
