class Group < ApplicationRecord
  has_many :landings, autosave: true

  def to_s
    name
  end
end
