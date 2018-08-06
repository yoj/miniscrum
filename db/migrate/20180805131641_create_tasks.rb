class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.string :title
      t.text :body
      t.integer :assign
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status
      t.integer :priority
      t.timestamps
    end
  end
end
