class AddNationalityToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nationality, :integer, null: false, default: 1
    add_foreign_key :users, :countries, column: :nationality
  end
end
