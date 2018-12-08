class Attorney < ApplicationRecord
  has_many :basic_party_infos
  has_many :clients, through: :basic_party_infos, class_name: 'Party'
  validates :name, presence: true
  validates :bar_number, presence: true
end
