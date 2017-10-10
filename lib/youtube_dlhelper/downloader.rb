# Youtube converter downloader class
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
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Downloader

# Dependencies
require 'youtube-dl.rb'
require 'rainbow/ext/string'
require 'fileutils'

# Module for all Downloading things
module Downloader
  # Accessing the url with get(url) via youtube-dl.rb
  # This method smells of :reek:TooManyStatements
  # @param [String] url Is the given URL to the Youtube file
  def self.get(url)
    puts 'Downloading file...'.color(:green)
    # Thanks for the gist https://gist.github.com/sapslaj/edb51218357fa33b6c4c
    video = YoutubeDL.download(url)
    video.filename # => "Adele - Hello-YQHsXMglC9A.f137.mp4"

    # rubocop:disable Metrics/LineLength
    video_with_title = YoutubeDL.download(url, extract_audio: true, audio_format: 'best', audio_quality: 0, output: '%(title)s.%(ext)s')
    video_with_title.filename # => "Adele - Hello.mp4"

    title = YoutubeDL::Runner.new(url, get_title: true).run
    # rubocop:disable Lint/Void
    title # => "Adele - Hello"
    puts 'Downloading done...'.colour(:green)
    filename = video_with_title.filename

    filename_new = rename(filename)
    return filename_new
  end

  # rubocop:disable Metrics/AbcSize
  # This method smells of :reek:TooManyStatements
  # Method for renaming the orig file with blanks to underscores
  # @param [String] url Is the given URL to the Youtube file
  # @return [String] filenamenew The fixed filename with underscores
  def self.rename(filename_orig)
    extn = File.extname filename_orig # .mp4
    filename = File.basename filename_orig, extn
    ext = file_exist_ogg_m4a(filename)
    # @note Replacing blanks with underscrores and delete non standard chars in
    # filename
    filename_new0 = filename.tr('/ /', '_')
    pattern = /[a-zA-Z0-9\-\s\_]/
    filename_new = filename_new0.split(//).keep_if do |chr|
      chr =~ pattern
    end.join
    puts 'Renaming the downloaded file'.color(:green)
    puts '+++ Debug +++'
    puts filename
    puts filename_new
    puts ext
    FileUtils.mv("#{filename}.#{ext}", "#{filename_new}.#{ext}")
    [filename_new]
  end

  # It checks what old file are available
  # @param [String] title
  # @return ext
  def self.file_exist_ogg_m4a(filename)
    if File.exist?("#{filename}.ogg")
      ext = 'ogg'
    elsif File.exist?("#{filename}.m4a")
      ext = 'm4a'
    elsif File.exist?("#{filename}.webm")
      ext = 'webm'
    elsif File.exist?("#{filename}.opus")
      ext = 'opus'
    end
    return ext
  end
end
