#!/usr/bin/env ruby
# Youtube converter main class
#
# Copyright (C) 2013-2017 Sascha Manns <Sascha.Manns@mailbox.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Dependencies
require_relative 'youtube_dlhelper/checker'
require_relative 'youtube_dlhelper/downloader'
require_relative 'youtube_dlhelper/import_config'
require_relative 'youtube_dlhelper/ripper'
require_relative 'youtube_dlhelper/notifier'
require 'highline/import'
require 'fileutils'
require 'parseconfig'
require 'addressable/uri'
require 'streamio-ffmpeg'
require 'rainbow/ext/string'
require 'hoe'

# The main class YoutubeDlhelper
class YoutubeDlhelper
  # @note Version variable
  VERSION = '3.0.0'.freeze

  # @note Name of the App
  my_name = File.basename($PROGRAM_NAME)

  # @note Command line arguments
  argv = ARGV[0].to_s

  # @note Checks if the URL is valid
  # @param [String] argv Given
  url = Checker.external_url_is_valid?(argv)

  # @note Check oldconfig
  Checker.oldconfig_exists?

  # @note Imports the configuration
  home = Dir.home
  music_dir_get, ogg_file_accept = Import.import_config
  music_dir = "#{home}/#{music_dir_get}"

  puts "#{my_name} #{VERSION}".colour(:yellow)
  puts
  puts 'Copyright (C) 2013-2017 Sascha Manns <Sascha.Manns@mailbox.org>'
  puts 'Description: This gem can download music from YouTube'
  puts "converts it to OGG/MP3 and places it in #{music_dir}."
  puts 'License: MIT'
  puts ''
  puts 'File bug reports there:'
  puts 'https://bugs.launchpad.net/youtube-dlhelper'

  # Check which decoder should used
  ffmpeg_binary = Checker.which_decoder?

  puts 'CHECKING TARGET'.color(:yellow)
  # @note Checks if target directory is present. Otherwise it creates one
  directory = Checker.check_target

  # @note Prints out which targetfolder is choosen.
  puts 'SEARCHING FOR TARGETDIR'.colour(:yellow)
  puts "Your present target directory is: #{music_dir}/#{directory}".colour
  (:yellow)
  puts 'You can choose another one directly in the config file.'.colour(:yellow)
  puts 'Checking now, if your target directory exists...'.colour(:yellow)
  # @param [String] music_dir Path to the music directory
  # @param [String] folder Path to the target directory
  Checker.check_dir(music_dir, directory)

  # @note Using FileUtils to enter the generated directory
  puts 'SWITCHING TO TARGETDIR'.colour(:yellow)
  # @param [String] music_dir Path to the music directory
  # @param [String] folder Path to the target directory
  FileUtils.cd("#{music_dir}/#{directory}") do
    puts "Now we are switched to directory #{Dir.pwd}".colour(:yellow)
    puts 'DOWNLOADING YOUR VIDEO'.colour(:yellow)

    # @param [String] url Is the given URL to the Youtube file
    filename, filename_old = Downloader.get(url)

    # @param [String] filename The filename
    # @param [String] ogg_file_accept OGG file as end file accepted?
    # (true/false)
    # @param [String] ffmpeg_binary Path to the ffmpeg binary
    filename_new, extension = Ripper.rip_prepare(filename, ogg_file_accept,
                                                ffmpeg_binary)

    # @param [String] filenamenew The new produced filename
    Checker.cleanup(filename_new, filename_old)

    puts "Now you can find your file in #{music_dir}/#{directory}".colour
    (:yellow)

    Notifier.run
  end
end
