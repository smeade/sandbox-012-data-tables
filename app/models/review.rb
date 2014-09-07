class Review < ActiveRecord::Base
  belongs_to :product
end

# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  product_id :integer
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
