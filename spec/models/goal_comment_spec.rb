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
require 'rails_helper'

RSpec.describe GoalComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
