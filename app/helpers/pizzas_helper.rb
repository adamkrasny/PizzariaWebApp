module PizzasHelper
  def pizza_sizes
    # displays "Small" but saves "s"
    [ ["Small", "s"], ["Medium", "m"], ["Large", "l"], ["X-Large", "x"] ]
  end
  def pizza_size_display size
    size_array = pizza_sizes.find { |s| s[1] == size }
    size_array ? size_array[0] : "undefined"
  end
  def pizza_ingredients
    [ "Pepperoni", "Sausage", "Onion", "Bacon"]
  end
  def pizza_ingredients_to_array ingredients
    ingredients.split ' '
  end
  def pizza_ingredients_to_string ingredients
    ingredients.join ' '
  end
end
