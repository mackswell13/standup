class CreateInvitations < ActiveRecord::Migration[8.0]
  def change
    create_table :invitations do |t|
      t.string :email_address, null: false
      t.string :token, null: false
      t.references :company, null: false, foreign_key: true
      t.boolean :used, null: false
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
