#!/usr/bin/env ruby

git_bundles = [ 
  "https://github.com/pangloss/vim-javascript.git",
  "https://github.com/scrooloose/nerdtree.git",
  "https://github.com/tpope/vim-markdown.git",
  "https://github.com/tpope/vim-repeat.git",
  "https://github.com/tpope/vim-surround.git",
  "https://github.com/tpope/vim-vividchalk.git",
  "https://github.com/fatih/vim-go.git",
]

vim_org_scripts = [
  ["IndexedSearch", "7062", "plugin"],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join("#{Dir.home}", ".vim", "bundle")

FileUtils.cd(bundles_dir)

puts "trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << URI.open("https://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end

