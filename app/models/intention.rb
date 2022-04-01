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
#
class Intention < ApplicationRecord
    validates :name, presence: true
    validates :user_id, presence: true
    validates :status, presence: true

    belongs_to :user
end
