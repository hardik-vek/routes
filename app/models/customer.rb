# frozen_string_literal: true
class Customer < ApplicationRecord
  validates :fname, :lname, :email, :phone_number, presence: true
  validates :fname, :lname, length: { minimum: 2, maximum: 50 }
  validates :email, uniqueness: true, length: { minimum: 5, maximum: 100 }
  validates :phone_number, length: { is: 10 }

  def self.search(search)
    if search
      customer = Customer.where(fname: search)
    else
      Customer.all
    end
  end
end
