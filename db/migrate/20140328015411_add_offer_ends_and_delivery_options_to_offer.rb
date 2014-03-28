class AddOfferEndsAndDeliveryOptionsToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :offer_ends, :timestamp
    add_column :offers, :delivery_options, :string
  end
end
