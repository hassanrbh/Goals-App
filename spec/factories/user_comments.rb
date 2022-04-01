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
FactoryBot.define do
  factory :user_comment do
    
  end
end
