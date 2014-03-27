class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.string :description
      t.string :retailer
      t.string :location

      t.timestamps
    end
  end
end
