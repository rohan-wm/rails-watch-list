class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, message: "must be longer than 6 characters" }
  validates :movie, :list, presence: true
  validates_uniqueness_of :movie_id, scope: :list_id
end
