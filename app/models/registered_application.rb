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
  has_many :events, dependent: :destroy

  default_scope {order('created_at DESC')}
  scope :visible_to, -> (user){user.admin? ? all : where(user: user) }

  validates :name, length: {minimum: 2}, presence: true
  validates :description, length: {minimum: 10}, presence: true
  validates :user, presence: true
  validates_uniqueness_of :url

end 
