class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :customer_name
      t.string :status, :default=>'b' # b=>billing, x=>cancelled, o=> OK done
      t.decimal :discount, :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
