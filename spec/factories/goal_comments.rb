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
FactoryBot.define do
  factory :goal_comment do
    
  end
end
