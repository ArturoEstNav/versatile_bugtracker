class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
  belongs_to :user

  def self.stringify_changes(array)
    if array.size == 0
      "no changes"
    elsif array.size == 1
      array[0].to_s
    elsif array.size == 2
      array.join(' and ')
    else
      second_half = array.pop
      first_half = array.join(', ')
      "#{first_half} and #{second_half}"
    end
  end
end
