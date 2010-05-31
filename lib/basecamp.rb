ActiveResource::Base.user = 'YOUR KEY HERE'
ActiveResource::Base.password = 'X'
ActiveResource::Base.site = 'http://site-name.basecamphq.com'

module Basecamp
  PROJECT_ID = 123456   # Your project id

  class Base < ActiveResource::Base
  end
end
