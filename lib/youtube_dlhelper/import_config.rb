# Youtube converter import class
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
# http://www.rubydoc.info/github/saigkill/youtube_dlhelper/Import
# Copyright (C) 2013-2017 Sascha Manns <Sascha.Manns@mailbox.org>

# Dependencies
require 'parseconfig'
require 'xdg'

# Module for Importing Informations
module Import
  # This Module parses the youtube_dlhelper.conf
  # @return [Array] music_dir, ogg_file_accept, ffmpeg_binary
  def self.import_config
    sysxdg = XDG['CONFIG_HOME']
    sysconfdir = "#{sysxdg}/youtube_dlhelper"
    config = ParseConfig.new(File.join("#{sysconfdir}/youtube_dlhelper.conf"))
    # @note Saving the variable musiddir
    music_dir = config['musicdir'].to_s
    # @note Saving the variable ogg_file_accept
    ogg_file_accept = config['ogg_file_accept'].to_s
    # @note It returns a array with music_dir, ogg_file_accept, ffmpeg_binary
    [music_dir, ogg_file_accept]
  end
end
