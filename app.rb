require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @shoes = Shoe.all()
  @stores = Store.all()
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

get("/shoes") do
  @shoes = Shoe.all()
  erb(:shoes)
end

post("/stores") do
  name = params.fetch("name")
  store = Store.new({:name => name, :id => nil})
  store.save()
  @stores = Store.all()
  erb(:stores)
end

post("/shoes") do
  brand = params.fetch("brand")
  shoe = Shoe.new({:brand => brand, :id => nil})
  shoe.save()
  @shoes = Shoe.all()
  erb(:shoes)
end
