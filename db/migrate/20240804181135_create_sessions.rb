class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.string :token
      t.string :email

      t.timestamps
    end
  end
end
