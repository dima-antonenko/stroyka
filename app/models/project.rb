class Project < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
end