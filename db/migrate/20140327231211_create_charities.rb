class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :webpage
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone

      t.timestamps
    end
  end
end
