# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :bundler
Hoe.plugin :manns
Hoe.plugin :reek
Hoe.plugin :rubocop
Hoe.plugin :rubygems
#Hoe.plugin :seattlerb

###########################################DEVELOPING ZONE##############################################################
# rubocop:disable Metrics/LineLength
Hoe.spec 'youtube_dlhelper' do
  developer('Sascha Manns', 'Sascha.Manns@mailbox.org')
  license 'MIT' # this should match the license in the README
  require_ruby_version '>= 2.2.3'

  self.history_file = 'History.rdoc'
  self.readme_file = 'README.rdoc'
  self.extra_rdoc_files = FileList['*.rdoc'].to_a
  self.post_install_message = '*** Run rake setup to finish the installation *** Please file bugreports and feature
equests on: https://bugs.launchpad.net/youtube-dlhelper'

  dependency 'bundler', '~> 1.15'
  dependency 'parseconfig', '~> 1.0'
  dependency 'streamio-ffmpeg', '~> 3.0'
  dependency 'rainbow', '~> 2.2'
  dependency 'addressable', '~> 2.5'
  dependency 'notifier', '~> 0.5'
  dependency 'youtube-dl.rb', '~> 0.3.1.2016'
  dependency 'xdg', '~> 2.2'
  dependency 'manpages', '~> 0.6'
  dependency 'hoe', '3.16'

  extra_dev_deps << ['coveralls', '~> 0.8']
  extra_dev_deps << ['hoe', '~> 3.16']
  extra_dev_deps << ['hoe-bundler', '~> 1.3']
  extra_dev_deps << ['hoe-manns', '~> 1.6']
  extra_dev_deps << ['hoe-reek', '~> 1.1']
  extra_dev_deps << ['hoe-rubocop', '~> 1.0']
  extra_dev_deps << ['hoe-rubygems', '~> 1.0']
  extra_dev_deps << ['hoe-version', '~> 1.2']
  extra_dev_deps << ['rake', '~> 12.1']
  extra_dev_deps << ['rdoc', '~> 5.1']
  extra_dev_deps << ['rubocop', '~> 0.47']
  extra_dev_deps << ['rspec', '~> 3.6']
end

##################################################SETUP ZONE############################################################

desc 'Run setup'
task :setup => [:install_config, :install_image, :manpage_register] do
  puts 'Launching Setup'
end

desc 'Install config'
task :install_config do
  puts 'Installing config ...'
  require 'xdg'
  sysxdg = XDG['CONFIG_HOME']
  sysconfdir = "#{sysxdg}/youtube_dlhelper"
  FileUtils.mkdir(sysconfdir) if !File.exist?(sysconfdir)
  FileUtils.cp('etc/youtube_dlhelper.conf', "#{sysconfdir}") if !File.exist?("#{sysconfdir}/youtube_dlhelper.conf")
end

desc 'Install image'
task :install_image do
  puts 'Installing image ...'
  localxdg = XDG['DATA_HOME']
  localdir = "#{localxdg}/youtube_dlhelper"
  FileUtils.mkdir(localdir) if !File.exist?(localdir)
  FileUtils.cp('data/youtube_dlhelper/100px-youtube_dlhelper.png', localdir) if
      !File.exist?("#{localdir}/100px-youtube_dlhelper.png")
end

desc 'Build manpage'
task :manpage do
  puts 'Building manpage ...'
  FileUtils.cd('man')
  buildstring1 = '--stringparam man.output.quietly 1'
  buildstring2 = '--stringparam funcsynopsis.style ansi'
  buildstring3 = '--stringparam man.th.extra1.suppress 1'
  buildstring4 = '--stringparam man.authors.section.enabled 0'
  buildstring5 = '--stringparam man.copyright.section.enabled 0'
  xsltprocflags = "#{buildstring1} #{buildstring2} #{buildstring3} #{buildstring4} #{buildstring5}"
  manxsl = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
  `xsltproc #{xsltprocflags} #{manxsl} youtube_dlhelper.xml`
  FileUtils.cd('..')
end