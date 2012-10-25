class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :size
      t.text :toppings
      t.references :order

      t.timestamps
    end

    #add_index :pizzas, :order_id
  end
end
