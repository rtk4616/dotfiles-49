#!/usr/bin/env ruby

# Swap icons of specified apps with custom icons included in $DOTFILES/vendor

require 'digest/md5'
require 'fileutils'

source_icon_dir = File.join(
  ENV['DOTFILES'],
  'vendor',
  'customizations',
  'icons'
)

local_app_dir = File.join(ENV['HOME'], 'Applications')

icons = [
  {
    :source => File.join(source_icon_dir, 'iTerm2.icns'),
    :destination => File.join(
      local_app_dir, "/iTerm.app/Contents/Resources/iTerm.icns"
    )
  },{
    :source => File.join(source_icon_dir, 'MacVim.icns'),
    :destination => File.join(
      local_app_dir, "/MacVim.app/Contents/Resources/MacVim.icns"
    )
  },{
    :source => File.join(source_icon_dir, 'MacVim.icns'),
    :destination => File.join(
      local_app_dir, "/MacVim.app/Contents/Resources/MacVim-generic.icns"
    )
  }
]


icons.each do |icon|

  next unless File.exists?(icon[:source])
  next unless File.exists?(icon[:destination])
  next if File.exists?("#{icon[:destination]}.bak")

  source_hash = Digest::MD5.file(icon[:source]).hexdigest
  destination_hash = Digest::MD5.file(icon[:destination]).hexdigest
  next if source_hash == destination_hash

  FileUtils.mv(icon[:destination], "#{icon[:destination]}.bak")
  FileUtils.cp(icon[:source], icon[:destination])
  puts "Updated icon: \n #{icon[:source]} -> #{icon[:destination]}"
end
