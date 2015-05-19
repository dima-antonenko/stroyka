class ProjectAttacment < ActiveRecord::Base
   
   belongs_to :project
   mount_uploader :image, GalleryUploader
end
