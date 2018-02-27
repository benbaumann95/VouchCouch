class BookingPolicy < ApplicationPolicy
  def create?
    return true
  end
end
