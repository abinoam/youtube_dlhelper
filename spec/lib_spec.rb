require 'rspec'
require 'spec_helper'

# rubocop:disable Metrics/LineLength
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/checker')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/downloader')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/import_config')
require File.join(File.dirname(__FILE__), '..', '/lib/youtube_dlhelper/ripper')

tempfile = 'Rainbow_-_Stargazer_Live_in_Nrnberg_1976'
tempfile1 = 'Rainbow - Stargazer (Live in Nürnberg 1976)'
ffmpeg_binary = '/usr/bin/ffmpeg'

describe 'Checker' do
  describe '.external_url_is_valid?' do
    context 'using http url' do
      it 'get an url, test it and give back when valid' do
        url = Checker.external_url_is_valid? \
('https://www.youtube.com/watch?v=UgdSarGbE0g')
        expect(url).equal? 'true'
      end
    end

    context 'using https url' do
      it 'get the url, test and give back when valid' do
        url = Checker.external_url_is_valid? \
('https://www.youtube.com/watch?v=UgdSarGbE0g')
        expect(url).equal? 'true'
      end
    end
  end

  describe '.which_decoder?' do
    it 'checks what decoder can be used' do
      ffmpeg_binary = Checker.which_decoder?
      #expect(ffmpeg_binary).equal? '/usr/bin/ffmpeg' || '/usr/bin/avconv'
      %w{/usr/bin/ffmpeg /usr/bin/avconv}.include?(ffmpeg_binary)
    end
  end
end

describe 'Downloader' do
  describe '.get' do
    it 'downloads a file from youtube' do
      Downloader.get('https://www.youtube.com/watch?v=UgdSarGbE0g')
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
      Checker.cleanup(tempfile, tempfile1)
      expect(File.exist?("#{tempfile}.mp4")).equal? 'false'
      expect(File.exist?("#{tempfile}.m4a")).equal? 'false'
      File.delete("#{tempfile1}.mp4") if File.exist?("#{tempfile1}.mp4")
      File.delete("#{tempfile}.mp3") if File.exist?("#{tempfile}.mp3")
      File.delete("#{tempfile}.ogg") if File.exist?("#{tempfile}.ogg")
      File.delete("#{tempfile}.mkv") if File.exist?("#{tempfile}.mkv")
    end
  end
end
