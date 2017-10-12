# Youtube converter checker class
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

# Class Documentation:
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Checker

# Dependencies
require 'rainbow/ext/string'
require 'fileutils'
require 'highline/import'
require 'net/http'
require 'uri'
require 'xdg'

# The Checker module contains different methods to check anything
module Checker
  # This method checks if a url is valid
  # This method smells of :reek:TooManyStatements
  # @param [String] url Is the given URL to the Youtube file
  # @return [String] url
  def self.external_url_is_valid?(url)
    puts 'Checking prefix'.color(:green)
    if url.include? 'https'
      puts 'Checking if https URL is valid'.color(:green)
      https_url_valid?(url)
      # return url
    else
      puts 'Checking if http URL is valid'.color(:green)
      http_url_valid?(url)
      # return url
    end
  end

  # Method to check https
  # @param [String] url Is the given URL to the Youtube file
  def self.https_url_valid?(url)
    # @param [String] url Is the given URL to the Youtube file
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.head(uri.path)
    end
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # Method to check http
  # @param [String] url Is the given URL to the Youtube file
  def self.http_url_valid?(url)
    # @param [String] url Is the given URL to the Youtube file
    uri = URI.parse(url)
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.head(uri.path)
    end
    response.is_a?(Net::HTTPSuccess) || response.is_a?(Net::HTTPRedirection)
  end

  # Ask for names, creates the folders and puts all into a $folder variable
  # This method smells of :reek:TooManyStatements
  # @return [String] folder
  def self.check_target
    entry = ask 'What kind of entry do you have? (Interpret or Group)'

    subdir = case entry
             when 'Interpret'
               [
                 ask('Whats the surname of your interpret?'),
                 ask('Whats the first name of your interpret?')
               ].join('_')

             when 'Group'
               ask 'Whats the name of the group?'

             else
               puts 'Just the entries "Interpret" or "Group" are allowed'.color(:red)
               abort('Aborted')
             end
    subdir.tr!(' ', '_')
    directory = "#{subdir}/Youtube-Music"
    return directory
  end

  # Checks if the target directory are present. If not, it creates one
  # @param [String] music_dir Path to the music directory
  # @param [String] directory Path to the target folder
  def self.check_dir(music_dir, directory)
    # @note Checking if music dir exists
    if Dir.exist?("#{music_dir}/#{directory}")
      puts 'Found directory. Im using it.'.color(:green)
    else
      puts 'No directory found. Im creating it.'.color(:green)
      # @note Creates the new directory in $music_dir/$folder
      FileUtils.mkdir_p("#{music_dir}/#{directory}")
      puts 'Created new directory...'.color(:green) if Dir.exist?("#{music_dir}/#{directory}")
    end
  end

  # This method checks if a oldconfig is available
  # @return [String] true or false
  def self.oldconfig_exists?
    sys_xdg = XDG['CONFIG_HOME']
    sysconf_dir = "#{sys_xdg}/youtube_dlhelper"
    if File.exist?("#{sysconf_dir}/youtube_dlhelper.conf")
      puts 'Found configuration file and using it...'.color(:green)
    else
      # @raise
      puts 'Please run rake setup'.color(:red)
      raise('Exiting now..').color(:red)
    end
  end

  # This method checks which decoder is available
  # This method smells of :reek:TooManyStatements
  # @return [String] ffmpeg_binary
  def self.get_ffmpeg_binary
    get_ffmpeg = `which ffmpeg`
    ffmpeg = p get_ffmpeg.chomp
    ffmpeg_binary = ffmpeg if ffmpeg != ''
    return ffmpeg_binary
  end

  # Cleaner method for unneeded files
  # @param [String] filename The name of the new produced file
  def self.cleanup
    puts 'Cleaning up directory'.color(:green)
    # @note Cleanup the temp files
    formats = %w(*.mp4 *.m4a *.webm *.opus *.mkv)
    formats.each do |format|
      Dir.glob(format).each do |file|
        File.delete(file) if File.exist?(file)
      end
    end

    puts 'Finished cleaning up'.color(:green)
  end
end
