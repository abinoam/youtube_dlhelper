require 'rspec'
require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/checker')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/downloader')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/import_config')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/ripper')

tempfile = 'AC_DC_-_Hells_Bells_from_Live_At_Donington'
tempfile1 = 'AC_DC - Hells Bells (from Live At Donington)'
ffmpeg_binary = '/home/travis/bin/ffmpeg'

describe 'Checker' do
  describe '.external_url_is_valid?' do
    context 'using http url' do
      it 'get an url, test it and give back when valid' do
        url = Checker.external_url_is_valid?('https://www.youtube.com/watch?v=qFJFonWfBBM')
        expect(url).equal? 'true'
      end
    end

    context 'using https url' do
      it 'get the url, test and give back when valid' do
        url = Checker.external_url_is_valid?('https://www.youtube.com/watch?v=qFJFonWfBBM')
        expect(url).equal? 'true'
      end
    end
  end

  describe '.get_ffmpeg_binary' do
    it 'checks what decoder can be used' do
      ffmpeg_binary = Checker.get_ffmpeg_binary
      %w[bin/ffmpeg].include?(ffmpeg_binary)
    end
  end
end

describe 'Downloader' do
  describe '.get' do
    it 'downloads a file from youtube' do
      Downloader.get('https://www.youtube.com/watch?v=qFJFonWfBBM')
      expect(File.exist?("#{tempfile}.mp4")).equal? 'true'
    end
  end
end

describe 'Ripper' do
  describe '.rip_prepare' do
    context 'With ogg_file_accept' do
      ogg_file_accept = 'true'
      it 'should not convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exist?("#{tempfile}.ogg")).equal? 'true'
      end
    end

    context 'Without ogg_file_accept' do
      ogg_file_accept = 'false'
      it 'should convert a file from youtube' do
        Ripper.rip_prepare(tempfile, ogg_file_accept, ffmpeg_binary)
        expect(File.exist?("#{tempfile}.mp3")).equal? 'true'
      end
    end
  end
end

describe 'Checker' do
  describe '.cleanup' do
    it 'Cleans up all downloaded and generated files' do
      Checker.cleanup
      expect(File.exist?("#{tempfile}.mp4")).equal? 'false'
      expect(File.exist?("#{tempfile}.m4a")).equal? 'false'
      File.delete("#{tempfile1}.mp4") if File.exist?("#{tempfile1}.mp4")
      File.delete("#{tempfile}.mp3") if File.exist?("#{tempfile}.mp3")
      File.delete("#{tempfile}.ogg") if File.exist?("#{tempfile}.ogg")
      File.delete("#{tempfile}.mkv") if File.exist?("#{tempfile}.mkv")
    end
  end
end
