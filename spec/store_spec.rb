require('spec_helper')

describe(Store) do
  it("validates presence of name") do
    test_store = Store.new({:name => ""})
    expect(test_store.save()).to(eq(false))
  end

  it("capitalizes the store names") do
    test_store = Store.create({:name => "test shoe store"})
    expect(test_store.name()).to(eq("Test Shoe Store"))
  end

  it('validates the uniqueness of the name of the tag') do
    test_store = create_test_store
    duplicate_store = Store.new({name: "test store"})
    expect(duplicate_store.save).to(eq(false))
  end
end
