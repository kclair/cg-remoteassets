class RemoteAsset < ActiveResource::Base
  self.site = 'http://localhost:3002'
  self.format = :json
end
