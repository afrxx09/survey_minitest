module ResearchMinitest
  
  class Person
    
    attr_accessor :name
    attr_accessor :age
    attr_accessor :cash
    attr_accessor :tired
    attr_accessor :items
    attr_accessor :salary

    def initialize(name, age)
      @name = name
      @age = age
      @cash = 0
      @tired = false
      @salary = 100
      @items = []
    end

    def speak
      return "Hello!"
    end

    def work(hours)
      return "too tired" if @tired
      @cash += salary * hours
      @tired = true
      return "job's done!"
    end

    def rest
      @tired = false
    end

    def buy_something(item, cost)
      return false if cost > @cash
      @items.push(item)
      @cash -= cost
      return true
    end

  end

end