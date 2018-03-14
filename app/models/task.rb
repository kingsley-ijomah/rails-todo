class Task < ApplicationRecord
  enum status: [:todo, :done, :archived]

  validates :name, presence: true
end
