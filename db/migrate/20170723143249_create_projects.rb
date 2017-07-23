class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.belongs_to :client, foreign_key: true
      t.string :name
      t.float :bill_rate

      t.timestamps
    end
  end
end
