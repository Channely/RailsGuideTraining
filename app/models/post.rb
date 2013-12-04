class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 1}
  validates :text, presence: true, length: {minimum: 1}
  validates :commit, presence: true, length: {minimum: 1}
end
