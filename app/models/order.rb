# frozen_string_literal: true
class Order < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :product
end
