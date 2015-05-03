# == Schema Information
#
# Table name: registered_applications
#
#  id          :integer          not null, primary key
#  name        :string
#  url         :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
end
