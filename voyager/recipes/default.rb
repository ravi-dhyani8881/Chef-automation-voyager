#
# Cookbook:: graphql
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Read the contents of the JSON file as a string
#json_string = File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file.json')
json_string = File.read('/var/chef/cookbooks/voyager/file.json')

# Parse the JSON string into a Ruby hash
json_data = JSON.parse(json_string)

# Access the value associated with the "cities" key
graph = json_data["tables"]

projectName = json_data["projectName"]

installDirectory = "/var/chef/output/"


#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file_names.json'))
#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file.json'))

user 'ravi.dhyani' do
  comment 'User for owning the directory'
  uid '1001' # Optional, specify the user ID if necessary
  gid 'users' # Optional, specify the group ID or group name if necessary
  home '/home/ravi.dhyani'
  shell '/bin/bash'
  manage_home true # Creates the home directory if it doesn't exist
  action :create
end

directory installDirectory + projectName + "/gql-server"do
  owner 'ravi.dhyani'
 # group 'group_name'
  mode '0755'
  recursive true
  action :create
end

directory installDirectory + projectName + "/voyager"do
  owner 'ravi.dhyani'
 # group 'group_name'
  mode '0755'
  recursive true
  action :create
end


# recipe.rb

# Assuming @name is defined elsewhere in the recipe or attributes
template installDirectory + projectName + "/gql-server/index.js" do
  source 'index.js.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end

template installDirectory + projectName + "/gql-server/schema.js" do
  source 'schema.js.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end


template installDirectory + projectName + "/voyager/index.html" do
  source 'index.html.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end

template installDirectory + projectName + "/voyager/voyager.js" do
  source 'voyager.js.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end

template installDirectory + projectName + "/package.json" do
  source 'package.json.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end

template installDirectory + projectName + "/package-lock.json" do
  source 'package-lock.json.erb'
  variables(
    projectName: projectName
  )
  owner 'ravi.dhyani'
  #group 'ravi.dhyani'
  mode '0644'
  action :create
end
