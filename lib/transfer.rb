class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    return true if sender.valid? && receiver.valid?    
  end

  def execute_transaction

    if self.valid? && sender.balance > amount
      if @status == "pending"        
        sender.withdrawl(amount)
        receiver.deposit(amount)
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end  
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(amount) 
      @receiver.withdrawl(amount)
      @status = "reversed"
    end
  end
end
