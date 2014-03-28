class AddRetailerToOffer < ActiveRecord::Migration
  def change
    remove_column :offers, :retailer
    add_column :offers, :retailer_id, :integer
  end
end
