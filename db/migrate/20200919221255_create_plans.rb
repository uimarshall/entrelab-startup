class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
