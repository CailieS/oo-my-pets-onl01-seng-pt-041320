class Owner 
  attr_reader :name, :species
  attr_accessor 
  @@all = []
  
  def initialize (name)
    @name = name
    @species = "human"
    @@all << self
   end
  
  def self.all
    @@all
  end
  
  def say_species
    "I am a #{self.species}."
   end
  
  def self.reset_all
    all.clear
  end
  
  def self.count
    self.all.length
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
   self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each do |cat|
    Cat.owner = nil
    Cat.mood = "nervous"
    end
    self.dog.each do |dog|
    Dog.owner = nil
    Dog.mood = "nervous"
  end
 end

  def list_pets
    number_of_dogs = self.dog.count
    number_of_cats = self.cat.count
    puts"I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end
end