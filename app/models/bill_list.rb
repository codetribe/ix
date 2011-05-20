require 'searchable'

class BillList < ActiveRecord::Base.extend Searchable
	belongs_to :bill
	
	searchable_by :product_name
end
