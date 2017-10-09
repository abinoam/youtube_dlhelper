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
#

# Dependencies

# Module for notify the user
require 'notifier'

# Module for notifying the user
module Notifier
  # Method for notifying the user
  def self.run
    local_dir = ENV['DATA_HOME']
    data_dir = "#{local_dir}/youtube_dlhelper "
    img = "#{data_dir}/100px-youtube_dlhelper.png"
    Notifier.notify(
      image: img.to_s,
      title: 'Your YouTube video',
      message: 'Your transcoding is finished.'
    )
  end
end
