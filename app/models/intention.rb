# == Schema Information
#
# Table name: intentions
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint           not null
#  status     :string           default("public"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :string           default("Ongoing")
#
class Intention < ApplicationRecord
    validates :name, presence: true
    validates :user_id, presence: true
    validates :status, presence: true
    validates :completed, presence: true

    belongs_to :user
    has_many :comment, class_name: 'GoalComment'
end
