class Group < ApplicationRecord
  has_many :landings, autosave: true
end
