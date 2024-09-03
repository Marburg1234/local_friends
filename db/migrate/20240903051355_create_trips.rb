class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :post_code
      t.string :address
      t.string :title
      t.text :explain

      t.timestamps
    end
  end
end
