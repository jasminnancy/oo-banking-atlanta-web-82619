require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
   
      def initialize(sender, receiver, amount)
        @sender = sender
        @receiver = receiver
        @status = "pending"
        @amount = amount
      end

      def valid?
        @sender.valid? and @receiver.valid?
      end

      def execute_transaction
        if valid? and self.status == "pending" and self.sender.balance > self.amount
          self.sender.balance -= self.amount
          self.receiver.balance += self.amount
          self.status = "complete"
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
        end
      end

      def reverse_transfer
        if self.status == "complete"
          self.sender.balance += self.amount
          self.receiver.balance -= self.amount
          self.status = "reversed"
        end
      end
  end