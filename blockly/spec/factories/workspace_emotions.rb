# == Schema Information
#
# Table name: workspace_emotions
#
#  id           :integer          not null, primary key
#  emotion      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  workspace_id :integer
#
# Indexes
#
#  index_workspace_emotions_on_user_id       (user_id)
#  index_workspace_emotions_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  user_id       (user_id => users.id)
#  workspace_id  (workspace_id => workspaces.id)
#

FactoryBot.define do
  factory :workspace_emotion do
    emotion { WorkspaceEmotion.emotions.values.sample }

    association :workspace
    association :user
  end
end
