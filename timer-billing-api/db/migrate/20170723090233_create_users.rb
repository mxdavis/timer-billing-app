class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :company-name
      t.integer :bill-rate
      t.integer :auth-id

      t.timestamps
    end
  end
end
