require "acts_as_finder/active_record/acts/finder"

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Finder)
