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
require 'fileutils'
require 'rainbow/ext/string'
require 'hoe'

# The main class YoutubeDlhelper
class YoutubeDlhelper
  # Version variable
  VERSION = '3.0.0'.freeze

  # Name of the App
  my_name = File.basename($PROGRAM_NAME)

  # Command line arguments
  argv = ARGV[0].to_s

  # Checks if the URL is valid
  # @param [String] argv Given
  url = Checker.external_url_is_valid?(argv)

  # Check if oldconfig exists
  Checker.oldconfig_exists?

  # Imports the configuration
  home = Dir.home
  music_dir_get, ogg_file_accept = Import.import_config
  music_dir = "#{home}/#{music_dir_get}"

  puts "#{my_name} #{VERSION}".color(:yellow)
  puts 'Copyright (C) 2013-2017 Sascha Manns <Sascha.Manns@mailbox.org>'.color(:yellow)
  puts 'Description: This gem can download music from YouTube'.color(:yellow)
  puts "converts it to OGG/MP3 and places it in #{music_dir}.".color(:yellow)
  puts 'License: GPL3'.color(:yellow)
  puts 'This program comes with ABSOLUTELY NO WARRANTY. This is free software, and you are'.color(:aquamarine)
  puts 'welcome to redistribute it under certain conditions. See LICENSE.rdoc'.color(:aquamarine)
  puts ''
  puts 'File bug reports there: https://bugs.launchpad.net/youtube-dlhelper'.color(:yellow)

  # Check which decoder should used
  ffmpeg_binary = Checker.which_decoder?

  puts 'CHECKING TARGET'.color(:aquamarine)
  # Checks if target directory is present. Otherwise it creates one
  directory = Checker.check_target # <- There it breaks

  # Prints out which targetfolder is choosen.
  puts 'SEARCHING FOR TARGETDIR'.color(:aquamarine)
  puts "Your present target directory is: #{music_dir}/#{directory}".color(:aquamarine)
  puts 'Checking now, if your target directory exists...'.color(:aquamarine)
  # @param [String] music_dir Path to the music directory
  # @param [String] directory Path to the target directory
  Checker.check_dir(music_dir, directory)

  # Using FileUtils to enter the generated directory
  puts 'SWITCHING TO TARGETDIR'.color(:aquamarine)
  # @param [String] music_dir Path to the music directory
  # @param [String] folder Path to the target directory
  FileUtils.cd("#{music_dir}/#{directory}") do
    puts "Now we are switched to directory #{Dir.pwd}".color(:aquamarine)
    puts 'DOWNLOADING YOUR VIDEO'.color(:aquamarine)

    # @param [String] url Is the given URL to the Youtube file
    filename = Downloader.get(url)

    # @param [String] filename The filename
    # @param [String] ogg_file_accept OGG file as end file accepted? (true/false)
    # @param [String] ffmpeg_binary Path to the ffmpeg binary
    Ripper.rip_prepare(filename, ogg_file_accept, ffmpeg_binary)

    Checker.cleanup

    puts "Now you can find your file in #{music_dir}/#{directory}".color(:yellow)

    Notifier.run
  end
end
