class Artist
    attr_accessor :name, :songs

    extend Concerns::Findable

    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
    end

    def self.all
        @@all
    end

    def add_song(song)
        self.songs.push(song) unless self.songs.include?(song)
        song.artist = self unless song.artist
    end

    def save
        @@all << self
    end

    def genres
        self.songs.map { |song| song.genre }.uniq
    end
end