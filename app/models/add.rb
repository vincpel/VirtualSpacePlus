class Add < ActiveRecord::Base
  belongs_to :user
end


class Electronic < Add; end
#class Tutoring < Add; end
#class Book < Add; end
