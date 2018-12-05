class Attorney < ApplicationRecord
  has_many :clients, class_name: 'Person'
end
