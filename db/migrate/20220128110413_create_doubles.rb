class CreateDoubles < ActiveRecord::Migration[6.1]
  def change
    create_table :doubles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :city
      t.string :country
      t.integer :price_per_day
      t.boolean :available

      t.timestamps
    end
  end
end
