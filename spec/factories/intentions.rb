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
FactoryBot.define do
  factory :intention do
    
  end
end
