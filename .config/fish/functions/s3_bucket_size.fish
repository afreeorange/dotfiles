function s3_bucket_size
    aws s3 ls --summarize --human-readable --recursive $argv[1]
end
