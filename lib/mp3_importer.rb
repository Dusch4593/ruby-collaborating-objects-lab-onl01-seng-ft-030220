require 'pry'

class MP3Importer 
  attr_accessor :path
  
  def initialize(test_music_path)
    @path = test_music_path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|file|
      file.gsub("#{path}/", "")
    }
  end
  
  def import 
    files.each{|filename|
      Song.new_by_filename(filename)
    }
  end
end

#binding.pry