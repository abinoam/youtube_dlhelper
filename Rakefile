# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :bundler
Hoe.plugin :email
Hoe.plugin :manns
Hoe.plugin :rubocop
Hoe.plugin :rubygems
#Hoe.plugin :seattlerb
Hoe.plugin :version

###########################################DEVELOPING ZONE##############################################################
# rubocop:disable Metrics/LineLength
Hoe.spec 'youtube_dlhelper' do
  developer('Sascha Manns', 'Sascha.Manns@mailbox.org')
  license 'GPL3' # this should match the license in the README
  require_ruby_version '>= 2.2.3'

  email_to << 'ruby-talk@ruby-lang.org'

  self.history_file = 'History.rdoc'
  self.readme_file = 'README.rdoc'
  self.extra_rdoc_files = FileList['*.rdoc'].to_a
  self.post_install_message = '*** Run rake setup to finish the installation *** Please file bugreports and feature requests on: https://bugs.launchpad.net/youtube-dlhelper'

  dependency 'bundler', '~> 1.15'
  dependency 'parseconfig', '~> 1.0'
  dependency 'streamio-ffmpeg', '~> 3.0'
  dependency 'rainbow', '~> 2.2'
  dependency 'addressable', '~> 2.5'
  dependency 'notifier', '~> 0.5'
  dependency 'youtube-dl.rb', '~> 0.3.1.2016'
  dependency 'xdg', '~> 2.2'

  extra_dev_deps << ['hoe', '~> 3.16']
  extra_dev_deps << ['hoe-bundler', '~> 1.3']
  extra_dev_deps << ['hoe-manns', '~> 1.6']
  extra_dev_deps << ['hoe-rubocop', '~> 1.0']
  extra_dev_deps << ['hoe-rubygems', '~> 1.0']
  extra_dev_deps << ['hoe-version', '~> 1.2']
  extra_dev_deps << ['rake', '~> 12.1']
  extra_dev_deps << ['rdoc', '~> 5.1']
  extra_dev_deps << ['rspec', '~> 3.6']
  extra_dev_deps << ['rubocop', '~> 0.50']
  extra_dev_deps << ['simplecov', '~> 0.15']
end

##################################################SETUP ZONE############################################################

desc 'Run setup'
task :setup do
  puts 'Installing config and data'
  require 'xdg'
  sysxdg = XDG['CONFIG_HOME']
  sysconfdir = "#{sysxdg}/youtube_dlhelper"
  localxdg = XDG['DATA_HOME']
  localdir = localxdg + '/youtube_dlhelper'
  FileUtils.mkdir(sysconfdir) if !File.exist?(sysconfdir)
  FileUtils.cp('etc/youtube_dlhelper.conf', "#{sysconfdir}") if !File.exist?("#{sysconfdir}/youtube_dlhelper.conf")
  FileUtils.mkdir(localdir) if !File.exist?(localdir)
  FileUtils.cp('data/youtube_dlhelper/100px-youtube_dlhelper.png', localdir) if
      !File.exist?("#{localdir}/100px-youtube_dlhelper.png")
end
