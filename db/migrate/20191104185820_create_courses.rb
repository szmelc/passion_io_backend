class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.references :category, null: false, foreign_key: true
      t.string :state

      t.timestamps
    end
  end
end
