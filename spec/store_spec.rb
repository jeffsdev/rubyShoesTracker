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

  describe('#tags') do
    it('returns a list of brands assigned to the store') do
      test_store = create_test_store
      test_brand = test_store.brands.create({
        name: "tests"
        })
      expect(test_store.brands).to(eq([test_brand]))
    end
  end

  describe('#brand_string_to_brands') do
    it('takes a list of brands and adds each of them to a store') do
      test_store = create_test_store
      brand1 = Brand.create({name: "brand 1"})
      brand2 = Brand.create({name: "brand 2"})
      brand3 = Brand.create({name: "brand 3"})
      test_string = "#{brand1.name}, #{brand2.name}, #{brand3.name}"
      test_store.brand_string_to_brands(test_string)
      expect(test_store.brands).to(eq([brand1, brand2, brand3]))
    end
  end
end
