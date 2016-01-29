require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

get('/stores/new') do
  erb(:store_form)
end

get('/stores/:id') do
  @store = Store.find(params[:id])
  @brands = @store.brands
  erb(:store)
end

post('/') do
  store_name = params.fetch('store_name')
  store = Store.create({name: store_name})
  redirect("/")
end
