function ydlp
    set file (yt-dlp --print "%(filename)s" $argv)

    echo "Downloading $file"
    yt-dlp $argv

    echo "Converting $file"
    ffmpeg -i $file "OUTPUT-$file.mp4"
end
