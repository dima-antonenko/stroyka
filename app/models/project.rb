class Project < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader

	has_many :project_attachments, inverse_of: :project, dependent: :destroy
	
	

	accepts_nested_attributes_for :project_attachments, allow_destroy: true
end