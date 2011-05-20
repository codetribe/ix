class Product < ActiveRecord::Base
	validates :name, :code, :selling_price, :presence=>true
	validates :code, :name, :uniqueness=>true
	validates :selling_price, :numericality=>true
	validate :selling_price_must_be_positive
	
	private
	def selling_price_must_be_positive
		errors.add(:selling_price, " must be positive") if selling_price < 0
	end
end
