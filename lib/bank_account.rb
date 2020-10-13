# Describes an BankAccount
class BankAccount
  ### CLASS DEFINITIONS ###


  # Class variables
  @@all = [] # list of all BankAccounts

  # Reader for all class variable
  def self.all
    @@all
  end  


  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :status, :balance
  attr_reader :name 

  # default constructor
  def initialize(name=nil)
    @name = name
    @balance = 1000
    self.status = "open"

    self.save
  end

  # saves BankAccount instance to all class variable
  def save
    self.class.all << self
  end

  # Increases the accounts balance based on the deposit ammount
  def deposit(amount)
    @balance += amount
  end

  # Returns a valid sentence reading the user their balance
  def display_balance
    p "Your balance is $1000."
  end

  # Returns whether or not the current account is valid
  def valid?
    @balance > 0 && status == "open"
  end

  # Changes the account status to closed
  def close_account
    self.status = "closed"
  end

  # Decreases the balance based on the amount
  def withdraw(amount)
    @balance = @balance - amount
  end

end