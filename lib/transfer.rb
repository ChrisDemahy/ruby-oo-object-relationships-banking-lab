# Describes an Transfer
class Transfer
  ### CLASS DEFINITIONS ###




  ### INSTANCE DEFINITIONS ###

  # instance readers and writers
  attr_accessor :sender, :receiver, :amount, :status

  # default constructor
  def initialize(sender=nil, receiver=nil, amount=nil)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = "pending"
  end

  # Returns whether the transaction is valid
  def valid?
    self.receiver.valid? && self.sender.valid?
  end

  # transfers the amount between accounts if it is a valid transfer
  def execute_transaction
    if self.status != "complete" && self.valid? == true && self.sender.balance >= amount
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount) 
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  # transfers the money from the receiver back to the senders account
  def reverse_transfer
    if self.status == "complete" && self.valid? == true && self.receiver.balance >= amount
      self.receiver.withdraw(self.amount)
      self.sender.deposit(self.amount) 
      self.status = "reversed"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end