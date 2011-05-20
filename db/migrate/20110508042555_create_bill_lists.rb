class CreateBillLists < ActiveRecord::Migration
  def self.up
    create_table :bill_lists do |t|
      t.string :product_name
      t.decimal :qty, :default=>1
      t.decimal :total
      t.integer :bill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bill_lists
  end
end
