###################################################################################
## Super Admin is created with username as 'superadmin' and password 'superadmin'##
###################################################################################

user = User.new(:username => 'superadmin',:password => 'superadmin', :email => 'superadmin@ncsu.edu',:admin => true, :superadmin => true)
user.save!
User.authenticate_by_username 'superadmin','superadmin'
