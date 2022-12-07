# Product class settings
class Grocery
    attr_accessor :name, :price
    def initialize(name, price)
      @name = name
      @price = price
    end
  end
  
  # User class settings
  class User
    attr_accessor :name, :address
  
    def initialize(arg1, arg2=nil, arg3=nil)
      @name = arg1
      @address = arg2
    end
  end
  
  # Seller class settings
  class Seller < User
    attr_accessor :name, :shop, :address
  
    def initialize(name, shop)
      super
      @shop = shop
      @orders = []
    end
  
    def orders(order)
      @orders << order
    end
  
    def orderling_list
      # Affichez une liste de commandes pour chaque acheteur en fonction des détails de l'achat de l'acheteur.
      @sum = 0
      puts "=====Listes de commandes par client(#{name}, #{shop})　====="
      @orders.each do |order|
        puts "Nom du client: #{order[0]}, montant d'argent: #{order[1]}, la date et l'heure：#{order[2].strftime("%Y-%m-%d")}}"
        @sum += order[1]
      end
      puts "--------------montant total：#{@sum}"
      puts "===================================="
    end
  end
  
  # Buyer class settings
  class Customer < User
    attr_accessor :name, :address
  
    def initialize(name, address)
      super
      @basket = []
    end
  
    def shopping(groceries)
      # Start shopping.
      grocery_list(groceries)
      shopping_end = nil
      while shopping_end != "yes" do
        # Product selection
        puts "Item number selection"
        number = gets.to_i
        # Enter a number
        puts "Product quantity input"
        quantity = gets.to_i
        entry(groceries[number], quantity)
        puts "Do you want to finish shopping? yes / no"
        shopping_end = gets.chomp
      end
      shopping_list(@basket)
      # @Sum is calculated in shopping_list
      @order = [name, @sum, Time.now]
    end
  
    # The following is a private method
    private
    def grocery_list(groceries)
      puts "------ Grocery List ------"
      groceries.each_with_index do |grocery, i|
        puts "#{i}: #{grocery.name}, #{grocery.price}"
      end
    end
  
    def entry(grocery, quantity)
      @basket << [grocery, quantity]
    end
  
    def shopping_list(basket)
      @sum = 0
      puts "=====liste d'achats(#{name}/#{address})====="
      basket.each do |grocery, quantity|
        money = grocery.price * quantity
        puts "nom commercial (marque): #{grocery.name}, volume: #{quantity}, montant d'argent:#{money}"
        @sum += money
      end
      puts "----------montant total:#{@sum}-------------"
      puts "===================================="
    end
  end
  
  # Créer une liste de produits (objet)
  groceries = []
  groceries = Grocery.new("banana", 300),
              Grocery.new("bread", 150),
              Grocery.new("milk", 230),
              Grocery.new("egg", 280),
              Grocery.new("meat", 800),
              Grocery.new("fish", 500)
  
  # Instantiate the seller (Ichiro Takahashi, A shop)
  ichiro = Seller.new("Ichiro Takahashi", "A Shop")
  
  # Instantiate Taro Yamada
  taro = Customer.new("Yamada Taro", "Tokyo")
  
  # Taro Yamada's shopping & shopping list creation
  order = taro.shopping(groceries)
  ichiro.orders(order)
  ichiro.orderling_list