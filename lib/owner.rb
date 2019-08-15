require 'pry'
class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:dogs => [], :cats => []}
  end
  
  def say_species
    "I am a #{self.species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  
  def buy_cat(name)
    @pets[:cats] << Cat.new(name, self)
  end
  
  def buy_dog(name)
    @pets[:dogs] << Dog.new(name, self)
  end
  
  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    @pets[:cats].each {|cat| self.mood = "happy"}
  end
  
  def sell_pets
  end
  
  def lists_pets
    @pets
  end
  
end