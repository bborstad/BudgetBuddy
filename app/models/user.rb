# == Schema Information
#
# Table name: users
#
#  id                         :bigint           not null, primary key
#  admin                      :boolean          default(FALSE)
#  announcements_last_read_at :datetime
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  first_name                 :string
#  last_name                  :string
#  remember_created_at        :datetime
#  reset_password_sent_at     :datetime
#  reset_password_token       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services
  has_many(
    :goals,
    class_name: 'Goal',
    foreign_key: 'user_id',
    inverse_of: :user
  )

  has_many(
    :retirements,
    class_name: 'Retirement',
    foreign_key: 'user_id',
    inverse_of: :user
  )

  has_many(
    :follows,
    class_name: 'Follow',
    foreign_key: 'user_id',
    inverse_of: :user
  )

  has_many(
    :accounts,
    class_name: 'Account',
    foreign_key: 'user_id',
    inverse_of: :user
  )


end

