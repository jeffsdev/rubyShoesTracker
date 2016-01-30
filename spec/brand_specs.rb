require('spec_helper')

describe(Brand) do
  it("validates presence of name") do
    test_brand = Brand.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it('validates the uniqueness of the brand name') do
    test_brand = create_test_brand
    duplicate_brand = Brand.new({name: "test brand"})
    expect(duplicate_brand.save).to(eq(true))
  end

  it("capitalizes the brand names") do
    test_brand = Brand.create({:name => "test shoe brand"})
    expect(test_brand.name()).to(eq("Test Shoe Brand"))
  end
end
