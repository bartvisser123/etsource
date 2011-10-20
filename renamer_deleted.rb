require 'rubygems'
require 'CSV'
require 'fileutils'


groups = []

CSV.foreach 'new_gqueries.csv' do |row|
  id, old_name, old_unit, new_name, new_unit, purpose, group, old_group, deleted, comments = row
  next if deleted.to_f < 1

  # # o = "gqueries/flat/#{old_name}.gql"
  # file = "gqueries/flat/#{new_name}.gql"
  
  file = "gqueries/flat/#{old_name}.gql"
  next unless File.exists?(file)
  
  # FileUtils.mv(file, new_location)
  # 
  # puts "Moved #{file} -> #{new_location}"
  # 
  # # groups << group.downcase.gsub(' ', "_")
  
  contents = File.read file
  new_content = "- deprecated_key = #{old_name}\n" + contents
  
   puts new_content
  File.open file, "w" do |f|
    f.write new_content
  end
  
  # puts contents
  
end

# puts groups.uniq.join("\n")