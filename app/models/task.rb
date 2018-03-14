class Task < ApplicationRecord
  enum status: [:todo, :done, :archived]
end
