require 'searchable'


class Bill < ActiveRecord::Base.extend Searchable
	has_many :bill_lists, :dependent=>:destroy
	
	searchable_by :customer_name
	
	def total
		total_amt = 0
		unless bill_lists.empty?
		# do only when bill lists are not empty
			bill_lists.each do |bill_list|
			 total_amt += bill_list.total
			end
		end
		total_amt
	end
end
