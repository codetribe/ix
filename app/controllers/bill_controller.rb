class BillController < ApplicationController
	def new
		#creates a new bill
		bill = Bill.new
		bill.save
		session[:bill_id] = bill.id
		@bill_id = bill.id
	end
  
	def print
		#prints the bill out
		@bill = Bill.find params[:id]
		respond_to do |format|
			format.js
		end
	end
	
	def cancel
		#sets the starts of the bill to cancelled
		Bill.find(params[:id]).destroy
		redirect_to :action=>'new'
	end
	
	def add_entry
		#adding an entry to the bill
		product_name, quantity = params[:product_entry].split('-')
		product_name = product_name.strip
		quantity = quantity.strip.to_f
		
		product = Product.find_by_name product_name
		bill = Bill.find session[:bill_id]
		@bill_list = BillList.new
		@bill_list.product_name = product.name
		@bill_list.qty = quantity
		@bill_list.total = quantity * product.selling_price
		@bill_list.bill = bill
		@bill_list.save
		
		@total = bill.total
		
		respond_to do |format|
			format.js
		end
		
		#update bill list with the details
	end
	
	def delete_entry
		#delets an entry in the bill list
		@id = params[:id]
		BillList.find(params[:id]).destroy
		@total = Bill.find(session[:bill_id]).total
		respond_to do |format|
			format.js
		end		
	end
	
	def autocomplete_product_entry
		@products = Product.where("name like ?", "#{params[:product_entry]}%")
		render :layout=>false
    end
    
    def list

		case params[:search_by]
			when 'date'
				 day = params[:date][:"select(1i)"]
				 month = params[:date][:"select(2i)"]
				 year = params[:date][:"select(3i)"]
				 start_time = Time.new(day, month, year, 0, 0, 0)
				 end_time = Time.new(day, month, year, 23, 59, 59)
				 @bills = Bill.where("created_at >= ? AND created_at <= ?", start_time, end_time)
			when 'search'
				bill_lists = BillList.search(params[:s])
				@bills = Bill.search(params[:s])
				bills_from_bill_lists = []
				bill_lists.each do |bill_list| 
					bills_from_bill_lists << bill_list.bill
				end
				@bills |= bills_from_bill_lists
		end
    end
    
    def view
		@bill = Bill.find params[:id]
		@bill_lists = @bill.bill_lists
    end
end
