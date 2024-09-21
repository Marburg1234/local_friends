class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :chat_room, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
