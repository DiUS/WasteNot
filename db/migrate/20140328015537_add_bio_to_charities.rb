class AddBioToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :bio, :string
  end
end