class AddCoverImageToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :cover_image, :string
  end
end
