class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :url
      t.integer :total
      t.string :schooltype
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
