class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :title, null: false
      t.text :explain, null: false

      t.timestamps
    end
  end
end
