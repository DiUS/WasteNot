class AddCharityToEndorsements < ActiveRecord::Migration
  def change
    add_column :endorsements, :charity_id, :integer
    add_column :endorsements, :retailer_id, :integer
  end
end
