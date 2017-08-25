class Bill < ActiveRecord::Base
  has_many :comments
end
