CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACC3SS_K3Y_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACC3SS_K3Y"]
  }
  config.fog_directory = ENV["AWS_S3_BUCKET"]
end
