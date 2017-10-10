# -*- ruby -*-

# Release:
# * update docs
# * git:manifest
# * bundler:gemfile
# * bundler:gemfile_lock
# * bundle_audit:run
# * gitc
# * rake release
# * send_email
# * clean_pkg
# * bump version
require 'rubygems'
require 'hoe'

Hoe.plugin :bundler
Hoe.plugin :git
Hoe.plugin :manns
Hoe.plugin :rdoc
Hoe.plugin :reek
Hoe.plugin :rubocop
Hoe.plugin :rubygems
Hoe.plugin :version

# rubocop:disable Metrics/BlockLength
Hoe.spec 'youtube_dlhelper' do
  developer('Sascha Manns', 'Sascha.Manns@mailbox.org')
  license 'GPL3' # this should match the license in the README
  require_ruby_version '>= 2.2.3'

  self.history_file = 'History.rdoc'
  self.readme_file = 'README.rdoc'
  self.extra_rdoc_files = FileList['*.rdoc'].to_a
  self.post_install_message = '*** Run rake setup to finish the installation ***'

  dependency 'bundler', '1.15.4'
  dependency 'parseconfig', '~> 1.0'
  dependency 'streamio-ffmpeg', '~> 3.0'
  dependency 'rainbow', '~> 2.2'
  dependency 'addressable', '~> 2.5'
  dependency 'highline', '~> 1.7'
  dependency 'notifier', '~> 0.5'
  dependency 'youtube-dl.rb', '~> 0.3.1.2017' # add :git => 'git://github.com/n1ckbren/youtube-dl.rb' to Gemfile
  dependency 'xdg', '~> 2.2'
  dependency 'manpages', '~> 0.6'

  extra_dev_deps << ['coveralls', '~> 0.8']
  extra_dev_deps << ['hoe-bundler', '~> 1.3']
  extra_dev_deps << ['hoe-git', '~> 1.6']
  extra_dev_deps << ['hoe-manns', '~> 1.6']
  extra_dev_deps << ['hoe-reek', '~> 1.1']
  extra_dev_deps << ['hoe-rubocop', '~> 1.0']
  extra_dev_deps << ['hoe-rubygems', '~> 1.0']
  extra_dev_deps << ['hoe-version', '~> 1.2']
  extra_dev_deps << ['rake', '~> 12.1']
  extra_dev_deps << ['rdoc', '~> 5.1']
  extra_dev_deps << ['rubocop', '~> 0.50']
  extra_dev_deps << ['rspec', '~> 3.6']
end

desc 'Run setup'
task setup: %i[install_config install_image manpage_register] do
  puts 'Launching Setup'
end

desc 'Install config'
task :install_config do
  puts 'Installing config ...'
  require 'xdg'
  sys_xdg = XDG['CONFIG_HOME']
  sysconf_dir = "#{sys_xdg}/youtube_dlhelper"
  FileUtils.mkdir(sysconf_dir) unless File.exist?(sysconf_dir)
  FileUtils.cp('etc/youtube_dlhelper.conf', sysconf_dir.to_s) unless
      File.exist?("#{sysconf_dir}/youtube_dlhelper.conf")
end

desc 'Install image'
task :install_image do
  puts 'Installing image ...'
  local_xdg = XDG['DATA_HOME']
  local_dir = "#{local_xdg}/youtube_dlhelper"
  FileUtils.mkdir(local_dir) unless File.exist?(local_dir)
  FileUtils.cp('data/youtube_dlhelper/100px-youtube_dlhelper.png', local_dir) unless
      File.exist?("#{local_dir}/100px-youtube_dlhelper.png")
end

desc 'Build manpage'
task :manpage do
  puts 'Building manpage ...'
  FileUtils.cd('man')
  build_string1 = '--stringparam man.output.quietly 1'
  build_string2 = '--stringparam funcsynopsis.style ansi'
  build_string3 = '--stringparam man.th.extra1.suppress 1'
  build_string4 = '--stringparam man.authors.section.enabled 0'
  build_string5 = '--stringparam man.copyright.section.enabled 0'
  xsltproc_flags = "#{build_string1} #{build_string2} #{build_string3} #{build_string4} #{build_string5}"
  man_xsl = 'http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl'
  `xsltproc #{xsltproc_flags} #{man_xsl} youtube_dlhelper.xml`
  FileUtils.cd('..')
end
