class Ad < ActiveRecord::Base
    belongs_to :user
    belongs_to :book
    belongs_to :electronic
    
    
    self.inheritance_column = nil   # to overide STI 
    

end
