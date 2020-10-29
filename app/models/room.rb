# == Schema Information
#
# Table name: rooms
#
#  id          :bigint           not null, primary key
#  name        :string
#  user1       :integer
#  user2       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  receiver_id :integer
#
# Indexes
#
#  index_rooms_on_author_id                  (author_id)
#  index_rooms_on_author_id_and_receiver_id  (author_id,receiver_id) UNIQUE
#  index_rooms_on_receiver_id                (receiver_id)
#
class Room < ApplicationRecord

    has_many :messages
    has_many :users, through: :messages
    validates :user2, presence: true

end
