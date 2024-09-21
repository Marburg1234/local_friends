class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :chat_room, null: false, foreign_key: true, type: :bigint
      t.text :message

      t.timestamps
    end
  end
end
