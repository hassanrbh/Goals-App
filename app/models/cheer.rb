# == Schema Information
#
# Table name: cheers
#
#  id           :bigint           not null, primary key
#  giver_id     :integer          not null
#  intention_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Cheer < ApplicationRecord
    CHEER_LIMIT = 12
    CHEER_LIMIT.freeze

    belongs_to :giver, :class_name => 'User'
    belongs_to :intention
end
