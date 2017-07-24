class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :project, foreign_key: true
      t.string :bill_time
      t.float :bill_rate
      t.text :description
      t.boolean :billed, default: false
      t.float :total
      t.datetime :date

      t.timestamps
    end
  end
end
