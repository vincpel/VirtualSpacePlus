class Ad < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    belongs_to :electronic
    
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.

    self.inheritance_column = nil   # to overide STI

    def self.types
      [:all_categories] + reflect_on_all_associations(:belongs_to).map() {|x| x.name} - [:user] 
    end

    def self.all_sub
      (reflect_on_all_associations(:belongs_to)).map {|x| x.active_record.all}
    end


end
