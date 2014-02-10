# encoding: utf-8
Refinery::ShareThis.configure do |config|

  # Identificator for share_this
  config.publisher = 'ur-71d05ae5-1ac0-dc50-ae4f-e16d17c3fea7'

  config.doNotHash = false
  config.doNotCopy = false
  config.hashAddressBar = false
  config.switchTo5x = false
  config.button_type = "vcount"

  # buttons: {:sharethis=>"ShareThis", :facebook=>"Facebook", :twitter=>"Tweet", :googleplus=>"Google +", :linkedin=>"LinkedIn", :pinterest=>"Pinterest", :delicious=>"Delicious", :identi=>"identi.ca", :email=>"Email"}
  config.buttons = {:facebook=>"Facebook", :twitter=>"Tweet", :googleplus=>"Google +", :delicious=>"Delicious", :identi=>"identi.ca", :email=>"Email"}

  config.namespaces = []
end
