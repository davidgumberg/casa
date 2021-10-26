class Health < ApplicationRecord
  # The "singleton_guard" column is a unique column which must always be set to '0'
  # This ensures that only one Health row is created
  validates_inclusion_of :singleton_guard, :in => [0]

  def instance
    first_or_create!(singleton_guard: 0)
  end
end

# == Schema Information
#
# Table name: healths
#
#  id                 :bigint           not null, primary key
#  latest_deploy_time :datetime
#  singleton_guard    :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_healths_on_singleton_guard  (singleton_guard) UNIQUE
#
