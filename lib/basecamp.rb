ActiveResource::Base.user = 'ec8f3cd86dfdebc604d5f08d10c852f3d06a8878'
ActiveResource::Base.password = 'X'
ActiveResource::Base.site = 'http://unigate.basecamphq.com'

module Basecamp
  PROJECT_ID = 2880241

  class Base < ActiveResource::Base
  end
end
