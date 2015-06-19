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

  it("allows you to add shoes that to this store") do
    test_shoe = Shoe.create({:brand => 'Docs', :id => nil})
    test_store = Store.create({:name => 'Underground', :id => nil})
    visit("/")
    click_link("Underground")
    visit("/stores/" + test_store.id().to_s())
    check(test_shoe.name)
    click_button("Add shoes")
    expect(page).to have_content("Docs")
  end
end
