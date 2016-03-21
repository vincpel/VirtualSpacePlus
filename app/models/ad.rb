class Ad < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    belongs_to :electronic
    
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

    self.inheritance_column = nil   # to overide STI 



end
