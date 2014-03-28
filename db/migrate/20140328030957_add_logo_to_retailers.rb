class AddLogoToRetailers < ActiveRecord::Migration
  def change
    add_column :retailers, :logo, :string
  end
end
