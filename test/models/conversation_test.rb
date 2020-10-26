# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  receiver_id :integer
#
# Indexes
#
#  index_conversations_on_author_id                  (author_id)
#  index_conversations_on_author_id_and_receiver_id  (author_id,receiver_id) UNIQUE
#  index_conversations_on_receiver_id                (receiver_id)
#
require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
