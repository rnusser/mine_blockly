# == Schema Information
#
# Table name: workspace_emotions
#
#  id           :integer          not null, primary key
#  emotion      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  workspace_id :integer          not null
#
# Indexes
#
#  index_workspace_emotions_on_user_id       (user_id)
#  index_workspace_emotions_on_workspace_id  (workspace_id)
#

class WorkspaceEmotion < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  enum emotion: {
    favorite: 1,
    like:     2
  }

  validates :workspace_id, presence: true
  validates :emotion, presence: true
  validates :user_id, presence: true
  validates :workspace_id, :uniqueness => { :scope => [:emotion, :user_id] }

  before_create :set_user_id

  scope :_mine, ->{ where(user_id: User.current.try(:id)) }

  private
    def set_user_id
      self.user_id = User.current.try(:id)
    end
end
