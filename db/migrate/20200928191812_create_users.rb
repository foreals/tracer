class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :cellphone
      t.string :last_name
      t.string :first_name
      t.string :email

      t.timestamps
    end
    add_index :users, :cellphone, unique: true
  end
end
