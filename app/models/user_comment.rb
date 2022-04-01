# == Schema Information
#
# Table name: user_comments
#
#  id         :bigint           not null, primary key
#  comment    :text             not null
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserComment < ApplicationRecord
    validates :comment, presence: true
    validates :user_id, presence: true

    belongs_to :user
end
