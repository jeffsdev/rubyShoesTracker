require('spec_helper')

describe(Store) do
  it("validates presence of description") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end
end