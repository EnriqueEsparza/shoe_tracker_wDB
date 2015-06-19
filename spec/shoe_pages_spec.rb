require("capybara/rspec")
require("./app")
require("launchy")
require("pry")
Capybara.app = Sinatra::Application



describe("path to add/list shoes", {:type => :feature}) do
  it("shows the list of shoes and allows you to add shoes.") do
    visit("/")
    click_link("Add a new shoe brand")
    fill_in("brand", :with => "docs")
    click_button("Add shoe")
    expect(page).to have_content("Docs")
  end

  it("allows you to add stores that carry this shoe brand") do
    test_shoe = Shoe.create({:brand => 'Docs', :id => nil})
    test_store = Store.create({:name => 'Underground', :id => nil})
    visit("/")
    click_link("Docs")
    visit("/shoes/" + test_shoe.id().to_s())
    check(test_store.name)
    click_button("Add stores")
    expect(page).to have_content("Underground")
  end
end
