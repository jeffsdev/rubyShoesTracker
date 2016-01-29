require('pry')
require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/') do
  @brands = Brand.all().order(:name)
  @stores = Store.all().order(:name)
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
  brand_name = params.fetch('brand_names')
  new_store = Store.create({name: store_name})
  brand_string = params[:brand_names]


  # Validation
  unless new_store.save
    @task = new_store
    @page = '/stores/new'
    return erb(:errors)
  end



end

post('/brands') do
  brand_name = params.fetch('brand_name')
  brand = Brand.create({name: brand_name})

  redirect("/")
end

# Update

get('/stores/:id/edit') do
  @store = Store.find(params[:id])
  @brands = @store.brands
  erb(:store_update_form)
end

patch('/stores/:id') do
  store_name = params.fetch('store_name')
  @brands = Brand.all()
  @store = Store.find(params.fetch("id").to_i)
  @store.update({name: store_name})
  erb(:store)
end

# Delete

delete('/stores/:id') do
  id = params[:id]
  store = Store.find(id)

  store.brands.delete
  store.destroy

  redirect('/')
end
