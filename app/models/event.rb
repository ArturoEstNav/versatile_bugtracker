class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true
  belongs_to :user

  def self.identify_changes(attributes = {})
    changes = []
    changes << "user" unless attributes[:ticket].user_id == attributes[:params][:user_id]
    # changes << "user" unless attributes[:params][:user_id].nil?
    # changes << "user" unless attributes[:params][:user_id] == ""
    changes << "status" unless attributes[:ticket].status == attributes[:params][:status]
    changes << "priority" unless attributes[:ticket].priority == attributes[:params][:priority]
    changes << "category" unless attributes[:ticket].category == attributes[:params][:category]
    changes
  end

  def self.store_changes_record(array)
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
