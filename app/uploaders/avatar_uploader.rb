# app/uploaders/avatar_uploader.rb
class AvatarUploader < CarrierWave::Uploader::Base
  # ストレージを設定
  storage :file

  # アップロードされたファイルの保存先ディレクトリを設定
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 受け入れるファイルの拡張子を制限
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # ファイルのデフォルトURLを設定
  def default_url(*args)
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # ファイルの一意な名前を設定
  def filename
    "avatar_#{model.id}.#{file.extension}" if original_filename
  end
end
