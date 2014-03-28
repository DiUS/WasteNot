class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.integer :stars
      t.string :comment

      t.timestamps
    end
  end
end
