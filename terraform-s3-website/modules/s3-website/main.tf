resource "aws_s3_bucket" "static_site" {
  bucket = "cloudpals-bucket"
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = "cloudpals-bucket"
  key          = "index.html"
  source       = "html/index.html"
  content_type = "text/html"
  etag         = "${md5(file("html/index.html"))}"
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = "cloudpals-bucket"
  key          = "error.html"
  source       = "html/error.html"
  content_type = "text/html"
  etag         = "${md5(file("html/error.html"))}"
  acl          = "public-read"
}
