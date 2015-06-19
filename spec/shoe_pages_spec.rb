require("capybara/rspec")
require("./app")
require("launchy")
require("pry")
Capybara.app = Sinatra::Application



describe("path back to index", {:type => :feature}) do
  it("shows the list of shoes and allows you to add shoes.") do
    
    visit("/")
    click_link("Add a new shoe brand")
    fill_in("brand", :with => "docs")
    click_button("Add shoe")
    expect(page).to have_content("Docs")
  end
end
