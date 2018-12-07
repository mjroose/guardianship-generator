class Attorney < ApplicationRecord
  has_many :clients, class_name: 'Person'
  validates :name, presence: true
  validates :bar_number, presence: true
end
