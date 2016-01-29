require('spec_helper')

describe(Brand) do
  it("validates presence of name") do
    test_brand = Brand.new({:name => ""})
    expect(test_brand.save()).to(eq(false))
  end

  it("capitalizes the brand names") do
    test_brand = Brand.create({:name => "test shoe brand"})
    expect(test_brand.name()).to(eq("Test Shoe Brand"))
  end
end
