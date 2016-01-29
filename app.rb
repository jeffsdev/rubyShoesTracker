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

get('/brands/new') do
  erb(:brand_form)
end

get('/stores/:id') do
  @store = Store.find(params[:id])
  @brands = @store.brands
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params[:id])
  @stores = @brand.stores
  erb(:brand)
end

post('/stores') do
  store_name = params.fetch('store_name')
  store = Store.create({name: store_name})

  redirect("/")
end

post('/brands') do
  brand_name = params.fetch('brand_name')
  brand = Brand.create({name: brand_name})

  redirect("/")
end
