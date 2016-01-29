class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)

  validates(:name, :presence => true)
  validates :name, uniqueness: { case_sensitive: false }

  before_save(:capitalize)


  def brand_string_to_brands(brand_string)
    brand_names = brand_string.split(', ')
    brand_names.each do |brand_name|
      brand_match = Brand.find_by(name: brand_name)
      if brand_match.nil?
        self.brands.create(name: brand_name)
      else
        self.brands << brand_match
      end
    end
  end


  private

  def capitalize
    self.name = name.split(" ").each { |w| w.capitalize! }.join(" ")
  end
end
