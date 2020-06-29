class Product < ApplicationRecord

  has_many :line_items
  before_destroy :check_if_has_line_item

  private

  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'This product has a LineItem')
      return false
    end
  end
end
