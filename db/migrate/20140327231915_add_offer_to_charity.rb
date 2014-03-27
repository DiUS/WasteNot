class AddOfferToCharity < ActiveRecord::Migration
  def change
    add_column :offers, :charity_id, :integer
  end
end
