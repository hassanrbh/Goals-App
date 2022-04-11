# == Schema Information
#
# Table name: goal_comments
#
#  id           :bigint           not null, primary key
#  comment      :text             not null
#  intention_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class GoalComment < ApplicationRecord
    validates :comment, presence: true
    validates :intention_id, presence: true

    belongs_to :intention

    has_many :likes, as: :likeable, dependent: :destroy
end
