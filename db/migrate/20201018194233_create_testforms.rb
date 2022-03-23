class CreateTestforms < ActiveRecord::Migration[6.0]
  def change
    create_table :testforms do |t|
      t.string :date
      t.string :RESULT
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
