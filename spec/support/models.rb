class Currency < ActiveRecord::Base
  acts_as_finder :short_name
end

class Language < ActiveRecord::Base
  acts_as_finder :short_name, :name
end

class Country < ActiveRecord::Base
  acts_as_finder :short_name
  acts_as_finder :name
end