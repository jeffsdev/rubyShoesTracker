class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)

  validates(:name, :presence => true)

  before_save(:capitalize)

  private

  def capitalize
    self.name = name.split(" ").each { |w| w.capitalize! }.join(" ")
  end
end
