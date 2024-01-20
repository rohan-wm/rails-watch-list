class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  has_many :lists, through: :bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, :overview, presence: true
end
